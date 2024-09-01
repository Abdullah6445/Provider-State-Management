import 'package:flutter/material.dart';
import 'package:state_managemt_provider/controller/count_controller.dart';
import 'package:state_managemt_provider/controller/list_controller.dart';
import 'package:provider/provider.dart';
import 'package:state_managemt_provider/screens/page_two.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint("whole build called");
    return Scaffold(
      floatingActionButton: Consumer<ListController>(
          builder: (context, listControllerModel, child) {
        debugPrint("floating build");

        return FloatingActionButton(
          onPressed: listControllerModel.addListItemFunction,
          child: const Icon(Icons.add),
        );
      }),
      appBar: AppBar(
        title: const Text("main screen"),
        actions: [
          Consumer<CountController>(
            builder: (context, myType, child) {
              debugPrint("===================");

              debugPrint("only count rebuild");
              debugPrint("===================");
              return IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  myType.increment();
                },
              );
            },
          )
          // IconButton(
          //   icon: const Icon(Icons.navigate_next),
          //   onPressed: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const PageTwo(),
          //         ));
          //   },
          // ),
        ],
      ),
      body: Column(
        children: [
          Consumer<CountController>(
            builder: (context, myType, child) {
              return Text(myType.count.toString());
            },
          ),
          SizedBox(
            height: 20,
          ),
          Consumer<ListController>(
            builder: (context, listControllerModel, child) {
              debugPrint("text build");

              return Text(listControllerModel.itemList.last.toString());
            },
          ),
          Consumer<ListController>(
            builder: (context, listControllerModel, child) {
              debugPrint("list build");
              return Expanded(
                child: ListView.builder(
                  itemCount: listControllerModel.itemList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child:
                          Text(listControllerModel.itemList[index].toString()),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

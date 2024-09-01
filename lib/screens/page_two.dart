import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managemt_provider/controller/list_controller.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    debugPrint("page two rebuild");
    return Scaffold(
      floatingActionButton: Consumer<ListController>(
        builder: (context, myType, child) {
          debugPrint("floating 2 rebuild");

          return FloatingActionButton(
            onPressed: myType.addListItemFunction,
            child: const Icon(Icons.add),
          );
        },
      ),
      appBar: AppBar(
        title: const Text("Page Two"),
      ),
      body: Column(
        children: [
          Consumer<ListController>(
            builder: (context, myType, child) {
              debugPrint("text 2 rebuild");

              return Text(
                myType.itemList.last.toString(),
                style: const TextStyle(fontSize: 21),
              );
            },
          ),
          Consumer<ListController>(
            builder: (context, myType, child) {
              debugPrint("list 2 rebuild");

              return Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: myType.itemList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(myType.itemList[index].toString()),
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

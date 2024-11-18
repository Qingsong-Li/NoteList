// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.refresh),
        ),
        appBar: AppBar(
          title: const Text('NoteList'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: noteList());
  }

  Widget noteList() {
    return Obx(() => ListView.builder(
          itemCount: controller.noteList.length,
          itemBuilder: (BuildContext context, int index) {
            return noteItem(
                index,
              );
          },
        ));
  }

  Widget noteItem(int index) {

    return InkWell(
      onTap: () {
        Get.toNamed("detail",arguments: {"index":index});
      },
      child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(20),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                controller.noteList.value[index].title!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
                subtitle: Text(
                  controller.noteList.value[index].category!,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Divider(),
              Text(
                controller.noteList.value[index].detail!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16),
              )
            ],
          )),
    );
  }
}

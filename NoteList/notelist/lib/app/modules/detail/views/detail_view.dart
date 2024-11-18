// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

// ignore: must_be_immutable
class DetailView extends GetView<DetailController> {


  DetailView({
    super.key,
  });
  @override
// TODO: implement controller
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.upload();//上传数据
            controller.homeController.getNoteList();//重新加载数据
            Get.back();//返回主页面
            
          },
          child: const Icon(Icons.upload),
        ),
        appBar: AppBar(
          title: const Text('修改笔记'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const Text("标题： "),
                  Expanded(
                    child: TextField(
                      controller: controller.titleFiledController,
                      decoration: const InputDecoration(
                        hintText: "笔记标题",
                        border: OutlineInputBorder(),
                      ),
                      // onChanged: (value) {
                      //   controller.newNoteItem.detail = value;
                      // },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text("分类： "),
                  Expanded(
                    child: TextField(
                      controller: controller.categoryFiledController,
                      decoration: const InputDecoration(
                        hintText: "笔记分类",
                        border: OutlineInputBorder(),
                      ),
                      // onChanged: (value) {
                      //   controller.newNoteItem.category = value;
                      // },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.detailFiledController,
                maxLines: 1000,
                decoration: const InputDecoration(
                  hintText: "笔记内容",
                  border: OutlineInputBorder(),
                ),
                // onChanged: (value) {
                //   controller.newNoteItem.detail = value;
                // },
              ),
            ],
          ),
        ));
  }
}

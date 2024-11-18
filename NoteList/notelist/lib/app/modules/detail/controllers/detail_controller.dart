// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notelist/app/modules/home/controllers/home_controller.dart';
import 'package:notelist/app/modules/home/models/note_model.dart';

class DetailController extends GetxController {
  //该Item的索引 
  late final int index;

// 三个输入框的控制器
  late final TextEditingController titleFiledController;
  late final TextEditingController categoryFiledController;
  late final TextEditingController detailFiledController;

// 修改数据后上传的model
  late NoteItemModel newNoteItem;

//拿显示的笔记
  late final HomeController homeController;

  //TODO: Implement DetailController

  @override
  void onInit() {
    super.onInit();
    homeController = Get.find<HomeController>();

    titleFiledController = TextEditingController();
    categoryFiledController = TextEditingController();
    detailFiledController = TextEditingController();

    //获取该item的索引
   index = Get.arguments["index"];

    titleFiledController.value =
        TextEditingValue(text: homeController.noteList.value[index].title!);
    categoryFiledController.value =
        TextEditingValue(text: homeController.noteList.value[index].category!);
    detailFiledController.value =
        TextEditingValue(text: homeController.noteList.value[index].detail!);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // 提交修改后上传数据
  void upload() {
    DateTime nowTime = DateTime.now();

    NoteItemModel newNoteItem =
        NoteItemModel(nId: homeController.noteList.value[index].nId,
        title: titleFiledController.value.text,
        category: categoryFiledController.value.text,
        detail: detailFiledController.value.text,
        lastChangeTime: nowTime);

    newNoteItem.saveWithUrl("");
  }
}

// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:notelist/app/modules/home/models/note_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxList<NoteItemModel> noteList = <NoteItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getNoteList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getNoteList() async {

    // NoteModel noteModel = await NoteModel.fromUrl("");
    noteList.value = List.generate(10, (index) {
      return NoteItemModel(
          nId: "00${index}",
          title: "标题${index}",
          category: "分类${index}",
          detail: "内容：${index}",
          lastChangeTime: null);
    });
    sortByLastChangeTime();
    update();
  }

  void sortByLastChangeTime(){
    noteList.value.sort((a, b) => b.lastChangeTime!.compareTo(a.lastChangeTime!),);
  }
}

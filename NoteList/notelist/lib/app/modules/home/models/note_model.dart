import 'package:dio/dio.dart';
class NoteModel {
  List<NoteItemModel>? result;

  NoteModel({this.result});

// 根据url拿到全部笔记数据解析成model
  static Future<NoteModel> fromUrl(String url) async {
    try {
      Dio dio = Dio();
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return NoteModel.fromJson(response.data);
      } else {
        throw Exception('数据加载失败');
      }
    } catch (e) {
      throw Exception('error: $e');
    }
  }

  NoteModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <NoteItemModel>[];
      json['result'].forEach((v) {
        result?.add(NoteItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NoteItemModel {
  String? nId;
  String? title;
  String? category;
  String? detail;
  DateTime? lastChangeTime;

  NoteItemModel(
      {this.nId,
      this.title,
      this.category,
      this.detail,
      this.lastChangeTime,
      });

  NoteItemModel.fromJson(Map<String, dynamic> json) {
    nId = json['_id'];
    title = json['title'];
    category = json['category'];
    detail = json['detail'];
    
    lastChangeTime =  DateTime.parse(json['lastChangeTime']); }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = nId;
    data['title'] = title;
    data['category'] = category;
    data['detail'] = detail;
    data['lastChangeTime'] = lastChangeTime.toString();
    
    return data;
  }

   Future<void> saveWithUrl( String url) async {
   try {
    String url = "${this.nId}";
    Dio dio = Dio();
    Response response = await dio.post(
      url,
      data: {
        ...toJson(), // 将当前对象的 JSON 数据解构
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("保存成功");
    } else {
      throw Exception('保存失败 ${response.statusCode}');
    }
  } catch (e) {
    print('error: $e');
    rethrow;
  }
}
}
import 'dart:convert';

import 'package:flutter/services.dart';

import 'ModelClass.dart';

class ApiRepo {
  PostModel? pm;
  List<PostModel> postList=[];

  Future loadJsonData() async {
   var data = await rootBundle.loadString('assets/jsondata.json');

    var d = jsonDecode(data);
    for(var e in d){
      pm = PostModel.fromJson(e);
      postList.add(pm!);
    }
    return postList;
  }
}
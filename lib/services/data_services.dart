import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/model/welcome_data_model.dart';

class DataServices{
  String baseURl = 'http://mark.bslmeiyu.com/api';
  Dio dio = Dio();
  Future<List<DataModel>> getInfo()async{
    var apiUrl = '/getplaces';
    Response<dynamic> response =  await dio.get(baseURl+apiUrl);
    if(response.statusCode == 200) {
      List<dynamic> list = response.data;
      return list.map((e) => DataModel.fromJson(e)).toList();
    }else{
      debugPrint('Api Error');
      return [];
    }

  }
}
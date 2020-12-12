

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:technical_task/models/repo_model.dart';
import 'dart:convert' as convert;


class HelperFunctions{

  static void showToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  static  convertJsonResponse(Response jsonResponse){
    List<RepoModel> reposList=List();
    //decode the response to json format
    List<dynamic>jsonList=convert.jsonDecode(jsonResponse.body)as List;
    //convert the json list to repo model list
    for(int i=0;i<jsonList.length;i++){
      reposList.add(RepoModel.fromJson(jsonList[i]));
    }
    return reposList;
  }


}
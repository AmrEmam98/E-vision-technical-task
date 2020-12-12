

import 'package:intl/intl.dart';

class RepoModel{
  String name,description,htmlUrl;
  DateTime createdAt,pushedAt,updatedAt;
  RepoModel(){
  }
  RepoModel.fromJson(dynamic jsonObject){
    name=jsonObject['name'];
    description=jsonObject['description'];
    htmlUrl=jsonObject['html_url'];
    createdAt=DateTime.parse(jsonObject['created_at']);
    updatedAt=DateTime.parse(jsonObject['updated_at']);
    pushedAt=DateTime.parse(jsonObject['pushed_at']);

  }
}
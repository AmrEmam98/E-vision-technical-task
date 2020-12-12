import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:technical_task/constants/response_constants.dart';
class HttpService{
  //user name to get all user repos
 static Future fetchData(String userName)async{
    String url='https://api.github.com/users/$userName/repos';
    //get data from api
    http.Response response=  await  http.get(url);
    //if success then return thre response
    if(response.statusCode==200){
      return response;
    }
    // if failed then return not found
    else{
     return kNotFound;
    }


  }

}
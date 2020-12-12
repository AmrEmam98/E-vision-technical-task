import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:technical_task/constants/response_constants.dart';
import 'package:technical_task/models/repo_model.dart';
import 'package:technical_task/networkServices/http_services.dart';

import 'package:technical_task/screens/repos_screen.dart';
import 'package:technical_task/util/helper_functions.dart';

class LoadingScreen extends StatelessWidget {
  static String id = 'LoadingScreen';

  @override
  Widget build(BuildContext context) {
    String userName = ModalRoute.of(context).settings.arguments;
    print(userName);
    return Scaffold(
        body: Center(
      child: FutureBuilder(
        future: HttpService.fetchData(userName),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.done) {

            //user name not found
            if (snapShot.data == kNotFound) {
            _backToHomeScreen(context);
            } else {
              Response response = snapShot.data;

              //convet the json response into list of repo model
              List<RepoModel> reposList =
                  HelperFunctions.convertJsonResponse(response);

              //if no repos to show then back to home screen
              if(reposList.isEmpty){
                _backToHomeScreen(context);
              }


              else {
                //user name valid and there is a repos to show
                //then go to repos screen to show the repos in a list
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushReplacementNamed(context, ReposScreen.id,
                      arguments: reposList);
                });
              }
            }
          }
          return SpinKitFadingCircle(
            color: Colors.white,
            size: 70.0,
          );
        },
      ),
    ));
  }
  _backToHomeScreen(BuildContext context){
    SchedulerBinding.instance.addPostFrameCallback((_) {
      HelperFunctions.showToast('User name not found or no repos to show');
      Navigator.of(context).pop();
    });
  }
}

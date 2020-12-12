import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:technical_task/models/repo_model.dart';
import 'package:technical_task/util/helper_functions.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoListItem extends StatelessWidget {
  final RepoModel repoModel;
  bool isGrid;

  RepoListItem({this.repoModel,this.isGrid});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    //seperate cheldreens of last widget as we'll use it twice
    var children=[
      Text(
        'Created at : ${repoModel.createdAt.year}/ ${repoModel.createdAt.month}/${repoModel.createdAt.day}',
        style: TextStyle(color: Colors.black, fontSize: 15.0),
      ),
      InkWell(
        onTap: (){
          //open repo in browser
          _launchUrl(repoModel.htmlUrl);
        },
        child: Text(
          'Open in browser>>',
          style: TextStyle(
              color: Colors.blue[900],
              fontSize: 16.0
          ),
        ),
      )

    ];
    return Container(
      //if in grid mode the height'll be multiplied by 0.3 else 0.2 only
      height: screenSize.height * (isGrid?0.3:0.2),
      margin: EdgeInsets.symmetric(vertical: 3.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 5.0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    repoModel.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    //if description is null then put the string as null
                    repoModel.description ?? 'Null',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
             //if is grid mode diplay the last widget as column
              //else diplay it as a row
             isGrid?
           Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children:children,
             ):  Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children:children,
             )

            ],
          ),
        ),
      ),
    );

  }


  _launchUrl(String url)async{
    if (await canLaunch(url)) {
    await launch(url);
    } else {
    HelperFunctions.showToast('Error opening link' );
    }
  }

}

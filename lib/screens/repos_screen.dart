
import 'package:flutter/material.dart';
import 'package:technical_task/models/repo_model.dart';
import 'package:technical_task/widgets/repo_list_item.dart';
class ReposScreen extends StatefulWidget {
  static String id='ReposScreen';

  @override
  _ReposScreenState createState() => _ReposScreenState();
}

class _ReposScreenState extends State<ReposScreen> {
  @override
  bool isGrid=false;
  Widget build(BuildContext context) {
    List<RepoModel> reposList =ModalRoute.of(context).settings.arguments;
    print(reposList[0].name);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Repos'),
        actions: <Widget>[
          Center(child: Text('Switch Mode')),
          Switch(
            value: isGrid,
            onChanged: (value){
              setState(() {
                isGrid=value;
              });
            },
          ),
        ],
      ),
      body: Container(
        color: Color(0xFFBDBDBD),
        //if grid mode is selected then display grid view widget else display listview widget
        child: isGrid? GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context,index)=>RepoListItem(repoModel: reposList[index],isGrid: isGrid,),itemCount: reposList.length,)
            :ListView.builder(itemBuilder: (context,index)=>RepoListItem(repoModel: reposList[index],isGrid: isGrid,),itemCount: reposList.length,),
      ),
    );
  }
}

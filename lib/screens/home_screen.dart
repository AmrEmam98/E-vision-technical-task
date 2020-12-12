import 'package:flutter/material.dart';
import 'package:technical_task/screens/loading_screen.dart';
import 'package:technical_task/screens/repos_screen.dart';


class HomeScreen extends StatefulWidget {
  static String id='HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController usernameController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset('assets/images/github-universe.jpg',height:screenSize.height*0.3 ,width: screenSize.width,fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 16.0),
            child: Text('Please Enter Github User Name :',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 20.0,

            ),
              textAlign: TextAlign.start,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width*0.6,
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      hintText: 'AmrEmam98',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Colors.blue[900],
                              width: 2.0
                          )
                      ),

                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),

                      )
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search,color: Colors.white,size: 30.0,),
                onPressed:(){
                  if(!usernameController.text.isEmpty)
                    {
                      Navigator.pushNamed(context, LoadingScreen.id,arguments: usernameController.text);
                    }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class home extends StatefulWidget {
  home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  bool person = false;
  bool timer = false;
  bool android = false;
  bool iphone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mc Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
        Container(
          decoration: BoxDecoration(
            border: Border.all()
          ),
          padding: EdgeInsets.all(12),
          child: 
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.account_circle_rounded, size: 50,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Flutter McFlutter', style: TextStyle(fontSize: 25),),
                      Text('Experienced App Developer'),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('123 Main Street'),
                    Text('(415) 555-0198'),
                  ],
                ),
              ),
              //SizedBox(height: 13,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: (){
                      person = !person;
                      ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Text(" . . . "),
                        ),
                      );
                      setState(() {});
                    },
                    icon: Icon(Icons.accessibility, color: person?Colors.indigo:Colors.black),
                  ),
                  IconButton(
                    onPressed: (){
                      timer = !timer;
                      ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Text(" . . . "),
                        ),
                      );
                      setState(() {});
                    },
                    icon: Icon(Icons.timer, color: timer?Colors.indigo:Colors.black),
                  ),
                  IconButton(
                    onPressed: (){
                      android = !android;
                      ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Text(" . . . "),
                        ),
                      );
                      setState(() {});
                    },
                    icon: Icon(Icons.phone_android, color: android?Colors.indigo:Colors.black),
                  ),
                  IconButton(
                    onPressed: (){
                      iphone = !iphone;
                      ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Text(" . . . "),
                        ),
                      );
                      setState(() {});
                    },
                    icon: Icon(Icons.phone_iphone, color: iphone?Colors.indigo:Colors.black),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
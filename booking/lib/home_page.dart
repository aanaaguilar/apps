import 'package:flutter/material.dart';
import 'package:booking/info.dart';
import 'package:booking/activity_item.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Map<String, String>> _listElements = [
    {
      "day": "1",
      "lugar": "Nusa Islands",
      "image": "assets/images/nusa.jpg",
    },
    {
      "day": "2",
      "lugar": "Lempuyang Temple Complex",
      "image": "assets/images/lempuyang.jpg",
    },
    {
      "day": "3",
      "lugar": "Uluwatu Temple",
      "image": "assets/images/uluwatu.jpg",
    },
    {
      "day": "4",
      "lugar": "Pura Ulun Danu Bratan",
      "image": "assets/images/pura.jpg",
    },
    {
      "day": "5",
      "lugar": "Besakih Temple",
      "image": "assets/images/besakih.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('R E S E R V A   T U   H O T E L'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: 
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17),
                    child: Positioned.fill(
                      child: Image(image: AssetImage('assets/images/palms.jpg'), fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
              // para poder poner column o listview en stack hay que encerrarlas en positioned y anclarla a todos lados
              Positioned(
                top: 64,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView(
                  children: [
                    info(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                          },
                          child: Text("Details"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.grey[200],
                          ),
                        ),
                        Text("Walkthrough Flight Detail"),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () => {},
                            child: ActivityItem(
                              content: _listElements[index],
                            ),
                          );
                        },
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            content: Text("Reservación en progreso"),
                          ),
                        );
                      },
                      child: Text("Start booking", style: TextStyle(color: Colors.white),),
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

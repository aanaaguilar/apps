import 'package:flutter/material.dart';

class act extends StatelessWidget {
  final Map<String, String> content;
  act({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: 120,
            child: Image(image: AssetImage(content["image"]!), fit: BoxFit.fill),
          ),
          Text("Day ${content["day"]}", style: TextStyle(fontSize: 11)),
          Text("${content["lugar"]}"),
        ],
      ),
    );
  }
}
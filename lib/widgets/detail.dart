import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String,String> item; // create a variable item, of type Map<String,String>

  DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail page"),backgroundColor: Colors.red,),
      body: Center(
        child: Column(
          children: [
            Text(item["name"]!),
            Text(item["desc"]!),
            Text(item["place"]!)
          ],
        ),
      ),
    );
  }
}

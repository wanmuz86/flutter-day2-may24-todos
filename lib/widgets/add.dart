import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add new item"), backgroundColor: Colors.red,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Fill in the information"),
            TextField(decoration: InputDecoration(hintText: "Enter item name"),),
            TextField(decoration: InputDecoration(hintText: "Enter item description"),),
            TextField(decoration: InputDecoration(hintText: "Enter item place"),),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Add new Item"))
          ],
        ),
      ),
    );
  }
}

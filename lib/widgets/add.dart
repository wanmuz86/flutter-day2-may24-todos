import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  var nameEditingController = TextEditingController();
  var descEditingController = TextEditingController();
  var placeEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add new item"), backgroundColor: Colors.red,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Fill in the information"),
            TextField(decoration: InputDecoration(hintText: "Enter item name"),
            controller: nameEditingController,),
            TextField(decoration: InputDecoration(hintText: "Enter item description"),
            controller: descEditingController,),
            TextField(decoration: InputDecoration(hintText: "Enter item place"),
            controller: placeEditingController,),
            ElevatedButton(onPressed: (){

              // Create a Map with name, desc and place
              // We will use it later to be added inside the ListView
              var newItem = {
                "name":nameEditingController.text,
                "desc":descEditingController.text,
                "place":placeEditingController.text
              };

              print(newItem);



              Navigator.pop(context);
            }, child: Text("Add new Item"))
          ],
        ),
      ),
    );
  }
}

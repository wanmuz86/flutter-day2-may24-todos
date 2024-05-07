import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final int index;
  final Map<String, String>
      item; // create a variable item, of type Map<String,String>

  DetailPage({required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail page"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            Text(item["name"]!),
            Text(item["desc"]!),
            Text(item["place"]!),
            // ONLY ROW AND COLUMN - children, .. Stack..
            // Container, Center, Padding, Single .. child
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    print("ToDO: passed backward $index");
                  },
                  child: Text("Delete item"),
                ),
                ElevatedButton(
                    onPressed: () {

                    }, child: Text("Mark as complete"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

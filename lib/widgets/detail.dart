import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final int index;
  final Map<String, dynamic>
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

                    var data = {
                      "index": index,
                      "action": 1 // 1 is DELETE, 2 is MARK AS COMPLETED
                    };
                    Navigator.pop(context, data); // Pass it back
                  },
                  child: Text("Delete item"),
                ),
                ElevatedButton(
                    onPressed: () {
                      var data = {"index": index, "action": 2};
                      Navigator.pop(context, data);
                    },
                    child: Text(item["completed"] == true
                        ? "Unmark completion"
                        : "Mark as complete"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todos_may/widgets/add.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> _todos = [
    {
      "name": "Navigation",
      "desc": "Basic Navigation, Pass forward, Pass back data",
      "place": "Online meeting"
    },
    {
      "name": "ListView",
      "desc": "Listview, ListTile, Card",
      "place": "Online Meeting"
    },
    {
      "name": "Lunch",
      "desc": "Grab something for lunch",
      "place": "On place/ home"
    },
    {
      "name": "Shared Preference",
      "desc": "Local way of storing data",
      "place": "Online meeting"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To do app"),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          // How many rows are there?  -> The length of your data
          itemCount: _todos.length,

          // What to show on every row
          itemBuilder: (BuildContext context, int index) {
            // It will have a container
            // The height of the container is 50
            // The color of the container is amber
            // The container will have a centered child, with text  ...
            // the value "name" of each item in _todos List (index)
            return Container(
              height: 50,
              color: Colors.amber,
              child: Center(child: Text(_todos[index]["name"]!)),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPage()));
        },
        backgroundColor: Colors.red,
      ),
    );
  }
}

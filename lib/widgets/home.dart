import 'package:flutter/material.dart';
import 'package:todos_may/widgets/add.dart';
import 'package:todos_may/widgets/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _todos = [
    {
      "name": "Navigation",
      "desc": "Basic Navigation, Pass forward, Pass back data",
      "place": "Online meeting",
      "completed": true
    },
    {
      "name": "ListView",
      "desc": "Listview, ListTile, Card",
      "place": "Online Meeting",
      "completed": true
    },
    {
      "name": "Lunch",
      "desc": "Grab something for lunch",
      "place": "On place/ home",
      "completed": true
    },
    {
      "name": "Shared Preference",
      "desc": "Local way of storing data",
      "place": "Online meeting",
      "completed": false
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
            // return Container(
            //   height: 50,
            //   color: Colors.amber,
            //   child: Center(child: Text(_todos[index]["name"]!)),
            // );

            return Card(
              child: ListTile(
                leading: _todos[index]["completed"] == true
                    ? Icon(Icons.check)
                    : SizedBox(),
                title: Text(_todos[index]["name"]!),
                subtitle: Text(_todos[index]["place"]!),
                trailing: Icon(Icons.chevron_right),
                onTap: () async {
                  var data = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                item: _todos[index],
                                index: index,
                              )));

                  if (data != null) {
                    if (data["action"] == 1) {
                      // Delete
                      _todos.removeAt(data["index"]);

                      /// shared preference code will be here

                      setState(() {
                        _todos; // _todos = _todos;
                      });
                    } else {
                      // Edit
                      var index = data["index"];
                      // if true change to false
                      // if false change to true
                      // reverse it
                      _todos[index]["completed"] = ! _todos[index]["completed"];

                      setState(() {
                        _todos;
                      });
                    }
                  }
                },
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          // We WAITTTTT (await) until the process of AddPage finish and
          // see if there is an item passed
          // await is part of asynchronous prograimming ( async - await)
          // If you use await, you need to add async to the neareast
          // function {}
          var newItem = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPage()));

          // 3) We check and process the passed item

          if (newItem != null) {
            _todos.add(newItem);

            // shared prefeence code will be here

            setState(() {
              _todos; // _todos = _todos;
            });
          }
        },
        backgroundColor: Colors.red,
      ),
    );
  }
}

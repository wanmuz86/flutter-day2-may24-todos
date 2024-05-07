import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todos_may/widgets/add.dart';
import 'package:todos_may/widgets/detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _todos = [
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

  // Doing an initialization upon page load (document.ready) - initState

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // We retrieve based on the key / filename
    var todoString = prefs.getString("todos");
    if (todoString!= null){
      setState(() {
        // We transform String to List<dynamic> then assign it to todos
        _todos = jsonDecode(todoString);
      });
    }

  }

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

                      saveData();

                      setState(() {
                        _todos; // _todos = _todos;
                      });
                    } else {
                      // Edit
                      var index = data["index"];
                      // if true change to false
                      // if false change to true
                      // reverse it
                      _todos[index]["completed"] = !_todos[index]["completed"];
                      saveData();

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
            saveData();


            setState(() {
              _todos; // _todos = _todos;
            });
          }
        },
        backgroundColor: Colors.red,
      ),
    );
  }

  void saveData() async {
    // shared prefeence code will be here
    // Obtain shared preferences.
    final SharedPreferences prefs =
        await SharedPreferences.getInstance();
// shared preference only can store : string, int, double, bool, List<String>
    // If you want to store List or Map or List of Map
    // We transform it into string first / jsonEncode
    // First parameter is key / filename
    // Second parameter is what to be saved
    prefs.setString("todos", jsonEncode(_todos)); // save
  }
}

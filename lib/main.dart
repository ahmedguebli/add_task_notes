import 'package:flutter/material.dart';
import 'package:add_task_note/add-note.dart';
import 'package:add_task_note/all-notes.dart';
import 'package:add_task_note/complt-notes.dart';
import 'package:add_task_note/pending-notes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MY NOTES',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'MY NOTES'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  AppLifecycleState _lastLifecycleState;

  final List<Widget> _children = [
    MyAllTasks(),
    MyPendingTask(),
    MyCompletedTask()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.all_out), title: Text('ALL')),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_open), title: Text('PENDING')),
          BottomNavigationBarItem(
              icon: Icon(Icons.refresh), title: Text('COMPLETED')),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyAddNewTask(),
            ),
          );
        },
        tooltip: 'New Task',
        label: Text('Add a new Note'),
        icon: Icon(Icons.add),
      ),
    );
  }
}

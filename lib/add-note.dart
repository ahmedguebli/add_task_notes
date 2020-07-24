import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:add_task_note/task_data_model.dart';

class MyAddNewTask extends StatefulWidget {
  @override
  _MyAddNewTaskState createState() => _MyAddNewTaskState();
}

class _MyAddNewTaskState extends State<MyAddNewTask> {
  TextEditingController _taskTitle = new TextEditingController();
  TextEditingController _taskDescription = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Notes'),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Card(
          elevation: 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(12),
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: _taskTitle,
                  cursorColor: Theme.of(context).primaryColorDark,
                  decoration: InputDecoration(hintText: 'Note...'),
                ),
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          TaskDataModel().addTask(_taskTitle.text, _taskDescription.text);
          Navigator.pop(context);
        },
        label: Text('Save Note'),
        tooltip: 'Save Note',
        icon: Icon(Icons.check),
      ),
    );
  }
}

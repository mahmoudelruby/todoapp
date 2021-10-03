import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/ui/DataBase/Modal/Todo.dart';

class AddToDoBottomSheet extends StatefulWidget {
  static final ROUTE_NAME = 'bottomsheet';
  @override
  _AddToDoBottomSheetState createState() => _AddToDoBottomSheetState();
}

class _AddToDoBottomSheetState extends State<AddToDoBottomSheet> {
  String title = '';
  String content = '';
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return SafeArea(
//minimum: EdgeInsets.only(top: 100),

      child: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Text('Add New Task',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: MyThemeData.PrimaryColor))),
            TextField(
              onChanged: (newText) {
                title = newText;
              },
              decoration: InputDecoration(labelText: 'title'),
            ),
            TextField(
              onChanged: (newText) {
                content = newText;
              },
              decoration: InputDecoration(labelText: 'content'),
            ),
            InkWell(
              onTap: () {
                chooseDateForTodo();
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                child: Center(
                  child: date == null
                      ? Text(
                          'select date',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: MyThemeData.PrimaryColor),
                        )
                      : Text(date.toString()),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  addTodoItem();
                  Navigator.pop(context);
                },
                child: Text(
                  'add new',
                ))
          ],
        ),
      ),
    );
  }

  void addTodoItem() async {
    Todo todo = Todo(title: title, content: content, date: date);
    var box = await Hive.openBox<Todo>(Todo.BOX_NAME);
    box.add(todo);
  }

  void chooseDateForTodo() async {
    var chooseDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));

    date = chooseDate!;
  }
}

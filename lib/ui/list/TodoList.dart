import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/ui/DataBase/Modal/Todo.dart';

class TodoList extends StatelessWidget {
  Todo todo;
  Function onDeleteAction;
  TodoList(this.todo, this.onDeleteAction);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10),
      child: Slidable(
        actionExtentRatio: .25,
        actionPane: SlidableScrollActionPane(),
        actions: [
          IconSlideAction(
            onTap: () {
              onDeleteAction(todo);
            },
            color: Colors.transparent,
            iconWidget: Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8)),
                  color: Colors.red),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    Text(
                      'delete',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
        child: Container(
          decoration: BoxDecoration(
            color: MyThemeData.WhiteColor,
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.only(top: 5, bottom: 5),
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: MyThemeData.PrimaryColor),
                width: 3,
                height: 50,
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(left: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(todo.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: MyThemeData.PrimaryColor,
                            fontSize: 18,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today_outlined),
                          Text(todo.date.toString())
                        ],
                      ),
                    )
                  ],
                ),
              )),
              Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: MyThemeData.PrimaryColor),
                child: Image(image: AssetImage('assets/images/Icon_check.png')),
              )
            ],
          ),
        ),
      ),
    );
  }
}

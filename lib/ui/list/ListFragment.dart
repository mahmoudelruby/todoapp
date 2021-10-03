import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/ui/DataBase/Modal/Todo.dart';
import 'package:todoapp/ui/list/TodoList.dart';
import 'package:visibility_detector/visibility_detector.dart';

class TodoListFragment extends StatefulWidget {
  @override
  _TodoListFragmentState createState() => _TodoListFragmentState();
}

class _TodoListFragmentState extends State<TodoListFragment> {
  DateTime selectedDay = DateTime.now();
  List<Todo> todoslist = [];
  DateTime focuseDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return VisibilityDetector(
      key: Key('todo list screen'),
      onVisibilityChanged: (visibilityInfo) {
        getAllTodoFromBox();
      },
      child: Container(

        child: Column(children: [
          TableCalendar(
            firstDay: DateTime.now().subtract(Duration(days: 365)),
            lastDay: DateTime.now().add(Duration(days: 365)),
            calendarFormat: CalendarFormat.week,
            headerVisible: false,
            focusedDay: focuseDay,
            selectedDayPredicate: (day) {
              return isSameDay(day, selectedDay);
            },
            weekendDays: [],
            onDaySelected: (newSelectedDate, newfocuseDay) {
              setState(() {
                selectedDay = newSelectedDate;
                focuseDay = newfocuseDay;
              });
              getAllTodoFromBox();
            },
            calendarStyle: CalendarStyle(
              todayTextStyle:
                  TextStyle(fontSize: 18, color: MyThemeData.BlackColor),
              selectedDecoration: BoxDecoration(
                color: MyThemeData.BlackColor,
                borderRadius: BorderRadius.circular(8),
              ),
              defaultDecoration: BoxDecoration(
                  color: MyThemeData.WhiteColor,
                  borderRadius: BorderRadius.circular(8)),
              defaultTextStyle:
                  TextStyle(fontSize: 18, color: MyThemeData.BlackColor),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
                decoration: BoxDecoration(
                    color: MyThemeData.WhiteColor,
                    borderRadius: BorderRadius.circular(8))),
          ),
          Expanded(
              child: todoslist.length > 0
                  ? ListView.builder(
                      itemCount: todoslist.length,
                      itemBuilder: (context, index) {
                        return TodoList(todoslist[index], onDeleteTask);
                      })
                  : Center(child: Text('No Todos This Day')))
        ]),
      ),
    );
  }

  onDeleteTask(Todo item) async {
    var box = await Hive.openBox<Todo>(Todo.BOX_NAME);
    int index = box.values.toList().indexOf(item);
    box.deleteAt(index);
    getAllTodoFromBox();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTodoFromBox();
  }

  void getAllTodoFromBox() async {
    var box = await Hive.openBox<Todo>(Todo.BOX_NAME);

    setState(() {
      todoslist =
          box.values.where((item) => isSameDay(item.date, focuseDay)).toList();
    });
  }
}

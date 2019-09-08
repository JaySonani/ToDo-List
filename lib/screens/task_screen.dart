import 'package:flutter/material.dart';
import 'package:todoey_flutter/Widgets/tasks_list.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Material(
                  color: Colors.amber,
                  elevation: 10,
                  borderRadius: BorderRadius.circular(30),
                  child: CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 35,
                      color: Color(0xFF6C4F57),
                    ),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 50.0),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'To',
                                style: TextStyle(color: Color(0xFF6C4F57))),
                            TextSpan(
                                text: 'Do List',
                                style: TextStyle(color: Color(0xFF6C4F57)))
                          ]),
                    ),
                    // Text(
                    //   "Todo List",
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.w700,
                    //       color: Colors.black,
                    //       fontSize: 50.0),
                    // ),
                    Icon(
                      Icons.done_all,
                      size: 70,
                      color: Color(0xFF6C4F57),
                    ),
                  ],
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(color: Color(0xFF6C4F57), fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Provider.of<TaskData>(context).taskCount > 0 ? Color(0xFFE9E3E3) : Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Provider.of<TaskData>(context).taskCount > 0
                  ? TasksList()
                  : 
                  Container(
                    color: Colors.white,
                    child: Center(
                    
                      child: Column(
                        
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.check_circle,
                          size: 200,
                          color: Colors.lightGreen,
                        ),
                        Text(
                          "Hurray!",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 40),
                        ),
                        Text(
                          "You've completed all tasks",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                        )
                      ],
                    )),
            ),),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(),
          );
        },
        backgroundColor: Color(0xFF6C4F57),
        child: Icon(Icons.add),
      ),
    );
  }
}

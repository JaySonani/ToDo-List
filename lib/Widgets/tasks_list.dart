import 'package:flutter/material.dart';
import 'package:todoey_flutter/Widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final taskItem = taskData.tasks[index];

            return Dismissible(
              key: Key(taskItem.name),
              onDismissed: (direction){ 
                taskData.deleteTask(taskItem);
              },
              background: Container(
                color: Colors.green,
                padding: EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10,),
                    Text(
                      "Completed",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Deleted",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(width: 10,),
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),


              child: TaskTile(
                title: taskItem.name,
                isChecked: taskItem.isDone,
                checkboxCallback: (checkboxState) {
                  taskData.updateTask(taskItem);
                },
                longPressCallback: () {
                  taskData.deleteTask(taskItem);
                },
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/presentation/aml/home/custom.dart';
import 'package:graduation/presentation/aml/tasks/Tasks_Cubit/tasks_cubit.dart';
import 'package:lottie/lottie.dart';
import 'package:table_calendar/table_calendar.dart';

class task extends StatefulWidget {
  const task({super.key});

  @override
  State<task> createState() => _taskState();
}

DateTime today = DateTime.now();

class _taskState extends State<task> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "Your Tasks",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              backgroundColor: const Color.fromRGBO(210, 219, 220, 0.612),
            ),
            body: state is TasksGetLOADING
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(121, 152, 155, 0.612),
                            borderRadius: BorderRadius.circular(20)),
                        padding: EdgeInsets.only(top: 15, left: 30, right: 30),
                        margin: EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 20),
                        child: TableCalendar(
                          focusedDay: today,
                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.utc(2025, 12, 31),
                        ),
                      ),
                      Container(
                          child: Expanded(child: AllTasks(context: context))),
                    ],
                  ));
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/presentation/aml/tasks/CreateTask/create_task_cubit.dart';
import 'package:graduation/presentation/aml/tasks/Tasks_Cubit/tasks_cubit.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

class addTask extends StatefulWidget {
  const addTask({super.key});

  @override
  State<addTask> createState() => _addTaskState();
}

int index = 0;
bool status = true;
bool click_1 = true;
bool click_2 = true;
bool click_3 = true;

TextEditingController titlecontroler = TextEditingController();
TextEditingController purposecontroler = TextEditingController();
TextEditingController Startcontroler = TextEditingController();
TextEditingController endcontroler = TextEditingController();
TextEditingController title = TextEditingController();
var startTime;
var endTime;
bool Hidden = false;
bool Favourite = false;
bool Trash = false;

class _addTaskState extends State<addTask> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTaskCubit, CreateTaskState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              color: const Color.fromRGBO(239, 241, 241, 0.965),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            "Create New Task",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Schedule",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: input_field(
                          title: " Tittle",
                          controller: titlecontroler,
                          hint: "Enter the Title",
                          // widget: null,
                        ),
                      ),
                      input_field(
                        title: " Purpose",
                        controller: purposecontroler,
                        hint: "Enter the Purpose",
                        // widget: null,
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text('Start'),
                              TimePickerSpinnerPopUp(
                                mode: CupertinoDatePickerMode.time,
                                minTime: DateTime.now()
                                    .subtract(const Duration(days: 10)),
                                maxTime: DateTime.now()
                                    .add(const Duration(days: 800)),
                                barrierColor: Colors
                                    .black12, //Barrier Color when pop up show
                                minuteInterval: 1,
                                padding:
                                    const EdgeInsets.fromLTRB(12, 10, 12, 10),
                                cancelText: 'Cancel',
                                confirmText: 'OK',
                                pressType: PressType.singlePress,
                                // Customize your time widget
                                // timeWidgetBuilder: (dateTime) {},
                                onChange: (dateTime) {
                                  startTime =
                                      '${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
                                  print(
                                      startTime); // Implement your logic with select dateTime
                                },
                              )
                            ],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Column(
                            children: [
                              Text('End'),
                              TimePickerSpinnerPopUp(
                                mode: CupertinoDatePickerMode.time,
                                minTime: DateTime.now()
                                    .subtract(const Duration(days: 10)),
                                maxTime: DateTime.now()
                                    .add(const Duration(days: 800)),
                                barrierColor: Colors
                                    .black12, //Barrier Color when pop up show
                                minuteInterval: 1,
                                padding:
                                    const EdgeInsets.fromLTRB(12, 10, 12, 10),
                                cancelText: 'Cancel',
                                confirmText: 'OK',
                                pressType: PressType.singlePress,
                                // Customize your time widget
                                // timeWidgetBuilder: (dateTime) {},
                                onChange: (dateTime) {
                                  endTime =
                                      '${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
                                  print(endTime);
                                  // Implement your logic with select dateTime
                                },
                              )
                            ],
                          ),
                          Container(width: 12),
                        ],
                      ),
                      /////////////////////////////////////////////////////////////////////////
                      Container(
                        padding: const EdgeInsets.only(top: 20, left: 8),
                        child: const Text(
                          "Priority",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 52,
                                  width: double.infinity,
                                  child: Container(
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          backgroundColor: click_1
                                              ? const Color.fromARGB(
                                                  255, 235, 233, 233)
                                              : const Color.fromARGB(
                                                  255, 61, 125, 177),
                                        ),
                                        onPressed: () {
                                          Hidden = !Hidden;
                                          setState(() {
                                            click_1 = !click_1;
                                          });
                                        },
                                        child: const Text(
                                          "Low",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            ////////////

                            ///////////////////////
                            const SizedBox(width: 15),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 52,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        backgroundColor: click_2
                                            ? const Color.fromARGB(
                                                255, 235, 233, 233)
                                            : const Color.fromARGB(
                                                255, 61, 125, 177),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          Favourite = !Favourite;
                                          click_2 = !click_2;
                                        });
                                      },
                                      child: const Text(
                                        "Medium",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        backgroundColor: click_3
                                            ? const Color.fromARGB(
                                                255, 235, 233, 233)
                                            : const Color.fromARGB(
                                                255, 61, 125, 177),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          Trash = !Trash;
                                          click_3 = !click_3;
                                        });
                                      },
                                      child: const Text(
                                        "High",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //////////////////////////////////////////////////////////////////
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: const input_field(
                          title: " Description",
                          hint: "Enter the Description",
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: SwitchListTile(
                          title: const Text(
                            "Reminder",
                            style: TextStyle(fontSize: 22),
                          ),
                          activeColor: const Color.fromARGB(255, 61, 125, 177),
                          inactiveThumbColor: Colors.grey,
                          value: status,
                          onChanged: (value) {
                            setState(() {
                              status = value;
                            });
                          },
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 50),
                          width: 320,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              backgroundColor: click_2
                                  ? const Color.fromARGB(255, 61, 125, 177)
                                  : const Color.fromARGB(255, 61, 125, 177),
                            ),
                            onPressed: () {
                              CreateTaskCubit.get(context).CreateTask(
                                  title: titlecontroler.text,
                                  purpose: purposecontroler.text,
                                  start_time: startTime.toString(),
                                  end_time: endTime.toString(),
                                  favorite: Favourite,
                                  trash: Trash,
                                  hidden: Hidden);
                              TasksCubit.get(context).getAllTasks();
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    margin: const EdgeInsets.all(15),
                                    child: Container(
                                      child: AlertDialog(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 40),
                                        title: const Center(
                                          child: Text(
                                            "Great Job",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                            ),
                                          ),
                                        ),
                                        content: Text(
                                            "Your Task was added Successfully",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[700])),
                                        backgroundColor: const Color.fromARGB(
                                            255, 211, 216, 223),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        actions: [
                                          Center(
                                            child: Container(
                                              width: 150,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              padding: const EdgeInsets.only(
                                                  top: 30),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  backgroundColor: click_2
                                                      ? const Color.fromARGB(
                                                          255, 61, 125, 177)
                                                      : const Color.fromARGB(
                                                          255, 61, 125, 177),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  "Back",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              child: const Text(
                                "Create Task",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            // color: Color.fromARGB(255, 61, 125, 177),
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}

class input_field extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  // final Widget widget;

  const input_field({
    super.key,
    required this.title,
    required this.hint,
    this.controller,
    // required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 53,
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.2),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  autocorrect: false,
                  cursorColor: Colors.grey,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: hint,
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

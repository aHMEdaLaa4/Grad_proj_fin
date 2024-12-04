import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation/presentation/aml/chats/chat.dart';
import 'package:graduation/presentation/aml/home/custom.dart';
import 'package:graduation/presentation/aml/tasks/Favourite.dart';
import 'package:graduation/presentation/aml/tasks/Hidden.dart';
import 'package:graduation/presentation/aml/tasks/Tasks_Cubit/Search.dart';
import 'package:graduation/presentation/aml/tasks/Tasks_Cubit/tasks_cubit.dart';
import 'package:graduation/presentation/aml/tasks/Trash.dart';
import 'package:graduation/presentation/aml/tasks/task.dart';
import 'package:graduation/presentation/aya/screen/Home/home_cubit.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

var search;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
                color: const Color.fromRGBO(239, 241, 241, 0.965),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Search(),
                                  ));
                            },
                            child: Container(
                              width: 300,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(Icons.search),
                                ],
                              ),
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 20),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => chat()),
                                  );
                                },
                                icon: const FaIcon(FontAwesomeIcons.comment)),
                          )
                        ],
                      ),
                    ),
                    ///////////////////////////////////////////////////////////////////
                    Container(
                      height: 15,
                    ),
                    /////////////////////////////////////////////////////////////////////////////
                    Column(
                      children: [
                        Container(
                          child: GridView(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 150,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15),
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 167, 191, 211),
                                        width: 2),
                                    color: const Color.fromARGB(
                                        255, 251, 248, 248),
                                    borderRadius: BorderRadius.circular(20)),
                                child: InkWell(
                                  onTap: () {
                                    TasksCubit.get(context).getAllTasks();
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => const task()),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                      ),
                                      Container(
                                        height: 25,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: const Text("All Tasks",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Container(
                                        child: const Divider(
                                          color: Color.fromARGB(
                                              255, 167, 191, 211),
                                          thickness: 2,
                                          endIndent: 7,
                                        ),
                                      ),
                                      Lottie.asset('assets/images/task.json',
                                          height: 70)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 167, 191, 211),
                                        width: 2),
                                    color: const Color.fromARGB(
                                        255, 251, 248, 248),
                                    borderRadius: BorderRadius.circular(20)),
                                child: InkWell(
                                  onTap: () {
                                    TasksCubit.get(context).getFavTasks();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Favourite(),
                                        ));
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 15,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: const Text("Favorite",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        child: const Divider(
                                          color: Color.fromARGB(
                                              255, 167, 191, 211),
                                          thickness: 2,
                                          endIndent: 7,
                                        ),
                                      ),
                                      Container(
                                          child: Lottie.asset(
                                              'assets/images/start.json',
                                              width: 45)),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 167, 191, 211),
                                        width: 2),
                                    color: const Color.fromARGB(
                                        255, 251, 248, 248),
                                    borderRadius: BorderRadius.circular(20)),
                                child: InkWell(
                                  onTap: () {
                                    TasksCubit.get(context).getTrashTasks();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Trash(),
                                        ));
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 25,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: const Text("Trash",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17)),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        child: const Divider(
                                          color: Color.fromARGB(
                                              255, 167, 191, 211),
                                          thickness: 2,
                                          endIndent: 7,
                                        ),
                                      ),
                                      Container(
                                          child: Lottie.asset(
                                              'assets/images/trash.json',
                                              width: 40)),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 167, 191, 211),
                                        width: 2),
                                    color: const Color.fromARGB(
                                        255, 251, 248, 248),
                                    borderRadius: BorderRadius.circular(20)),
                                child: InkWell(
                                  onTap: () {
                                    TasksCubit.get(context).getHideTasks();

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HiddenScreen(),
                                        ));
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 25,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: const Text("Hidden",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17)),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        child: const Divider(
                                          color: Color.fromARGB(
                                              255, 167, 191, 211),
                                          thickness: 2,
                                          endIndent: 7,
                                        ),
                                      ),
                                      Container(
                                          child: const FaIcon(
                                        FontAwesomeIcons.eyeSlash,
                                        color:
                                            Color.fromARGB(255, 61, 125, 177),
                                        size: 30,
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        state is TasksGetLOADING
                            ? Lottie.asset('assets/images/loading.json')
                            : TasksCubit.get(context).AllTasks.isEmpty
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Divider(),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'No Tasks',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Center(
                                          child: Lottie.asset(
                                              'assets/images/Animation.json',
                                              height: 235)),
                                    ],
                                  )
                                : Container(child: HomeTasks(context: context))
                      ],
                    )
                  ],
                )),
          ),
        );
      },
    );
  }
}

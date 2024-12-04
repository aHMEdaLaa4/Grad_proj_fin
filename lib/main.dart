import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/Cache/local_network.dart';
import 'package:graduation/network/Dio/App_Dio.dart';
import 'package:graduation/presentation/aml/tasks/CreateTask/create_task_cubit.dart';
import 'package:graduation/presentation/aml/tasks/Tasks_Cubit/tasks_cubit.dart';
import 'package:graduation/presentation/aya/pageroute/Setting/settings_cubit.dart';
import 'package:graduation/presentation/aya/screen/Home/home_cubit.dart';
import 'package:graduation/presentation/aya/screen/calls/calls_cubit.dart';
import 'package:graduation/presentation/screens/ForgetPassDoc/Forget_pass.dart';
import 'package:graduation/presentation/screens/ForgetPassDoc/forget_pass_doc_cubit.dart';
import 'package:graduation/presentation/screens/Login_patient/login_patient_cubit.dart';
import 'package:graduation/presentation/screens/RegisterDoctor/cubit/auth_cubit.dart';
import 'package:graduation/presentation/screens/VerifyDoctor/verify_cubit.dart';
import 'package:graduation/presentation/screens/VideoCall/callscreen.dart';
import 'package:graduation/presentation/screens/log_in.dart';
import 'package:graduation/presentation/screens/log_in2.dart';
import 'package:graduation/presentation/screens/loginDoctor/cubit/login_cubit.dart';
import 'package:graduation/presentation/screens/loginDoctor/login_doc.dart';
import 'package:graduation/presentation/screens/Login_patient/Register_patient.dart';

import 'package:graduation/presentation/screens/on_bording.dart';
import 'package:graduation/presentation/screens/on_bording1.dart';
import 'package:graduation/presentation/screens/on_bording4.dart';

import 'presentation/screens/VerifyDoctor/verify.dart';


void main() {
  runApp(const MyApp());
  AppDioHelper.init();
  CacheNetwork.cacheInitilzation();
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:
    [
      BlocProvider(create: (context)=>AuthCubit()),
      BlocProvider(create: (context)=>LoginCubit()),
      BlocProvider(create: (context)=>CallsCubit()),
      BlocProvider(create: (context)=>ForgetPassDocCubit()),
      BlocProvider(create: (context)=>VerifyCubit()),
      BlocProvider(create: (context)=>HomeCubit()),
      BlocProvider(create: (context)=>SettingsCubit()),
      BlocProvider(create: (context)=>LoginPatientCubit()),
      BlocProvider(create: (context)=>TasksCubit()),
      BlocProvider(create: (context)=>CreateTaskCubit()),
    ] , child: MaterialApp(debugShowCheckedModeBanner: false,

      home:SplashScreen(),
    ) );
  }
}


// PageView(
// children: [
// ONBORDING1(),
// ONBORDING2(),
// ONBORDING3(),
// ONBORDING4(),
// LOGIN(),
// LOGIN2(),
// FORGET(),
// VerifyDoctor(),
// NewPassword(),
// Congratulations(),
// WelcomeBack(),
// Profile(),
// Balance(),
// ChatBot(),
// ],
// ),
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation/presentation/aya/pageroute/Setting/settings_cubit.dart';
import 'package:graduation/presentation/aya/pageroute/availability_widget.dart';
import 'package:graduation/presentation/aya/pageroute/changePass.dart';
import 'package:graduation/presentation/aya/pageroute/create-call.dart';
import 'package:graduation/presentation/aya/pageroute/feedback_widget.dart';
import 'package:graduation/presentation/aya/pageroute/Setting/settings_widget.dart';
import 'package:graduation/presentation/aya/pageroute/termsOfUse.dart';
import 'package:graduation/presentation/aya/pageroute/wallet.dart';
import 'package:graduation/presentation/aya/screen/Home/home_cubit.dart';
import 'package:graduation/presentation/aya/screen/calls/calls_screen.dart';
import 'package:graduation/presentation/screens/loginDoctor/login_doc.dart';

import '../../../Cache/local_network.dart';
import '../../screens/ForgetPassDoc/Forget_pass.dart';
import '../../screens/VideoCall/callscreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 110, right: 110),
                    child: Text(
                      'User Profile',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 15),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color.fromARGB(63, 196, 196, 196),
                                width: 1))),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: SettingsCubit.get(context)
                                    .DocDetails['photo'] !=
                                null
                            ? NetworkImage(SettingsCubit.get(context)
                                .DocDetails['photo']
                                .toString())
                            : NetworkImage(
                                'https://th.bing.com/th/id/R.9c213f70d66f833eb40f7cc3e907d724?rik=X9mHpfM3hPTvmA&pid=ImgRaw&r=0'),
                      ),
                      title: Row(
                        children: [
                          Text(
                            'Dr.${CacheNetwork.getCacheData(key: 'name')} ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Icon(
                            Icons.check_circle_outline,
                            size: 17,
                            color: Colors.blueAccent,
                          )
                        ],
                      ),
                      subtitle: Text(
                          SettingsCubit.get(context).DocDetails['specialize']),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.wallet,
                            color: Color.fromARGB(193, 0, 0, 129),
                            size: 30,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Wallet',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              MaterialButton(
                                minWidth: 1,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Wallet()));
                                },
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.settings,
                            color: Color.fromARGB(193, 0, 0, 129),
                            size: 30,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Account Settings',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              MaterialButton(
                                minWidth: 1,
                                onPressed: () {
                                  SettingsCubit.get(context)
                                      .getDoctorInformation(context: context);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const SettingsWidget()));
                                },
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.password_rounded,
                            color: Color.fromARGB(193, 0, 0, 129),
                            size: 30,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Change Password',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              MaterialButton(
                                minWidth: 1,
                                onPressed: () {
                                  SettingsCubit.get(context)
                                      .getDoctorInformation(context: context);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => FORGET()));
                                },
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.feed_outlined,
                            color: Color.fromARGB(193, 0, 0, 129),
                            size: 30,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Feedback after session',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              MaterialButton(
                                minWidth: 1,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const FeedBackWidget()));
                                },
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.call_outlined,
                            color: Color.fromARGB(193, 0, 0, 129),
                            size: 30,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Create New Call',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              MaterialButton(
                                minWidth: 1,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const callScreen()));
                                },
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.calendar_month,
                            color: Color.fromARGB(193, 0, 0, 129),
                            size: 30,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Avilability',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              MaterialButton(
                                minWidth: 1,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const AvailabilityWidget()));
                                },
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.check_box,
                            color: Color.fromARGB(193, 0, 0, 129),
                            size: 30,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Terms Of Use',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              MaterialButton(
                                minWidth: 1,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const TermsOfUse()));
                                },
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Fluttertoast.showToast(
                                msg: "Loging Out",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM_LEFT,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginDoc(),
                                ));
                          },
                          child: Container(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            child: ListTile(
                              leading: const Icon(
                                Icons.logout_outlined,
                                color: Color.fromARGB(193, 0, 0, 129),
                                size: 30,
                              ),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Log Out',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  MaterialButton(
                                    minWidth: 1,
                                    onPressed: () {},
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

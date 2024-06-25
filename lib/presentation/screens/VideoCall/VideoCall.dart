import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class VideoPage extends StatelessWidget {
  final callid;

  VideoPage({this.callid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ZegoUIKitPrebuiltCall(
            appID: 723729696,
            // Fill in the appID that you get from ZEGOCLOUD Admin Console.
            appSign:
            'd4895f22446e68280363eaf3a6e31b721974a7bf1e07b49de2b7dc4a12bfd836',
            // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
            userID: userid,
            userName: username,
            callID: callid,
            // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
            config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()));
  }
}

String userid = Random().nextInt(1095000).toString();
String username = Random().nextInt(10095000).toString();

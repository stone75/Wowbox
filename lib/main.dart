import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import 'appmain.dart';

void main() {

  KakaoSdk.init(
    nativeAppKey: '322e0c114b1f0d8a7942fb0526abe2ae',
    javaScriptAppKey: 'a215b324981be3de75e54e29b365efb9',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wowbox',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const AppMain(),
    );
  }
}

// Side Drawer (removed)
// https://pub.dev/packages/flutter_slider_drawer
//
// Navigation Bar
// https://pub.dev/packages/responsive_navigation_bar
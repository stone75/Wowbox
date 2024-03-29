import 'package:flutter/material.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';
import 'package:wowbox/db/dbHelper.dart';
import 'package:wowbox/models/mdlUserInfo.dart';
import 'package:wowbox/scnBoxList.dart';
import 'package:wowbox/scnBoard.dart';
import 'package:wowbox/scnCoin.dart';
import 'package:wowbox/scnLogin.dart';
import 'package:wowbox/scnMyPage.dart';

import 'scnGoods.dart';
import 'C.dart';

final iconList = <IconData>[
  Icons.card_giftcard_outlined, // 상품 리스트
  Icons.forum_outlined, // 속닥속닥
  Icons.cake_outlined, // 코인벌기
  Icons.curtains_outlined, // 커뮤니티
];

final sceneList = <Widget>[
  SceneGoods(),
  SceneBoxList(),
  SceneCoin(),
  SceneBoard(),
];

class AppMain extends StatefulWidget {
  const AppMain({super.key});

  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  var _bottomNavIndex = 0;

  void changeTab(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // var targetScene;

    DBHelper helper = DBHelper();
    var readUserInfo = helper.getUserInfo();
    C.logger('----------=========');
    C.logger(C.g_UserInfo.toString());
    // if (C.g_UserInfo == null || C.g_UserInfo?.userid == '0') {
    //   targetScene = SceneLogin();
    // } else {
    //   targetScene = SceneMyPage();
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wowbox"),
        centerTitle: true,
        // leading: IconButton(
        //   icon: const Icon(Icons.accessibility),
        //   onPressed: () {},
        // ),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_rounded),
            iconSize: 30,
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  // pageBuilder: (context, animation, secondaryAnimation) => targetScene,
                  pageBuilder: ((context, animation, secondaryAnimation) {
                    if (C.g_UserInfo == null || C.g_UserInfo?.userid == '0') {
                      return SceneLogin();
                    } else {
                      return SceneMyPage();
                    }
                  }),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const begin = Offset(-1.0, 0.0);
                    const end = Offset.zero;
                    final tween = Tween(begin: begin, end: end);
                    final offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                )
              ).then((value) { setState(() {});});
            },
          ),
          // IconButton(
          //   icon: const Icon(Icons.person),
          //   iconSize: 30,
          //   onPressed: () {
          //     Navigator.of(context).push(
          //       PageRouteBuilder(
          //         pageBuilder: (context, animation, secondaryAnimation) => const SceneMyPage(),
          //         transitionsBuilder: (context, animation, secondaryAnimation, child) {
          //           const begin = Offset(-1.0, 0.0);
          //           const end = Offset.zero;
          //           final tween = Tween(begin: begin, end: end);
          //           final offsetAnimation = animation.drive(tween);
          //
          //           return SlideTransition(
          //             position: offsetAnimation,
          //             child: child,
          //           );
          //         },
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
      body: sceneList[_bottomNavIndex],

      extendBody: true,
      bottomNavigationBar: ResponsiveNavigationBar(
        selectedIndex: _bottomNavIndex,
        onTabChange: changeTab,
        // showActiveButtonText: false,
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),

        navigationBarButtons: const <NavigationBarButton>[
          NavigationBarButton(
            text: 'Goods',
            icon: Icons.redeem_outlined,
            backgroundGradient: LinearGradient(
              colors: [
                Colors.redAccent,
                Colors.orangeAccent,
                Colors.greenAccent
              ],
            ),
          ),
          NavigationBarButton(
            text: 'Box',
            icon: Icons.unarchive_outlined,
            backgroundGradient: LinearGradient(
              colors: [
                Colors.greenAccent,
                Colors.blueAccent,
              ],
            ),
          ),
          NavigationBarButton(
            text: 'Coin',
            icon: Icons.monetization_on_outlined,
            backgroundGradient: LinearGradient(
              colors: [
                Colors.blueAccent,
                Colors.deepPurpleAccent,
              ],
            ),
          ),
          // NavigationBarButton(
          //   text: 'Board',
          //   icon: Icons.diversity_3_outlined,
          //   backgroundGradient: LinearGradient(
          //     colors: [
          //       Colors.deepPurpleAccent,
          //       Colors.redAccent,
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

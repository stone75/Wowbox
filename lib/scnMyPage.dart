import 'package:flutter/material.dart';
import 'package:wowbox/C.dart';

class SceneMyPage extends StatefulWidget {
  const SceneMyPage({super.key});

  @override
  State<SceneMyPage> createState() => _SceneMyPageState();
}

class _SceneMyPageState extends State<SceneMyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 64),
            Center(
              child: Icon(
                Icons.check_box_outlined,
                color: Colors.amberAccent,
                size: 160,
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text("ElevatedButton"),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: Text('UserInfo : ' + C.g_UserInfo.toString()),
            ),
          ],
        ),
      ),
    );
  }
}

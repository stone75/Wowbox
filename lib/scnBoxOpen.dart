import 'package:flutter/material.dart';

class SceneBoxOpen extends StatefulWidget {
  const SceneBoxOpen({super.key});

  @override
  State<SceneBoxOpen> createState() => _SceneBoxOpenState();
}

class _SceneBoxOpenState extends State<SceneBoxOpen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Box Open!!!'),
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
          ],
        ),
      ),
    );
  }
}

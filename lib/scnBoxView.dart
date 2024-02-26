import 'package:flutter/material.dart';

class SceneBoxView extends StatefulWidget {
  final dynamic itemID;

  const SceneBoxView({Key? key, required this.itemID}) : super(key: key);

  @override
  State<SceneBoxView> createState() => _SceneBoxViewState();
}

class _SceneBoxViewState extends State<SceneBoxView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Box View!!!'),
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
              child: Text("Box ID : ${widget.itemID}"),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Close"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

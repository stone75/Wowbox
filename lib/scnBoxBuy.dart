import 'package:flutter/material.dart';

class SceneBoxBuy extends StatefulWidget {
  const SceneBoxBuy({super.key});

  @override
  State<SceneBoxBuy> createState() => _SceneBoxBuyState();
}

class _SceneBoxBuyState extends State<SceneBoxBuy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Box Buy!!!'),
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
                child: Text("Buy New Box"),
              ),
            ),
          ],
        ),
      ),
    );
  }}

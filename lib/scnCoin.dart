import 'package:flutter/material.dart';

class SceneCoin extends StatefulWidget {
  const SceneCoin({super.key});

  @override
  State<SceneCoin> createState() => _SceneCoinState();
}

class _SceneCoinState extends State<SceneCoin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: const [
          SizedBox(height: 64),
          Center(
            child: Icon(
              Icons.monetization_on_outlined,
              color: Colors.amberAccent,
              size: 160,
            ),
          ),
        ],
      ),
    );
  }
}

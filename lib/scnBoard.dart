import 'package:flutter/material.dart';

class SceneBoard extends StatefulWidget {
  const SceneBoard({super.key});

  @override
  State<SceneBoard> createState() => _SceneBoardState();
}

class _SceneBoardState extends State<SceneBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: const [
          SizedBox(height: 64),
          Center(
            child: Icon(
              Icons.diversity_3_outlined,
              color: Colors.amberAccent,
              size: 160,
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

class RandomPositionsGeneratorButton extends StatefulWidget {
  final ValueChanged<Map<String, String>> onEmitPosition;
  const RandomPositionsGeneratorButton({super.key, required this.onEmitPosition});

  @override
  State<RandomPositionsGeneratorButton> createState() => RandomPositionsGeneratorButtonState();
}

class RandomPositionsGeneratorButtonState extends State<RandomPositionsGeneratorButton> {
  static List<Map<String, String>> imagePositions = [
    {'name': 'A bicicleta', 'image': '1-Bicicleta.jpeg'},
    {'name': 'Cara a cara', 'image': '2-Cara-a-cara.jpeg'},
    {'name': 'O plugue', 'image': '3-O-plugue.jpeg'},
    {'name': 'O Cachorro', 'image': '4-O-cachorro.jpeg'},
    {'name': 'Pequena colher', 'image': '5-Pequena-colher.jpeg'},
    {'name': '69 em ponte', 'image': '6-69-em-ponte.jpeg'},
  ];
  final Set<int> _drawnPositions = {};
  final int numbersOfPositions = imagePositions.length;
  int _randomPosition = 0;

  void _generatorRandomPosition() {
    final random = Random();

    if (_drawnPositions.length == numbersOfPositions) {
      _drawnPositions.clear();
    }

    do {
      _randomPosition = random.nextInt(numbersOfPositions);
    } while(_drawnPositions.contains(_randomPosition));

    setState(() {
      _drawnPositions.add(_randomPosition);
      widget.onEmitPosition(imagePositions[_randomPosition]);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
     
      child: ElevatedButton(
        onPressed: _generatorRandomPosition,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(const Color.fromARGB(255, 248, 0, 95).withOpacity(0.8)),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)),
          textStyle: WidgetStateProperty.all<TextStyle>(const TextStyle(fontSize: 24)),
          elevation: WidgetStateProperty.all<double>(1.0)
        ),
        child: const Text('Sortear posição')
      )
    );
  }
}

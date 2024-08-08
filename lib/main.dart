import 'package:flutter/material.dart';
import 'package:random_sutra/image_sex_position.dart';
import 'package:random_sutra/randomizer_positions_button.dart';

void main() {
  runApp(const RandomSutraApp());
}

class RandomSutraApp extends StatelessWidget {
  const RandomSutraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RandomSutra()
    );
  }
}

class RandomSutra extends StatefulWidget {
  const RandomSutra({super.key});

  @override
  State<RandomSutra> createState() => RandomSutraState();
}

class RandomSutraState extends State<RandomSutra> {
  String _currentImage = '1-Bicicleta.jpeg';
  String _namePosition = 'Bicileta';

  void updatePosition(Map<String, String> newPosition) {
    setState(() {
      _currentImage = newPosition['image']!;
      _namePosition = newPosition['name']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade700,
      appBar: AppBar(
        backgroundColor: const Color(0xFFE94E77).withOpacity(0.6),
        title: const Text('Random Images', selectionColor: Colors.white,)
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              const Color(0xFFE92CA1).withOpacity(0.8), // Base color
              const Color(0xFFE94E77).withOpacity(0.6), // Slightly lighter
              const Color(0xFFFFA07A).withOpacity(0.4), // Light warm color
              const Color(0xFFFFD700).withOpacity(0.2), // Lightest warm color
            ],
            stops: const [0.1, 0.4, 0.7, 1.0],
            center: const Alignment(0.3, 0.3),
            radius: 1.0
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ImageSexPosition(sexPositionImage: _currentImage),
                Text(_namePosition, style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24.0
                )),
                Container(
                  width: 280,
                  margin: const EdgeInsets.fromLTRB(0, 32.0, 0, 0),
                  child: RandomPositionsGeneratorButton(onEmitPosition: updatePosition)
                ),
              ]
            ),
          ),
        ),
      )
    );
  }
}

import 'package:flutter/material.dart';

class ImageSexPosition extends StatelessWidget {
  final String sexPositionImage;

  const ImageSexPosition({super.key, required this.sexPositionImage});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Sutra/$sexPositionImage',
      width: double.infinity,
      height: 300,
    );
  }
}

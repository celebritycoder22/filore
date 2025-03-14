import 'package:flutter/material.dart';

class PhotoFullScreen extends StatelessWidget {
  const PhotoFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(''),
          ],
        ),
      ),
    );
  }
}

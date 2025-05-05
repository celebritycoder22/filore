import 'dart:ui';

import 'package:filore/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class GlassSnackbar extends StatelessWidget {
  const GlassSnackbar({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
          child: Container(
            height: 30,
            width: 200,
            decoration: BoxDecoration(color: white.withValues(alpha: 0.3)),
            child: Text(message),
          ),
        ),
      ),
    );
  }
}

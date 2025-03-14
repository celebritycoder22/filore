import 'package:filore/src/utils/constants/colors.dart';
import 'package:filore/src/utils/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:go_router/go_router.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({
    super.key,
    required this.isDark,
    required this.route,
  });

  final bool isDark;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: GestureDetector(
          onTap: () {
            context.go(route);
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 30),
            child: CircleAvatar(
              backgroundColor: isDark ? giftGrey : fGrey,
              child: SvgPicture.asset(
                arrowBackIcon,
                height: 25,
                width: 25,
                colorFilter:
                    ColorFilter.mode(isDark ? white : black, BlendMode.srcIn),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';
import 'package:filore/src/core/providers/navigation_index_provider.dart';
import 'package:filore/src/core/providers/user_provider.dart';
import 'package:filore/src/routes/photo_feed_screen.dart';
import 'package:filore/src/routes/user_profile_screen.dart';
import 'package:filore/src/utils/constants/colors.dart';
import 'package:filore/src/utils/constants/icons.dart';
import 'package:filore/src/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiloreHome extends ConsumerWidget {
  const FiloreHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final deviceWidth = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final selectedIndex = ref.watch(selectedIndexProvider);

    final List<Widget> screens = [
      PhotoFeedScreen(),
      UserProfileScreen(), // No need to pass user manually
    ];

    return Scaffold(
      body: Stack(
        children: [
          screens[selectedIndex], // Main screen content

          // Glassmorphic Bottom Navigation Bar
          Positioned(
            bottom: -1, // Adjusts its position above the screen bottom
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20), // Strong blur
                child: Container(
                  height: 70,
                  width: deviceWidth, // Keeps it centered
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: isDark
                        ? giftGrey.withValues(alpha: .3)
                        : white.withValues(alpha: 0.3), // Soft transparency
                    border: Border(
                        top: BorderSide(
                            color: isDark
                                ? const Color.fromARGB(255, 227, 227, 227)
                                : black,
                            width: 0.2)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ref.read(selectedIndexProvider.notifier).state = 0;
                          },
                          child: SvgPicture.asset(
                            homeIcon,
                            height: 25,
                            width: 25,
                            colorFilter: ColorFilter.mode(
                              isDark ? white : black,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ref.read(selectedIndexProvider.notifier).state = 0;
                          },
                          child: SvgPicture.asset(
                            searchIcon,
                            height: 25,
                            width: 25,
                            colorFilter: ColorFilter.mode(
                              isDark ? white : black,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ref.read(selectedIndexProvider.notifier).state = 0;
                          },
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                colors: [green, black],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds);
                            },
                            child: SvgPicture.asset(
                              addPostIcon,
                              height: 40,
                              width: 40,
                              colorFilter: ColorFilter.mode(
                                isDark ? white : black,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ref.read(selectedIndexProvider.notifier).state = 0;
                          },
                          child: SvgPicture.asset(
                            bookmarkIcon,
                            height: 25,
                            width: 25,
                            colorFilter: ColorFilter.mode(
                              isDark ? white : black,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ref.read(selectedIndexProvider.notifier).state = 1;
                          },
                          child: CircleAvatar(
                              radius: 14,
                              backgroundImage:
                                  NetworkImage(user?.profilePhoto ?? love)
                              // Default image if null
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:filore/src/core/components/arrow_back_widget.dart';
import 'package:filore/src/utils/constants/colors.dart';
import 'package:filore/src/utils/constants/icons.dart';
import 'package:filore/src/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class PhotoDetailScreen extends ConsumerWidget {
  const PhotoDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final deviceWidth = MediaQuery.of(context).size.width;

    // Get the selected photo and user data
    final data = GoRouterState.of(context).extra as Map<String, dynamic>?;
    final selectedPhoto = data?['photo'];
    final user = data?['user'];

    // If no photo is selected, show a fallback
    if (selectedPhoto == null) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: Column(
            children: [
              //arrow back
              ArrowBack(isDark: isDark, route: '/user_profile'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 308.0),
                child: Center(child: Text('No photo selected!')),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Stack(
            children: [
              //the photo posted by the photographer
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button
                  ArrowBack(isDark: isDark, route: '/user_profile'),

                  // Photo caption (if available)
                  if (selectedPhoto.caption.isNotEmpty)
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        selectedPhoto.caption,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(decoration: TextDecoration.underline),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                  // Photo frame
                  Container(
                    alignment: Alignment.bottomRight,
                    height: 320,
                    width: deviceWidth - 40,
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.only(bottom: 15, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      image: DecorationImage(
                        image: NetworkImage(selectedPhoto.photoUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 10,
                          sigmaY: 10,
                        ),
                        child: GestureDetector(
                          // Optionally, handle a tap for full view here
                          child: Container(
                            height: 30,
                            width: 90,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: white.withValues(alpha: 0.2),
                            ),
                            child: Text(
                              'View full',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: white,
                                      fontSize: 13.2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // User's profile image (who posted the photo)
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 10, right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: user?.profilePhoto != null &&
                                  user!.profilePhoto.isNotEmpty
                              ? NetworkImage(user.profilePhoto)
                              : AssetImage(love) as ImageProvider,
                        ),
                        const SizedBox(width: 10),
                        //username of photographer
                        Text(user?.name ?? 'username',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w900)),

                        if (user?.isVerified == true) const SizedBox(width: 4),
                        SvgPicture.asset(verifiedIcon, height: 14, width: 14),

                        //grey dot
                        const SizedBox(width: 15),
                        CircleAvatar(
                          radius: 3,
                          backgroundColor: tGrey,
                        ),
                        const SizedBox(width: 15),
                        //username of photographer
                        Text('22',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w900, color: tGrey)),

                        Expanded(
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: SvgPicture.asset(bookmarkIcon)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //comment field
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 38.0),
                  child: Row(
                    children: [
                      // User's profile image
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(user?.profilePhoto ?? love),
                      ),
                      const SizedBox(width: 10),

                      // Comment field
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: isDark ? iGrey : fGrey,
                            hintText: "Add a comment...",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(
                                  8.0), // Adjust padding if needed
                              child: GestureDetector(
                                onTap: () {},
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor:
                                      const Color.fromARGB(255, 85, 85, 85),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 9.0),
                                    child: SvgPicture.asset(
                                      messageIcon,
                                      height: 50, // Adjust icon size
                                      width: 50,
                                      colorFilter: ColorFilter.mode(
                                          isDark ? white : tGrey,
                                          BlendMode.srcIn),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

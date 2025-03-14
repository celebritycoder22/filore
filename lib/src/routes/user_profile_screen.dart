import 'package:filore/src/core/models/user_model.dart';
import 'package:filore/src/core/providers/photo_provider.dart';
import 'package:filore/src/core/providers/user_provider.dart';
import 'package:filore/src/utils/constants/colors.dart';
import 'package:filore/src/utils/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final user = ref.watch(userProvider);

    if (user == null) {
      return Center(
        child: Text('No user is logged in'),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      context.go('/home');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: CircleAvatar(
                        backgroundColor: isDark ? giftGrey : fGrey,
                        child: SvgPicture.asset(
                          arrowBackIcon,
                          height: 25,
                          width: 25,
                          colorFilter: ColorFilter.mode(
                              isDark ? white : black, BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    // Back Button

                    // User Profile
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          //user dp
                          child: GestureDetector(
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(user.profilePhoto),
                              radius: 60,
                            ),
                          ),
                        ),

                        // Profile Details
                        Padding(
                          padding: const EdgeInsets.only(left: 26, top: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Name & Verification
                              Row(
                                children: [
                                  Text(
                                    user.name.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.6,
                                      color: isDark ? white : black,
                                      shadows: [
                                        Shadow(
                                          offset: const Offset(0.5, 0.5),
                                          blurRadius: 0.5,
                                          color: isDark
                                              ? white
                                              : black.withAlpha(4),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 3),
                                  if (user.isVerified == true)
                                    SvgPicture.asset(
                                      verifiedIcon,
                                      height: 17,
                                      width: 17,
                                    ),
                                ],
                              ),
                              const SizedBox(height: 4),

                              // Username
                              Text(
                                '@${user.username}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: tGrey,
                                  shadows: [
                                    Shadow(
                                      offset: const Offset(0.5, 0.5),
                                      blurRadius: 0.5,
                                      color: tGrey.withAlpha(2),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 7),

                              // Followers & Location
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    personIcon,
                                    height: 14,
                                    width: 14,
                                    colorFilter: ColorFilter.mode(
                                        isDark ? white : black,
                                        BlendMode.srcIn),
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    '4M',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(fontSize: 14),
                                  ),
                                  //
                                  const SizedBox(width: 12),
                                  //
                                  SvgPicture.asset(
                                    locationIcon,
                                    height: 14,
                                    width: 14,
                                    colorFilter: ColorFilter.mode(
                                        isDark ? white : giftGrey,
                                        BlendMode.srcIn),
                                  ),
                                  //
                                  const SizedBox(width: 4),
                                  //
                                  Text(
                                    'Brussels',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // User Bio
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        'Programmer',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: tGrey,
                              fontSize: 14,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7.0),
                      child: Text(
                        'Mobile App Dev #flutter • UI/UX Designer • Phil 4:13',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 14.8,
                            ),
                      ),
                    ),

                    // Follow & Gift Buttons
                    Row(
                      children: [
                        FilledButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(bGrey)),
                          onPressed: () {},
                          child: Text(
                            'Follow',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: black,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 33,
                            width: 60,
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: isDark ? giftGrey : black,
                            ),
                            child: InkWell(
                              onTap: () => giftCreator(context, user),
                              child: SvgPicture.asset(giftIcon),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // User Posts Grid
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 90),
                      child: GridView.builder(
                        shrinkWrap: true, // Fixes infinite height issue
                        physics:
                            const NeverScrollableScrollPhysics(), // Prevents nested scrolling
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 7,
                          childAspectRatio:
                              0.75, // Adjust aspect ratio to fit the images
                        ),
                        itemCount: user.photos.length,
                        itemBuilder: (context, index) {
                          final photo = user.photos[index];

                          //photoframe
                          return GestureDetector(
                            onTap: () {
                              ref.watch(photoProvider.notifier).state = photo;
                              //router to the phot detail screen
                              context.go('/photo_detail',
                                  extra: {'user': user, 'photo': photo});
                            },
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              child: Image.network(
                                photo.photoUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//show support user modal
Future<void> giftCreator(BuildContext context, UserModel user) {
  final deviceWidth = MediaQuery.of(context).size.width;
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return showModalBottomSheet(
    // showDragHandle: true,
    context: context,
    builder: (context) {
      return Container(
        padding: EdgeInsets.all(16),
        height: 350,
        width: deviceWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Support Creator',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w900, fontSize: 22),
            ),
            SizedBox(height: 20),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                CircleAvatar(
                  radius: 65,
                  backgroundImage: AssetImage(user.profilePhoto),
                ),
                Positioned(
                  top: 10,
                  right: -3,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: const Color.fromARGB(255, 163, 109, 255),
                    child: Text(
                      '💸',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              '@${user.username}',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: tGrey,
              ),
            ),
            const SizedBox(height: 25),
            Text('Tap and hold photo to copy payment link',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 14.8,
                    )),
            const SizedBox(height: 10),
            FilledButton(
              style: ButtonStyle(
                minimumSize: WidgetStatePropertyAll(Size(350, 40)),
                maximumSize: WidgetStatePropertyAll(Size(350, 40)),
              ),
              onPressed: () {},
              child: Text('Or hire',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: isDark ? white : white,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      );
    },
  );
}

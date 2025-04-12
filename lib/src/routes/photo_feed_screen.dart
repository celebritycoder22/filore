import 'package:filore/src/core/providers/photo_provider.dart';
import 'package:filore/src/core/providers/user_provider.dart';
import 'package:filore/src/utils/constants/colors.dart';
import 'package:filore/src/utils/constants/icons.dart';
import 'package:filore/src/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class PhotoFeedScreen extends ConsumerWidget {
  const PhotoFeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final user = ref.watch(userProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              // Filore logo centered at the top
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: SvgPicture.asset(
                    isDark ? filoreIconDark : filoreIcon,
                    height: 36,
                    width: 36,
                  ),
                ),
              ),
              if (user?.following == null || user!.following.isEmpty)
                //
                Expanded(
                  child: Center(
                      child: Text(
                          'You need to follow photographers to display posts',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: isDark ? white : black))),
                )
              else
                // Photo feed
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 100),
                    itemCount: user.following
                        .expand((follower) => follower.photos)
                        .length,
                    itemBuilder: (context, index) {
                      final photo = user.following
                          .expand((followers) => followers.photos)
                          .toList()[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: GestureDetector(
                          onTap: () {
                            ref.read(selectedPhotoProvider.notifier).state =
                                photo;
                            context.go('/photo_detail',
                                extra: {'photo': photo, 'user': user});
                          },
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  photo.photoUrl,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                              const SizedBox(height: 10),
                              //photo reaction buttons

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  spacing: 2,
                                  children: [
                                    SvgPicture.asset(likeIcon,
                                        height: 20, width: 20),
                                    //like count
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0, left: 1),
                                        child: Text(
                                            formatCount(photo.likeCount),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color:
                                                      isDark ? prGrey : black,
                                                )),
                                      ),
                                    ),
                                    //comment icon
                                    SvgPicture.asset(commentIcon,
                                        height: 16, width: 16),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0, left: 2),
                                        child: Text(
                                            formatCount(photo.commentCount),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color:
                                                      isDark ? prGrey : black,
                                                )),
                                      ),
                                    ),
                                    //share photo icon
                                    SvgPicture.asset(shareIcon,
                                        height: 17, width: 17),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0, left: 1),
                                        child: Text(
                                            formatCount(photo.shareCount),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color:
                                                      isDark ? prGrey : black,
                                                )),
                                      ),
                                    ),
                                    SvgPicture.asset(bookmarkIcon,
                                        height: 17, width: 17),
                                    //bookmark count
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0, left: 2),
                                      child: Text(
                                        formatCount(photo.bookmarkCount),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: isDark ? prGrey : black,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),

                              //the white divider
                              Divider(
                                  thickness: 0.2, color: isDark ? tGrey : black)
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

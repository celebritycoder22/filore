import 'package:filore/src/core/models/user_model.dart';
import 'package:filore/src/core/providers/isFollowing_provider.dart';
import 'package:filore/src/core/providers/user_provider.dart';
import 'package:filore/src/utils/constants/colors.dart';
import 'package:filore/src/utils/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  const UserProfileScreen({super.key});

  @override
  ConsumerState<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<UserProfileScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final user = ref.watch(userProvider);

    if (user == null) {
      return const Center(child: Text('No user is logged in'));
    }

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: CircleAvatar(
                            backgroundColor: isDark ? giftGrey : fGrey,
                            child: IconButton(
                              icon: SvgPicture.asset(
                                arrowBackIcon,
                                height: 25,
                                width: 25,
                                colorFilter: ColorFilter.mode(
                                    isDark ? white : black, BlendMode.srcIn),
                              ),
                              onPressed: () => context.go('/home'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(user.profilePhoto),
                              radius: 60,
                            ),
                          ),
                          const SizedBox(width: 26),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    user.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.6,
                                          color: isDark ? white : black,
                                        ),
                                  ),
                                  const SizedBox(width: 3),
                                  if (user.isVerified)
                                    SvgPicture.asset(verifiedIcon,
                                        height: 17, width: 17),
                                ],
                              ),
                              Text('@${user.username}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(color: tGrey)),
                              const SizedBox(height: 7),
                              Row(
                                children: [
                                  SvgPicture.asset(personIcon,
                                      height: 14,
                                      width: 14,
                                      colorFilter: ColorFilter.mode(
                                          isDark ? white : black,
                                          BlendMode.srcIn)),
                                  const SizedBox(width: 3),
                                  Text('4M',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                  const SizedBox(width: 12),
                                  SvgPicture.asset(locationIcon,
                                      height: 14,
                                      width: 14,
                                      colorFilter: ColorFilter.mode(
                                          isDark ? white : giftGrey,
                                          BlendMode.srcIn)),
                                  const SizedBox(width: 4),
                                  Text('Brussels',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text('Programmer',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: tGrey)),
                      Text(
                          'Mobile App Dev #flutter • UI/UX Designer • Phil 4:13',
                          style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          FilledButton(
                            style:
                                FilledButton.styleFrom(backgroundColor: bGrey),
                            onPressed: () {},
                            child: Text('Follow',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: isDark ? black : black)),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () => giftCreator(context, user),
                            child: Container(
                              height: 33,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isDark ? giftGrey : black,
                              ),
                              child: Center(child: SvgPicture.asset(giftIcon)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                TabBar(
                  controller: _tabController,
                  dividerColor:
                      isDark ? lineGrey : Color.fromARGB(255, 236, 235, 235),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 0.1, // height of indicator
                  padding: const EdgeInsets.only(left: 4.0),
                  tabAlignment: TabAlignment.start,
                  indicatorPadding: EdgeInsets.only(top: 79),
                  indicator: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              width: 1.5, color: isDark ? white : black))),
                  isScrollable: true, indicatorColor: isDark ? white : black,
                  tabs: [
                    Tab(
                      height: 80,
                      child: AnimatedBuilder(
                        animation: _tabController,
                        builder: (context, child) {
                          bool isSelected = _tabController.index == 0;
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Gallery',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: isDark ? white : black,
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                              ),
                              const SizedBox(height: 17),
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                child: isSelected
                                    ? SvgPicture.asset(
                                        photoIcon,
                                        height: 22,
                                        width: 22,
                                        colorFilter: ColorFilter.mode(
                                            isDark ? white : iGrey,
                                            BlendMode.srcIn),
                                      )
                                    : SizedBox(height: 24), // Empty space
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    //collections tab
                    Tab(
                      height: 80,
                      child: AnimatedBuilder(
                        animation: _tabController,
                        builder: (context, child) {
                          bool isSelected = _tabController.index == 1;
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Collections',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: isDark ? white : black,
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                              ),
                              const SizedBox(height: 17),
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                child: isSelected
                                    ? SvgPicture.asset(
                                        collectionIcon,
                                        height: 24,
                                        width: 24,
                                        colorFilter: ColorFilter.mode(
                                            isDark ? white : iGrey,
                                            BlendMode.srcIn),
                                      )
                                    : SizedBox(
                                        height: 24,
                                        key: ValueKey(4)), // Empty space
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    //Audience tab
                    Tab(
                      height: 80,
                      child: AnimatedBuilder(
                        animation: _tabController,
                        builder: (context, child) {
                          bool isSelected = _tabController.index == 2;
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Followers',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: isDark ? white : black,
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                              ),
                              const SizedBox(height: 17),
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                child: isSelected
                                    ? SvgPicture.asset(
                                        collectionIcon,
                                        height: 24,
                                        width: 24,
                                        colorFilter: ColorFilter.mode(
                                            isDark ? white : iGrey,
                                            BlendMode.srcIn),
                                      )
                                    : SizedBox(
                                        height: 24,
                                        key: ValueKey(4)), // Empty space
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    //Shop tab
                    Tab(
                      height: 80,
                      child: AnimatedBuilder(
                        animation: _tabController,
                        builder: (context, child) {
                          bool isSelected = _tabController.index == 3;
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Following',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: isDark ? white : black,
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                              ),
                              const SizedBox(height: 17),
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                child: isSelected
                                    ? SvgPicture.asset(
                                        collectionIcon,
                                        height: 24,
                                        width: 24,
                                        colorFilter: ColorFilter.mode(
                                            isDark ? white : iGrey,
                                            BlendMode.srcIn),
                                      )
                                    : SizedBox(
                                        height: 24,
                                        key: ValueKey(4)), // Empty space
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    //Shop tab
                    Tab(
                      height: 80,
                      child: AnimatedBuilder(
                        animation: _tabController,
                        builder: (context, child) {
                          bool isSelected = _tabController.index == 3;
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Shop',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: isDark ? white : black,
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                              ),
                              const SizedBox(height: 17),
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                child: isSelected
                                    ? SvgPicture.asset(
                                        collectionIcon,
                                        height: 24,
                                        width: 24,
                                        colorFilter: ColorFilter.mode(
                                            isDark ? white : iGrey,
                                            BlendMode.srcIn),
                                      )
                                    : SizedBox(
                                        height: 24,
                                        key: ValueKey(4)), // Empty space
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      //gallery view
                      GridView.builder(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 7,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: user.photos.length,
                        itemBuilder: (context, index) {
                          final photo = user.photos[index];
                          return GestureDetector(
                            onTap: () => context.go('/photo_detail',
                                extra: {'user': user, 'photo': photo}),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(photo.photoUrl,
                                  fit: BoxFit.cover),
                            ),
                          );
                        },
                      ),

                      //collections view  ******************************
                      ListView.builder(
                        padding: const EdgeInsets.only(top: 24),
                        itemCount: user.collections
                            .length, // Iterate over collections, not photos
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap:
                            true, // Ensure it works inside scrollable parents
                        itemBuilder: (context, index) {
                          final collection =
                              user.collections[index]; // Get the collection
                          final photos = collection.photos
                              .take(3)
                              .toList(); // Get up to 3 photos

                          final total = collection.photos;

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // First Image (Large)
                                    Container(
                                      height: 164,
                                      width: 200,
                                      margin: const EdgeInsets.only(right: 4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: photos.isNotEmpty
                                            ? DecorationImage(
                                                image: NetworkImage(
                                                    photos[0].photoUrl),
                                                fit: BoxFit.cover,
                                              )
                                            : null,
                                        color: Colors.grey[
                                            800], // Placeholder color for missing image
                                      ),
                                    ),

                                    // Two Smaller Images in a Column
                                    Column(
                                      children: List.generate(2, (i) {
                                        return Container(
                                          height: 80,
                                          width: 190,
                                          margin: EdgeInsets.only(
                                              bottom: i == 0
                                                  ? 4
                                                  : 0), // Add spacing
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: photos.length > i + 1
                                                ? DecorationImage(
                                                    image: NetworkImage(
                                                        photos[i + 1].photoUrl),
                                                    fit: BoxFit.cover,
                                                  )
                                                : null,
                                            color: Colors.grey[
                                                800], // Placeholder if no image
                                          ),
                                        );
                                      }),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 4),

                                // Collection Name
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10.0, left: 5, top: 7),
                                  child: Row(
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      //collection names
                                      Text(
                                        collection.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      SizedBox(width: 8),
                                      //dot
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 2.0),
                                        child: CircleAvatar(
                                            backgroundColor: isDark
                                                ? const Color.fromARGB(
                                                    255, 66, 65, 65)
                                                : black,
                                            radius: 3.3),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        '@${'klyde3'}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),

                                      const SizedBox(width: 10),
                                      //hashtags
                                      if (photos.isNotEmpty &&
                                          photos.first.hashtags.isNotEmpty)
                                        Expanded(
                                          // Ensures it doesn't break layout
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: SizedBox(
                                              height:
                                                  20, // Required for ListView inside Row
                                              child: ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: photos
                                                    .first.hashtags.length,
                                                itemBuilder: (context, index) {
                                                  final hashtag = photos
                                                      .first.hashtags[index];

                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .only(
                                                        right:
                                                            5), // Add spacing
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal:
                                                              10), // Better spacing
                                                      decoration: BoxDecoration(
                                                        color: isDark
                                                            ? giftGrey
                                                            : fGrey,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '#$hashtag',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),

                                      //image icon
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: SvgPicture.asset(photoIcon,
                                            colorFilter: ColorFilter.mode(
                                                isDark ? white : black,
                                                BlendMode.srcIn),
                                            height: 18,
                                            width: 18),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        total.length.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      //*********************** */
                      //followers
                      user.followers.isEmpty
                          ? Center(
                              child: Text('You don\'t have any followers yet'))
                          : ListView.builder(
                              itemCount: user.followers.length,
                              itemBuilder: (context, index) {
                                final follower = user.followers[index];
                                return Consumer(builder: (context, ref, child) {
                                  final isFollowing =
                                      ref.watch(isFollowingProvider(follower));
                                  return ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    dense: true,
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(follower.profilePhoto),
                                    ),
                                    title: Row(
                                      children: [
                                        Text(follower.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium),
                                        const SizedBox(width: 3),
                                        if (follower.isVerified)
                                          SvgPicture.asset(verifiedIcon,
                                              height: 14, width: 14),
                                      ],
                                    ),
                                    subtitle: Text('@${follower.username}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                color: isDark ? tGrey : tGrey)),
                                    trailing: TextButton(
                                      onPressed: () {
                                        ref
                                            .read(isFollowingProvider(follower)
                                                .notifier)
                                            .state = !ref.read(
                                          isFollowingProvider(follower),
                                        );
                                      },
                                      style: ButtonStyle(
                                          shape: WidgetStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15))),
                                          minimumSize:
                                              const WidgetStatePropertyAll(
                                                  Size(100, 31)),
                                          maximumSize:
                                              const WidgetStatePropertyAll(
                                                  Size(100, 31)),
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                            isDark ? white : black,
                                          )
                                          // textStyle:
                                          //     WidgetStatePropertyAll(GoogleFonts.poppins(color: Colors.pink)),
                                          ),
                                      child: Text(
                                        isFollowing
                                            ? 'Following'
                                            : 'Follow back',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                                color: isDark ? black : white,
                                                fontSize: 11.9,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  );
                                });
                              },
                            ),
                      //following
                      user.following.isEmpty
                          ? Center(
                              child: Text('You don\'t have any followers yet'))
                          : ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: user.following.length,
                              itemBuilder: (context, index) {
                                final following = user.following[index];
                                return ListTile(
                                  dense: true,
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(following.profilePhoto),
                                  ),
                                  title: Row(
                                    children: [
                                      Text(following.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                      const SizedBox(width: 5),
                                      if (following.isVerified)
                                        SvgPicture.asset(verifiedIcon),
                                    ],
                                  ),
                                );
                              },
                            ),

                      //shop View
                      Center(
                          child: Text('Shop feature coming soon!',
                              style: Theme.of(context).textTheme.bodyMedium))
                    ],
                  ),
                ),
              ],
            ),
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

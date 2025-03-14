import 'package:filore/src/routes/filore_home.dart';
import 'package:filore/src/routes/photo_feed_screen.dart';
import 'package:filore/src/routes/photo_detail_screen.dart';
import 'package:filore/src/routes/user_profile_screen.dart';
import 'package:filore/src/utils/theme/filore_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(ProviderScope(child: Filore()));
}

class Filore extends StatelessWidget {
  const Filore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: FiloreTheme.lightTheme,
      darkTheme: FiloreTheme.darkModeTheme,
      debugShowCheckedModeBanner: false,
      title: 'Filore',
      routerConfig: _route,
    );
  }
}

GoRouter _route = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, builder) => FiloreHome(),
    ),
    //
    GoRoute(
      path: '/user_profile',
      builder: (context, builder) => UserProfileScreen(),
    ),
    GoRoute(
      path: '/feed',
      builder: (context, builder) => PhotoFeedScreen(),
    ),
    GoRoute(
      path: '/photo_detail',
      builder: (context, builder) => PhotoDetailScreen(),
    ),
  ],
);

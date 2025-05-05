import 'package:filore/src/routes/auth/auth_gate.dart';
import 'package:filore/src/routes/auth/sign_in_screen.dart';
import 'package:filore/src/routes/auth/sign_up_screen.dart';
import 'package:filore/src/routes/auth/supabase_details.dart';
import 'package:filore/src/routes/filore_home.dart';
import 'package:filore/src/routes/onboarding/onboarding_screen.dart';
import 'package:filore/src/routes/photo_feed_screen.dart';
import 'package:filore/src/routes/photo_detail_screen.dart';
import 'package:filore/src/routes/user_profile_screen.dart';
import 'package:filore/src/utils/theme/filore_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: anonPublic,
  );
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
      title: 'Filore : photograpy haven',
      routerConfig: _route,
    );
  }
}

GoRouter _route = GoRouter(
  initialLocation: '/onboard',
  routes: [
    GoRoute(
      path: '/onboard',
      builder: (context, builder) => OnboardingScreen(),
    ),
    //auth routes
    GoRoute(
      path: '/auth_gate',
      builder: (context, builder) => AuthGate(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, builder) => SignUpScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, builder) => SignInScreen(),
    ),
    //end of auth route
    GoRoute(
      path: '/home',
      builder: (context, builder) => FiloreHome(),
    ),
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

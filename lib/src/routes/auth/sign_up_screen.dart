import 'package:filore/src/core/components/glass_snackbar.dart';
import 'package:filore/src/routes/auth/auth_service.dart';
import 'package:filore/src/utils/constants/colors.dart';
import 'package:filore/src/utils/constants/icons.dart';
import 'package:filore/src/utils/constants/images.dart';
import 'package:filore/src/utils/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _showGlassSnackbar = false;
  String _glassSnackbarMessage = '';

  final authService = AuthService();

  void _triggerGlassSnackbar(String message) {
    setState(() {
      _showGlassSnackbar = true;
      _glassSnackbarMessage = message;
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() => _showGlassSnackbar = false);
      }
    });
  }

  void signUp() async {
    final email = _emailController.text;
    final name = _nameController.text;
    final username = _usernameController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      _triggerGlassSnackbar('Passwords do not match!');
      return;
    }

    try {
      await authService.signUpWithEmailPassword(
          email: email, password: password);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account created successfully!')),
        );
      }
    } on FiloreExceptions catch (e) {
      if (mounted) _triggerGlassSnackbar(e.message);
    } catch (e) {
      if (mounted) _triggerGlassSnackbar('Error: $e');
    }

    try {
      await Supabase.instance.client.auth.updateUser(UserAttributes(data: {
        'name': name,
        'username': username,
      }));
    } catch (e) {
      if (mounted) _triggerGlassSnackbar('Failed to update profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        Scaffold(
          body: ListView(
            children: [
              Column(
                children: [
                  Container(
                    height: 200,
                    padding: const EdgeInsets.only(left: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(regBanner), fit: BoxFit.cover),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () => context.go('/onboard'),
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: lineGrey,
                            child: SvgPicture.asset(
                              arrowBackIcon,
                              height: 25,
                              width: 25,
                              colorFilter:
                                  ColorFilter.mode(white, BlendMode.srcIn),
                            ),
                          ),
                        ),
                        const SizedBox(height: 85),
                        Text(
                          'Create your',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: white,
                                    fontSize: 19,
                                  ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(filoreIconDark,
                                height: 30, width: 30),
                            Text(
                              'account',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: white,
                                    fontSize: 19,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 30),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(hintText: 'Name'),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _usernameController,
                            decoration:
                                const InputDecoration(hintText: '@username'),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _emailController,
                            decoration:
                                const InputDecoration(hintText: 'Email'),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            decoration:
                                const InputDecoration(hintText: 'Password'),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            obscureText: true,
                            controller: _confirmPasswordController,
                            decoration: const InputDecoration(
                                hintText: 'Confirm password'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 10),
                    child: FilledButton(
                      onPressed: signUp,
                      style: ButtonStyle(
                        minimumSize:
                            WidgetStateProperty.all(const Size(400, 40)),
                        maximumSize:
                            WidgetStateProperty.all(const Size(400, 40)),
                      ),
                      child: Text(
                        'Sign up',
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: isDark ? black : white,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Or continue with',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialButton(googleIcon, isDark),
                      const SizedBox(width: 20),
                      _socialButton(xIcon, isDark, colored: true),
                      const SizedBox(width: 20),
                      _socialButton(appleIcon, isDark, colored: true),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account? ',
                          style: Theme.of(context).textTheme.bodyMedium),
                      GestureDetector(
                        onTap: () => context.go('/login'),
                        child: Text('Login',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: turquoise,
                                  fontWeight: FontWeight.bold,
                                )),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        if (_showGlassSnackbar)
          Positioned.fill(
            child: IgnorePointer(
              child: GlassSnackbar(message: _glassSnackbarMessage),
            ),
          ),
      ],
    );
  }

  Widget _socialButton(String icon, bool isDark, {bool colored = false}) {
    return Container(
      height: 55,
      width: 55,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isDark ? lineGrey : fGrey,
      ),
      child: SvgPicture.asset(
        icon,
        colorFilter: colored
            ? ColorFilter.mode(isDark ? white : black, BlendMode.srcIn)
            : null,
      ),
    );
  }
}

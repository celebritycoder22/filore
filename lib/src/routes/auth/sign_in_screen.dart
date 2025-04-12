import 'package:filore/src/routes/auth/auth_service.dart';
import 'package:filore/src/utils/constants/colors.dart';
import 'package:filore/src/utils/constants/icons.dart';
import 'package:filore/src/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final authService = AuthService();
    //controllers
    TextEditingController _emailController = TextEditingController();
    // TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    //method to login
    void login() async {
      final email = _emailController.text;
      final password = _passwordController.text;

      //
      try {
        await authService.signInwithEmailPassword(
            email: email, password: password);
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Error $e')));
        }
      }
    }

    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              //banner
              Container(
                  height: 200,
                  padding: const EdgeInsets.only(left: 15, bottom: 0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(camera), fit: BoxFit.cover),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        //arrowback
                        GestureDetector(
                          onTap: () => context.go('/signup'),
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

                        //
                        SizedBox(height: 85),
                        Text('Login to your',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                  fontSize: 19,
                                )),
                        Row(spacing: 4, children: [
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
                        ])
                      ])),

              //text form field
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 30.0, right: 15),
                child: Form(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      // TextFormField(
                      //   controller: _usernameController,
                      //   enabled: true,
                      //   decoration: InputDecoration(hintText: '@Username'),
                      // ),
                      // const SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        enabled: true,
                        decoration: InputDecoration(hintText: 'Email'),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        enabled: true,
                        decoration: InputDecoration(hintText: 'Password'),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(
                    'Forgot password?',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.pinkAccent,
                        decoration: TextDecoration.underline),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 195.0, bottom: 10),
                child: FilledButton(
                  onPressed: () => login,
                  style: ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(Size(400, 40)),
                    maximumSize: WidgetStatePropertyAll(Size(400, 40)),
                  ),
                  child: Text(
                    'Sign in',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: isDark ? black : white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Or continue with',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              //
              Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isDark ? lineGrey : fGrey),
                    child: SvgPicture.asset(googleIcon),
                  ),
                  Container(
                    height: 55,
                    width: 55,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isDark ? lineGrey : fGrey),
                    child: SvgPicture.asset(
                      xIcon,
                      colorFilter: ColorFilter.mode(
                        isDark ? white : black,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  Container(
                    height: 55,
                    width: 55,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isDark ? lineGrey : fGrey),
                    child: SvgPicture.asset(
                      appleIcon,
                      colorFilter: ColorFilter.mode(
                        isDark ? white : black,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 50),
              //already have a n account

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    onTap: () => context.go('/signup'),
                    child: Text(
                      'Sign Up',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: turquoise, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

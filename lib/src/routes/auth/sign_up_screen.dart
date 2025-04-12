import 'package:filore/src/routes/auth/auth_service.dart';
import 'package:filore/src/utils/constants/colors.dart';
import 'package:filore/src/utils/constants/icons.dart';
import 'package:filore/src/utils/constants/images.dart';
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
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    //controllers
    TextEditingController _emailController = TextEditingController();
    TextEditingController _nameController = TextEditingController();
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _confirmPasswordController = TextEditingController();

    final authService = AuthService();

    void signUp() async {
      final email = _emailController.text;
      final name = _nameController.text;
      final username = _usernameController.text;
      final password = _passwordController.text;
      final confirmPassword = _confirmPasswordController.text;

      //check if password matched
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Passwords do not match!'),
        ));
        return;
      }

      //try to sign up
      try {
        await authService.signUpWithEmailPassword(
            email: email, password: password);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Account created succesfully!'),
        ));

        //save the username
        await Supabase.instance.client.auth.updateUser(UserAttributes(data: {
          'name': name,
          'username': username,
        }));
      } catch (e) {
        if (mounted) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Error: $e'),
          ));
        }
      }
      //   if (password < 6) {
      //     // ignore: use_build_context_synchronously
      //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //       content: Text('Password should be more than 6 characters'),
      //     ));
      //   }
      // }
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
                        image: NetworkImage(regBanner), fit: BoxFit.cover),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        //arrowback
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

                        //
                        SizedBox(height: 85),
                        Text('Create your',
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
                      TextFormField(
                        controller: _nameController,
                        enabled: true,
                        decoration: InputDecoration(hintText: 'Name'),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _usernameController,
                        enabled: true,
                        decoration: InputDecoration(hintText: '@username'),
                      ),
                      const SizedBox(height: 20),
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
                      const SizedBox(height: 20),
                      TextFormField(
                        obscureText: true,
                        controller: _confirmPasswordController,
                        enabled: true,
                        decoration:
                            InputDecoration(hintText: 'Confirm password'),
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
                    minimumSize: WidgetStatePropertyAll(Size(400, 40)),
                    maximumSize: WidgetStatePropertyAll(Size(400, 40)),
                  ),
                  child: Text(
                    'Sign up',
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
                    'Already have an account? ',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    onTap: () => context.go('/login'),
                    child: Text(
                      'Login',
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

import 'package:filore/src/routes/onboarding/onboard1.dart';
import 'package:filore/src/routes/onboarding/onboard2.dart';
import 'package:filore/src/routes/onboarding/onboard3.dart';
import 'package:filore/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              children: [
                Onboard1(),
                Onboard2(),
                Onboard3(),
              ],
            ),
            const SizedBox(
              width: 10,
            ),

            //skip text
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 20),
                child: GestureDetector(
                  onTap: () => _controller.jumpToPage(2),
                  child: Text('Skip',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.w600)),
                ),
              ),
            ),

            //indicator
            Positioned(
              top: 644,
              left: 180,
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: ExpandingDotsEffect(
                    dotWidth: 12, activeDotColor: turquoise, dotHeight: 10),
              ),
            ),

            //get started button
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: FilledButton(
                  onPressed: () => context.go('/signup'),
                  style: ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(Size(350, 44)),
                    maximumSize: WidgetStatePropertyAll(Size(350, 44)),
                  ),
                  child: Text(
                    'Get started',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: isDark ? black : white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

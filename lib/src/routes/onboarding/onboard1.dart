import 'package:filore/src/utils/constants/images.dart';
import 'package:flutter/material.dart';

class Onboard1 extends StatelessWidget {
  const Onboard1({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 90.0, bottom: 150),
            child: CircleAvatar(
              radius: 150,
              backgroundImage: NetworkImage(onboard1Image),
            ),
          ),

          //onboarding text
          Text('Share your photographs',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              'Showcase your creative masterpieces to a global audience, inspiring photo lovers and fellow photographers alike.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    });
  }
}

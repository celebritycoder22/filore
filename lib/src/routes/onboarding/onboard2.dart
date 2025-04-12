import 'package:filore/src/utils/constants/images.dart';
import 'package:flutter/material.dart';

class Onboard2 extends StatelessWidget {
  const Onboard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 90.0, bottom: 150),
            child: CircleAvatar(
              radius: 150,
              backgroundImage: NetworkImage(onboard2Image),
            ),
          ),

          //onboarding text
          Text('Get tipped and earn',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              'Monetize your passion by selling your art directly through the app and receive tips from admirers.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:filore/src/utils/constants/images.dart';
import 'package:flutter/material.dart';

class Onboard3 extends StatelessWidget {
  const Onboard3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 90.0, bottom: 150),
            child: CircleAvatar(
              radius: 150,
              backgroundImage: NetworkImage(onboard3Image),
            ),
          ),

          //onboarding text
          Text('Enjoy photography',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              'Immerse yourself in a vibrant community where you can discover and appreciate diverse shots from around the world.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

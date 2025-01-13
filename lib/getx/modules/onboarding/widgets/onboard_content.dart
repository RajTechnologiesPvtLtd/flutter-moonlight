import 'package:flutter/material.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.image,
    required this.title,
    required this.text,
  });

  final String? image, title, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              image!,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title!,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          text!,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

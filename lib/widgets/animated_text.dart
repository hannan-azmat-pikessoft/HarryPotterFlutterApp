import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatelessWidget {
  const AnimatedTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Text')),
      body: Column(
        children: [
          AnimatedTextKit(
            animatedTexts: [
              RotateAnimatedText(
                "Hello World",
                textStyle:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ],
            totalRepeatCount: 5,
            pause: const Duration(milliseconds: 200),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
        ],
      ),
    );
  }
}

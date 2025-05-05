import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SizedBox.expand(
        child: Column(
          children: [
            // Logo bölümü
            Expanded(
              child: Container(
                width: 400,
                height: 400,
                child: Image.asset(
                  'assets/images/gym.webp',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            InkWell(
              onTap: () => context.go("/home"),
              child: SizedBox(
                width: 250,
                height: 250,
                child: DotLottieLoader.fromAsset(
                  "assets/motions/weightlifting.lottie",
                  frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                    if (dotlottie != null) {
                      return Lottie.memory(dotlottie.animations.values.single);
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

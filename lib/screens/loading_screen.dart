import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool _isLoading = false;

  Future<void> _handleTap() async {
    if (_isLoading) return;

    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;
    final user = FirebaseAuth.instance.currentUser;

    context.go(user == null ? '/login' : '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 400,
            height: 400,
            child: Image.asset('assets/images/gym.webp', fit: BoxFit.contain),
          ),

          InkWell(
            onTap: _handleTap,
            child: SizedBox(
              width: 250,
              height: 250,
              child: DotLottieLoader.fromAsset(
                'assets/motions/weightlifting.lottie',
                frameBuilder: (_, dotlottie) {
                  if (dotlottie != null) {
                    return Lottie.memory(dotlottie.animations.values.single);
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

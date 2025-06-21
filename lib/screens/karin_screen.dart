import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:go_router/go_router.dart';

class KarinScreen extends StatefulWidget {
  const KarinScreen({super.key});

  @override
  State<KarinScreen> createState() => _KarinScreenState();
}

class _KarinScreenState extends State<KarinScreen> {
  final List<String> _videoPaths = [
    'assets/videos/karin_videos/karin_1.mp4',
    'assets/videos/karin_videos/karin_2.mp4',
    'assets/videos/karin_videos/karin_3.mp4',
    'assets/videos/karin_videos/karin_4.mp4',
    'assets/videos/karin_videos/karin_5.mp4',
    'assets/videos/karin_videos/karin_6.mp4',
    'assets/videos/karin_videos/karin_7.mp4',
    'assets/videos/karin_videos/karin_8.mp4',
    'assets/videos/karin_videos/karin_9.mp4',
    'assets/videos/karin_videos/karin_10.mp4',
  ];

  late List<VideoPlayerController> _controllers;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controllers = _videoPaths
        .map((path) => VideoPlayerController.asset(path)..initialize())
        .toList();

    for (var controller in _controllers) {
      controller.addListener(() {
        if (mounted) setState(() {});
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _playPause() {
    final controller = _controllers[_currentIndex];
    setState(() {
      controller.value.isPlaying ? controller.pause() : controller.play();
    });
  }

  void _goToVideo(int index) {
    if (_currentIndex != index) {
      _controllers[_currentIndex].pause();
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controllers[_currentIndex];
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorScheme.onPrimary),
          onPressed: () => context.go('/home'),
        ),
        title: Text(
          'Karın Hareketleri',
          style: TextStyle(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: colorScheme.primary,
      ),
      body: controller.value.isInitialized
          ? Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AspectRatio(
                        aspectRatio: controller.value.aspectRatio,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: VideoPlayer(controller),
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: _playPause,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(12),
                          minimumSize: const Size(56, 56),
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                        ),
                        child: Icon(
                          controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 32,
                  left: 0,
                  right: 0,
                  child: _buildPageIndicators(colorScheme),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(color: colorScheme.primary),
            ),
    );
  }

  Widget _buildPageIndicators(ColorScheme colorScheme) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      children: List.generate(
        _videoPaths.length,
        (index) => GestureDetector(
          onTap: () => _goToVideo(index),
          child: Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _currentIndex == index
                  ? colorScheme.primary
                  : colorScheme.onSecondary.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '${index + 1}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

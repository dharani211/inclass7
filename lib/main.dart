import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FadingImageAnimation(),
    );
  }
}

class FadingImageAnimation extends StatefulWidget {
  @override
  _FadingImageAnimationState createState() => _FadingImageAnimationState();
}

class _FadingImageAnimationState extends State<FadingImageAnimation> with SingleTickerProviderStateMixin {
  bool _isVisible = true;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
    if (_isVisible) {
      _controller.forward();  // Start rotating when image becomes visible
    } else {
      _controller.reverse();  // Rotate back when image fades out
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fading & Rotating Image Animation'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: toggleVisibility,
          child: AnimatedOpacity(
            opacity: _isVisible ? 1.0 : 0.0,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            child: RotationTransition(
              turns: _animation, // Apply rotation animation
              child: Image.asset(
                'assets/image.jpeg', // Load the image from assets
                width: 200, // Set image size (optional)
                height: 200,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleVisibility,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

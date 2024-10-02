import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FadingRotatingImageAnimation(),
    );
  }
}

class FadingRotatingImageAnimation extends StatefulWidget {
  const FadingRotatingImageAnimation({super.key});

  @override
  _FadingRotatingImageAnimationState createState() =>
      _FadingRotatingImageAnimationState();
}

class _FadingRotatingImageAnimationState
    extends State<FadingRotatingImageAnimation> {
  bool _isVisible = true;
  double _rotationAngle = 0.0; // Tracks the rotation angle

  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
      _rotationAngle = 0.0; // Reset rotation on toggle
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fading & Rotating Image Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              child: Transform(
                alignment: Alignment.center, // Rotate around image center
                transform: Matrix4.rotationZ(_rotationAngle), // Apply rotation
                child: Image.asset(
                  'assets/image.jpg', // Replace with your image path
                  height: 200, // Adjust the height as needed
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: const Duration(seconds: 3),
              child: const Text(
                'Bonjour!',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isVisible = !_isVisible;
            _rotationAngle += 0.5; // Increase rotation by 0.5 radians
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

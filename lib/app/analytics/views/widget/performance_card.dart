import 'package:flutter/material.dart';
import 'dart:math';

class PerformanceCard extends StatelessWidget {
  final double performance;
  final String imagePath;

  const PerformanceCard({
    super.key,
    required this.performance,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 210,
      decoration: BoxDecoration(
        color: const Color(0xFF8D63EF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 20,
            top: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Overall Performance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  
                  width: MediaQuery.of(context).size.width - 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: CustomPaint(
                              painter: RadialProgressPainter(
                                progress: performance / 100,
                                progressColor: const Color(0xFF531BBC),
                                backgroundColor: Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  '${performance.toInt()}%',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),
                           Text(
                              'Amazing Performance',
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            // bottom: 0,
            child: Image.asset(
              imagePath,
              height: 200,
            ),
          ),
          
        ],
      ),
    );
  }
}

class RadialProgressPainter extends CustomPainter {
  final double progress;
  final Color progressColor;
  final Color backgroundColor;

  RadialProgressPainter({
    required this.progress,
    required this.progressColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;
    const strokeWidth = 10.0;

    // Draw background circle
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw progress arc
    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

// Usage example:
// PerformanceCard(
//   performance: 80,
//   imagePath: 'assets/character.png',
// )
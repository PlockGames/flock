import 'package:flock/flock_canvas_block.dart';
import 'package:flutter/material.dart';

class FlockPainter extends CustomPainter {
  List<FlockCanvasBlock> canvasBlocks;

  FlockPainter({required this.canvasBlocks});

  @override
  void paint(Canvas canvas, Size size) {
    //Draw blocks
    for (var block in canvasBlocks) {
      block.drawBlock(canvas);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

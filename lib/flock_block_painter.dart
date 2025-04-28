import 'package:flock/flock_canvas_block.dart';
import 'package:flutter/material.dart';

class FlockBlockPainter extends CustomPainter {
  FlockCanvasBlock canvasBlock;
  bool isSelected;

  FlockBlockPainter({required this.canvasBlock, this.isSelected = false});

  @override
  void paint(Canvas canvas, Size size) {
    canvasBlock.drawBlock(canvas, isSelected: isSelected);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

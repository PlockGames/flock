import 'package:flock/flock_canvas_block.dart';
import 'package:flutter/material.dart';

class FlockPainter extends CustomPainter {
  List<FlockCanvasBlock> canvasBlocks;
  FlockCanvasBlock? selectedBlock;
  Offset canvasOffset;

  FlockPainter({
    required this.canvasBlocks,
    this.selectedBlock,
    this.canvasOffset = Offset.zero,
  });

  @override
  void paint(Canvas canvas, Size size) {
    //Draw blocks
    for (var block in canvasBlocks) {
      block.drawBlock(
        canvas,
        isSelected: block == selectedBlock,
        offset: canvasOffset,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

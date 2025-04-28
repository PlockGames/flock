import 'package:flock/flock_block_parameter.dart';
import 'package:flutter/cupertino.dart';

import 'flock_block_painter.dart';
import 'flock_canvas_block.dart';

enum FlockBlockType { statement, output, action }

class FlockBlock {
  final String name;
  final FlockBlockType type;
  final String text;
  final List<FlockBlockParameter> parameters;

  const FlockBlock({
    required this.name,
    required this.type,
    required this.text,
    this.parameters = const [],
  });

  getFlockCanvasBlock() {
    return FlockCanvasBlock(block: this, x: 0, y: 0);
  }

  getDisplay({FlockCanvasBlock? canvasBlock, isSelected = false}) {
    canvasBlock ??= getFlockCanvasBlock();

    return CustomPaint(
      size: Size(100, 50),
      painter: FlockBlockPainter(
        canvasBlock: canvasBlock!,
        isSelected: isSelected,
      ),
    );
  }
}

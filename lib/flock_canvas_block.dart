import 'package:flock/flock_block.dart';
import 'package:flutter/material.dart';

class FlockCanvasBlock {
  static const double blockHeight = 30;
  static const double blockAngle = 5;
  static const double blockActionHoleWidth = 10;
  static const double blockActionHoleStart = 15;

  FlockBlock block;

  double x;
  double y;
  FlockCanvasBlock? previousBlock;
  FlockCanvasBlock? nextBlock;
  FlockCanvasBlock? outputBlock;

  FlockCanvasBlock({required this.block, required this.x, required this.y});

  Path getStatementBlockPath(double blockWidth) {
    return Path()
      ..moveTo(x, y + blockAngle)
      ..arcToPoint(
        Offset(x + blockAngle, y),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(x + blockActionHoleStart - blockAngle, y)
      ..arcToPoint(
        Offset(x + blockActionHoleStart, y + blockAngle),
        radius: const Radius.circular(blockAngle),
        clockwise: false,
      )
      ..lineTo(
        x + blockActionHoleStart + blockActionHoleWidth - blockAngle,
        y + blockAngle,
      )
      ..arcToPoint(
        Offset(x + blockActionHoleStart + blockActionHoleWidth, y),
        radius: const Radius.circular(blockAngle),
        clockwise: false,
      )
      ..lineTo(x + blockWidth - blockAngle, y)
      ..arcToPoint(
        Offset(x + blockWidth, y + blockAngle),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(x + blockWidth, y + blockHeight - blockAngle)
      ..arcToPoint(
        Offset(x + blockWidth - blockAngle, y + blockHeight),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(x + blockActionHoleStart + blockActionHoleWidth, y + blockHeight)
      ..arcToPoint(
        Offset(
          x + blockActionHoleStart + blockActionHoleWidth - blockAngle,
          y + blockHeight + blockAngle,
        ),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(x + blockActionHoleStart, y + blockHeight + blockAngle)
      ..arcToPoint(
        Offset(x + blockActionHoleStart - blockAngle, y + blockHeight),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(x + blockAngle, y + blockHeight)
      ..arcToPoint(
        Offset(x, y + blockHeight - blockAngle),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..close();
  }

  Path getActionBlockPath(double blockWidth) {
    return Path()
      ..moveTo(x, y + blockAngle)
      ..arcToPoint(
        Offset(x + blockAngle, y),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(x + blockActionHoleStart - blockAngle, y)
      ..arcToPoint(
        Offset(x + blockActionHoleStart, y + blockAngle),
        radius: const Radius.circular(blockAngle),
        clockwise: false,
      )
      ..lineTo(
        x + blockActionHoleStart + blockActionHoleWidth - blockAngle,
        y + blockAngle,
      )
      ..arcToPoint(
        Offset(x + blockActionHoleStart + blockActionHoleWidth, y),
        radius: const Radius.circular(blockAngle),
        clockwise: false,
      )
      ..lineTo(x + blockWidth - blockAngle, y)
      ..arcToPoint(
        Offset(x + blockWidth, y + blockAngle),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(x + blockWidth, y + blockHeight - blockAngle)
      ..arcToPoint(
        Offset(x + blockWidth - blockAngle, y + blockHeight),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(x + blockActionHoleStart + blockActionHoleWidth, y + blockHeight)
      ..arcToPoint(
        Offset(
          x + blockActionHoleStart + blockActionHoleWidth - blockAngle,
          y + blockHeight + blockAngle,
        ),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(x + blockActionHoleStart, y + blockHeight + blockAngle)
      ..arcToPoint(
        Offset(x + blockActionHoleStart - blockAngle, y + blockHeight),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(x + blockAngle, y + blockHeight)
      ..arcToPoint(
        Offset(x, y + blockHeight - blockAngle),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..close();
  }

  Path getOutputBlockPath(double blockWidth) {
    return Path()
      ..moveTo(x, y + blockAngle)
      ..arcToPoint(
        Offset(x + blockAngle, y),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(x + blockWidth - blockAngle, y)
      ..arcToPoint(
        Offset(x + blockWidth, y + blockAngle),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(x + blockWidth, y + blockHeight - blockAngle)
      ..arcToPoint(
        Offset(x + blockWidth - blockAngle, y + blockHeight),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(x + blockAngle, y + blockHeight)
      ..arcToPoint(
        Offset(x, y + blockHeight - blockAngle),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      // draw output
      ..lineTo(x, y + blockHeight / 2 + 5)
      ..lineTo(x - 3, y + blockHeight / 2 + 10)
      ..arcToPoint(
        Offset(x - 3, y + blockHeight / 2 - 10),
        radius: const Radius.circular(5),
        clockwise: true,
      )
      ..lineTo(x, y + blockHeight / 2 - 5)
      ..close();
  }

  drawBlock(Canvas canvas, {bool isSelected = false}) {
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: block.text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    double blockWidth = textPainter.width + 20;

    Paint paint =
        Paint()
          ..color = const Color(0xFF252525)
          ..style = PaintingStyle.fill
          ..strokeWidth = 2.0;

    Paint selectedPaint =
        Paint()
          ..color = const Color(0xFF007AFF)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0;

    if (block.type == FlockBlockType.statement) {
      canvas.drawPath(getStatementBlockPath(blockWidth), paint);
      textPainter.paint(canvas, Offset(x + 10, y + blockHeight / 2 - 6));
      if (isSelected) {
        canvas.drawPath(getStatementBlockPath(blockWidth), selectedPaint);
      }
    } else if (block.type == FlockBlockType.output) {
      canvas.drawPath(getOutputBlockPath(blockWidth), paint);
      // draw text
      textPainter.paint(canvas, Offset(x + 10, y + blockHeight / 2 - 6));
      if (isSelected) {
        canvas.drawPath(getOutputBlockPath(blockWidth), selectedPaint);
      }
    } else if (block.type == FlockBlockType.action) {
      canvas.drawPath(getActionBlockPath(blockWidth), paint);
      // draw text
      textPainter.paint(canvas, Offset(x + 10, y + blockHeight / 2 - 6));
      if (isSelected) {
        canvas.drawPath(getActionBlockPath(blockWidth), selectedPaint);
      }
    }
  }
}

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

  Path getStatementBlockPath(double blockWidth, [Offset offset = Offset.zero]) {
    final double adjustedX = x + offset.dx;
    final double adjustedY = y + offset.dy;

    return Path()
      ..moveTo(adjustedX, adjustedY + blockAngle)
      ..arcToPoint(
        Offset(adjustedX + blockAngle, adjustedY),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(adjustedX + blockActionHoleStart - blockAngle, adjustedY)
      ..arcToPoint(
        Offset(adjustedX + blockActionHoleStart, adjustedY + blockAngle),
        radius: const Radius.circular(blockAngle),
        clockwise: false,
      )
      ..lineTo(
        adjustedX + blockActionHoleStart + blockActionHoleWidth - blockAngle,
        adjustedY + blockAngle,
      )
      ..arcToPoint(
        Offset(
          adjustedX + blockActionHoleStart + blockActionHoleWidth,
          adjustedY,
        ),
        radius: const Radius.circular(blockAngle),
        clockwise: false,
      )
      ..lineTo(adjustedX + blockWidth - blockAngle, adjustedY)
      ..arcToPoint(
        Offset(adjustedX + blockWidth, adjustedY + blockAngle),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(adjustedX + blockWidth, adjustedY + blockHeight - blockAngle)
      ..arcToPoint(
        Offset(adjustedX + blockWidth - blockAngle, adjustedY + blockHeight),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(
        adjustedX + blockActionHoleStart + blockActionHoleWidth,
        adjustedY + blockHeight,
      )
      ..arcToPoint(
        Offset(
          adjustedX + blockActionHoleStart + blockActionHoleWidth - blockAngle,
          adjustedY + blockHeight + blockAngle,
        ),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(
        adjustedX + blockActionHoleStart,
        adjustedY + blockHeight + blockAngle,
      )
      ..arcToPoint(
        Offset(
          adjustedX + blockActionHoleStart - blockAngle,
          adjustedY + blockHeight,
        ),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(adjustedX + blockAngle, adjustedY + blockHeight)
      ..arcToPoint(
        Offset(adjustedX, adjustedY + blockHeight - blockAngle),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..close();
  }

  Path getActionBlockPath(double blockWidth, [Offset offset = Offset.zero]) {
    final double adjustedX = x + offset.dx;
    final double adjustedY = y + offset.dy;

    return Path()
      ..moveTo(adjustedX, adjustedY + blockAngle)
      ..arcToPoint(
        Offset(adjustedX + blockAngle, adjustedY),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(adjustedX + blockActionHoleStart - blockAngle, adjustedY)
      ..arcToPoint(
        Offset(adjustedX + blockActionHoleStart, adjustedY + blockAngle),
        radius: const Radius.circular(blockAngle),
        clockwise: false,
      )
      ..lineTo(
        adjustedX + blockActionHoleStart + blockActionHoleWidth - blockAngle,
        adjustedY + blockAngle,
      )
      ..arcToPoint(
        Offset(
          adjustedX + blockActionHoleStart + blockActionHoleWidth,
          adjustedY,
        ),
        radius: const Radius.circular(blockAngle),
        clockwise: false,
      )
      ..lineTo(adjustedX + blockWidth - blockAngle, adjustedY)
      ..arcToPoint(
        Offset(adjustedX + blockWidth, adjustedY + blockAngle),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(adjustedX + blockWidth, adjustedY + blockHeight - blockAngle)
      ..arcToPoint(
        Offset(adjustedX + blockWidth - blockAngle, adjustedY + blockHeight),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(
        adjustedX + blockActionHoleStart + blockActionHoleWidth,
        adjustedY + blockHeight,
      )
      ..arcToPoint(
        Offset(
          adjustedX + blockActionHoleStart + blockActionHoleWidth - blockAngle,
          adjustedY + blockHeight + blockAngle,
        ),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(
        adjustedX + blockActionHoleStart,
        adjustedY + blockHeight + blockAngle,
      )
      ..arcToPoint(
        Offset(
          adjustedX + blockActionHoleStart - blockAngle,
          adjustedY + blockHeight,
        ),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(adjustedX + blockAngle, adjustedY + blockHeight)
      ..arcToPoint(
        Offset(adjustedX, adjustedY + blockHeight - blockAngle),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..close();
  }

  Path getOutputBlockPath(double blockWidth, [Offset offset = Offset.zero]) {
    final double adjustedX = x + offset.dx;
    final double adjustedY = y + offset.dy;

    return Path()
      ..moveTo(adjustedX, adjustedY + blockAngle)
      ..arcToPoint(
        Offset(adjustedX + blockAngle, adjustedY),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(adjustedX + blockWidth - blockAngle, adjustedY)
      ..arcToPoint(
        Offset(adjustedX + blockWidth, adjustedY + blockAngle),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(adjustedX + blockWidth, adjustedY + blockHeight - blockAngle)
      ..arcToPoint(
        Offset(adjustedX + blockWidth - blockAngle, adjustedY + blockHeight),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(adjustedX + blockAngle, adjustedY + blockHeight)
      ..arcToPoint(
        Offset(adjustedX, adjustedY + blockHeight - blockAngle),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      // draw output
      ..lineTo(adjustedX, adjustedY + blockHeight - blockAngle)
      ..arcToPoint(
        Offset(
          adjustedX - blockAngle,
          adjustedY + blockHeight - blockAngle * 2,
        ),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..lineTo(adjustedX - blockAngle, adjustedY + blockAngle * 2)
      ..arcToPoint(
        Offset(adjustedX, adjustedY + blockAngle),
        radius: const Radius.circular(blockAngle),
        clockwise: true,
      )
      ..close();
  }

  Offset getBlockSize() {
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: block.text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    double blockWidth = textPainter.width + 20;
    return Offset(blockWidth, blockHeight);
  }

  drawBlock(
    Canvas canvas, {
    bool isSelected = false,
    Offset offset = Offset.zero,
  }) {
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
      canvas.drawPath(getStatementBlockPath(blockWidth, offset), paint);
      textPainter.paint(
        canvas,
        Offset(x + offset.dx + 10, y + blockHeight / 2 - 6 + offset.dy),
      );
      if (isSelected) {
        canvas.drawPath(
          getStatementBlockPath(blockWidth, offset),
          selectedPaint,
        );
      }
    } else if (block.type == FlockBlockType.output) {
      canvas.drawPath(getOutputBlockPath(blockWidth, offset), paint);
      // draw text
      textPainter.paint(
        canvas,
        Offset(x + offset.dx + 10, y + blockHeight / 2 - 6 + offset.dy),
      );
      if (isSelected) {
        canvas.drawPath(getOutputBlockPath(blockWidth, offset), selectedPaint);
      }
    } else if (block.type == FlockBlockType.action) {
      canvas.drawPath(getActionBlockPath(blockWidth, offset), paint);
      // draw text
      textPainter.paint(
        canvas,
        Offset(x + 10 + offset.dx, y + blockHeight / 2 - 6 + offset.dy),
      );
      if (isSelected) {
        canvas.drawPath(getActionBlockPath(blockWidth, offset), selectedPaint);
      }
    }
  }
}

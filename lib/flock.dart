import 'package:flock/flock_canvas_block.dart';
import 'package:flutter/material.dart';

import 'flock_category.dart';
import 'flock_painter.dart';

class FlockWidget extends StatefulWidget {
  List<FlockCategory> blockbox;

  FlockWidget({super.key, this.blockbox = const []});

  @override
  State<StatefulWidget> createState() {
    return _FlockWidgetState();
  }
}

class _FlockWidgetState extends State<FlockWidget> {
  int selectedCategory = -1;
  List<FlockCanvasBlock> canvasBlocks = [];
  FlockCanvasBlock? currentlyDraggedBlock;
  Offset canvasOffset = Offset.zero;

  @override
  void initState() {
    super.initState();
    selectedCategory = -1;
    canvasBlocks = [];
    currentlyDraggedBlock = null;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: 40,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children:
                // for each category, create a tab
                widget.blockbox.map((category) {
                  if (category.children.isEmpty) {
                    return const SizedBox();
                  } else {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedCategory ==
                              widget.blockbox.indexOf(category)) {
                            selectedCategory = -1;
                          } else {
                            selectedCategory = widget.blockbox.indexOf(
                              category,
                            );
                          }
                        });
                      },
                      child: Container(
                        width: width / widget.blockbox.length,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color:
                              selectedCategory ==
                                      widget.blockbox.indexOf(category)
                                  ? Colors.blue
                                  : Colors.grey,
                        ),
                        child: Center(
                          child: Text(
                            category.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }
                }).toList(),
          ),
        ),
        if (selectedCategory != -1)
          SizedBox(
            height: 100,
            child: Container(
              color: Colors.grey[200],
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:
                    widget.blockbox[selectedCategory].children.map((block) {
                      return GestureDetector(
                        child: LongPressDraggable<FlockCanvasBlock>(
                          delay: const Duration(milliseconds: 50),
                          data: FlockCanvasBlock(block: block, x: 0, y: 0),
                          feedback: block.getDisplay(isSelected: true),
                          child: block.getDisplay(),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),
        Expanded(
          child: DragTarget<FlockCanvasBlock>(
            builder: (context, candidateData, rejectedData) {
              return GestureDetector(
                onPanStart: (details) {
                  Offset pos = details.localPosition - canvasOffset;
                  for (var block in canvasBlocks) {
                    Rect blockRect = Rect.fromLTWH(
                      block.x,
                      block.y,
                      block.getBlockSize().dx,
                      block.getBlockSize().dy,
                    );

                    if (blockRect.contains(pos)) {
                      currentlyDraggedBlock = block;
                      break;
                    }
                  }
                },
                onPanUpdate: (details) {
                  if (currentlyDraggedBlock != null) {
                    setState(() {
                      currentlyDraggedBlock!.x += details.delta.dx;
                      currentlyDraggedBlock!.y += details.delta.dy;
                    });
                  } else {
                    setState(() {
                      canvasOffset += details.delta;
                    });
                  }
                },
                onPanEnd: (details) {
                  currentlyDraggedBlock = null;
                },
                child: CustomPaint(
                  size: Size.infinite,
                  painter: FlockPainter(
                    canvasBlocks: canvasBlocks,
                    selectedBlock: currentlyDraggedBlock,
                    canvasOffset: canvasOffset,
                  ),
                ),
              );
            },
            onAcceptWithDetails: (data) {
              setState(() {
                final offset = context.findRenderObject() as RenderBox;
                data.data.x =
                    data.offset.dx - offset.localToGlobal(Offset.zero).dx;
                data.data.y =
                    data.offset.dy - 140 - offset.localToGlobal(Offset.zero).dy;
                canvasBlocks.add(data.data);
              });
            },
          ),
        ),
      ],
    );
  }
}

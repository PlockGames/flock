import 'package:flock/flock_block.dart';
import 'package:flock/flock_block_parameter.dart';

var blockIf = FlockBlock(
  name: "block_if",
  type: FlockBlockType.statement,
  text: "if {} then",
  parameters: [FlockBlockParameter(name: "condition", value: "true")],
);

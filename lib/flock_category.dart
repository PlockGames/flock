import 'flock_block.dart';

class FlockCategory {
  String name;
  List<FlockBlock> children = [];

  FlockCategory({required this.name, required this.children});
}

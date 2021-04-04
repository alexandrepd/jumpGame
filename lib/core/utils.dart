import 'dart:math';

double randomDoubleInRange({double min = -1.0, double max = 1.0}) {
  return Random().nextDouble() * (max - min + 1.0) + min;
}

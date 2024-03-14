import 'dart:math';

double getRandomPosition(List<double> limits) {
  print(Random().nextDouble() * (limits[1] - limits[0]) + limits[0]);
  return (Random().nextDouble() * (limits[1] - limits[0]) + limits[0]) <= 1
      ? Random().nextDouble() * (limits[1] - limits[0]) + limits[0]
      : (Random().nextDouble() * (limits[1] - limits[0]) + limits[0]) - 1;
}

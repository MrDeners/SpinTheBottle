import 'dart:math';

double getRandomPosition(List<double> limits) {
  return (Random().nextDouble() * (limits[1] - limits[0]) + limits[0]) <= 1
      ? Random().nextDouble() * (limits[1] - limits[0]) + limits[0]
      : (Random().nextDouble() * (limits[1] - limits[0]) + limits[0]) - 1;
}

void changeTable() {
  //TODO: Change table
}

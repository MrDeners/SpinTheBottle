// ignore_for_file: file_names
class TableSkin {
  // ignore: non_constant_identifier_names
  final int _ID;
  final String _skin;
  final int _price;
  final bool _isAvailable;

  const TableSkin(
      // ignore: non_constant_identifier_names
      {required int ID,
      required String skin,
      required int price,
      required bool isAvailable})
      : _ID = ID,
        _skin = skin,
        _price = price,
        _isAvailable = isAvailable;

  // ignore: non_constant_identifier_names
  int get ID => _ID;
  String get skin => _skin;
  int get price => _price;
  bool get isAvailable => _isAvailable;
}

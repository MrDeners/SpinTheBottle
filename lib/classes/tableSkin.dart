class TableSkin {
  final int _ID;
  final String _skin;
  final int _price;
  final bool _isAvailable;

  const TableSkin(
      {required int ID,
      required String skin,
      required int price,
      required bool isAvailable})
      : _ID = ID,
        _skin = skin,
        _price = price,
        _isAvailable = isAvailable;

  int get ID => _ID;
  String get skin => _skin;
  int get price => _price;
  bool get isAvailable => _isAvailable;
}

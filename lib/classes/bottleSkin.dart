class BottleSkin {
  final int _ID;
  final String _skin;
  final int _price;
  final bool _isAvailable;

  const BottleSkin(
      {required int ID,
      required String skin,
      required int price,
      bool isAvailable = true})
      : _ID = ID,
        _skin = skin,
        _price = price,
        _isAvailable = isAvailable;

  int get ID => _ID;
  String get skin => _skin;
  int get price => _price;
  bool get isAvailable => _isAvailable;
}

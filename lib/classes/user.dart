class User {
  final String _firstName;
  final String _secondName;
  final String _age;
  final String _avatar;
  final String _border;
  final int _heartsAmount;
  final bool _isPatron;
  final bool _isNullUser;
  int chair = 0;

  User(
      {required String firstName,
      required String secondName,
      String age = "",
      String avatar = 'assets/DefaultAvatar.png',
      String border = 'assets/Borders/RedBorder.png',
      int heartsAmount = 0,
      bool isPatron = false,
      bool isNullUser = false,
      int chair = 0})
      : _firstName = firstName,
        _secondName = secondName,
        _age = age,
        _avatar = avatar,
        _border = border,
        _heartsAmount = heartsAmount,
        _isPatron = isPatron,
        _isNullUser = isNullUser;

  String get firstName => _firstName;
  String get secondName => _secondName;
  int get heartsAmount => _heartsAmount;
  String get age => _age;
  String get avatar => _avatar;
  String get border => _border;
  bool get isPatron => _isPatron;
  bool get isNullUser => _isNullUser;
}

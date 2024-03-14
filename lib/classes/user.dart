class User {
  final String _firstName;
  final String _secondName;
  final String _age;
  final String _avatar;
  final String _border;
  final int _heartsAmount;
  final bool _isPatron;
  final int _chair;

  const User(
      {required String firstName,
      required String secondName,
      String age = "",
      String avatar = 'assets/DefaultAvatar.png',
      String border = 'assets/Borders/RedBorder.png',
      int heartsAmount = 0,
      bool isPatron = false,
      int chair = 3}) //TODO: = 0
      : _firstName = firstName,
        _secondName = secondName,
        _age = age,
        _avatar = avatar,
        _border = border,
        _heartsAmount = heartsAmount,
        _isPatron = isPatron,
        _chair = chair;

  String get firstName => _firstName;
  String get secondName => _secondName;
  int get heartsAmount => _heartsAmount;
  String get age => _age;
  String get avatar => _avatar;
  String get border => _border;
  bool get isPatron => _isPatron;
  int get chair => _chair;
}

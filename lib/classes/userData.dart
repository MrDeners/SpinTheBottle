class UserData {
  final String _firstName;
  final String _secondName;
  final int _heartsAmount;
  final String _age;
  final bool _isPatron;

  const UserData(
      {required String firstName,
      required String secondName,
      String age = "",
      int heartsAmount = 0,
      bool isPatron = false})
      : _firstName = firstName,
        _secondName = secondName,
        _heartsAmount = heartsAmount,
        _isPatron = isPatron,
        _age = age;

  String get firstName => _firstName;
  String get secondName => _secondName;
  int get heartsAmount => _heartsAmount;
  String get age => _age;
  bool get isPatron => _isPatron;
}

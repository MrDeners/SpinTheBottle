class UserData {
  final String _firstName;
  final String _secondName;
  final int _heartsAmount;

  UserData(this._firstName, this._secondName, this._heartsAmount);

  String get firstName => _firstName;
  String get secondName => _secondName;
  int get heartsAmount => _heartsAmount;
}

import 'package:spin_the_bottle/classes/user.dart';
import 'package:spin_the_bottle/classes/tableSkin.dart';
import 'package:spin_the_bottle/classes/bottleSkin.dart';

class PlayTable {
  // ignore: non_constant_identifier_names
  final int _ID;
  List<User> _users;
  TableSkin _tableSkin;
  BottleSkin _bottleSkin;
  List<User> _selectedUsers;
  int _spinnerID;
  Map _busyChairs;
  Map _userIntervals;

  PlayTable(
      {required int ID,
      List<User>? users,
      int spinnerID = 0,
      List<User> selectedUsers = const [],
      Map busyChairs = const {
        '1': false,
        '2': false,
        '3': false,
        '4': false,
        '5': false,
        '6': false,
        '7': false,
        '8': false,
      },
      Map userIntervals = const {
        '5': [0.9376, 1.0625],
        '4': [0.0626, 0.1875],
        '8': [0.1876, 0.3125],
        '2': [0.3126, 0.4375],
        '6': [0.4376, 0.5625],
        '3': [0.5626, 0.6875],
        '7': [0.6876, 0.8125],
        '1': [0.8126, 0.9375],
      },
      TableSkin tableSkin = const TableSkin(
        ID: 0,
        skin: 'assets/TableSkins/MainTableSkin.png',
        price: 0,
        isAvailable: true,
      ),
      BottleSkin bottleSkin = const BottleSkin(
        ID: 0,
        skin: 'assets/BottleSkins/MainBottleSkin.png',
        price: 0,
        isAvailable: true,
      )})
      : _ID = ID,
        _users = users ?? [],
        _tableSkin = tableSkin,
        _bottleSkin = bottleSkin,
        _spinnerID = spinnerID,
        _busyChairs = busyChairs,
        _userIntervals = userIntervals,
        _selectedUsers = selectedUsers;

  int get ID => _ID;
  List<User> get users => _users;
  List<User> get selectedUsers => _selectedUsers;
  TableSkin get tableSkin => _tableSkin;
  BottleSkin get bottleSkin => _bottleSkin;
  int get spinnerID => _spinnerID;
  Map get busyChairs => _busyChairs;
  Map get userIntervals => _userIntervals;
  String get tableSkinImage => _tableSkin.skin;
  String get bottleSkinImage => _bottleSkin.skin;

  void addUser(User user) {
    if (_users.length < 8) {
      _users.add(user);
    } else {
      //TODO: user.ChangeTable
    }
  }

  void removeUser(User user) {
    _users.remove(user);
    if (_users.isEmpty) {
      //TODO: DeleteTable
    }
  }

  void changeTableSkin(TableSkin skin) {
    _tableSkin = skin;
  }

  void changeBottleSkin(BottleSkin skin) {
    _bottleSkin = skin;
  }
}

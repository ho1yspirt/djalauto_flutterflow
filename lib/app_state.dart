import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _initialDate = prefs.containsKey('ff_initialDate')
        ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_initialDate')!)
        : null;
    _teachersList = prefs.getStringList('ff_teachersList')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        }).toList() ??
        _teachersList;
    _carList = prefs.getStringList('ff_carList')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        }).toList() ??
        _carList;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _logoIcon =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/djalauto-mdpcse/assets/yxn5dry9x9yy/icon_logo.png';
  String get logoIcon => _logoIcon;
  set logoIcon(String _value) {
    _logoIcon = _value;
  }

  String _logo =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/djalauto-mdpcse/assets/q0v1ahsbk532/logo.png';
  String get logo => _logo;
  set logo(String _value) {
    _logo = _value;
  }

  int _plus1 = 1;
  int get plus1 => _plus1;
  set plus1(int _value) {
    _plus1 = _value;
  }

  String _emptyString = '';
  String get emptyString => _emptyString;
  set emptyString(String _value) {
    _emptyString = _value;
  }

  DateTime? _initialDate = DateTime.fromMillisecondsSinceEpoch(1672552800000);
  DateTime? get initialDate => _initialDate;
  set initialDate(DateTime? _value) {
    _initialDate = _value;
    _value != null
        ? prefs.setInt('ff_initialDate', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_initialDate');
  }

  List<dynamic> _teachersList = [
    jsonDecode(
        '{\"name\":\"Тимур\",\"profession\":\"Преподаватель\",\"experience\":\"20 лет\",\"age\":\"20 лет\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/djalauto-mdpcse/assets/e4qff6s10u16/timur.jpg\"}'),
    jsonDecode(
        '{\"name\":\"Владимир\",\"profession\":\"Автоинструктор\",\"experience\":\"20 лет\",\"age\":\"20 лет\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/djalauto-mdpcse/assets/x0b9rupdk5nm/vladimir.jpg\"}'),
    jsonDecode(
        '{\"name\":\"Инкер\",\"profession\":\"Автоинструктор\",\"experience\":\"20 лет\",\"age\":\"20 лет\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/djalauto-mdpcse/assets/qfsmqhae5caa/inker.jpg\"}'),
    jsonDecode(
        '{\"name\":\"Олег\",\"profession\":\"Автоинструктор\",\"experience\":\"20 лет\",\"age\":\"20 лет\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/djalauto-mdpcse/assets/zhxxpvqo5wjw/oleg.jpg\"}')
  ];
  List<dynamic> get teachersList => _teachersList;
  set teachersList(List<dynamic> _value) {
    _teachersList = _value;
    prefs.setStringList(
        'ff_teachersList', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToTeachersList(dynamic _value) {
    _teachersList.add(_value);
    prefs.setStringList(
        'ff_teachersList', _teachersList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTeachersList(dynamic _value) {
    _teachersList.remove(_value);
    prefs.setStringList(
        'ff_teachersList', _teachersList.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _carList = [
    jsonDecode(
        '{\"transmition\":\"механика\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/djalauto-mdpcse/assets/1zhybxxx3rrb/car-1.jpg\"}'),
    jsonDecode(
        '{\"transmition\":\"автомат\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/djalauto-mdpcse/assets/1v86pi9cf51e/car-2.jpg\"}'),
    jsonDecode(
        '{\"transmition\":\"механика\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/djalauto-mdpcse/assets/gmlfm80z4ujq/car-3.jpg\"}'),
    jsonDecode(
        '{\"transmition\":\"механика\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/djalauto-mdpcse/assets/8zw0ot58346u/car-4.jpg\"}')
  ];
  List<dynamic> get carList => _carList;
  set carList(List<dynamic> _value) {
    _carList = _value;
    prefs.setStringList(
        'ff_carList', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToCarList(dynamic _value) {
    _carList.add(_value);
    prefs.setStringList(
        'ff_carList', _carList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromCarList(dynamic _value) {
    _carList.remove(_value);
    prefs.setStringList(
        'ff_carList', _carList.map((x) => jsonEncode(x)).toList());
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

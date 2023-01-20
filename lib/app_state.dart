import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

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

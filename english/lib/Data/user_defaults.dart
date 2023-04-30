import 'dart:ffi';
import 'package:shared_preferences/shared_preferences.dart';

enum _EnumKeysDefaults { keySwitch, keySegment }

class UserDefaults {
  UserDefaults._();
  static final UserDefaults shared = UserDefaults._();

  // save

  saveIndexSegment(int index) async {
    SharedPreferences defaults = await SharedPreferences.getInstance();
    defaults.setInt(_EnumKeysDefaults.keySegment.toString(), index);
  }

  saveSwitch(bool value) async {
    SharedPreferences defaults = await SharedPreferences.getInstance();
    defaults.setBool(_EnumKeysDefaults.keySwitch.toString(), value);
  }

  saveWord(String wordId, Bool isFavorit) async {
    SharedPreferences defaults = await SharedPreferences.getInstance();
    if (isFavorit == true) {
      defaults.setBool(wordId, true);
    } else {
      defaults.remove(wordId);
    }
  }

  // get

  Future<int> getSegmentIndex() async {
    SharedPreferences defaults = await SharedPreferences.getInstance();
    return defaults.getInt(_EnumKeysDefaults.keySegment.toString()) ?? 0;
  }

  Future<bool> getSwitchValue() async {
    SharedPreferences defaults = await SharedPreferences.getInstance();
    return defaults.getBool(_EnumKeysDefaults.keySwitch.toString()) ?? false;
  }

  Future<bool> favoritThisWord(String wordId) async {
    SharedPreferences defaults = await SharedPreferences.getInstance();
    return defaults.getBool(wordId) ?? false;
  }
}

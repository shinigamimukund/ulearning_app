import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning_app/common/entities/values/constants.dart';

class StorageService {
  late final SharedPreferences _preferences;

  Future<StorageService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  ///@start:- welcome page..........
  ///setting values for key
  Future<bool> setBool(String key, bool value) async {
    //print('set bool is ${await _preferences.setBool(key, value)}');
    return await _preferences.setBool(key, value);
  }

  bool getDeviceFirstOpen() {
    //print(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME);
    //print(
    //  'get device first open = ${_preferences.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false}');
    return _preferences.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ??
        false;
  }

  ///@end:- welcome page.........

  ///@start:- signin page........
  Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  bool getUserTokenKey() {
    return _preferences.getString(AppConstants.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }

  ///@end:- signin page.......

  ///@start:- logout in settings page........
  Future<bool> remove(String key) {
    return _preferences.remove(key);
  }

  ///@end:- logout in settings page.......
}

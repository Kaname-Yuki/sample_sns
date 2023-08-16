import 'package:shared_preferences/shared_preferences.dart';

Future<bool> getFavorite(String type, int id) async {
  final data = await SharedPreferences.getInstance();
  final isFavorite = data.getBool('$type$id');
  return isFavorite == null ? Future.value(false) : Future.value(isFavorite);
}

void setFavorite(String type, int id, {bool isFavorite = false}) async {
  final data = await SharedPreferences.getInstance();
  data.setBool('$type$id', !isFavorite);
}

Future<bool> getIsDarkModeData() async {
  final data = await SharedPreferences.getInstance();
  final isDarkMode = data.getBool('isDarkMode');
  return isDarkMode == null ? Future.value(true) : Future.value(isDarkMode);
}

void setIsDarkModeData({bool isDarkMode = false}) async {
  final data = await SharedPreferences.getInstance();
  data.setBool('isDarkMode', !isDarkMode);
}

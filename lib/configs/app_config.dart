import 'package:shared_preferences/shared_preferences.dart';

class AppConfig {
  static const String smtpUsername = 'c9672845e3a3b8574575dd3feb6ed9c6';
  static const String smtpPassword = 'd13e7750d357507f3960861f8e4f7874';
  static const String senderEmail = 'yaminhany12@gmail.com';

  static String? _cachedIp;

  // This method loads the IP address from SharedPreferences and caches it
  static Future<void> loadIpAddress() async {
    final prefs = await SharedPreferences.getInstance();
    _cachedIp = prefs.getString('home_assistant_ip'); // Load IP from preferences
  }

  // This method allows synchronous access to the IP address after it has been loaded
  static String? get ipAddress => _cachedIp;

  // This method saves the IP address to SharedPreferences and caches it
  static Future<void> saveIpAddress(String ip) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('home_assistant_ip', ip); // Save to preferences
    _cachedIp = ip; // Cache the IP address for future use
  }
}

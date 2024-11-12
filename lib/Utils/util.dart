import 'dart:convert';
import 'dart:io' as io;

class Util {
  static final String _enviroment = io.Platform.environment['ENV'] ?? 'dev';

  static Future<String?> getConfigurationValue(
      String parent, String child) async {
    Map<String, dynamic> config = await _loadConfig();
    return config[parent][child];
  }

  static Future<Map<String, dynamic>> _loadConfig() async {
    final file = io.File('config_$_enviroment.json');
    final content = await file.readAsString();
    return jsonDecode(content);
  }
}

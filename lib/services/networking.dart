import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  final String url;

  Networking({
    required this.url,
  });

  Future fetchWeather() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
      return;
    }
  }
}

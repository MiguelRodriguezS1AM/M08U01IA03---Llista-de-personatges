import 'dart:convert';
import 'dart:io';
import 'dart:async';

class Digimon {
  final String name;
  String imageUrl;
  String apiname;
  String levelDigimon;

  int rating = 10;

  Digimon(this.name);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient http = new HttpClient();
    try {
      apiname = name;
      var der = '[';
      var iz = ']';
      var uri =
          new Uri.https('www.mockachino.com', '56e06c3c-23e7-45/$apiname');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();

      List data = json.decode('$der$responseBody$iz');
      imageUrl = data[0]["image"];
      levelDigimon = data[0]["homeworld"];

      print(levelDigimon);
    } catch (exception) {
      print(exception);
    }
  }
}

import 'package:login_app/models/ChractersModelData.dart';
import 'package:http/http.dart' as http;

class HarryPotterCharacters {
  var client = http.Client();

  Future<List<HPChractersModel>?> getCharacters() async {
    var uri = Uri.parse("https://hp-api.herokuapp.com/api/characters");
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      return hpChractersModelFromJSON(response.body);
    }
    return null;
  }
}

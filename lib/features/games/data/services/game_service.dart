import 'package:app/core/constantes.dart';
import 'package:http/http.dart' as http;

class GameService {
  //att
  final http.Client client;
  //constructor
  GameService(this.client);

  //fetch all games
  Future<http.Response> getAll() async {
    print("Service : Hello");
    return await client.get(Uri.parse(BASEURL));
  }
}

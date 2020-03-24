import 'dart:convert';
import 'package:carros/models/carro.dart';
import 'package:carros/models/usuario.dart';
import 'package:carros/pages/favoritos/carro_dao.dart';
import 'package:carros/utils/api_response.dart';
import 'package:http/http.dart' as http;

enum TipoCarro { classicos, esportivos, luxo }

class Api {
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    try {
      // var url = 'http://livrowebservices.com.br/rest/login';
      var url = 'https://carros-springboot.herokuapp.com/api/v2/login';

      Map<String, String> headers = {'Content-Type': 'application/json'};

      Map params = {'username': login, 'password': senha};
      String parmsJson = json.encode(params);

      var response = await http.post(url, body: parmsJson, headers: headers);

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse);
        user.save();
        return ApiResponse.ok(user);
      }

      return ApiResponse.error(mapResponse['error']);
    } catch (error) {
      return ApiResponse.error('Não foi possivel fazer o login.');
    }
  }

  static Future<List<Carro>> getCarros(TipoCarro tipo) async {
    String valueTipo = tipo.toString().replaceAll('TipoCarro.', '');

    Usuario user = await Usuario.get();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${user.token}'
    };

    var url =
        'https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$valueTipo';
    var response = await http.get(url, headers: headers);
    List list = json.decode(response.body);

    List<Carro> carros = list.map<Carro>((map) => Carro.fromMap(map)).toList();

    final carroDao = CarroDAO();

    carros.forEach((carro) => carroDao.save(carro));

    return carros;
  }

  static Future<String> getLoripsum() async {
    var url = 'https://loripsum.net/api';
    var response = await http.get(url);
    String text = response.body;
    text = text.replaceAll("<p>", '');
    text = text.replaceAll("</p>", '');

    return text;
  }
}

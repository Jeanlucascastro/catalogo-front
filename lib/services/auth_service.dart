import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static Future<String> login( {required String login, required String password}) async {
    // URL da API de login
    String url = 'http://localhost:8080/auth/login';

    // Corpo da solicitação com os dados de login
    Map<String, String> body = {
      'login': login,
      'password': password,
    };

    try {
      // Fazendo a solicitação POST para o servidor
      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      print("Response body: ${response.statusCode}");

      // Verifica se a solicitação foi bem-sucedida (código de status 200)
      if (response.statusCode == 200) {
        
        // Analisa a resposta JSON
        Map<String, dynamic> responseData = json.decode(response.body);
        print("Success: $responseData");
        print(responseData['token']);

        // Verifica se o login foi bem-sucedido na resposta
        String success = responseData[''];

      
        return success; // Retorna o valor de sucesso
      } else {
        // Se a solicitação falhar com outro código de status, você pode lidar com isso aqui, como lançar uma exceção ou retornar false
        print("Erro de solicitação: ${response.statusCode}");
        return "false";
      }
    } catch (e) {
      // Se ocorrer um erro durante a solicitação, você pode lidar com isso aqui, como lançar uma exceção ou retornar false
      print('Erro ao fazer login: $e');
      return 'false';
    }

  }
}

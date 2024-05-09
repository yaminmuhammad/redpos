import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:redpos/data/models/response/auth_response_model.dart';

class AuthRemoteDataSource {
  Future<Either<String, AuthResponseModel>> login(
      String username, String password) async {
    final url = Uri.parse('https://sbi-pos.ptsiu.id/auth/sign-in');
    final response = await http.post(
      url,
      body: {
        'username': username,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return Left('Failed to Login');
    }
  }
}

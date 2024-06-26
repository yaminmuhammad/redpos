import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:redpos/data/datasource/auth_local_datasource.dart';
import 'package:redpos/data/models/response/auth_response_model.dart';
import 'package:redpos/core/constants/variable.dart';

class AuthRemoteDataSource {
  // Login
  Future<Either<String, AuthResponseModel>> login(
      String username, String password) async {
    final url = Uri.parse('${Variables.baseUrl}/auth/sign-in');
    final response = await http.post(
      url,
      headers: {
        'X-Requested-With': 'XMLHttpRequest',
      },
      body: {
        'username': username,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to Login');
    }
  }

  // Logout
  Future<Either<String, bool>> logout() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/logout');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${authData.token}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return const Right(true);
    } else {
      return const Left('Failed to logout');
    }
  }
}

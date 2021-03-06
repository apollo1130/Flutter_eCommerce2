import 'package:chopper/chopper.dart';
import 'package:ecommers/core/app_services/auth_response.dart';
import 'package:ecommers/core/models/login_model.dart';
import 'package:ecommers/core/models/user_model.dart';
import 'package:ecommers/core/services/index.dart';

class AuthorizationService {
  Future<bool> tryLogin(String username, String password) async {
    final userJson = UserModel(username, null, password).toJson();

    final Response<LoginModel> response = await apiService.login(userJson);

    if (response.isSuccessful) {
      membershipService.refresh(response.body);
    }

    return response.isSuccessful;
  }

  Future<AuthResponse> tryAuthorize(
      String username, String email, String password) async {
    final userJson = UserModel(username, email, password).toJson();
    final Response<LoginModel> response = await apiService.auth(userJson);

    if (response.isSuccessful) {
      membershipService.refresh(response.body);

      return AuthResponse(isSuccessful: response.isSuccessful);
    }

    return AuthResponse(
        isSuccessful: response.isSuccessful, error: response.bodyString);
  }

  Future logOut() async {
    await membershipService.clear();
  }
}

import 'package:get/get.dart';

// User 모델 정의
class User {
  final String name;
  final String email;
  final String loginType; // google or naver

  User({required this.name, required this.email, required this.loginType});
}

// AuthController 정의
class AuthController extends GetxController {
  var user = Rxn<User>();

  void setUser(User? user) {
    this.user.value = user;
    print(this.user.value!.name);
    print(this.user.value!.email);
    print(this.user.value!.loginType);
  }

  void clearUser() {
    this.user.value = null;
  }
}
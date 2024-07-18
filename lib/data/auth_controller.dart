import 'package:get/get.dart';

// User 모델 정의
class User {
  final String name;
  final String email;
  final String loginType; // google or naver
  List<String>? selectedTypes; // 선택된 관심사 종류
  List<String>? selectedPeriods; // 선택된 기간
  String? selectedCity; // 선택된 도시

  User({
    required this.name,
    required this.email,
    required this.loginType,
    this.selectedTypes,
    this.selectedPeriods,
    this.selectedCity,
  });
}

// AuthController 정의
class AuthController extends GetxController {
  var user = Rxn<User>();

  void setUser(User? user) {
    this.user.value = user;
    if (user != null) {
      print(this.user.value!.name);
      print(this.user.value!.email);
      print(this.user.value!.loginType);
    }
  }

  void clearUser() {
    this.user.value = null;
  }

  // 관심사, 기간, 도시 정보 갱신 함수
  void updateUserInterests(List<String> types, List<String> periods, String city) {
    if (user.value != null) {
      user.value = User(
        name: user.value!.name,
        email: user.value!.email,
        loginType: user.value!.loginType,
        selectedTypes: types,
        selectedPeriods: periods,
        selectedCity: city,
      );
      print('Updated interests: ${user.value!.selectedTypes}, ${user.value!.selectedPeriods}, ${user.value!.selectedCity}');
    }
  }
}

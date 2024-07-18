import 'package:docent/commons/color_pallet.dart';
import 'package:docent/data/auth_controller.dart';
import 'package:docent/screen/OAuth/interest_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';


class SignInScreen extends StatefulWidget {
  @override
  State createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  NaverAccessToken? _naverAccessToken;
  NaverLoginResult? _naverLoginResult;

  final AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      if (account != null) {
        authController.setUser(
          User(
            name: account.displayName ?? '',
            email: account.email,
            loginType: 'google',
          ),
        );
      } else {
        authController.clearUser();
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleGoogleSignIn() async {
    try {
      await _googleSignIn.signIn();
      // 로그인 성공 시 InterestSelectionScreen으로 라우팅
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InterestSelectionScreen()),
      );
    } catch (error) {
      print('Sign in failed: $error');
    }
  }

  Future<void> _handleGoogleSignOut() async {
    try {
      await _googleSignIn.disconnect();
      authController.clearUser();
    } catch (error) {
      print('Sign out failed: $error');
    }
  }

  Future<void> _handleNaverSignIn() async {
    try {
      _naverLoginResult = await FlutterNaverLogin.logIn();
      if (_naverLoginResult?.status == NaverLoginStatus.loggedIn) {
        _naverAccessToken = await FlutterNaverLogin.currentAccessToken;
        authController.setUser(
          User(
            name: _naverLoginResult?.account.name ?? '',
            email: _naverLoginResult?.account.email ?? '',
            loginType: 'naver',
          ),
        );
        // 로그인 성공 시 InterestSelectionScreen으로 라우팅
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InterestSelectionScreen()),
        );
      }
    } catch (error) {
      print('Naver Sign-In failed: $error');
    }
  }

  Future<void> _handleNaverSignOut() async {
    try {
      await FlutterNaverLogin.logOut();
      authController.clearUser();
      setState(() {
        _naverAccessToken = null;
        _naverLoginResult = null;
      });
    } catch (error) {
      print('Naver Sign-Out failed: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorPallet colorPallet = ColorPallet();
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '로그인',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Obx(() {
          final user = authController.user.value;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // if (user != null) ...[
              //   ListTile(
              //     leading: user.loginType == 'google'
              //         ? GoogleUserCircleAvatar(identity: _googleSignIn.currentUser!)
              //         : CircleAvatar(
              //       backgroundImage: NetworkImage(_naverLoginResult?.account.profileImage ?? ''),
              //     ),
              //     title: Text(user.name),
              //     subtitle: Text(user.email),
              //   ),
              //   const SizedBox(height: 20),
              //   ElevatedButton(
              //     onPressed: user.loginType == 'google' ? _handleGoogleSignOut : _handleNaverSignOut,
              //     child: Text(user.loginType == 'google' ? 'Sign Out' : 'Sign Out from Naver'),
              //   ),
              // ] else ...[
                Text(
                  '로그인으로 나만의\nAI 도슨트의 추천을 받아요!',
                  style: TextStyle(
                    fontSize: 20,
                    color: colorPallet.gray_82
                  ),
                ),
                SizedBox(height: height * 0.12),
                // Google Login
                Container(
                  width: width * 0.7,
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      side: BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: EdgeInsets.all(12.0),
                    ),
                    onPressed: _handleGoogleSignIn,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "lib/assets/images/google_logo.png",
                          width: 34,
                        ),
                        SizedBox(width: width * 0.02),
                        Text(
                          'Sign In with Google',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Naver Login
                GestureDetector(
                  onTap: _handleNaverSignIn,
                  child: Image.asset(
                    'lib/assets/images/naver_logo.png',
                    width: width * 0.7,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "이용약관",
                        style: TextStyle(fontSize: 12, color: colorPallet.gray_82),
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Text(
                        "개인정보처리방침",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: height*0.2,)
              ],
            // ],
          );
        }),
      ),
    );
  }
}
import 'package:docent/commons/color_pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInDemo extends StatefulWidget {
  @override
  State createState() => SignInDemoState();
}

class SignInDemoState extends State<SignInDemo> {
  GoogleSignInAccount? _currentUser;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  NaverAccessToken? _naverAccessToken;
  NaverLoginResult? _naverLoginResult;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleGoogleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print('Sign in failed: $error');
    }
  }

  Future<void> _handleGoogleSignOut() async {
    try {
      if (_currentUser != null) {
        await _googleSignIn.disconnect();
      }
    } catch (error) {
      print('Sign out failed: $error');
    }
  }

  Future<void> _handleNaverSignIn() async {
    try {
      _naverLoginResult = await FlutterNaverLogin.logIn();
      if (_naverLoginResult?.status == NaverLoginStatus.loggedIn) {
        _naverAccessToken = await FlutterNaverLogin.currentAccessToken;
      }
      setState(() {});
    } catch (error) {
      print('Naver Sign-In failed: $error');
    }
  }

  Future<void> _handleNaverSignOut() async {
    try {
      await FlutterNaverLogin.logOut();
      setState(() {
        _naverAccessToken = null;
        _naverLoginResult = null;
      });
    } catch (error) {
      print('Naver Sign-Out failed: $error');
    }
  }

  // Future<void> _handleKakaoSignIn() async {
  //   try {
  //     _naverLoginResult = await FlutterNaverLogin.logIn();
  //     if (_naverLoginResult?.status == NaverLoginStatus.loggedIn) {
  //       _naverAccessToken = await FlutterNaverLogin.currentAccessToken;
  //     }
  //     setState(() {});
  //   } catch (error) {
  //     print('Naver Sign-In failed: $error');
  //   }
  // }
  //
  // Future<void> _handleKakaoSignOut() async {
  //   try {
  //     await FlutterNaverLogin.logOut();
  //     setState(() {
  //       _naverAccessToken = null;
  //       _naverLoginResult = null;
  //     });
  //   } catch (error) {
  //     print('Naver Sign-Out failed: $error');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    ColorPallet colorPallet = ColorPallet();
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    GoogleSignInAccount? user = _currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('로그인',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (user != null) ...[
              ListTile(
                leading: GoogleUserCircleAvatar(
                  identity: user,
                ),
                title: Text(user.displayName ?? ''),
                subtitle: Text(user.email),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _handleGoogleSignOut,
                child: const Text('Sign Out'),
              ),
            ]
            else if (_naverLoginResult != null &&
                _naverLoginResult?.status == NaverLoginStatus.loggedIn) ...[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      _naverLoginResult?.account.profileImage ?? ''),
                ),
                title: Text(_naverLoginResult?.account.name ?? ''),
                subtitle: Text(_naverLoginResult?.account.email ?? ''),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _handleNaverSignOut,
                child: const Text('Sign Out from Naver'),
              ),
            ] else ...[
              const Text(
                '로그인으로 나만의\nAI 도슨트의 추천을 받아요!',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
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
                      Image.asset("lib/assets/images/google_logo.png",
                        width: 34,
                      ),
                      SizedBox(width: width * 0.02),
                      Text('Sign In with Google',
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
              // Kakao Login
              // GestureDetector(
              //   onTap: _handleKakaoSignIn,
              //   child: Image.asset(
              //     'lib/assets/images/kakao_logo.png',
              //     width: width * 0.7,
              //   ),
              // ),
              Row(
                children: [
                  Text(
                    "이용약관",
                    style: TextStyle(
                      fontSize: 12,
                      color: colorPallet.gray_82
                    ),
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
              )
            ],
          ],
        ),
      ),
    );
  }
}

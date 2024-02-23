import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:http/http.dart' as http;

class SceneLogin extends StatefulWidget {
  const SceneLogin({super.key});

  @override
  State<SceneLogin> createState() => _SceneLoginState();
}

class _SceneLoginState extends State<SceneLogin> {
  bool isLogined = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100.0),
            const Text(
              'WOWBOX',
              style: TextStyle(
                fontSize: 30.0,
                color: Color(0xFF007BFF),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30.0),
            const Text(
              '간편하게 로그인해서\nWOWBOX를 즐겨보세요',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 50.0),
            GestureDetector(
              onTap: () {
                // print("test");
                signinKakao();
              },
              child: const Image(
                image: AssetImage('assets/kakao_login_medium_wide.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signinKakao() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();

      print("Is Installed : " + isInstalled.toString());
      print(await KakaoSdk.origin);

      OAuthToken token = isInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();

      final url = Uri.https('kapi.kakao.com', '/v2/user/me');

      final response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}'
        },
      );

      final profileInfo = json.decode(response.body);
      print(profileInfo.toString());

      // 사용자 정보 가져오기
      User user = await UserApi.instance.me();
      print('사용자 정보 요청 성공'
          '\n회원: ${user}'
          );


      // 사용자 배송지 정보 가져오기
      // UserShippingAddresses userShippingAddress;
      // try {
      //   userShippingAddress = await UserApi.instance.shippingAddresses();
      // } catch (error) {
      //   print('배송지 조회 실패 $error');
      //   return;
      // }

      // // 사용자의 배송지 정보 동의항목 동의 여부에 따라 응답 처리
      // if (userShippingAddress.shippingAddresses != null) {
      //   print('배송지 조회 성공'
      //       '\n회원번호: ${userShippingAddress.userId}'
      //       '\n배송지: \n${userShippingAddress.shippingAddresses?.join('\n')}');
      // } else if (!userShippingAddress.needsAgreement) {
      //   print('사용자 카카오계정에 배송지 정보 없음'
      //       '배송지 정보가 꼭 필요하다면 동의항목 설정에서 수집 후 제공 기능을 활성화 해 보세요.');
      // } else if (userShippingAddress.needsAgreement) {
      //   print('사용자에게 배송지 제공 동의를 받아야 합니다');
      //
      //   // 배송지 동의항목의 ID
      //   List<String> scopes = ['shipping_address'];
      //
      //   // 사용자에게 배송지 정보 제공을 위한 동의 요청
      //   OAuthToken token;
      //   try {
      //     token = await UserApi.instance.loginWithNewScopes(scopes);
      //     print('사용자가 동의한 동의항목: ${token.scopes}');
      //   } catch (error) {
      //     print('배송지 정보 동의 요청 실패 $error');
      //   }
      //
      //   // 사용자 동의 후 다시 배송지 정보 가져오기
      //   try {
      //     UserShippingAddresses userShippingAddresses =
      //     await UserApi.instance.shippingAddresses();
      //     print('배송지 조회 성공'
      //         '\n회원번호: ${userShippingAddresses.userId}'
      //         '\n${userShippingAddresses.shippingAddresses?.join('\n')}');
      //   } catch (error) {
      //     print('배송지 조회 실패 $error');
      //   }
      // }




      setState(() {
        isLogined = true;
      });

    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');
    }
  }
}

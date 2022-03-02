import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/services.dart'; //메서드 채널을 사용하기 위하여
import 'sendDataExample.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        home: CupertinoNativeApp(),
      );
    } else {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SendDataExample(),
      );
    }
  }
}

class CupertinoNativeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NativeApp();
  }
}

class NativeApp extends StatefulWidget {
  @override
  _NativeApp createState() => _NativeApp();
}

class _NativeApp extends State<NativeApp> {
  static const platform = const MethodChannel(
      'com.flutter.dev/info'); //괄호 안의 문자열은 어떤 통신을 할 것인지를 구분하는 키값
  String _deviceInfo = 'Unknown info'; //안드로이드에서 전달받은 기기 정보를 저장하는데 사용

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Native 통신 예제'),
      ),
      body: Container(
        child: Center(
          child: Text(
            _deviceInfo,
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getDeviceInfo();
        },
        child: Icon(Icons.get_app),
      ),
    );
  }

  Future<void> _getDeviceInfo() async {
    String deviceInfo;
    try {
      final String result = await platform.invokeMethod(
          'getDeviceInfo'); //메서드 채널로 연결된 안드로이드에서 네이티브 API를 호출, getDeviceInfo는 안드로이드 네이티브 소스에서 호출할 함수 이름
      deviceInfo = 'Device info : $result';
    } on PlatformException catch (e) {
      deviceInfo = 'Failed to get Device info: ${e.message}.';
    }
    setState(() {
      _deviceInfo = deviceInfo;
    });
  }
}

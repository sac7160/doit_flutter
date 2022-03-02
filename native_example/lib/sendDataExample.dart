import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SendDataExample extends StatefulWidget {
  @override
  _SendDataExampleState createState() => _SendDataExampleState();
}

class _SendDataExampleState extends State<SendDataExample> {
  static const platform = const MethodChannel('com.flutter.dev/encrypto');

  TextEditingController controller = new TextEditingController();
  String _changeText = 'Nothing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Data Example'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: controller,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                _changeText,
                style: TextStyle(fontSize: 20),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _sendData(controller.value.text);
        },
        child: Text('변환'),
      ),
    );
  }

  Future<void> _sendData(String text) async {
    final String result = await platform.invokeMethod('getEncrypto', text);
    print(result);
    setState(() {
      _changeText = result;
    });
  }
}

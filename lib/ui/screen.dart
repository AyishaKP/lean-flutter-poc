import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lean_poc/ui/webview.dart';

class LeanPOC extends StatefulWidget {
  const LeanPOC({Key? key}) : super(key: key);

  @override
  _LeanPOCState createState() => _LeanPOCState();
}

class _LeanPOCState extends State<LeanPOC> {
  final platform = MethodChannel('samples.flutter.dev/lean');
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    String fullName = '';
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter - LeanPOC'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your Amount',
                    ),
                  )),
              Container(
                margin: EdgeInsets.all(20),
                child: Text(fullName),
              ),
              Container(
                color: Colors.amberAccent,
                margin: EdgeInsets.all(25),
                child: TextButton(
                  child: Text(
                    "SUBMIT",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return Scaffold(
                            appBar: AppBar(
                              title: Text('Lean'),
                              leading: IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            body: WebView(
                              onWebViewCreated: (controller) {
                                controller.loadUrl('https://www.google.com');
                              },
                            ),
                          );
                        },
                      ),
                    );

                    print('I got tapped');
                  },
                ),
              ),
              //  Text(_batteryLevel),
            ],
          ),
        ),
      ),
    );
  }

  // String _batteryLevel = 'Unknown battery level.';

  // Future<void> _getBatteryLevel() async {
  //   String batteryLevel;
  //   try {
  //     final int result = await platform.invokeMethod('getBatteryLevel');
  //     batteryLevel = 'Battery level at $result % .';
  //   } on PlatformException catch (e) {
  //     batteryLevel = "Failed to get battery level: '${e.message}'.";
  //   }

  //   setState(() {
  //     _batteryLevel = batteryLevel;
  //   });
  // }
}

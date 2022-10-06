import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:memory_matrix/data/constants.dart';

class MySettings extends StatefulWidget {
  const MySettings({Key? key}) : super(key: key);

  @override
  State<MySettings> createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackPressed(context),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 20,
            onPressed: () {
              onBackPressed(context);
            },
          ),
          centerTitle: true,
          title: Text('Settings', style: large_text,),
        ),
        body: Container(
          child: Center(
            child: Text(" Settings will come here still in development", style: small_text),
          ),
        ),
      ),
    );
  }
}

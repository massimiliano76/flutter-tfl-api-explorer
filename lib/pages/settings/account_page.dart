import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/tfl_api_state.dart';
import '../../widgets/text.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Consumer<TflApiState>(
        builder: (context, tflApi, child) {
          return ListView(
            children: <Widget>[
              ListTile(
                title: Text('App id'),
                subtitle: NullableText(tflApi.appId),
              ),
              ListTile(
                title: Text('App key'),
                subtitle: NullableText(tflApi.appKey),
              ),
            ],
          );
        },
      ),
    );
  }
}
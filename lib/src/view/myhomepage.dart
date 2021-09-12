import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_mobx/src/models/controller.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = Controller();

  @override
  Widget build(BuildContext context) {
    _textField({String labelText, onChanged, String Function() errorText}) {
      return TextField(
        decoration: InputDecoration(
          labelText: labelText,
          errorText: errorText == null ? null : errorText(),
          border: OutlineInputBorder(),
        ),
        onChanged: onChanged,
      );
    }

    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(builder: (_) {
              return _textField(
                labelText: "name",
                onChanged: controller.client.changeName,
                errorText: controller.validateName,
              );
            }),
            SizedBox(
              height: 20.0,
            ),
            Observer(builder: (_) {
              return _textField(
                labelText: "email",
                onChanged: controller.client.changeEmail,
                errorText: controller.validateEmail,
              );
            }),
            Observer(builder: (_) {
              return RaisedButton(
                onPressed: controller.isValid ? () {} : null,
                child: Text("Salvar"),
              );
            }),
          ],
        ));
  }
}

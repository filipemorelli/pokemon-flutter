import 'package:flutter/material.dart';

class SettingsSceen extends StatelessWidget {
  const SettingsSceen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
        centerTitle: true,
      ),
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Text("Configuraões"),
        ),
      ),
    );
  }
}

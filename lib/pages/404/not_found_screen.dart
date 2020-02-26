import 'package:flutter/material.dart';

class NotFoundScreen extends StatefulWidget {
  @override
  _NotFoundScreenState createState() => _NotFoundScreenState();
}

class _NotFoundScreenState extends State<NotFoundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página não encontrada."),
        centerTitle: true,
      ),
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Text("Página não encontrada"),
        ),
      ),
    );
  }
}

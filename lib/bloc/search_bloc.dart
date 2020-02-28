import 'dart:async';

import 'package:flutter/material.dart';

class SearchBloc {
  StreamController<AppBar> _streamController;
  AppBar _startAppBar;
  AppBar _searchAppBar;

  Stream<AppBar> get stream => _streamController.stream;

  SearchBloc({@required AppBar startAppBar, @required AppBar searchAppBar}) {
    _streamController = StreamController.broadcast();
    _startAppBar = startAppBar;
    _searchAppBar = searchAppBar;
  }

  setStartAppBar() => _streamController.sink.add(_startAppBar);

  setSearchppBar() => _streamController.sink.add(_searchAppBar);

  dispose() {
    _streamController.close();
  }
}

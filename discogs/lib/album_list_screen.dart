import 'package:discogs/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class AlbumListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Album List"),
          ),
          body: Container(),
        );
      },
    );
  }
}

class _ViewModel {

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel();
  }

}

import 'dart:async';

import 'package:cryptocurrencies_redux/app_state.dart';
import 'package:cryptocurrencies_redux/crypto/crypto.dart';
import 'package:cryptocurrencies_redux/crypto/cryptos_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class CrytosListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (context, vm) {
          return new _CryptosList(
            cryptos: vm.cryptos,
            onRefresh: vm.onRefresh
          );
        }
    );
  }
}

class _ViewModel {
  final List<Crypto> cryptos;
  final Function onRefresh;

  _ViewModel({
    this.cryptos,
    this.onRefresh
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(
      cryptos: store.state.cryptos,
      onRefresh: (completer) {
        store.dispatch(new CryptosLoadAction(completer: completer));
      }
    );
  }
}

class _CryptosList extends StatelessWidget {
  final List<Crypto> cryptos;
  final Function(Completer) onRefresh;

  _CryptosList({
    this.cryptos,
    this.onRefresh
  });

  Future<Null> _onRefresh() {
    var completer = new Completer();
    onRefresh(completer);
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    var _listViewBuilder = new ListView.builder(
      itemBuilder: _itemBuilder,
      itemCount: cryptos.length,
      itemExtent: 56.0,
    );

    var _refreshIndicator = new RefreshIndicator(
      child: _listViewBuilder,
      onRefresh: _onRefresh,
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Cryptocurrencies"),
      ),
      body: _refreshIndicator,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
//    if (index >= _cryptos.length - 5) {
//      _loadMore();
//    }
    return new Text(cryptos[index].name);
  }
}
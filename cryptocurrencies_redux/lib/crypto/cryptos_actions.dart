import 'dart:async';

import 'package:cryptocurrencies_redux/crypto/crypto.dart';

class CryptosLoadAction {
  Completer completer;

  CryptosLoadAction({
    this.completer
  });
}

class CryptosLoadedAction {
  List<Crypto> cryptos;

  CryptosLoadedAction(this.cryptos);

  @override
  String toString() {
    return 'CryptosLoadedAction{cryptos: $cryptos}';
  }
}

class CryptosNotLoadedAction {}
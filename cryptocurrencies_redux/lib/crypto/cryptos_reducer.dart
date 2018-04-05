import 'dart:async';

import 'package:cryptocurrencies_redux/app_state.dart';
import 'package:cryptocurrencies_redux/crypto/crypto.dart';
import 'package:cryptocurrencies_redux/crypto/cryptos_actions.dart';
import 'package:redux/redux.dart';

final cryptosReducer = combineTypedReducers<List<Crypto>>([
  new ReducerBinding<List<Crypto>, CryptosLoadedAction>(_setLoadedCryptos),
  new ReducerBinding<List<Crypto>, CryptosNotLoadedAction>(_setNotLoadedCryptos),
]);

List<Crypto> _setLoadedCryptos(List<Crypto> crypto, CryptosLoadedAction action) {
  return action.cryptos;
}

List<Crypto> _setNotLoadedCryptos(List<Crypto> crypto, CryptosNotLoadedAction action) {
  return [];
}


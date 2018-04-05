import 'dart:async';

import 'package:cryptocurrencies_redux/crypto/crypto.dart';

class AppState {
  final bool isLoading;
  final List<Crypto> cryptos;

  AppState({
    this.isLoading = false,
    this.cryptos = const [],
  });

  factory AppState.loading() => new AppState(isLoading: true);

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, cryptos: $cryptos}';
  }
}

import 'package:cryptocurrencies_redux/crypto/crypto.dart';

class CryptosLoadAction {}

class CryptosLoadedAction {
  List<Crypto> cryptos;

  CryptosLoadedAction(this.cryptos);

  @override
  String toString() {
    return 'CryptosLoadedAction{cryptos: $cryptos}';
  }
}

class CryptosNotLoadedAction {}
import 'package:cryptocurrencies_redux/app_state.dart';
import 'package:cryptocurrencies_redux/crypto/cryptos_reducer.dart';

AppState appReducer(AppState state, action) {
  return new AppState(
    cryptos: cryptosReducer(state.cryptos, action),
  );
}


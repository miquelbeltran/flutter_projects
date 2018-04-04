import 'package:cryptocurrencies_redux/app_state.dart';
import 'package:cryptocurrencies_redux/crypto/cryptos_actions.dart';
import 'package:cryptocurrencies_redux/crypto/cryptos_repository.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';


List<Middleware<AppState>> createStoreMiddleware() {
  final repository = new CryptosRepository();
  final loadCryptos = _createLoadCryptos(repository);

  var list = combineTypedMiddleware([
    new MiddlewareBinding<AppState, CryptosLoadAction>(loadCryptos),
  ]);
  list.add(new LoggingMiddleware.printer());

  return list;
}

Middleware<AppState> _createLoadCryptos(CryptosRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.getCryptos().then((cryptos) {
      store.dispatch(
          new CryptosLoadedAction(cryptos)
      );
      store.state.loadCompleter?.complete();
    }).catchError((error) {
      store.dispatch(new CryptosNotLoadedAction());
      print(error);
    });
    next(action);
  };
}
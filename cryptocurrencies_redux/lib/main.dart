import 'package:cryptocurrencies_redux/app_state.dart';
import 'package:cryptocurrencies_redux/app_state_reducer.dart';
import 'package:cryptocurrencies_redux/crypto/cryptos_actions.dart';
import 'package:cryptocurrencies_redux/home_screen.dart';
import 'package:cryptocurrencies_redux/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:cryptocurrencies_redux/store_middleware.dart';

void main() => runApp(new CryptoApp());

class CryptoApp extends StatelessWidget {

  final store = new Store<AppState>(
    appReducer,
    initialState: new AppState.loading(),
    middleware: createStoreMiddleware(),
  );

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: new MaterialApp(
          title: 'Crytocurrencies Redux Demo',
          theme: new ThemeData(
            primarySwatch: Colors.grey
          ),
          routes: {
            Routes.home: (context) {
              return new StoreBuilder<AppState>(
                onInit: (store) => store.dispatch(new CryptosLoadAction()),
                builder: (context, store) {
                  return new HomeScreen();
                },
              );
            }
          },
        ),
    );
  }
}


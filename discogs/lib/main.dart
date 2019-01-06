import 'package:discogs/album_list_screen.dart';
import 'package:discogs/app_state.dart';
import 'package:discogs/app_state_reducer.dart';
import 'package:discogs/routes.dart';
import 'package:discogs/store_middleware.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() => runApp(DiscogsApp());

class DiscogsApp extends StatelessWidget {
  final store = Store<AppState>(
    appStateReducer,
    initialState: AppState.init(),
    middleware: createStoreMiddleware(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Discogs App Demo',
        routes: {
          Routes.home : (context) {
            return StoreBuilder<AppState>(
              onInit: (store) => store.dispatch(StartLoadingPage()),
              builder: (context, store) {
                return AlbumListScreen();
              },
            );
          }
        },
      ),
    );
  }
}





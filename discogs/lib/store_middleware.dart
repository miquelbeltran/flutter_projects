
import 'package:discogs/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStoreMiddleware() {
  return [_loggingMiddleware];
}

_loggingMiddleware(Store<AppState> store, action, NextDispatcher next) {
  print('${new DateTime.now()}: $action');
  next(action);
}

//Middleware<AppState>
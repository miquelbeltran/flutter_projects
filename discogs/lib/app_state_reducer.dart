import 'package:discogs/app_state.dart';
import 'package:discogs/model.dart';
import 'package:redux/redux.dart';

class StartLoadingPage {
  int page;
}

class AddAlbumsToList {
  List<Album> list;
  int page;
}

AppState appStateReducer(AppState state, action) {
  return AppState(
    albumListState: albumListReducer(state.albumListState, action)
  );
}

final albumListReducer = combineReducers<AlbumListState>([
  TypedReducer<AlbumListState, StartLoadingPage>(_startLoadingPage),
  TypedReducer<AlbumListState, AddAlbumsToList>(_addAlbumsToList),
]);

AlbumListState _startLoadingPage(AlbumListState state, StartLoadingPage action) {
  return AlbumListState(isLoading: true, albums: state.albums, page: state.page);
}

AlbumListState _addAlbumsToList(AlbumListState state, AddAlbumsToList action) {
  return AlbumListState(isLoading: false, albums: state.albums + action.list, page: action.page);
}

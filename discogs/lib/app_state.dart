import 'package:discogs/model.dart';

class AppState {
  final AlbumListState albumListState;

  AppState({this.albumListState});

  factory AppState.init() => AppState(
        albumListState: AlbumListState(),
      );
}

class AlbumListState {
  final bool isLoading;
  final List<Album> albums;
  final int page;

  AlbumListState({
    this.isLoading = false,
    this.albums = const [],
    this.page = 0,
  });
}

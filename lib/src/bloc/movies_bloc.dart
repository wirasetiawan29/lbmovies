import 'package:lbmovie_app/src/models/item_model.dart';
import 'package:lbmovie_app/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _repository = Repository();
  final _movieFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allMovies => _movieFetcher.stream;

  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _movieFetcher.sink.add(itemModel);
  }

  dispose() {
    _movieFetcher.close();
  }
}

final bloc = MoviesBloc();
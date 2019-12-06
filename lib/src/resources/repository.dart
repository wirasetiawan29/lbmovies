import 'package:lbmovie_app/src/models/item_model.dart';
import 'package:lbmovie_app/src/resources/movie_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();
  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();
}
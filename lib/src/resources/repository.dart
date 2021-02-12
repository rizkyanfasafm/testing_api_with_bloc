import 'dart:async';
import 'movie_api_provider.dart';
import 'paket_api_provider.dart';
import '../models/item_model.dart';
import '../models/trailer_model.dart';
import '../models/paket_model.dart';

class Repository{
  final moviesApiProvider = MovieApiProvider();
  final paketApiProvider = PaketApiProvider();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();
  Future<TrailerModel> fetchTrailers(int movieId) => moviesApiProvider.fetchTrailer(movieId);
  Future<ListPaket> fetchPaket() => paketApiProvider.fetchPaketList();
}
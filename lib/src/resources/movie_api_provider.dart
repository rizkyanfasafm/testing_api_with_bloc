import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';
import '../models/trailer_model.dart';

class MovieApiProvider{
  Client client = Client();
  final _apiKey = '796a0c0809a548c4054accd51d8bd387';

  Future<ItemModel> fetchMovieList() async{
    final response = await client.get('http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey');
    if(response.statusCode == 200){
      return ItemModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load post');
    }
  }

  Future<TrailerModel> fetchTrailer(int movieId) async{
    final response = await client.get('https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$_apiKey');
    if(response.statusCode == 200){
      return TrailerModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load trailers');
    }
  }
}
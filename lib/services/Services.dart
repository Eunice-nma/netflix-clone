import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_clone/Models/NowPlayingModel.dart';
import 'package:netflix_clone/Models/PopularMoviesModel.dart';
import 'package:netflix_clone/Models/TvSeriesModel.dart';
import 'package:netflix_clone/Models/UpComingMoviesModel.dart';

class Api {
  var httpClient = http.Client();
  static const apiKey = "db8c29de96767df9c748f50d557a61df";
  static const url = "https://api.themoviedb.org/3";

  // ignore: missing_return
  Future<List<PopularMoviesModel>> fetchPopularMovies() async {
    final response =
        await http.get(Uri.parse('$url/movie/popular?api_key=$apiKey'));

    if (response.statusCode == 200) {
      // print(response);
      final parsed =
          json.decode(response.body)["results"].cast<Map<String, dynamic>>();

      return parsed
          .map<PopularMoviesModel>((json) => PopularMoviesModel.fromJson(json))
          .toList();
    } else {
      print(response.statusCode);
      throw Exception("Failed to load popular movies");
    }
  }

  Future<List<UpCommingMoviesModel>> fetchUpComingMovies() async {
    final response = await http.get(Uri.parse(
        '$url/movie/upcoming?api_key=$apiKey&language=en-US&page=10'));

    if (response.statusCode == 200) {
      final parsed =
          json.decode(response.body)["results"].cast<Map<String, dynamic>>();
      // print(response.statusCode);
      // print(parsed);
      return parsed
          .map<UpCommingMoviesModel>(
              (json) => UpCommingMoviesModel.fromJson(json))
          .toList();
    } else {
      print(response.statusCode);
      throw Exception("Failed to load popular movies");
    }
  }

  Future<List<NowPlayingModel>> fetchNowPlayingMovies() async {
    final response = await http.get(Uri.parse(
        '$url/movie/now_playing?api_key=$apiKey&language=en-US&page=4'));

    if (response.statusCode == 200) {
      final parsed =
          json.decode(response.body)["results"].cast<Map<String, dynamic>>();
      
      return parsed
          .map<NowPlayingModel>((json) => NowPlayingModel.fromJson(json))
          .toList();
    } else {
      print(response.statusCode);
      throw Exception("Failed to load popular movies");
    }
  }

  Future<List<TvSeriesModel>> fetchTvSeriesMovies() async {
    final response = await http.get(
        Uri.parse('$url/tv/popular?api_key=$apiKey&language=en-US&page=1'));

    if (response.statusCode == 200) {
      final parsed =
          json.decode(response.body)["results"].cast<Map<String, dynamic>>();
      print(response.statusCode);
   
      return parsed
          .map<TvSeriesModel>((json) => TvSeriesModel.fromJson(json))
          .toList();
    } else {
      print(response.statusCode);
      throw Exception("Failed to load popular movies");
    }
  }
}

import 'dart:convert';
import 'package:ebmrox_3version/tv_show/repository/model/tv_show_model.dart';
import 'package:http/http.dart' as http;

class ShowRepository {
  final String baseURL = "https://api.tvmaze.com/";

  Future<List<TVShowModel>> searchShows(String query) async {
    final response =
        await http.get(Uri.parse(baseURL + 'search/shows?q=$query'));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List;
      final shows = body.map((e) => TVShowModel.fromJson(e)).toList();
      return shows;
    } else {
      throw Exception('Failed to load TV shows');
    }
  }
}

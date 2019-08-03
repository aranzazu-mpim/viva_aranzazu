import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:viva_aranzazu/data/model/search/model_search.dart';

class AranzazuDataSource {
  final http.Client client;
  final String _searchBaseUrl =
      'http://aranzazushrine.ph/home/index.php/wp-json/capie/v1/search/news?';

  AranzazuDataSource(this.client);

  Future<AranzazuSearchResult> searchArticles({String query, int index}) async {
    final urlRaw = _searchBaseUrl + '?q=$query' + '&page=$index';
    final urlEncoded = Uri.encodeFull(urlRaw);

    final response = await client.get(urlEncoded);

    if (response.statusCode == 200) {
      return AranzazuSearchResult.fromJson(response.body);
    } else {
      throw AranzazuSearchError(json.decode(response.body)['message']);
    }
  }
}

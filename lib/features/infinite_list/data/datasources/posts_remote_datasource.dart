import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/errors/exceptions.dart';
import '../models/raw_posts.dart';

abstract class IPostsRemoteDataSource {
  Future<List<RawPost>> fetchPosts({int? start, int? limit});
}

/// Fetches posts from remote API.
///
/// Example api:
/// `https://jsonplaceholder.typicode.com/posts?_start=0&_limit=2`.
class PostsRemoteDataSource implements IPostsRemoteDataSource {
  PostsRemoteDataSource(this._client);

  final http.Client _client;

  static const _baseUrl = 'jsonplaceholder.typicode.com';

  @override
  Future<List<RawPost>> fetchPosts({
    int? start,
    int? limit,
  }) async {
    final queryParam = <String, String>{};
    if (start != null) {
      queryParam['_start'] = start.toString();
    }
    if (limit != null) {
      queryParam['_limit'] = limit.toString();
    }

    final Uri uri;
    if (queryParam.isEmpty) {
      uri = Uri.https(_baseUrl, 'posts');
    } else {
      uri = Uri.https(_baseUrl, 'posts', queryParam);
    }

    try {
      final res = await _client.get(uri);
      return List<RawPost>.from(
          jsonDecode(res.body).map((model) => RawPost.fromJson(model)));
    } on Exception {
      throw ServerException();
    }
  }
}

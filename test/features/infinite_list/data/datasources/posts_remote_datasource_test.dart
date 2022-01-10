import 'dart:convert';

import 'package:clean_list/core/errors/exceptions.dart';
import 'package:clean_list/features/infinite_list/data/datasources/posts_remote_datasource.dart';
import 'package:clean_list/features/infinite_list/data/models/raw_posts.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'posts_remote_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  final mockClient = MockClient();
  final dataSource = PostsRemoteDataSource(mockClient);

  void setUpMockHttpClientSuccess200() {
    when(mockClient.get(any))
        .thenAnswer((_) async => http.Response(fixture('posts.json'), 200));
  }

  void setUpMockHttpClientFailure() {
    when(mockClient.get(any)).thenThrow(Exception());
  }

  group('fetchPosts', () {
    test(
      'should perform a GET request on a URL without any paramters',
      () async {
        setUpMockHttpClientSuccess200();

        dataSource.fetchPosts();

        verify(
          mockClient.get(
            Uri.https('jsonplaceholder.typicode.com', 'posts'),
          ),
        );
      },
    );

    test(
      'should perform a GET request on a URL with paramters',
      () async {
        const start = 0;
        const limit = 2;
        setUpMockHttpClientSuccess200();
        final Map<String, dynamic> queryParam = {
          '_start': start.toString(),
          '_limit': limit.toString(),
        };

        dataSource.fetchPosts(limit: limit, start: start);

        verify(
          mockClient.get(
            Uri.https('jsonplaceholder.typicode.com', 'posts', queryParam),
          ),
        );
      },
    );

    test(
      'should return list of RawPosts when the response code is 200 (success)',
      () async {
        setUpMockHttpClientSuccess200();
        final List<RawPost> rawPosts = List.from(
          jsonDecode(fixture('posts.json')).map((e) => RawPost.fromJson(e)),
        );

        final result = await dataSource.fetchPosts();

        expect(result, equals(rawPosts));
      },
    );

    test(
      'should throw a ServerException when the Exception is thrown',
      () async {
        setUpMockHttpClientFailure();

        final call = dataSource.fetchPosts;

        await expectLater(call, throwsA(isA<ServerException>()));
      },
    );
  });
}

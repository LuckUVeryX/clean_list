import 'dart:convert';

import 'package:clean_list/features/infinite_list/data/models/raw_posts.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  group('RawPosts', () {
    const RawPost tRawPosts =
        RawPost(userId: 1, id: 1, title: 'title text', body: 'body text');

    test('fromJson should return a valid model from posts JSON', () {
      final Map<String, dynamic> jsonMap = jsonDecode(fixture('post.json'));
      // act
      final result = RawPost.fromJson(jsonMap);
      // assert
      expect(result, tRawPosts);
    });

    test('toJson should return a JSON map containing the proper data', () {
      final res = tRawPosts.toJson();

      final expectedMap = {
        'userId': 1,
        'id': 1,
        'title': 'title text',
        'body': 'body text'
      };

      expect(res, expectedMap);
    });
  });
}

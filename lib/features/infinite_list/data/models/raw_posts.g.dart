// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raw_posts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RawPost _$RawPostFromJson(Map<String, dynamic> json) => RawPost(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$RawPostToJson(RawPost instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };

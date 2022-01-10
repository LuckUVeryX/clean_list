import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'raw_posts.g.dart';

@JsonSerializable()
class RawPost extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  const RawPost({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory RawPost.fromJson(Map<String, dynamic> json) =>
      _$RawPostFromJson(json);

  Map<String, dynamic> toJson() => _$RawPostToJson(this);

  @override
  List<Object?> get props => [userId, id, title, body];
}

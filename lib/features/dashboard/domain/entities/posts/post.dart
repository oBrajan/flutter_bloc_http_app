import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int created_time;
  final String post_text;
  final List<String> locations;
  final List<String> languages;
  final String author_name;

  Post(
      {this.created_time,
      this.post_text,
      this.locations,
      this.languages,
      this.author_name});

  @override
  List<Object> get props => [
        created_time,
        post_text,
        locations,
        languages,
        author_name,
      ];
}

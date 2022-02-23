import 'package:easy2know_flutter/features/dashboard/data/models/posts/posts_response.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/posts/post.dart';

List<Post> mapResponseToPost(PostsResponse response) {
  List<Post> list = new List<Post>();

  response.data.forEach((element) {
    list.add(Post(
      created_time: element.created_time,
      post_text: element.post_text,
      locations: element.locations,
      languages: element.languages,
      author_name: element.author_name,
    ));
  });

  return list;
}

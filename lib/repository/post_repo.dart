import 'package:flutter_bloc_app/model/post_model.dart';

abstract class PostRepo {
  Future<List<PostModel>> getAllPost();
}
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_app/model/post_model.dart';
import 'package:flutter_bloc_app/repository/post_repo.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepo postRepo;
  List<PostModel>? posts;

  PostBloc(this.postRepo) : super(PostInitial());

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
   if(event is GetPostEvent){
     yield PostLoading();
     try{
       posts = await postRepo.getAllPost();
       print(posts);
       yield PostLoaded(posts: posts!);
     }catch(ex){
       print(ex);
       yield PostError();
     }
   }

  }
}

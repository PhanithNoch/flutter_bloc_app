import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/post_bloc.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: BlocBuilder<PostBloc,PostState>(

        builder: (BuildContext context, state) {
          if(state is PostLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is PostLoaded){
            return ListView.builder(
              itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    title: Text(state.posts[index].title!),
                    subtitle: Text(state.posts[index].body!),
                  ),
                );
              },
            );
          }
          return Center(child: Text("Error"),);
        },

      )
    );
  }
}

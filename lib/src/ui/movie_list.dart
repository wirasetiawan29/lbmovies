import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lbmovie_app/src/bloc/movies_bloc.dart';
import 'package:lbmovie_app/src/models/item_model.dart';

class MovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieListState();
  }
}

class MovieListState extends State<MovieList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGBOOK MOVIES', style: TextStyle(fontFamily: 'RobotoMono'),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: (){
              bloc.fetchAllMovies();
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  /*
    StreamBuilder<T>(
      key: ...optional, the unique ID of this Widget...
      stream: ...the stream to listen to...
      initialData: ...any initial data, in case the stream would initially be empty...
      builder: (BuildContext context, AsyncSnapshot<T> snapshot){
          if (snapshot.hasData){
              return ...the Widget to be built based on snapshot.data
          }
          return ...the Widget to be built if no data is available
      },
    )
  */

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data.results.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        return GridTile(
          child: InkResponse(
            enableFeedback: true,
            child: Image.network(
              'https://image.tmdb.org/t/p/w185${snapshot.data
                  .results[index].poster_path}',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }



}

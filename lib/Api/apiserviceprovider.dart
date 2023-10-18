
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/Api/api.dart';
import 'package:movieapp/modelclass/castindividual.dart';
import 'package:movieapp/modelclass/castmoviemodel.dart';
import 'package:movieapp/modelclass/detailmovie.dart';
import 'package:movieapp/modelclass/modelclass.dart';

final apiServiceprovider = Provider((ref) => ApiService());
final getpostprovider =
    FutureProvider((ref) => ref.read(apiServiceprovider).getPosts());
final getTrendingprovider =
    FutureProvider((ref) => ref.read(apiServiceprovider).getTrendingMovies());

final getNowplayingprovider =
    FutureProvider((ref) => ref.read(apiServiceprovider).getNowplaying());

final castmovieProvider =
    FutureProvider.family<CastMovieModel?, int>((ref, movieid) {
  return ref.watch(apiServiceprovider).getCasting(movieid);
});
final detailmovieProvider =
    FutureProvider.family<DetailMovieModel?, int>((ref, movie_id) {
  return ref.watch(apiServiceprovider).getdetail(movie_id);
});
final castDetailsprovider =
    FutureProvider.family<Castindividual?, int>((ref, cast_id) {
  return ref.watch(apiServiceprovider).getcastDetails(cast_id);
});

final getsearchcontent = StateProvider<String>((ref) {
  return '';
});
final searchprovider = FutureProvider<MovieModel?>((ref) async {
  return ref
      .watch(apiServiceprovider)
      .getSearchDetails(ref.watch(getsearchcontent));
});

final gettvprovider =
    FutureProvider((ref) => ref.read(apiServiceprovider).gettvtoprated());

class Moviekey {
  static String imagew500 = "https://image.tmdb.org/t/p/w500/";
}

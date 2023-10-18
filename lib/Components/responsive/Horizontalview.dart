import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/Components/responsive/detailtmdb.dart';
import 'package:movieapp/Components/responsive/responsivenss.dart';
// import 'package:movieapp/modelclass/castmoviemodel.dart';
// import 'package:movieapp/view/details.dart';

import '../../modelclass/modelclass.dart';

class Horizontal extends StatelessWidget {
  const Horizontal({
    // final String ;
    required this.results,
    super.key,
  });

  final List<Result> results;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveSize.width(200, context),
      child: ListView.builder(
        itemCount: results.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                ResponsiveSize.width(10, context),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailTmdb(movie_id: results[index].id!),
                      ));
                },
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailTmdb(
                                  movie_id: results[index].id!,
                                )));
                  },
                  child: Container(
                    width: ResponsiveSize.width(150, context),
                    // height: ResponsiveSize.width(100, context),
                    color: const Color.fromARGB(255, 180, 29, 29),
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://image.tmdb.org/t/p/w500${results[index].backdropPath!}",
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => const Text('error'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

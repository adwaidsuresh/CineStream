import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:movieapp/Api/api.dart';
import 'package:movieapp/Api/apiserviceprovider.dart';
// import 'package:movieapp/Components/responsive/casts.dart';
import 'package:movieapp/Components/responsive/detailtmdb.dart';
import 'package:movieapp/Components/responsive/responsivenss.dart';
import 'package:movieapp/modelclass/modelclass.dart';
// import 'package:movieapp/view/castdetails.dart';

ListView searchmethod(MovieModel? data) {
  return ListView.separated(
    separatorBuilder: (context, index) {
      return SizedBox(
        height: ResponsiveSize.width(20, context),
      );
    },
    physics: const ClampingScrollPhysics(),
    itemCount: data!.results!.length,
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return Container(
        color: const Color.fromARGB(255, 14, 13, 13),
        child: Column(
          children: [
            data.results![index].backdropPath != null
                ? InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailTmdb(movie_id: data.results![index].id!),
                          ));
                    },
                    child: Container(
                        width: ResponsiveSize.width(300, context),
                        // height: ResponsiveSize.width(350, context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                ResponsiveSize.width(10, context)),
                            image: const DecorationImage(
                                image: AssetImage('assets/images/9.jpg'),
                                fit: BoxFit.fill)),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  ResponsiveSize.width(10, context))),
                              child: CachedNetworkImage(
                                errorWidget: (context, url, error) =>
                                    const Text('error'),
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                imageUrl: Moviekey.imagew500 +
                                    data.results![index].backdropPath!,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              height: ResponsiveSize.width(10, context),
                            ),
                            Text(
                              data.results![index].originalTitle!,
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              data.results![index].releaseDate.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text('VoteAverage:',
                                    style: TextStyle(color: Colors.white)),
                                Text(data.results![index].popularity.toString(),
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 237, 6, 6),
                                        fontWeight: FontWeight.w800)),
                                const Text('Popularity:',
                                    style: TextStyle(color: Colors.white)),
                                Text(
                                    data.results![index].voteAverage.toString(),
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 235, 8, 8),
                                        fontWeight: FontWeight.w800)),
                              ],
                            )
                          ],
                        )),
                  )
                : const Icon(Icons.error)
          ],
        ),
      );
    },
  );
}

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/Components/responsive/casts.dart';
import 'package:movieapp/Components/responsive/responsivenss.dart';
import 'package:movieapp/modelclass/modelclass.dart';
import 'package:percent_indicator/percent_indicator.dart';
// import '../Api/api.dart';

class Details extends ConsumerWidget {
  const Details({
    super.key,
    required this.data,
  });

  final Result data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final api = ref.watch(getpostprovider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 157, 134, 134),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  Positioned(
                      top: ResponsiveSize.width(10, context),
                      child: CircularPercentIndicator(
                        radius: ResponsiveSize.width(20, context),
                        backgroundColor:
                            const Color.fromARGB(255, 243, 237, 237),
                        center: Text(
                          data.voteAverage.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        curve: Curves.bounceInOut,
                        percent: ResponsiveSize.width(.56, context),
                        lineWidth: ResponsiveSize.width(.8, context),
                      )),
                  Container(
                    width: ResponsiveSize.width(300, context),
                    height: ResponsiveSize.width(350, context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            ResponsiveSize.width(120, context),
                          ),
                        ),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500${data.posterPath!}'),
                            fit: BoxFit.cover),
                        color: Colors.green),
                  ),
                ],
              ),
            ),
            Text(data.title!,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ResponsiveSize.width(20, context),
                    fontWeight: FontWeight.w600)),
            Text(
              data.overview!,
              style: const TextStyle(color: Colors.white),
            ),
            Text('popularity  ' + data.popularity.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ResponsiveSize.width(18, context),
                    fontWeight: FontWeight.w500)),
            SizedBox(
              height: ResponsiveSize.width(20, context),
            ),
            Cast(
              movieid: data.id!,
            )
          ],
        ),
      ),
    );
  }
}

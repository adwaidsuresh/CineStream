import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:movieapp/Api/api.dart';
import 'package:movieapp/Api/apiserviceprovider.dart';
import 'package:movieapp/Components/responsive/detailtmdb.dart';
import 'package:movieapp/Components/responsive/responsivenss.dart';
// import 'package:movieapp/modelclass/castmoviemodel.dart';

class Latest extends ConsumerWidget {
  const Latest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Now = ref.watch(getNowplayingprovider);
    return Now.when(
      data: (data) {
        if (data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return CarouselSlider.builder(
            itemCount: data.results!.length,
            itemBuilder: (context, index, realIndex) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailTmdb(movie_id: data.results![index].id!)));
                },
                child: Container(
                  width: ResponsiveSize.width(400, context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.greenAccent),
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500${data.results![index].backdropPath!}",
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
            options: CarouselOptions(
                aspectRatio: 5 / 2,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                autoPlayInterval: Duration(seconds: 2),
                reverse: false,
                pageSnapping: true,
                height: ResponsiveSize.width(200, context),
                autoPlay: true,
                autoPlayCurve: Curves.linear,
                autoPlayAnimationDuration: const Duration(seconds: 6),
                viewportFraction: 1,
                enlargeCenterPage: true));
      },
      error: (error, stackTrace) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      loading: () => Center(
        child: Text('$Error'),
      ),
    );
  }
}

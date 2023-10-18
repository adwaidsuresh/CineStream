import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:movieapp/Api/api.dart';
import 'package:movieapp/Api/apiserviceprovider.dart';
import 'package:movieapp/Components/responsive/Horizontalview.dart';
import 'package:movieapp/Components/responsive/Latestmovie.dart';
// import 'package:movieapp/Components/responsive/bottomnavigation.dart';
import 'package:movieapp/Components/responsive/detailtmdb.dart';
import 'package:movieapp/Components/responsive/responsivenss.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/Components/responsive/tvtoprate.dart';
import 'package:movieapp/Components/responsive/upcoming.dart';
// import 'package:movieapp/modelclass/tvtoprated.dart';
// import 'package:movieapp/Components/responsive/upcoming.dart';
import 'package:movieapp/provider/provider.dart';

class ScreenOne extends ConsumerWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final app = ref.watch(getpostprovider);
    final theme = ref.watch(colorProvider);

    // final movi = ref.watch(moviesProvider);
    final changeList = ref.watch(listProvider);

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor:
            theme ? Color.fromARGB(255, 241, 241, 171) : Colors.black,
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Hi,Melanie !",
              style: TextStyle(color: theme ? Colors.black : Colors.white),
            ),
            backgroundColor: Colors.transparent,
            actions: [
              Icon(Icons.cast, color: theme ? Colors.black : Colors.white),
            ]),
        body: app.when(
          data: (data) {
            if (data == null) {
              return const Center(
                child: Text(
                  'Something went wrong..',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              );
            }
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: ResponsiveSize.width(240, context),
                        top: ResponsiveSize.width(20, context)),
                    child: Text(
                      'Latest Trailer',
                      style: TextStyle(
                          fontFamily: "FONT3",
                          fontWeight: FontWeight.w800,
                          color: theme ? Colors.black : Colors.white,
                          fontSize: ResponsiveSize.width(20, context)),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveSize.width(10, context),
                  ),
                  CarouselSlider.builder(
                      itemCount: data.results!.length,
                      itemBuilder: (context, index, realIndex) {
                        return InkWell(
                          onDoubleTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailTmdb(
                                        movie_id: data.results![index].id!)));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.greenAccent),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500${data.results![index].posterPath!}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                          aspectRatio: 16 / 9,
                          autoPlayInterval: Duration(seconds: 3),
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                          reverse: true,
                          pageSnapping: true,
                          height: ResponsiveSize.width(300, context),
                          autoPlay: true,
                          autoPlayCurve: Curves.easeIn,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 700),
                          viewportFraction: .5,
                          enlargeCenterPage: true)),
                  SizedBox(
                    height: ResponsiveSize.width(20, context),
                  ),
                  Row(
                    children: [
                      Text('Trending',
                          style: TextStyle(
                              fontFamily: "FONT3",
                              fontWeight: FontWeight.w800,
                              color: theme ? Colors.black : Colors.white,
                              fontSize: ResponsiveSize.width(20, context))),
                      Padding(
                        padding:
                            EdgeInsets.all(ResponsiveSize.width(10, context)),
                        child: Container(
                          width: ResponsiveSize.width(223, context),
                          height: ResponsiveSize.width(50, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  ResponsiveSize.width(15, context)),
                              border: Border.all(
                                  color: Color.fromARGB(255, 11, 196, 73))),
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  ref.read(listProvider.notifier).state = true;
                                },
                                child: Container(
                                  width: ResponsiveSize.width(75, context),
                                  height: ResponsiveSize.width(25, context),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          ResponsiveSize.width(15, context)),
                                      color: changeList
                                          ? Colors.orange
                                          : Colors.transparent),
                                  child: Center(
                                    child: Text('Today',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: theme
                                                ? Colors.black
                                                : Colors.white,
                                            fontSize: ResponsiveSize.width(
                                                15, context))),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  ref.read(listProvider.notifier).state = false;
                                },
                                child: Container(
                                  width: ResponsiveSize.width(85, context),
                                  height: ResponsiveSize.width(25, context),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          ResponsiveSize.width(15, context)),
                                      color: changeList
                                          ? Colors.transparent
                                          : Colors.orange),
                                  child: Center(
                                    child: Text('Week',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: theme
                                                ? Colors.black
                                                : Colors.white,
                                            fontSize: ResponsiveSize.width(
                                                15, context))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  changeList
                      ? Upcoming()
                      :
                      // SizedBox(
                      //   height: ResponsiveSize.width(20, context),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(
                      //       right: ResponsiveSize.width(230, context),
                      //       top: ResponsiveSize.width(20, context)),
                      //   child: Text(
                      //     'Latest Movies',
                      //     style: TextStyle(
                      //         // fontFamily: 'Font1',
                      //         fontWeight: FontWeight.w800,
                      //         color: Colors.white,
                      //         fontSize: ResponsiveSize.width(20, context)),
                      //   ),
                      // ),
                      Latest(),
                  Padding(
                    padding: EdgeInsets.only(
                        right: ResponsiveSize.width(180, context),
                        top: ResponsiveSize.width(20, context)),
                    child: Text(
                      'Upcoming Movies',
                      style: TextStyle(
                          fontFamily: "FONT3",
                          fontWeight: FontWeight.w800,
                          color: theme ? Colors.black : Colors.white,
                          fontSize: ResponsiveSize.width(20, context)),
                    ),
                  ),
                  Horizontal(
                    results: data.results!,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: ResponsiveSize.width(220, context),
                        top: ResponsiveSize.width(20, context)),
                    child: Text(
                      'TV Toprated',
                      style: TextStyle(
                          fontFamily: "FONT3",
                          fontWeight: FontWeight.w800,
                          color: theme ? Colors.black : Colors.white,
                          fontSize: ResponsiveSize.width(20, context)),
                    ),
                  ),
                  Tvrated(),
                ],
              ),
            );
          },
          error: (error, stackTrace) => Center(
            child: Text(
              '$error',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        // bottomNavigationBar: Navigation1(),
      ),
    );
  }
}

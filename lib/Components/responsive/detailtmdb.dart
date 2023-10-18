import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/Api/apiserviceprovider.dart';
import 'package:movieapp/Components/responsive/casts.dart';
import 'package:movieapp/Components/responsive/responsivenss.dart';
import 'package:movieapp/Components/responsive/upcoming.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:share_plus/share_plus.dart';

class DetailTmdb extends ConsumerWidget {
  final int movie_id;
  DetailTmdb({super.key, required this.movie_id});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detai = ref.watch(detailmovieProvider(movie_id));
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: ResponsiveSize.width(20, context),
        backgroundColor: const Color.fromARGB(255, 7, 7, 7),
      ),
      body: SingleChildScrollView(
        child: detai.when(
          data: (data) {
            if (data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            ;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    Container(
                      height: ResponsiveSize.width(200, context),
                      width: ResponsiveSize.width(360, context),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  Moviekey.imagew500 + data.backdropPath!),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(
                              ResponsiveSize.width(10, context))),
                          color: Colors.white),
                    ),
                    Positioned(
                      left: ResponsiveSize.width(10, context),
                      child: CircularPercentIndicator(
                          radius: ResponsiveSize.width(20, context),
                          backgroundColor: Colors.white,
                          lineWidth: ResponsiveSize.width(1.5, context),
                          animation: true,
                          animateFromLastPercent: true,
                          center: Text(
                            data.voteAverage.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          percent: data.voteAverage! / 10),
                    ),
                  ],
                ),
                SizedBox(
                  height: ResponsiveSize.width(20, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data.originalTitle!,
                      style: TextStyle(
                          color: const Color.fromARGB(255, 214, 6, 6),
                          fontSize: ResponsiveSize.width(18, context),
                          fontFamily: 'Font4'),
                    ),
                  ],
                ),
                SizedBox(
                  height: ResponsiveSize.width(20, context),
                ),
                Container(
                  width: ResponsiveSize.width(350, context),
                  height: ResponsiveSize.width(40, context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          ResponsiveSize.width(8, context)),
                      color: const Color.fromARGB(255, 242, 242, 244)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.play_arrow),
                        color: const Color.fromARGB(255, 10, 10, 10),
                        iconSize: ResponsiveSize.width(30, context),
                      ),
                      Text(
                        'Watch First Episode S1 E1',
                        style: TextStyle(
                            fontFamily: "FONT3",
                            fontWeight: FontWeight.w600,
                            fontSize: ResponsiveSize.width(20, context)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: ResponsiveSize.width(20, context),
                ),
                Text(
                  data.overview!,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "FONT2",
                      fontWeight: FontWeight.w900,
                      fontSize: ResponsiveSize.width(15, context)),
                  textAlign: TextAlign.justify,
                ),
                Row(
                  children: [
                    Text(
                      'Runtime:${data.runtime} ',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '|',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: ResponsiveSize.width(30, context)),
                    ),
                    Text(
                      'Status:${data.status} ',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Text(
                  data.tagline!,
                  style: const TextStyle(color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add)),
                        const Text('Wishlist',
                            style: TextStyle(
                              color: Colors.white,
                            ))
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () async {
                              {
                                await Share.share(data.originalTitle!,
                                    subject: 'TMBD');
                              }
                            },
                            icon: const Icon(Icons.share)),
                        const Text('share',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: ResponsiveSize.width(10, context),
                ),
                Cast(movieid: movie_id),
                SizedBox(
                  height: ResponsiveSize.width(10, context),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: ResponsiveSize.width(170, context)),
                  child: Text('More Like This',
                      style: TextStyle(
                          fontFamily: 'Font2',
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: ResponsiveSize.width(22, context))),
                ),
                Upcoming()
              ],
            );
          },
          error: (error, stackTrace) {
            return const Center(
              child: Text('error'),
            );
          },
          loading: () {
            return Center(
              child: CircularPercentIndicator(
                  radius: ResponsiveSize.width(20, context)),
            );
          },
        ),
      ),
    );
  }
}





////showbottomsheet///////////

 // scaffoldKey.currentState!.showBottomSheet(
                                //   (context) => Container(
                                //     height:
                                //         MediaQuery.sizeOf(context).height * .4,
                                //     color:
                                //         const Color.fromARGB(255, 14, 14, 14),
                                //     child: GridView.builder(
                                //       itemCount: 12,
                                //       shrinkWrap: true,
                                //       physics: const ClampingScrollPhysics(),
                                //       itemBuilder: (context, index) =>
                                //           Container(
                                //         // width: ResponsiveSize.width(20, context),
                                //         // height: ResponsiveSize.width(25, context),
                                //         color: const Color.fromARGB(
                                //             255, 245, 248, 245),
                                //         child: Icon(Icons.abc),
                                //       ),
                                //       gridDelegate:
                                //           const SliverGridDelegateWithFixedCrossAxisCount(
                                //         crossAxisCount: 4,
                                //         crossAxisSpacing: 10,
                                //         mainAxisSpacing: 10,
                                //       ),
                                //     ),
                                //   ),
                                // );

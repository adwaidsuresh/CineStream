import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/Api/apiserviceprovider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../Components/responsive/responsivenss.dart';

class CastDetails extends ConsumerWidget {
  // final int movieid;
  final int castid;
  const CastDetails({super.key, required this.castid});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final castDet = ref.watch(castDetailsprovider(castid));
    return Scaffold(
      backgroundColor: Colors.black,
      body: castDet.when(
        data: (data) {
          if (data == null) {
            return const Center(
              child: Text(
                'error',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.all(
              ResponsiveSize.width(60, context),
            ),
            child: Column(
              children: [
                ListView.builder(
                  itemCount: data.id,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Center(
                      child: data.profilePath != null
                          ? Container(
                              width: ResponsiveSize.width(200, context),
                              height: ResponsiveSize.width(200, context),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        Moviekey.imagew500 + data.profilePath!),
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    ResponsiveSize.width(10, context),
                                  ),
                                  color: Colors.amber),
                              child: Text(data.name!),
                            )
                          : const Icon(Icons.person),
                    );
                  },
                )
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        loading: () {
          return Center(
            child: CircularPercentIndicator(
                radius: ResponsiveSize.width(15, context)),
          );
        },
      ),
    );
  }
}

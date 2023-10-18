import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:movieapp/Api/api.dart';
import 'package:movieapp/Api/apiserviceprovider.dart';
import 'package:movieapp/Components/responsive/responsivenss.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Tvrated extends ConsumerWidget {
  const Tvrated({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tv = ref.watch(gettvprovider);
    return tv.when(
      data: (data) {
        if (data == null) {
          return const Center(
            child: Text('error'),
          );
        }
        return SizedBox(
          height: ResponsiveSize.width(180, context),
          child: ListView.separated(
            itemCount: data.results!.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                width: ResponsiveSize.width(150, context),
                height: ResponsiveSize.width(250, context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      ResponsiveSize.width(10, context),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(Moviekey.imagew500 +
                            data.results![index].backdropPath!),
                        fit: BoxFit.cover)),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: ResponsiveSize.width(10, context),
              );
            },
          ),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: CircularPercentIndicator(
              radius: ResponsiveSize.width(5, context)),
        );
      },
      loading: () {
        return const Center(child: Text('suck'));
      },
    );
  }
}

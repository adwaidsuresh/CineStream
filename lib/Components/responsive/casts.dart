import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:movieapp/Api/api.dart';
import 'package:movieapp/Api/apiserviceprovider.dart';
import 'package:movieapp/Components/responsive/responsivenss.dart';
import 'package:movieapp/view/castdetails.dart';

class Cast extends ConsumerWidget {
  const Cast({super.key, required this.movieid});

  final int movieid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final castt = ref.watch(castmovieProvider(movieid));

    return castt.when(
      data: (data) {
        if (data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SizedBox(
          height: ResponsiveSize.width(220, context),
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              width: ResponsiveSize.width(10, context),
            ),
            itemCount: data.cast!.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                data.cast![index].profilePath != null
                    ? InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CastDetails(castid: data.cast![index].id!),
                              ));
                        },
                        child: Container(
                          width: ResponsiveSize.width(100, context),
                          height: ResponsiveSize.width(150, context),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(Moviekey.imagew500 +
                                    data.cast![index].profilePath!),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(
                                ResponsiveSize.width(12, context)),
                          ),
                        ),
                      )
                    : const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                Text(
                  data.cast![index].name!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ResponsiveSize.width(12, context),
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
        );
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

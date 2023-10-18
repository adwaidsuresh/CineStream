import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:movieapp/Api/api.dart';
import 'package:movieapp/Api/apiserviceprovider.dart';
import 'package:movieapp/Components/responsive/Horizontalview.dart';
// import 'package:movieapp/provider/provider.dart';

// import '../../modelclass/modelclass.dart';

class Upcoming extends ConsumerWidget {
  const Upcoming({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final api = ref.watch(latestProvider);
    final trending = ref.watch(getTrendingprovider);
    return trending.when(
      data: (data) {
        if (data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Horizontal(results: data.results!);
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

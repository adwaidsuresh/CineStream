import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:movieapp/Api/api.dart';
import 'package:movieapp/Api/apiserviceprovider.dart';
import 'package:movieapp/Components/responsive/responsivenss.dart';
import 'package:movieapp/Components/responsive/searchcomponents.dart';
import 'package:movieapp/provider/provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Search extends ConsumerWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(searchprovider);
    final theme = ref.watch(colorProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            theme ? Color.fromARGB(255, 241, 241, 171) : Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(ResponsiveSize.width(20, context)),
                  child: TextField(
                    onChanged: (value) {
                      ref.read(getsearchcontent.notifier).state = value;
                      ref.invalidate(searchprovider);
                    },
                    decoration: InputDecoration(
                      hintText: 'search',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.only(
                        left: ResponsiveSize.width(25, context),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            ResponsiveSize.width(10, context)),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            ResponsiveSize.width(10, context)),
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: TextStyle(
                          color: Color(0xFF5F5F5F),
                          letterSpacing: ResponsiveSize.width(.5, context),
                          fontSize: ResponsiveSize.width(12, context)),
                    ),
                  ),
                ),
              ),
              search.when(
                data: (data) {
                  if (data == null) {
                    return const Center(
                      child: Text('error'),
                    );
                  }
                  ;
                  return searchmethod(data);
                },
                error: (error, stackTrace) {
                  return const Center(
                    child: Text('Errorrrr'),
                  );
                },
                loading: () {
                  return Center(
                    child: CircularPercentIndicator(
                        radius: ResponsiveSize.width(11, context)),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

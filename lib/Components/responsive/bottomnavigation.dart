import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:movieapp/provider/provider.dart';
import 'package:movieapp/view/profile.dart';
import 'package:movieapp/view/screen_1.dart';
import 'package:movieapp/view/search.dart';

class Navigation1 extends ConsumerWidget {
  Navigation1({super.key}); 

  final controller = PageController();

  final int selectedIndex = 0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(colorProvider.notifier).state;
    return Scaffold(
      backgroundColor:
          theme ? const Color.fromARGB(255, 241, 241, 171) : Colors.black,
      extendBody: true,
      body: PageView(
        physics: const BouncingScrollPhysics(),
        controller: controller,
        children: const [ScreenOne(), Search(), ProfilePage()],
        onPageChanged: (value) {
          ref.read(bottomProvider.notifier).state = value;
        },
      ),
      bottomNavigationBar: MoltenBottomNavigationBar(
        barColor: const Color.fromRGBO(1, 26, 18, 0.376),
        domeCircleColor: const Color.fromARGB(255, 168, 165, 164),
        selectedIndex: ref.watch(bottomProvider),
        onTabChange: (index) {
          ref.read(bottomProvider.notifier).state = index;
          controller.animateToPage(index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.linear);
        },
        tabs: [
          MoltenTab(icon: const Icon(Icons.home)),
          MoltenTab(icon: const Icon(Icons.search)),
          MoltenTab(icon: const Icon(Icons.person)),
        ],
      ),
    );
  }
}

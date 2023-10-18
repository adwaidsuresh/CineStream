import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/Components/responsive/responsivenss.dart';
import 'package:movieapp/provider/provider.dart';
import 'package:movieapp/services/authservice.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contai = ref.watch(containerProvider);
    final theme = ref.watch(colorProvider);
    return Scaffold(
      backgroundColor:
          theme ? const Color.fromARGB(255, 241, 241, 171) : Colors.black,
      appBar: AppBar(
        backgroundColor:
            theme ? const Color.fromARGB(255, 241, 241, 171) : Colors.black,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        title: Text(
          'Profiles & More',
          style: TextStyle(
              color: theme ? Colors.black : Colors.white,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: ResponsiveSize.width(30, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mode_edit_outline_sharp,
                      color: const Color.fromARGB(255, 131, 126, 126),
                      size: ResponsiveSize.width(30, context),
                    )),
                Text(
                  '    Manage Profiles',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 131, 126, 126),
                      fontSize: ResponsiveSize.width(18, context),
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: ResponsiveSize.width(50, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'MODE',
                      style: TextStyle(
                          color: theme ? Colors.black : Colors.white,
                          fontSize: ResponsiveSize.width(20, context)),
                    ),
                    Switch(
                      value: ref.read(colorProvider.notifier).state,
                      onChanged: (value) {
                        theme ? Colors.black : Colors.white;
                        ref.read(colorProvider.notifier).state =
                            !ref.read(colorProvider.notifier).state;
                      },
                    ),
                  ],
                ),
                Container(
                  width: ResponsiveSize.width(350, context),
                  height: ResponsiveSize.width(50, context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromARGB(255, 136, 134, 134)),
                      color: const Color.fromARGB(255, 11, 10, 10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                              size: ResponsiveSize.width(25, context),
                              Icons.notifications,
                              color: const Color.fromARGB(255, 174, 171, 171))),
                      Text(
                        'Notification',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 174, 171, 171),
                            fontSize: ResponsiveSize.width(20, context)),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.keyboard_arrow_right_outlined,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: ResponsiveSize.width(20, context),
                ),
                Container(
                  width: ResponsiveSize.width(350, context),
                  height: ResponsiveSize.width(50, context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromARGB(255, 136, 134, 134)),
                      color: const Color.fromARGB(255, 11, 10, 10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.format_list_bulleted_add,
                            color: const Color.fromARGB(255, 174, 171, 171),
                            size: ResponsiveSize.width(25, context),
                          )),
                      Text(
                        'My List',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 174, 171, 171),
                            fontSize: ResponsiveSize.width(20, context)),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_right_outlined,
                            color: Colors.white,
                            size: ResponsiveSize.width(25, context),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: ResponsiveSize.width(20, context),
                ),
                Container(
                  width: ResponsiveSize.width(350, context),
                  height: ResponsiveSize.width(50, context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromARGB(255, 136, 134, 134)),
                      color: const Color.fromARGB(255, 11, 10, 10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings,
                            color: Color.fromARGB(255, 174, 171, 171),
                          )),
                      Text(
                        'App Settings',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 174, 171, 171),
                            fontSize: ResponsiveSize.width(20, context)),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.keyboard_arrow_right_outlined,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: ResponsiveSize.width(20, context),
                ),
                Container(
                  width: ResponsiveSize.width(350, context),
                  height: ResponsiveSize.width(50, context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromARGB(255, 136, 134, 134)),
                      color: const Color.fromARGB(255, 11, 10, 10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.help,
                            color: const Color.fromARGB(255, 174, 171, 171),
                            size: ResponsiveSize.width(25, context),
                          )),
                      Text(
                        'Help',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 174, 171, 171),
                            fontSize: ResponsiveSize.width(20, context)),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.keyboard_arrow_right_outlined,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: ResponsiveSize.width(20, context),
                ),
                Container(
                  padding: const EdgeInsets.all(3),
                  width: ResponsiveSize.width(350, context),
                  // height: ResponsiveSize.width(50, context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromARGB(255, 136, 134, 134)),
                      color: const Color.fromARGB(255, 11, 10, 10)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                size: ResponsiveSize.width(25, context),
                                Icons.person,
                                color: const Color.fromARGB(255, 174, 171, 171),
                              )),
                          Text(
                            'Profile',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 174, 171, 171),
                                fontSize: ResponsiveSize.width(20, context)),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              ref.read(containerProvider.notifier).state =
                                  !ref.read(containerProvider.notifier).state;
                              ref.read(iconProvider.notifier).state =
                                  !ref.read(iconProvider.notifier).state;
                            },
                            icon: Icon(
                              ref.read(iconProvider.notifier).state
                                  ? Icons.keyboard_arrow_down_rounded
                                  : Icons.keyboard_arrow_right_outlined,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      contai == true
                          ? Container(
                              height: ResponsiveSize.width(350, context),
                              width: ResponsiveSize.width(250, context),
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Account',
                                        style: TextStyle(
                                            fontSize: ResponsiveSize.width(
                                                20, context),
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const CircleAvatar(
                                        backgroundImage:
                                            AssetImage('assets/images/4.jpg'),
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Member since December 2022',
                                    style: TextStyle(
                                        fontSize:
                                            ResponsiveSize.width(15, context),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Container(
                                    width: ResponsiveSize.width(220, context),
                                    height: ResponsiveSize.width(260, context),
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'MELANIE',
                                          style: TextStyle(
                                              fontSize: ResponsiveSize.width(
                                                  20, context),
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              'Change email',
                                              style: TextStyle(
                                                  fontSize:
                                                      ResponsiveSize.width(
                                                          15, context),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const Icon(Icons
                                                .arrow_forward_ios_outlined),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Change password',
                                              style: TextStyle(
                                                  fontSize:
                                                      ResponsiveSize.width(
                                                          15, context),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const Icon(Icons
                                                .arrow_forward_ios_outlined),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Add phone number',
                                              style: TextStyle(
                                                  fontSize:
                                                      ResponsiveSize.width(
                                                          15, context),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const Icon(Icons
                                                .arrow_forward_ios_outlined),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                SizedBox(
                  height: ResponsiveSize.width(40, context),
                ),
                InkWell(
                  onTap: () {
                    Authservices.logout();
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => Login(),
                    // ));
                  },
                  child: Text(
                    'Signout',
                    style: TextStyle(
                        color: theme ? Colors.black : Colors.white,
                        fontSize: ResponsiveSize.width(20, context),
                        fontFamily: 'FONT3'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

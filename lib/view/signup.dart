import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/Components/responsive/responsivenss.dart';
// import 'package:movieapp/provider/authprovider.dart';
import 'package:movieapp/services/authservice.dart';
// import '../Components/responsive/bottomnavigation.dart';
import '../Components/responsive/custom_textfield.dart';

class Signup extends ConsumerWidget {
  Signup({super.key});
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final confirmpassword = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: ResponsiveSize.width(200, context),
              color: Colors.black,
              child: Center(
                child: Text(
                  'Signup',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Font4',
                    fontSize: ResponsiveSize.width(40, context),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: ResponsiveSize.width(400, context),
                  height: ResponsiveSize.width(595, context),
                  color: Colors.black,
                  // decoration: BoxDecoration(
                  //   // borderRadius: BorderRadius.circular(
                  //   //     ResponsiveSize.width(10, context)),
                  //   color: Colors.black,
                  // ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextField(
                        controller: name,
                        label: '',
                        hint: 'NAME',
                        onChanged: '',
                      ),
                      CustomTextField(
                        controller: email,
                        label: '',
                        hint: 'EMAIL',
                        onChanged: '',
                      ),
                      CustomTextField(
                        controller: password,
                        label: '',
                        hint: 'PASSWORD',
                        onChanged: '',
                      ),
                      CustomTextField(
                        controller: confirmpassword,
                        label: '',
                        hint: 'CONFIRM PASSWORD',
                        onChanged: '',
                      ),
                      SizedBox(
                        height: ResponsiveSize.width(20, context),
                      ),
                      InkWell(
                        onTap: () async {
                          if (email.text.isEmpty &&
                              password.text == '' &&
                              name.text == '' &&
                              confirmpassword.text == '') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Center(
                                  child: Text(
                                    'Fill in the Blanks',
                                    style: TextStyle(fontFamily: "FONT3"),
                                  ),
                                ),
                              ),
                            );
                          } else if (password.text != confirmpassword.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Center(
                                  child: Text(
                                    'incorrectpassword',
                                    style: TextStyle(fontFamily: "FONT3"),
                                  ),
                                ),
                              ),
                            );
                          }
                          try {
                            UserCredential userCredential =
                                await Authservices.signup(
                                    email.text, password.text);
                            if (userCredential.user != null &&
                                context.mounted) {
                              Navigator.pop(context);
                            }
                          } on FirebaseAuthException catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${e.message}'),
                                ),
                              );
                            }
                          }
                        },
                        child: Container(
                          width: ResponsiveSize.width(290, context),
                          height: ResponsiveSize.width(45, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                ResponsiveSize.width(10, context),
                              ),
                              color: Color(0xBB2AC3D7)),
                          child: const Center(
                            child: Text(
                              'CONTINUE',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ResponsiveSize.width(15, context),
                      ),
                      Center(
                        child: Text(
                          'or',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ResponsiveSize.width(15, context)),
                        ),
                      ),
                      SizedBox(
                        height: ResponsiveSize.width(15, context),
                      ),
                      Container(
                        width: ResponsiveSize.width(290, context),
                        height: ResponsiveSize.width(45, context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              ResponsiveSize.width(10, context),
                            ),
                            color: const Color.fromARGB(246, 239, 242, 242)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.facebook,
                                color: const Color.fromARGB(255, 10, 95, 164),
                                size: ResponsiveSize.width(30, context),
                              ),
                              Text('continue With Facebook',
                                  style: TextStyle(
                                      fontSize:
                                          ResponsiveSize.width(15, context),
                                      fontWeight: FontWeight.w700))
                            ]),
                      ),
                      SizedBox(
                        height: ResponsiveSize.width(15, context),
                      ),
                      InkWell(
                        child: Container(
                          width: ResponsiveSize.width(290, context),
                          height: ResponsiveSize.width(45, context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                ResponsiveSize.width(10, context),
                              ),
                              color: const Color.fromARGB(
                                246,
                                239,
                                242,
                                242,
                              )),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    child: Image.asset('assets/images/2.png'),
                                    height: ResponsiveSize.width(30, context)),
                                Text('continue With Google',
                                    style: TextStyle(
                                        fontSize:
                                            ResponsiveSize.width(15, context),
                                        fontWeight: FontWeight.w700))
                              ]),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: ResponsiveSize.width(40, context),
                            bottom: ResponsiveSize.width(40, context),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: TextStyle(
                                      color: const Color.fromARGB(255, 9, 8, 8),
                                      // fontFamily: 'FONT1',
                                      fontWeight: FontWeight.w800,
                                      fontSize:
                                          ResponsiveSize.width(15, context)),
                                  children: const [
                                    TextSpan(
                                      text: 'Already have an account?',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    TextSpan(
                                        text: '   Login',
                                        style: TextStyle(
                                            color: Color(0xFF47DE2C))),
                                    TextSpan(
                                        text: '\nForgot your password?',
                                        style: TextStyle(
                                            color: Color(0xFF47DE2C))),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

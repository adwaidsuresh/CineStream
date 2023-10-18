import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:movieapp/Components/responsive/bottomnavigation.dart';
import 'package:movieapp/Components/responsive/custom_textfield.dart';
import 'package:movieapp/Components/responsive/responsivenss.dart';
// import 'package:movieapp/provider/authprovider.dart';
import 'package:movieapp/provider/provider.dart';
import 'package:movieapp/services/authservice.dart';
// import 'package:movieapp/view/screen_1.dart';
import 'package:movieapp/view/signup.dart';

class Login extends ConsumerWidget {
  Login({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(colorProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: ResponsiveSize.width(400, context),
              height: ResponsiveSize.width(790, context),
              // color: Colors.white,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/7.jpg'),
                      fit: BoxFit.fitHeight)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: ResponsiveSize.width(370, context),
                    height: ResponsiveSize.width(440, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          ResponsiveSize.width(10, context)),
                      color: const Color.fromARGB(142, 11, 0, 0),
                    ),
                    child: Column(
                      children: [
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
                        SizedBox(
                          height: ResponsiveSize.width(20, context),
                        ),
                        InkWell(
                          onTap: () async {
                            if (email.text == '' && password.text == '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Center(
                                    child: Text(
                                      'Fill the manditory fields',
                                      style: TextStyle(fontFamily: "FONT3"),
                                    ),
                                  ),
                                ),
                              );
                            }
                            try {
                              await Authservices.login(
                                  email.text, password.text);
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
                                color: color
                                    ? const Color.fromARGB(255, 125, 125, 123)
                                    : const Color(0xBB2AC3D7)),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                      child: Image.asset('assets/images/2.png'),
                                      height:
                                          ResponsiveSize.width(30, context)),
                                  Text('continue With Google',
                                      style: TextStyle(
                                          fontSize:
                                              ResponsiveSize.width(15, context),
                                          fontWeight: FontWeight.w700))
                                ]),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: ResponsiveSize.width(82, context),
                              top: ResponsiveSize.width(40, context)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Signup(),
                                ),
                              );
                            },
                            child: RichText(
                                text: TextSpan(
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 9, 8, 8),
                                  // fontFamily: 'FONT1',
                                  fontWeight: FontWeight.w800,
                                  fontSize: ResponsiveSize.width(15, context)),
                              children: const [
                                TextSpan(text: 'Don\'t have an account?'),
                                TextSpan(
                                    text: '   Signup',
                                    style: TextStyle(color: Color(0xFF47DE2C))),
                                TextSpan(
                                    text: '\nForgot your password?',
                                    style: TextStyle(color: Color(0xFF47DE2C))),
                              ],
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movieapp/Components/responsive/responsivenss.dart';
import 'package:movieapp/view/authchecker.dart';
// import 'package:movieapp/view/login.dart';

class GetStart extends StatelessWidget {
  const GetStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: ResponsiveSize.width(500, context),
                  height: ResponsiveSize.width(490, context),
                  child: Image.asset(
                    'assets/images/1.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                    left: ResponsiveSize.width(100, context),
                    top: ResponsiveSize.width(110, context),
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'FONT1',
                              fontWeight: FontWeight.w700,
                              fontSize: ResponsiveSize.width(30, context),
                            ),
                            children: const [
                          TextSpan(text: 'ONE'),
                          TextSpan(
                            text: 'PEICE',
                            style: TextStyle(
                              color: Color(0xFFF12516),
                            ),
                          )
                        ])))
              ],
            ),
            Container(
              width: ResponsiveSize.width(340, context),
              height: ResponsiveSize.width(290, context),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Color.fromARGB(255, 56, 55, 55),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: ResponsiveSize.width(18, context),
                      top: ResponsiveSize.width(25, context),
                    ),
                    child: RichText(
                        text: TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                        // fontFamily: 'FONT1',
                        fontWeight: FontWeight.w800,
                        fontSize: ResponsiveSize.width(25, context),
                      ),
                      children: const [
                        TextSpan(text: '      Brings '),
                        TextSpan(
                          text: 'free',
                          style: TextStyle(
                            color: Color(0xFFF12516),
                          ),
                        ),
                        TextSpan(text: ' streaming to\n'),
                        TextSpan(text: '               Your Device')
                      ],
                    )),
                  ),
                  SizedBox(
                    height: ResponsiveSize.width(35, context),
                  ),
                  Text(
                    'Unleash a worldof limitless entertainment,\n       watch everything and everywhere',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: ResponsiveSize.width(15, context),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveSize.width(20, context),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Authchecker(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.only(
                        left: ResponsiveSize.width(80, context),
                        right: ResponsiveSize.width(80, context),
                      ),
                      foregroundColor: Colors.white10,
                      shape: const LinearBorder(
                        bottom: LinearBorderEdge(alignment: 20),
                      ),
                    ),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: ResponsiveSize.width(16, context),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

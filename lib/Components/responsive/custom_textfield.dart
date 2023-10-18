import 'package:flutter/material.dart';
import 'package:movieapp/Components/responsive/responsivenss.dart';

// import '../utils/responsiveness.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final String onChanged;
  final TextEditingController controller;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.hint,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              color: Colors.white,
              fontSize: ResponsiveSize.width(9, context),
              letterSpacing: ResponsiveSize.width(1.5, context),
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          width: ResponsiveSize.width(310, context),
          child: TextField(
            controller: controller,
            onChanged: (value) {},
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              contentPadding: EdgeInsets.only(
                left: ResponsiveSize.width(25, context),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(ResponsiveSize.width(10, context)),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(ResponsiveSize.width(10, context)),
                borderSide: BorderSide.none,
              ),
              hintText: hint,
              hintStyle: TextStyle(
                  color: Color(0xFF5F5F5F),
                  letterSpacing: ResponsiveSize.width(.5, context),
                  fontSize: ResponsiveSize.width(12, context)),
            ),
          ),
        ),
      ],
    );
  }
}

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {required this.label,
      required this.hint,
      required this.isPassword,
      required this.controller,
      super.key});
  final String label;
  final String hint;
  final bool isPassword;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isHiddenPassword = true;
  bool isEyeCrossed = false;
  Icon eyeIcon = const Icon(
    Icons.visibility_off,
    color: Colors.white,
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0,
          MediaQuery.of(context).size.height * 0.008,
          0,
          MediaQuery.of(context).size.height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label,
              style: TextStyle(
                height: 0.5,
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.025,
              )),
          SizedBox(
            // width: infinity,
            child: TextField(
              style: TextStyle(
                // height: 2,
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.02,
              ),
              controller: widget.controller,
              obscureText: widget.isPassword ? _isHiddenPassword : false,
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    // width: 1,
                    color: Colors.white,
                  ),
                ),
                hintText: widget.hint,
                // suffixIcon: showPasswordIcon(widget.isPassword),
                suffixIcon: widget.isPassword
                    ? InkWell(
                        onTap: () {
                          _viewPassword(widget.isPassword);
                        },
                        child: eyeIcon,
                      )
                    : const Icon(null),
                hintStyle: TextStyle(
                  color: Color.fromARGB(141, 153, 153, 153),
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _viewPassword(isPassword) {
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
      isEyeCrossed = !isEyeCrossed;
      eyeIcon = isEyeCrossed
          ? const Icon(
              Icons.visibility,
              color: Colors.white,
            )
          : const Icon(
              Icons.visibility_off,
              color: Colors.white,
            );
    });
  }
}

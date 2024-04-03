import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consts/const.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hint,
    this.maxlines = 1,
    this.onsaved, this.onchanged,
  });
  int maxlines;
  String hint;
  final Function(String)? onchanged;
  final void Function(String?)? onsaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      onSaved: onsaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is Required';
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxlines,
      decoration: InputDecoration(
        hintText: hint,
        border: newMethod(),
        enabledBorder: newMethod(),
        focusedBorder: newMethod(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder newMethod([Color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Color ?? Colors.white));
  }
}

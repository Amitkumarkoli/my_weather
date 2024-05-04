import 'package:flutter/cupertino.dart';

import '../themes/themes.dart';

class CustomCupertinoTextField extends StatelessWidget {
  const CustomCupertinoTextField({

    super.key,
    this.placeholder,
    this.prefix = "",
    this.readOnly = false,
    this.onTap,
    this.suffix,
    this.obscureText = false,
    this.controller

  });
  final String prefix;
  final String? placeholder;
  final bool readOnly;
  final GestureTapCallback? onTap;
  final Widget? suffix;
  final bool obscureText;
  final TextEditingController? controller;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: CupertinoTextField(
        controller: controller,
        suffix: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: suffix,
        ),
        onTap: onTap,
        readOnly: readOnly,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        prefix: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(prefix),
        ),
        placeholder: placeholder,
        decoration: Themes.kDefaultRoundedBorderDecoration,
        style: Themes.kDefaultTextStyleForCupertinoTextFiled,
        obscureText: obscureText,

      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../constants/colors.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextInputType textInputType;
  final String hintText;
  final String defaultText;
  final FocusNode focusNode;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputAction actionKeyboard;

  const TextFormFieldWidget({
    required this.hintText,
    required this.focusNode,
    required this.textInputType,
    required this.defaultText,
    this.obscureText = false,
    required this.controller,
    this.actionKeyboard = TextInputAction.done,
  });

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  double bottomPaddingToError = 12;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: color_black,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
        child: Card(
          elevation: 5,
          child: SizedBox(
            height: 50,
            child: TextFormField(
              expands: true,
              maxLines: null,
              cursorColor: color_black,
              obscureText: widget.obscureText,
              keyboardType: widget.textInputType,
              textInputAction: widget.actionKeyboard,
              focusNode: widget.focusNode,
              style: const TextStyle(
                color: color_black,
                fontSize: 16.0,
                fontStyle: FontStyle.normal,
              ),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  fontSize: 14.0,
                  fontStyle: FontStyle.normal,
                ),
                contentPadding: const EdgeInsets.only(top: 10, left: 10),
                isDense: true,
              ),
              controller: widget.controller,
            ),
          ),
        ),
      ),
    );
  }
}

// Widget _buildCustomername() {
//   return TextFormFieldWidget(
//     hintText: "Customer Name",
//     textInputType: TextInputType.text,
//     actionKeyboard: TextInputAction.next,
//     controller: _nameController,
//     focusNode: _nameControllerFocus,
//     defaultText: 'Customer Name', // Don't pass image in case of no prefix Icon
//   );
// }
String? commonValidation(String value, String messageError) {
  var required = requiredValidator(value, messageError);
  if (required != null) {
    return required;
  }
  return null;
}

String? requiredValidator(value, messageError) {
  if (value.isEmpty) {
    return messageError;
  }
  return null;
}

void changeFocus(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String labelText;
  final String hintText;
  final bool isValid;
  final bool isLoading;
  final Function(String) onChanged;
  final Function(String) onValidate;
  final bool isObscure;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.labelText,
    required this.hintText,
    required this.isValid,
    required this.isLoading,
    required this.onChanged,
    required this.onValidate,
    this.isObscure = false,
  });

  OutlineInputBorder _getBorder(
      bool isValid, bool isFocused, bool isLoading, context) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: isLoading
            ? const Color(0xFF79747E).withOpacity(0.12)
            : isValid
                ? (focusNode.hasFocus
                    ? const Color(0xFF0061A6)
                    : const Color(0xFF43474E))
                : const Color(0xFFBA1A1A),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Focus(
          focusNode: focusNode,
          onFocusChange: (hasFocus) {
            if (!hasFocus && !isLoading) {
              onValidate(controller.text);
            }
          },
          child: TextField(
            style: const TextStyle(fontSize: 16, color: Color(0xFF1A1C1E)),
            cursorColor: isValid || focusNode.hasFocus
                ? const Color(0xFF0061A6)
                : const Color(0xFFBA1A1A),
            controller: controller,
            // enabled: !isLoading,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(
                color: isLoading
                    ? const Color(0xFF79747E).withOpacity(0.12)
                    : isValid
                        ? (focusNode.hasFocus
                            ? const Color(0xFF0061A6)
                            : const Color(0xFF43474E))
                        : const Color(0xFFBA1A1A),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: isLoading
                      ? const Color(0xFF79747E).withOpacity(0.12)
                      : const Color(0xFF43474E)),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              enabledBorder: _getBorder(isValid, false, isLoading, context),
              focusedBorder:
                  _getBorder(isValid, focusNode.hasFocus, isLoading, context),
              errorBorder: _getBorder(false, false, isLoading, context),
              // errorStyle: TextStyle(
              //     color: isValid ? customColors!.primary : customColors!.error),
              focusedErrorBorder: _getBorder(false, true, isLoading, context),
              // fillColor: Colors.grey.shade200,
              // filled: isLoading,
            ),
            obscureText: isObscure,
            onChanged: (value) {
              onChanged(value);
            },
          ),
        ),
        const SizedBox(height: 5),
        if (!isValid)
          Text(
            '$labelText is incorrect',
            style: const TextStyle(
                fontFamily: "Roboto", fontSize: 12, color: Color(0xFFBA1A1A)),
          ),
      ],
    );
  }
}

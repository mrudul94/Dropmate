import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool password;

  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.password = false,
  });

  @override
  AuthFieldState createState() => AuthFieldState();
}

class AuthFieldState extends State<AuthField> {
  bool _obscureText = true; // Default is true to hide the password

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon:
            widget.password
                ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
                : null, // Show icon only if it's a password field
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "${widget.hintText} is missing!";
        }
        return null;
      },
      controller: widget.controller,
      obscureText: widget.password ? _obscureText : false,
    );
  }
}

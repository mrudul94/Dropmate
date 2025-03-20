import 'package:dropmate/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AuthGradientButton extends StatelessWidget {
  final String buttonText;
  final Future<void> Function()? function;
  final Future<void> Function()? function2;
  const AuthGradientButton({
    super.key,
    required this.buttonText,
    this.function,
    this.function2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppPallete.gradient1, AppPallete.gradient2],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          fixedSize: Size(390, 55),
        ),
        onPressed: () async {
          if (function != null) await function!();
          if (function2 != null) await function2!();
        },
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

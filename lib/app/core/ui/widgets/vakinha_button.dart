import 'package:flutter/material.dart';

class VakinhaButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final double? width;
  final double? heigth;
  final Color? color;

  const VakinhaButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.width,
    this.heigth = 50,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heigth,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(), backgroundColor: color),
        child: Text(
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          label,
        ),
      ),
    );
  }
}

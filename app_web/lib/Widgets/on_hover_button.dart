import 'package:flutter/material.dart';

class OnHoverButton extends StatefulWidget {
  final Widget Function(bool isHovered) builder;

  const OnHoverButton(this.builder, {super.key});

  @override
  State<OnHoverButton> createState() => _OnHoverButtonState();
}

class _OnHoverButtonState extends State<OnHoverButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: widget.builder(isHovered),
    );
  }

  void onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}

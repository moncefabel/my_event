import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ImageDialog extends StatelessWidget {
  const ImageDialog(this.link, {Key? key}): super(key: key);
  final String link;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Image.network(
        link,
        fit: BoxFit.cover,
      ),
    );
  }
}
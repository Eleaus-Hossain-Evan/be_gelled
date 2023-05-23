import 'package:flutter/material.dart';

class KTitleText extends StatelessWidget {
  const KTitleText(this.title,
      {Key? key,
      this.fontSize,
      this.fontWeight,
      this.fontColor,
      this.style,
      this.maxLines})
      : super(key: key);

  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final TextStyle? style;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style ?? const TextStyle(),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}

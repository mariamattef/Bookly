import 'package:booklyapp/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(this.message, {super.key});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(message,style:Styles.textStyle18);
  }
}

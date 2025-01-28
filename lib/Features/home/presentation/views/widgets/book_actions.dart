import 'package:booklyapp/Core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(children: [
        Expanded(
            child: CustomButton(
          backgroundColor: Colors.white,
          color: Colors.black,
          text: '99.99 \$',
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        )),
        Expanded(
            child: CustomButton(
                backgroundColor: Color(0xffEF8262),
                color: Colors.white,
                text: 'Free Preview',
                fontSize: 16,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ))),
      ]),
    );
  }
}

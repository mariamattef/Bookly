import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       
        Text('Bookly',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

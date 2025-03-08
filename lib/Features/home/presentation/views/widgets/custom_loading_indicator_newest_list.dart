import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CutomLoadingIndicatorNewestList extends StatelessWidget {
  const CutomLoadingIndicatorNewestList({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          5,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(     
                color: const Color.fromARGB(31, 224, 224, 224),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    height: 110,
                    width: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(31, 224, 224, 224),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('data jklb xjksncjsk ncxckc'),
                        Text('Programming in Python'),
                        Text('Author: John Doe'),
                        Text('Price: 20\$'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

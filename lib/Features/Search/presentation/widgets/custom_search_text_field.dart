import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: 'Search',
          suffix: IconButton(
              onPressed: () {},
              icon: Opacity(
                opacity: .8,
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 22,
                  color: Colors.white.withOpacity(.8),
                ),
              )),
          enabledBorder: buildOutlneInputBorder(),
          focusedBorder: buildOutlneInputBorder()),
    );
  }

  OutlineInputBorder buildOutlneInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}

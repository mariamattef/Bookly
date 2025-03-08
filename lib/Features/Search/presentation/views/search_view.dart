import 'package:booklyapp/Features/Search/presentation/widgets/custom_text_field.dart';
import 'package:booklyapp/Features/Search/presentation/widgets/search_books_list_bloc_builder.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/utils/widgets/constants.dart';
import '../../../home/presentation/manager/search_books_cubit/search_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor, title: const Text("Search Books")),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: CustomTextField(),
          ),
          Expanded(child: SearchBooksListBlocBuilder()),
        ],
      ),
    );
  }
}

import 'package:booklyapp/Features/Search/presentation/widgets/custom_text_field.dart';
import 'package:booklyapp/Features/Search/presentation/widgets/search_books_list_bloc_builder.dart';
import 'package:flutter/material.dart';

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
        title: const Text("Search Books"),
      ),
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

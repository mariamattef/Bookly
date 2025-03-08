
import 'package:booklyapp/Features/home/presentation/manager/search_books_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: "Search for a book...",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            BlocProvider.of<SearchCubit>(context)
                .searchBooks(_searchController.text);
          },
        ),
      ),
      onChanged: (query) {
        BlocProvider.of<SearchCubit>(context).searchBooks(query);
      },
    );
  }
}

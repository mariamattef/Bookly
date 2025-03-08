
import 'package:booklyapp/Features/home/presentation/manager/search_books_cubit/search_cubit.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBooksListBlocBuilder extends StatelessWidget {
  const SearchBooksListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchInitial) {
                  return const Center(child: Text("Start typing to search..."));
                } else if (state is SearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchLoaded) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.books.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: BookListViewItem(books: state.books[index]),
                      );
                    },
                  );
                } else if (state is SearchError) {
                  return Center(child: Text("Error: ${state.message}"));
                }
                return const SizedBox();
              },
            );
  }
}
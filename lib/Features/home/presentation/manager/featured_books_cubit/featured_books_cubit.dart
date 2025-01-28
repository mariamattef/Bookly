import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booklyapp/Features/home/data/models/boook_model/boook.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repostries/home_repo.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBiooks() async {
    emit(FeaturedBooksLoading());
   var featuredBooks = await homeRepo.fetchFeaturedBooks();
      featuredBooks.fold(
        (failure) {
           emit( FeaturedBooksFailure(failure.errorMessage));
        },
        (books) => emit(FeaturedBooksSuccess( books)),
      );
  }
}

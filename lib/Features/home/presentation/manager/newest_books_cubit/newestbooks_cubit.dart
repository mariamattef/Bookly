import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repostries/home_repo.dart';


part 'newestbooks_state.dart';

class NewestbooksCubit extends Cubit<NewestbooksState> {
  NewestbooksCubit(this._homeRepo) : super(NewestbooksInitial());
  final HomeRepo _homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewestbooksLoading());
    var newestBooks = await _homeRepo.fetchNewestBooks();
    newestBooks.fold((failure) {
      emit(NewestbooksFailure(failure.errorMessage));
    }, (books) {
      emit(NewestbooksSuccess(books));
    });
  }



}

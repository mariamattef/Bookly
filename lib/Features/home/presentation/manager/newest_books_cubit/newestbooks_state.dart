part of 'newestbooks_cubit.dart';

sealed class NewestbooksState extends Equatable {
  const NewestbooksState();

  @override
  List<Object> get props => [];
}

final class NewestbooksInitial extends NewestbooksState {}

final class NewestbooksLoading extends NewestbooksState {}

final class NewestbooksSuccess extends NewestbooksState {
  final List<BookEntity> books;
 final BookEntity? bookId;

  const NewestbooksSuccess(this.books,{ this.bookId});
}

final class NewestbooksFailure extends NewestbooksState {
  final String error;

  const NewestbooksFailure(this.error);
}

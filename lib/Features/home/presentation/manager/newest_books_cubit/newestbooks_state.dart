part of 'newestbooks_cubit.dart';

sealed class NewestbooksState {
  const NewestbooksState();
}

final class NewestbooksInitial extends NewestbooksState {}

final class NewestbooksLoading extends NewestbooksState {}

final class NewestbooksPaginationLoading extends NewestbooksState {}

final class NewestbooksPaginationFailure extends NewestbooksState {
  final String errorMessage;

  const NewestbooksPaginationFailure(this.errorMessage);
}

final class NewestbooksSuccess extends NewestbooksState {
  final List<BookEntity> books;

  const NewestbooksSuccess(
    this.books,
  );
}

final class NewestbooksFailure extends NewestbooksState {
  final String error;

  const NewestbooksFailure(this.error);
}

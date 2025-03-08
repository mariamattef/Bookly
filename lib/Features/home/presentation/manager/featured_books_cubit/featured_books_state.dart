part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState {
  const FeaturedBooksState();
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksPaginationLoading extends FeaturedBooksState {
  final List<BookEntity> books;

  FeaturedBooksPaginationLoading(this.books);
}

final class FeaturedBooksPaginationFailure extends FeaturedBooksState {
  final String errorMessage;

  FeaturedBooksPaginationFailure(this.errorMessage);
}

final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;

  const FeaturedBooksSuccess(this.books);
}

final class FeaturedBooksFailure extends FeaturedBooksState {
  final String errorMessage;

  const FeaturedBooksFailure(this.errorMessage);
}

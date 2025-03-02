import 'package:booklyapp/Core/errors/failure.dart';
import 'package:booklyapp/Core/use_cases/use_case.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/repostries/home_repo.dart';
import 'package:dartz/dartz.dart';

class NewestBooksUseCase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;

  NewestBooksUseCase({required this.homeRepo});
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async {
    return await homeRepo.fetchNewestBooks();
  }
}

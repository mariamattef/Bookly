import 'package:booklyapp/Core/errors/failure.dart';
import 'package:booklyapp/Core/use_cases/use_case.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/repostries/home_repo.dart';
import 'package:dartz/dartz.dart';

class NewestBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  NewestBooksUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<BookEntity>>> call([int param=0]) async {
    return await homeRepo.fetchNewestBooks(pageNumber: param);
  }
}

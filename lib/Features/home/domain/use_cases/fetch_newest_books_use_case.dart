import 'package:dartz/dartz.dart';
import '../../../../Core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/book_entity.dart';
import '../repostries/home_repo.dart';

// class FetchNewestdBooksUseCase extends UseCase<List<BookEntity>, NoParam> {
//   final HomeRepo homeRepo;

//   FetchNewestdBooksUseCase({required this.homeRepo});

//   @override
//  Future<Either<Failure, List<BookEntity>>> call([NoParam param = const NoParam()]) async {
//     return await homeRepo.fetchNewestBooks();
//   }
// }

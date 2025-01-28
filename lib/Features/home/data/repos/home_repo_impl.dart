import 'package:booklyapp/Core/errors/failure.dart';
import 'package:booklyapp/Core/utils/api_service.dart';
import 'package:booklyapp/Features/home/data/models/boook_model/boook.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/repostries/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<Boook>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Boook>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endpoint:
              'volumes?q=subject:Programming&filtering=free-ebooks&sorting=newest');
      List<Boook> books = [];
      data['items'].forEach((item) {
        books.add(Boook.fromMap(item));
      });
      return right(books);
    } catch (e) {
      return left(ServerFailure());
    }
  }
}

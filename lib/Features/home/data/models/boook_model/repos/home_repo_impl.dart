import 'package:booklyapp/Core/errors/failure.dart';
import 'package:booklyapp/Features/home/data/models/boook_model/boook.dart';
import 'package:booklyapp/Features/home/data/models/boook_model/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl  extends HomeRepo{
  @override
  Future<Either<Failure, List<Boook>>> featchBestSellerBooks() {
    // TODO: implement featchBestSellerBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Boook>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}
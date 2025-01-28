import 'package:booklyapp/Core/errors/failure.dart';
import 'package:booklyapp/Features/home/data/models/boook_model/boook.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Boook>>> featchNewestBooks();
  Future<Either<Failure, List<Boook>>> fetchFeaturedBooks();
}

import 'package:bloc/bloc.dart';
import 'package:booklyapp/Core/utils/api_service.dart';
import 'package:booklyapp/Features/home/data/models/boook_model/boook.dart';
import 'package:booklyapp/Features/home/data/repos/home_repo_impl.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit() : super(FeaturedBooksInitial());
 
}

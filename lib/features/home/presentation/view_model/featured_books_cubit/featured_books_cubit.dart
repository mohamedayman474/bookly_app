
import 'package:bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/view_model/featured_books_cubit/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repository/home_repo.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit( this.featuredBooksUseCase) : super(FeaturedBooksInitial());

final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumber=0}) async {
    if(pageNumber==0){
      emit(FeaturedBooksLoading());
    }else{
      emit(FeaturedBooksPaginationLoading());
    }

    var result = await featuredBooksUseCase.call(pageNumber);
    result.fold((failure) {
      if(pageNumber==0){
        emit(FeaturedBooksFailure(failure.errMessage));
      }else{
        emit(FeaturedBooksPaginationFailure(failure.errMessage));
      }
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}

import 'package:bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/view_model/newest_books_cubit/newest_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repository/home_repo.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit( this.fetchNewestBooksUseCase)
      : super(NewestBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks({int pageNumber=0}) async {
    if(pageNumber==0){
      emit(NewestBooksLoading());
    }else{
      emit(NewestBooksPaginationLoading());
    }
    var result = await fetchNewestBooksUseCase.call(pageNumber);
    result.fold((failure) {
      if(pageNumber==0){
        emit(NewestBooksFailure(failure.errMessage));
      }else{
        emit(NewestBooksPaginationFailure(failure.errMessage));
      }
      }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}

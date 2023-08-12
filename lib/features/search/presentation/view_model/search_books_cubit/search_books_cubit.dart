import 'package:bookly_app/features/search/presentation/view_model/search_books_cubit/search_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repository/search_repo.dart';

class SearchBooksCubit extends Cubit<SearchBooksState>{
  SearchBooksCubit(this.searchRepo):super(SearchedBooksInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchedBooks({required String text})async {
    emit(SearchedBooksLoading());
    var result =await searchRepo.fetchSearchedBooks(bookName: text);
    result.fold((failure) {
      emit(SearchedBooksFailure(failure.errMessage));
    }, (books) {
      emit(SearchedBooksSuccess(books));
    });

  }
}
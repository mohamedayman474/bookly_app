import 'package:equatable/equatable.dart';

import '../../../data/models/book_model/book_model.dart';

class SimilarBooksState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksFailure extends SimilarBooksState {
  final String errMessage;

  SimilarBooksFailure(this.errMessage);
}

class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> books;

  SimilarBooksSuccess(this.books);
}

class SimilarBooksLoading extends SimilarBooksState {}

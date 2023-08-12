import 'package:bookly_app/features/home/domain/Entity/book_entity.dart';



abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksFailure extends SimilarBooksState {
  final String errMessage;

  SimilarBooksFailure(this.errMessage);
}

class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookEntity> books;

  SimilarBooksSuccess(this.books);
}

class SimilarBooksLoading extends SimilarBooksState {}

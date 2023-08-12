import '../../../../home/domain/Entity/book_entity.dart';

abstract class SearchBooksState {}
class SearchedBooksInitial extends SearchBooksState{}
class SearchedBooksLoading extends SearchBooksState{}
class SearchedBooksFailure extends SearchBooksState{
  final String errMessage;

  SearchedBooksFailure(this.errMessage);
}
class SearchedBooksSuccess extends SearchBooksState{
  final List<BookEntity> books;

  SearchedBooksSuccess(this.books);
}
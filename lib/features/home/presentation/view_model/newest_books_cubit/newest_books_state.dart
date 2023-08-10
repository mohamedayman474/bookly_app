

import 'package:bookly_app/features/home/domain/Entity/book_entity.dart';


abstract class NewestBooksState  {}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksFailure extends NewestBooksState {
  final String errMessage;

   NewestBooksFailure(this.errMessage);
}

class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> books;

   NewestBooksSuccess(this.books);
}

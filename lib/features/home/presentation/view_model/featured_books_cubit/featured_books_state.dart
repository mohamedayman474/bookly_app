

import 'package:bookly_app/features/home/domain/Entity/book_entity.dart';


abstract class FeaturedBooksState {}
class FeaturedBooksInitial extends FeaturedBooksState{}
class FeaturedBooksLoading extends FeaturedBooksState{}
class FeaturedBooksFailure extends FeaturedBooksState{
  final String errMessage;

   FeaturedBooksFailure(this.errMessage);
}
class FeaturedBooksSuccess extends FeaturedBooksState{
  final List<BookEntity> books;

  FeaturedBooksSuccess(this.books);
}
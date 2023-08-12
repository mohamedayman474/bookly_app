import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../Entity/book_entity.dart';

abstract class HomeRepo{
  Future<Either <Failure,List<BookEntity>>> fetchFeaturedBooks({int pageNumber=0});
  Future<Either <Failure,List<BookEntity>>> fetchNewestBooks({int pageNumber=0});
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks(
      {required String category});

}
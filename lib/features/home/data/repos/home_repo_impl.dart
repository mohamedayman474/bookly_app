import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/home_remote_data_source.dart';

import 'package:bookly_app/features/home/domain/Entity/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/repository/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  HomeRepoImpl({required this.homeRemoteDataSource,required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber=0})async {
    try{
      List<BookEntity> books;
      books=homeLocalDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      if(books.isNotEmpty){
        return right(books);
      }
      books= await homeRemoteDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      return right(books);
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));

    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({int pageNumber=0})async {
    try{
      List<BookEntity> books;
      books=homeLocalDataSource.fetchNewestBooks(pageNumber: pageNumber);
      if(books.isNotEmpty){
        return right(books);
      }
      books= await homeRemoteDataSource.fetchNewestBooks(pageNumber:pageNumber);
      return right(books);
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({required String category}) async{
    try{
      List<BookEntity> books;
      books=homeLocalDataSource.fetchSimilarBooks();
      if(books.isNotEmpty){
        return right(books);
      }
      books= await homeRemoteDataSource.fetchSimilarBooks();
      return right(books);
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
}
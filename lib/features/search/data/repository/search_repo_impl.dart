import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/domain/Entity/book_entity.dart';
import 'package:bookly_app/features/search/data/data_Sources/search_local_data_source.dart';
import 'package:bookly_app/features/search/domain/repository/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../data_Sources/search_remote_data_source.dart';

class SearchRepoImpl implements SearchRepo{
  final SearchLocalDataSource searchLocalDataSource;
  final SearchRemoteDataSource searchRemoteDataSource;
  SearchRepoImpl({required this.searchRemoteDataSource,required this.searchLocalDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchSearchedBooks({required String bookName})async {
    try{
      List<BookEntity> books;
      books=searchLocalDataSource.fetchSearchedBooks(bookName: bookName);
      if(books.isNotEmpty){
        return right(books);
      }
      books= await searchRemoteDataSource.fetchSearchedBooks(bookName: bookName);
      return right(books);
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));

    }
  }
}

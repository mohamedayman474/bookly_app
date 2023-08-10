import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz_unsafe.dart';

import '../../../../core/utils/fuctions/save_books_data.dart';
import '../../domain/Entity/book_entity.dart';

abstract class HomeRemoteDataSource{
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
  Future<List<BookEntity>> fetchSimilarBooks();
}
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks()async {
    var data= await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=subject:Programming');
    List<BookEntity> books =getBooksList(data);
    saveBooksData(books,kFeaturedBox);
    return books;

  }

  @override
  Future<List<BookEntity>> fetchNewestBooks()async {
   var data= await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');
   List<BookEntity> books =getBooksList(data);
   saveBooksData(books, kNewestBox);
   return books;
  }
  
  @override
  Future<List<BookEntity>> fetchSimilarBooks()async {
    var data=await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming');
    List<BookEntity> books= getBooksList(data);
    saveBooksData(books, kSimilarBox);
    return books;

  }



  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }



}
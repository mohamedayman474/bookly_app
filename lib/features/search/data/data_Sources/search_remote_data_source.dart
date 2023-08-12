import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_service.dart';

import '../../../../core/utils/fuctions/get_books_list.dart';
import '../../../../core/utils/fuctions/save_books_data.dart';
import '../../../home/data/models/book_model/book_model.dart';
import '../../../home/domain/Entity/book_entity.dart';

abstract class SearchRemoteDataSource{
  Future<List<BookEntity>> fetchSearchedBooks({required String bookName});

}
class SearchRemoteDataSourceImpl extends SearchRemoteDataSource{
  final ApiService apiService;
  SearchRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchSearchedBooks({required String bookName})async {
    var data=await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=subject:Programming&intitle$bookName');
    List<BookEntity> books= getBooksList(data);
    saveBooksData(books, kFeaturedBox);
    return books;


  }

}
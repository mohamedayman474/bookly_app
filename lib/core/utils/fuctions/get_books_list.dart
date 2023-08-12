import '../../../features/home/data/models/book_model/book_model.dart';
import '../../../features/home/domain/Entity/book_entity.dart';

List<BookEntity> getBooksList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  for (var item in data['items']) {
    books.add(BookModel.fromJson(item));
  }
  return books;
}
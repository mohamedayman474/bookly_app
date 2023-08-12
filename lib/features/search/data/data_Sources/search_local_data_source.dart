
import 'package:bookly_app/constants.dart';
import 'package:hive/hive.dart';

import '../../../home/domain/Entity/book_entity.dart';

abstract class SearchLocalDataSource{
  List<BookEntity> fetchSearchedBooks({required String bookName});

}
class SearchLocalDataSourceImpl extends SearchLocalDataSource{
  @override
  List<BookEntity> fetchSearchedBooks({required String bookName}) {
    var box=Hive.box<BookEntity>(kFeaturedBox);
    return box.values.toList();
  }


}
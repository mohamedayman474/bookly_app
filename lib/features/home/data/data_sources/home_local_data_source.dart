import 'package:hive/hive.dart';

import '../../../../constants.dart';
import '../../domain/Entity/book_entity.dart';

abstract class HomeLocalDataSource{
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity>fetchNewestBooks();
  List<BookEntity> fetchSimilarBooks();


}
 class HomeLocalDataSourceImpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBooks() {
var box=Hive.box<BookEntity>(kFeaturedBox);
return box.values.toList();

  }

  @override
  List<BookEntity> fetchNewestBooks() {
   var box=Hive.box<BookEntity>(kNewestBox);
   return box.values.toList();
  }


  @override
  List<BookEntity> fetchSimilarBooks() {
    var box=Hive.box<BookEntity>(kSimilarBox);
    return box.values.toList();
  }
}
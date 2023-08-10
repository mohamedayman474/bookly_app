import 'package:hive/hive.dart';

import '../../../features/home/domain/Entity/book_entity.dart';

void saveBooksData(List<BookEntity> books ,String boxName){
  var box=Hive.box(boxName);
  box.addAll(books);
}
import 'package:flutter/material.dart';

import '../../../../home/domain/Entity/book_entity.dart';
import '../../../../home/presentation/views/widgets/book_list_view_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics:  const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: books.length,
        itemBuilder: (context,index){
          return  Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: BookListViewItem(bookEntity: books[index],),
          );
        });
  }
}
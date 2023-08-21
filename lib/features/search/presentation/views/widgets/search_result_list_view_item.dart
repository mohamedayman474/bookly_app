import 'package:bookly_app/features/home/domain/Entity/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';

class SearchResultListViewItem extends StatelessWidget {
  const SearchResultListViewItem({Key? key, required this.bookEntity}) : super(key: key);
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8,left: 8),
      child: BookListViewItem(bookEntity: bookEntity),
    );
  }
}

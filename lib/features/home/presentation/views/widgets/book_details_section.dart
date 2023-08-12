import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/Entity/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.bookEntity}) : super(key: key);
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: CustomBookImage(
            imageUrl: bookEntity.image ?? '',
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          bookEntity.title?? '',
          textAlign: TextAlign.center,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        Opacity(
            opacity: .7,
            child: Text(
              bookEntity.authorName?? '',
              style: Styles.textStyle18.copyWith(fontStyle: FontStyle.italic),
            )),
        const SizedBox(
          height: 18,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: bookEntity.rating ?? 0,
          countRating: bookEntity.ratingsCount ?? 0,
        ),
        const SizedBox(
          height: 37,
        ),
         BooksAction(bookEntity: bookEntity,),
      ],
    );
  }
}

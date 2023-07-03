import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child:  Column(
        children: [
          const CustomBookDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.2),
            child: const CustomBookImage(),
          ),
           const SizedBox(height: 43,),
            Text('The Jungle Book',style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),),
          const SizedBox(height: 8,),
           Opacity(opacity: .7,
              child:  Text('Rudyard Kipling',style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic
              ),)),
           const SizedBox(height: 18,),
           const BookRating(mainAxisAlignment: MainAxisAlignment.center,),
          const SizedBox(height: 37,),
          const BooksAction()
        ],
      ),
    );
  }
}

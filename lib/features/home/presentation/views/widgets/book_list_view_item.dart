import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/Entity/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class BookListViewItem extends StatelessWidget {
  const BookListViewItem({Key? key, required this.bookEntity}) : super(key: key);
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: bookEntity);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
         CustomBookImage(imageUrl: bookEntity.image ?? ''),
            const SizedBox(width: 30,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.5,
                    child:  Text(bookEntity.title?? ''
                    ,maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(fontFamily: kGtSectraFine),),
                  ),
                  const SizedBox(height: 3,),
                   Text(bookEntity.authorName?? '',style: Styles.textStyle14,),
                  const SizedBox(height: 3,),
                  Row(
                    children:   [
                      Text('Free',style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold)),
                      const Spacer(),
                       BookRating(
                        rating:bookEntity.rating ?? 0 ,
                         countRating: bookEntity.ratingsCount?? 0,
                      ),
                    ],)

                ],
              ),
            )

          ],
        ),

      ),
    );
  }
}

import 'package:bookly_app/core/utils/fuctions/launch_url.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/domain/Entity/book_entity.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key, required this.bookEntity}) : super(key: key);
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              text: 'Free',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12)),

            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async{
                launchCustomUrl(context, bookEntity.previewLink);
               },
              text: getText(bookEntity),
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(topRight: Radius.circular(12),bottomRight: Radius.circular(12)),
            fontSize: 16,),
          )
        ],
      ),
    );
  }

 String getText(BookEntity bookEntity) {
    if(bookEntity.previewLink == null){
      return 'Not Available';
    }else{
      return 'Preview';
    }
 }
}


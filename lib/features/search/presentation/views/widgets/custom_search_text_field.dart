import 'package:bookly_app/features/home/domain/Entity/book_entity.dart';
import 'package:bookly_app/features/search/presentation/view_model/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/styles.dart';
class CustomSearchTextField extends StatelessWidget {
   CustomSearchTextField({super.key, required this.searchBooksCubit,  });
   final TextEditingController textEditingController=TextEditingController();
   final SearchBooksCubit searchBooksCubit;

 late BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            hintText: 'Search',
            suffixIcon: IconButton(
              onPressed: () {
                searchBooksCubit.fetchSearchedBooks(text: textEditingController.text);
              },
              icon: const Opacity(
                opacity: .8,
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.grey,
                  size: 22,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            "Search Result :",
            style: Styles.textStyle20,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(
        12,
      ),
    );
  }
}

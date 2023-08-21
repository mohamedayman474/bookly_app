import 'package:bookly_app/features/search/presentation/view_model/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/view_model/search_books_cubit/search_books_state.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSearchTextField(),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Search Results :',
              style: Styles.textStyle16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<SearchBooksCubit, SearchBooksState>(
            builder: (context, state) {
              return const SearchResultListView();
            },
          ),
        ],
      ),
    );
  }
}



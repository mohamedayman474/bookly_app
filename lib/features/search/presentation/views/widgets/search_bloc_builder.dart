import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../home/presentation/views/widgets/book_list_view_item.dart';
import '../../view_model/search_books_cubit/search_books_cubit.dart';
import '../../view_model/search_books_cubit/search_books_state.dart';
import 'custom_search_text_field.dart';

class SearchBlocBuilder extends StatelessWidget {
  const SearchBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SearchBooksCubit , SearchBooksState>(
      builder: (context,state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchTextField( searchBooksCubit: BlocProvider.of<SearchBooksCubit>(context)),
            if(state is SearchedBooksSuccess)
              Expanded(
                  child:ListView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: state.books.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: BookListViewItem(bookEntity: state.books[index],),
                      );
                    },
                  )
              ),
            //
            if (state is SearchedBooksFailure)
              CustomErrorWidget( errMessage: state.errMessage),
            if(state is SearchedBooksLoading )
              const CustomLoadingIndicator(),

          ]);
      },
    );
  }
}

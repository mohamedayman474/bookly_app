import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/search/presentation/view_model/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/view_model/search_books_cubit/search_books_state.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_result_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../home/presentation/views/widgets/book_list_view_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit,SearchBooksState>(
        builder: (context,state){
          if(state is SearchedBooksInitial){
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 200),
                    Icon(
                      Icons.search,
                      size: MediaQuery.of(context).size.width * 0.25,
                      color: Colors.white.withOpacity(0.7),
                    ),
                    Text(
                      'Please enter book name',
                      style: Styles.textStyle20.copyWith(
                        fontSize: 23,
                        color: Colors.white.withOpacity(0.7),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }
      else if(state is SearchedBooksSuccess){
        return ListView.builder(
          scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics:  const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context,index){
              return  Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: (){
                    GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: state.books[index]);
                  },
                    child: SearchResultListViewItem(bookEntity: state.books[index],)),
              );
            });
      }else if(state is SearchedBooksFailure){
        return CustomErrorWidget(errMessage: state.errMessage);
      }else{
        return const CustomLoadingIndicator();
      }
    });
  }
}

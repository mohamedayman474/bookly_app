import 'package:bookly_app/features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_model/featured_books_cubit/featured_books_state.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/feature_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/fuctions/build_error_snack_bar.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../domain/Entity/book_entity.dart';

class FeaturedBooksListViewBlocConsumer extends StatefulWidget {
   const FeaturedBooksListViewBlocConsumer({Key? key}) : super(key: key);

  @override
  State<FeaturedBooksListViewBlocConsumer> createState() => _FeaturedBooksListViewBlocConsumerState();
}

class _FeaturedBooksListViewBlocConsumerState extends State<FeaturedBooksListViewBlocConsumer> {
  final List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit,FeaturedBooksState>(
      listener: (context,state){
        if(state is FeaturedBooksSuccess ){
          books.addAll(state.books);
        }
        if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorWidget(state.errMessage),
          );
        }
      },
        builder: (context,state){
          if(state is FeaturedBooksSuccess ||
              state is FeaturedBooksPaginationLoading||
          state is FeaturedBooksPaginationFailure){
            return  FeaturedBooksListView(books:books);
          }else if(state is FeaturedBooksFailure){
            return CustomErrorWidget(errMessage: state.errMessage);
          } else {
            return const CustomLoadingIndicator();
          }


        });
  }
}

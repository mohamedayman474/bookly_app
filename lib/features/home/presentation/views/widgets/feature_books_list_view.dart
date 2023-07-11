import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_model/featured_books_cubit/featured_books_state.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit,FeaturedBooksState>(
        builder: (context,state){
      if(state is FeaturedBooksSuccess){
        return SizedBox(
          height: MediaQuery.of(context).size.height*0.3,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: CustomBookImage(),
                );
              }),
        );

      }else if(state is FeaturedBooksFailure){
        return CustomErrorWidget(errMessage: state.errMessage);
      }else{
        return const CustomLoadingIndicator();
      }

    });

  }
}

import 'package:bookly_app/features/search/presentation/view_model/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/domain/Entity/book_entity.dart';

class SearchView extends StatelessWidget {
   const SearchView({super.key});


  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(
        child: SearchViewBody(),
      ),
    );
  }
}

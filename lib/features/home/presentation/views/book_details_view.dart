import 'package:bookly_app/features/home/domain/Entity/book_entity.dart';
import 'package:bookly_app/features/home/presentation/view_model/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({Key? key, required this.bookEntity}) : super(key: key);
  final BookEntity bookEntity;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    super.initState();
  BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(category: widget.bookEntity.categories ?? '');
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: BookDetailsViewBody(bookEntity: widget.bookEntity,)),
    );
  }
}

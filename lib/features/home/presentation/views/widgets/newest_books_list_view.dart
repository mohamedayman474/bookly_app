import 'package:bookly_app/features/home/presentation/view_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/Entity/book_entity.dart';

class NewestBooksListView extends StatefulWidget {
  const NewestBooksListView({Key? key,required this.books}) : super(key: key);
 final List<BookEntity> books;

  @override
  State<NewestBooksListView> createState() => _NewestBooksListViewState();
}

class _NewestBooksListViewState extends State<NewestBooksListView> {
  late final ScrollController _scrollController;
  int nextPage=1;
  bool isLoading= false;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }
  void _scrollListener()async{
    var currentPosition=_scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if(currentPosition >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading=true;
        await BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(
            pageNumber: nextPage++);
        isLoading=false;
      }
    }
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
        physics:  const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: widget.books.length,
        itemBuilder: (context,index){
          return  Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: BookListViewItem(bookEntity: widget.books[index],),
          );
        });

  }
}

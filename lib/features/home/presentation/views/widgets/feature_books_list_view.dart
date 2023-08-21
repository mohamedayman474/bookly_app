import 'package:bookly_app/features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../domain/Entity/book_entity.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({Key? key, required this.books}) : super(key: key);
  final List<BookEntity> books;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
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
         await BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks(
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          itemCount: widget.books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(

                onTap: (){
                  GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: widget.books[index]);
                },
                child: CustomBookImage(
                  imageUrl:
                  widget.books[index].image ?? '',
                ),
              ),
            );
          }),
    );
  }
}

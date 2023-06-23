import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/feature_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/feature_books_list_view.dart';
import 'package:flutter/material.dart';

import 'bestSeller_listView_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomAppBar(),
          FeaturedBooksListView(),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Text('Best Seller',
              style: Styles.textStyle18,),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerListViewItem(),
          ),
        ],
      );
  }
}

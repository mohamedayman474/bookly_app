import 'package:bookly_app/features/home/presentation/views/widgets/bestSeller_listView_item.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics:  const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 4,
        itemBuilder: (context,index){
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BestSellerListViewItem(),
        );
        });
  }
}

import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
        AspectRatio(
        aspectRatio: 2.5/4,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(16),
              image:const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(AssetsData.testImage)

              )
          ),
        ),
      ),
          Column(
            children: [

            ],
          )

        ],
      ),

    );
  }
}

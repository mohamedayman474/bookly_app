import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,vertical: 40
      ),
      child: Row(
        children: [
          Image.asset(AssetsData.logo,
          height: 18,),
          const Spacer(),
          IconButton(onPressed: (){},
              icon:
              const Icon(FontAwesomeIcons.magnifyingGlass,
                size: 22,))
        ],
      ),
    );
  }
}

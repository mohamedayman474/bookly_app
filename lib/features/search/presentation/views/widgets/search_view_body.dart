
import 'package:bookly_app/features/search/presentation/views/widgets/search_bloc_builder.dart';
import 'package:flutter/material.dart';


class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff100e20),
          title: const Text('Search book'),
          centerTitle: true,
        ),
        body: const SearchBlocBuilder());
  }
}


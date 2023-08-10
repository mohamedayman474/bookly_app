import 'package:bookly_app/features/home/domain/repository/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../Entity/book_entity.dart';



class FetchSimilarBooksUseCase extends UseCase<List<BookEntity>,String>{
  final  HomeRepo homeRepo;

  FetchSimilarBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([String? param]) async{
    return await homeRepo.fetchSimilarBooks(category: param?? '');
  }
}


import 'package:bookly_app/features/home/domain/Entity/book_entity.dart';
import 'package:bookly_app/features/home/domain/repository/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>,int>{
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param=0]) async{
   return await homeRepo.fetchFeaturedBooks(
     pageNumber: param
   );
  }
}

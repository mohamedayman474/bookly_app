import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/use_case/use_case.dart';
import 'package:bookly_app/features/home/domain/Entity/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly_app/features/home/domain/repository/home_repo.dart';



class FetchNewestBooksUseCase extends UseCase<List<BookEntity>,NoParam>{
  final  HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async{
    return await homeRepo.fetchNewestBooks();
  }
}
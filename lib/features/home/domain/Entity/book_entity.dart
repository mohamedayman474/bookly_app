import 'package:equatable/equatable.dart';

class BookEntity extends Equatable {
  final String? image;
  final String? title;
  final String? authorName;
  final num? price;
  final num? rating;

  const BookEntity(
      this.image, this.title, this.authorName, this.price, this.rating);

  @override
  List<Object?> get props => [image, title, authorName, price, rating];
}

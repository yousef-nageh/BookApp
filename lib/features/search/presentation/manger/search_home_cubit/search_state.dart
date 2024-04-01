

import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchWaitingState extends SearchState {}
class SearchSuccessState extends SearchState {

  final List<BookEntity> model;

  SearchSuccessState(this.model);
}
class SearchErrorState extends SearchState {

  final String errorMassage;

  SearchErrorState(this.errorMassage);
}


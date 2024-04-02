import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';




abstract class UpperListStates{}

class StartState extends UpperListStates{}

class GetUpperListWaitingState extends UpperListStates{}

class GetUpperListSuccessState extends UpperListStates{

  final List<BookEntity> upperBooks;

  GetUpperListSuccessState(this.upperBooks);
}

class GetUpperListErrorState extends UpperListStates{

  final String errorMessage;

  GetUpperListErrorState(this.errorMessage);
}


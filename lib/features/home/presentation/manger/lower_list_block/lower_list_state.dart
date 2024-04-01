
import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';



abstract class LowerListStates {}

class LowerListInitial extends LowerListStates {}

class GetLowerListWaitingState extends LowerListStates{}

class GetLowerListSuccessState extends LowerListStates{

  final List<BookEntity> lowerBooks;

  GetLowerListSuccessState(this.lowerBooks);
}

class GetLowerListErrorState extends LowerListStates{

  final String errorMessage;

  GetLowerListErrorState(this.errorMessage);
}

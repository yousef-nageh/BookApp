


abstract class BookDetailsStates {}

final class BookDetailsInitial extends BookDetailsStates {}
final class BookDetailsGetRelatedBooksSuccessState extends BookDetailsStates {

}
final class BookDetailsGetRelatedBooksWaitingState extends BookDetailsStates {}
final class BookDetailsGetRelatedBooksErrorState extends BookDetailsStates {
  final String mess;

  BookDetailsGetRelatedBooksErrorState(this.mess);
}
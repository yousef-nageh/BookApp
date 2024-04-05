import 'package:bookly_app_with_mvvm/features/details/domain/use_cases/get_related_books_use_case.dart';
import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsStates> {
  BookDetailsCubit(this.getRelatedBooksUseCase) : super(BookDetailsInitial());
  GetRelatedBooksUseCase getRelatedBooksUseCase;

  static BookDetailsCubit instance(BuildContext context) =>
      BlocProvider.of(context);
List<BookEntity>bookList =[];
  Future<void> getRelatedBooks(
    String category,
  ) async {
    var result = await getRelatedBooksUseCase.call(category);
    result.fold(
        (error) =>
            emit(BookDetailsGetRelatedBooksErrorState(error.errorMessage)),
        (list) {
          bookList=list;
          emit(BookDetailsGetRelatedBooksSuccessState());
        });
  }
}

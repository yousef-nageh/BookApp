import 'package:bookly_app_with_mvvm/features/details/domain/use_cases/get_related_books_use_case.dart';
import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../app/functions/show_snack_bar.dart';
import '../../../../../core/utils/app_string.dart';
import 'book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsStates> {
  BookDetailsCubit(this.getRelatedBooksUseCase) : super(BookDetailsInitial());
  GetRelatedBooksUseCase getRelatedBooksUseCase;

  static BookDetailsCubit instance(BuildContext context) =>
      BlocProvider.of(context);
  List<BookEntity>bookList = [];

  Future<void> getRelatedBooks(String category,) async {
    emit(BookDetailsGetRelatedBooksWaitingState());
    var result = await getRelatedBooksUseCase.call(category);
    result.fold(
            (error) =>
            emit(BookDetailsGetRelatedBooksErrorState(error.errorMessage)),
            (list) {
          bookList = list;
          emit(BookDetailsGetRelatedBooksSuccessState());
        });
  }

  void showBook(BuildContext context, String link) async {
    Uri uri = Uri.parse(link);
    !await launchUrl(uri).catchError((error) {
      showCustomSnackBar(context, AppString.couldNotLaunch);
      return false;
    });
  }
}

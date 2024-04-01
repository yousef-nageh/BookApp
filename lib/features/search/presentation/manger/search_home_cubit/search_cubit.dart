
import 'package:bookly_app_with_mvvm/features/home/domain/use_cases/search_book_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchBooksUseCase searchBooksUseCase;

  SearchCubit(this.searchBooksUseCase) : super(SearchInitial());

  Future<void> searchForBook({required String param}) async {
    emit(SearchWaitingState());
    var result = await searchBooksUseCase.call(param);
    result.fold((l) {
      emit(SearchErrorState(l.errorMessage));
    }, (r) {
      emit(SearchSuccessState(r));
    });
  }
}

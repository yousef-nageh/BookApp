
import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_mvvm/features/search/domain/use_cases/search_book_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchBooksUseCase searchBooksUseCase;

  SearchCubit(this.searchBooksUseCase) : super(SearchInitial());
  final formKey= GlobalKey<FormState>();
  List<BookEntity> searchBooks=[];
  ScrollController controller =ScrollController();
int nextPage=1;

void setController(String param){

  controller.addListener(() {
    if (controller.hasClients) {
      if(controller.position.maxScrollExtent==controller.offset){
        searchForBook(param:param ,pageNumber:nextPage );
        nextPage++;
      }
    }
  });
}
static  SearchCubit instance(BuildContext context)=>BlocProvider.of(context);
  Future<void> searchForBook({required String param,int pageNumber=0}) async {
    if (pageNumber==0) {
      emit(SearchWaitingState());
    }else{
      emit(SearchPaginationWaitingState());
    }
    var result = await searchBooksUseCase.call(param,pageNumber:pageNumber );
    result.fold((l) {
      emit(SearchErrorState(l.errorMessage));
    }, (r) {

      searchBooks.addAll(r);
      emit(SearchSuccessState(r));
    });
  }
  void onSubmit (String value){
    if(formKey.currentState?.validate()==true){
      setController (value);
      searchForBook(param:value );
      searchBooks.clear();
      nextPage=1;


    }
  }
  void onTap(){

    emit(SearchInitial());
    controller.dispose();
    controller=ScrollController();
  }
}

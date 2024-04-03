

import 'package:bookly_app_with_mvvm/features/home/domain/use_cases/lower_list_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../domain/entities/book_entity.dart';
import 'lower_list_state.dart';



class LowerListCubit extends Cubit<LowerListStates> {
  LowerListCubit(this.lowerListUseCase) : super(LowerListInitial());
LowerListUseCase lowerListUseCase;
static LowerListCubit instance(BuildContext context)=>BlocProvider.of(context);
final ScrollController controller =ScrollController();
int nextPage=1;
List<BookEntity> lowerBooks=[];

  Future<void> getLowerListData({int pageNumber=0}) async {
    if (pageNumber==0) {
      emit(GetLowerListWaitingState());
    }else{
      emit(GetLowerListWithPaginationWaitingState());
    }
    var result = await lowerListUseCase.call(pageNumber);

    result.fold((l) {
      emit(GetLowerListErrorState(l.errorMessage));

    }, (bookList) {
      lowerBooks.addAll(bookList);
      emit(GetLowerListSuccessState());

    });
  }
  void setScrollController(){
    controller.addListener(() {
      if(controller.position.maxScrollExtent==controller.offset){
        getLowerListData(pageNumber: nextPage);
        nextPage++;
      }
    });
  }

}

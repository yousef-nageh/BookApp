import 'package:bookly_app_with_mvvm/features/home/domain/use_cases/upper_list_use_case.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import 'upper_list_states.dart';

class UpperListCubit extends Cubit<UpperListStates> {
  UpperListCubit(this.upperListUseCase) : super(StartState());
  final UpperListUseCase upperListUseCase;
  static UpperListCubit instance(BuildContext context)=>BlocProvider.of(context);
    int nextPage=1;
List <BookEntity> upperBooks=[];
final  controller=ScrollController();

  Future<void> getUpperListData({int pageNumber=0}) async {
    if (pageNumber==0) {
      emit(GetUpperListWaitingState());
    }else{
      emit(GetUpperListPaginationWaitingState());
    }
    var result = await upperListUseCase.call(pageNumber);

    result.fold((failure) {
      emit(GetUpperListErrorState(failure.errorMessage));
    }, (booksModel) {
      upperBooks.addAll(booksModel);
      emit(GetUpperListSuccessState());
    });
  }

  void startController() {
    controller.addListener(() {
      if(controller.position.maxScrollExtent==controller.offset){
        getUpperListData(pageNumber:nextPage );
        nextPage++;
        print(nextPage);
      }
    });
  }
}

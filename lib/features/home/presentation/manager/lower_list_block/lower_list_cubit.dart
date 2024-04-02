

import 'package:bookly_app_with_mvvm/features/home/domain/use_cases/lower_list_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'lower_list_state.dart';



class LowerListCubit extends Cubit<LowerListStates> {
  LowerListCubit(this.lowerListUseCase) : super(LowerListInitial());
LowerListUseCase lowerListUseCase;

  Future<void> getLowerListData() async {
    emit(GetLowerListWaitingState());
    var result = await lowerListUseCase.call();

    result.fold((l) {
      emit(GetLowerListErrorState(l.errorMessage));

    }, (r) {
      emit(GetLowerListSuccessState(r));

    });
  }


}

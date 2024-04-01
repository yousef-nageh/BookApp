



import 'package:bookly_app_with_mvvm/features/home/domain/use_cases/upper_list_use_case.dart';
import 'package:bookly_app_with_mvvm/features/home/presentation/manger/upper_list_block/upper_list_states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/home_repo.dart';

class UpperListCubit extends Cubit<UpperListStates> {
  UpperListCubit(this.upperListUseCase) : super(StartState());
  final UpperListUseCase upperListUseCase;

  Future<void> getUpperListData() async {
    emit(GetUpperListWaitingState());
    var result = await upperListUseCase.call();

    result.fold((failure) {
      emit(GetUpperListErrorState(failure.errorMessage));

    }, (booksModel) {
      emit(GetUpperListSuccessState(booksModel));
      
    });
  }








}



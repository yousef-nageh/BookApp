import 'package:bookly_app_with_mvvm/app/class/cache_helper.dart';
import 'package:bookly_app_with_mvvm/app/class/firebase_service.dart';
import 'package:bookly_app_with_mvvm/app/functions/service_locator.dart';
import 'package:bookly_app_with_mvvm/app/functions/show_snack_bar.dart';
import 'package:bookly_app_with_mvvm/config/extension.dart';
import 'package:bookly_app_with_mvvm/config/routes/routes.dart';
import 'package:bookly_app_with_mvvm/features/home/domain/use_cases/upper_list_use_case.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constance.dart';
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

      }
    });
  }
  Future <void>userLogout(BuildContext context)async {
     await getIt.get<FireBaseService>().userLogout().then((value) {
       CacheHelper.removeData(key: token);
     context.navigateToReplacement(pageName: AppRoutes.splashRoutes);
     }).catchError((error){
       showCustomSnackBar(context, error.toString());
     });
  }
}

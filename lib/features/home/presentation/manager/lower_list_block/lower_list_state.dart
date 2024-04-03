


abstract class LowerListStates {}

class LowerListInitial extends LowerListStates {}

class GetLowerListWaitingState extends LowerListStates{}
class GetLowerListWithPaginationWaitingState extends LowerListStates{}

class GetLowerListSuccessState extends LowerListStates{

}

class GetLowerListErrorState extends LowerListStates{

  final String errorMessage;

  GetLowerListErrorState(this.errorMessage);
}

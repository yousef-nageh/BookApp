




abstract class UpperListStates{}

class StartState extends UpperListStates{}

class GetUpperListWaitingState extends UpperListStates{}
class GetUpperListPaginationWaitingState extends UpperListStates{}

class GetUpperListSuccessState extends UpperListStates{}


class GetUpperListErrorState extends UpperListStates{

  final String errorMessage;

  GetUpperListErrorState(this.errorMessage);
}


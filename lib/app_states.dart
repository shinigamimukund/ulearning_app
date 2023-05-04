// to track the flow of the program or variable use shortcut
//cmd+upArrow

//all state variables
class AppState {
  int counter = 0;

  // this is a constructor which will definitely initialize counter
  // when the class is initialized
  AppState({required this.counter});
}

class InitStates extends AppState {
  //two ways of writing redirecting constructor
  //InitStates({required super.counter});
  InitStates()
      : super(
            counter:
                0); // it is redirecting to  AppState({required this.counter}); in AppStates class
}

// these blocks are used to connect CLASSES of app_states.dart and app_events.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/app_events.dart';
import 'package:ulearning_app/app_states.dart';

//Speculation:- this AppBloc classed is used in appropriate EVENT class.
//Question:- does Blocs passes data/EVENT from event to STATE
class AppBlocs extends Bloc<AppEvent, AppState> {
  //below code executes after even is triggers
  //EVENT ----------> BLOCS ------------> STATES
  //EVENT is like increment, decrement
  //BLOCS is triggeres after an EVENT and BLOCKS triggers appropriate STATES and updates the states

  //below initialState() constructor is called from file app_states.dart
  //which in turn redirects to the AppState() constructor
  //2 ways to trigger STATES
  //AppBlocs(super.initialState);//WHY WAS INITIALSATE ONLY SELECTED
  //and

  AppBlocs() : super(InitStates()) {//AppBlocs() constructor can redirect to InitState() constructor because
    // AppBlocs extends Bloc<AppEvent, AppState>......<AppEvent, AppState> are super classes for AppBloc() class
    //I think InitStates() is selected because of Bloc<......Event,AppState>
    //  appropriate states is bested because of Bloc<----,AppState>
    // so AppState have to be the second parameter of the Bloc

    //on method is used to REGISTER(receiver/listener of triggers from EVENT class
    //here EVENT is INCREMENT
    //Emitter<AppState> i.e emit in the below parameter,which
    //EMITS updates state to STATE class
    on<Increment>((event, emit) {
      //This SECTION listens to EVENTS i.e UI
      //one UI change through EVENT, ACCESS and/or UPDATE the appropriate states in AppState class

      //VERY IMPORTANT line bloc operation of states
      //here state in state.counter+1 , is a getter method which gets and returns that value i.e counter
      emit(AppState(counter: state.counter + 1));//******* this is how the states from the AppState() is accessed. eg login,increment etc,
      //state.counter+1 is like i+1; or i++; which gets and then returns value
      //emit is a variableName of type Emitter, it can be any name like, em, emi, emmmi, etc.
      //state. retrieves current state of the counter and then
      //increments that value by 1. and later
      //returns that updates state value to counter through AppState(required this.counter) Constructor, by
      // passing arguments/returning it to counter variable in the AppState(required this.counter) constructor
    });
  }
}

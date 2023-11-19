/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals_model/model/grid_component_event.dart';
import 'package:eliud_pkg_fundamentals_model/model/grid_component_state.dart';
import 'package:eliud_pkg_fundamentals_model/model/grid_repository.dart';

class GridComponentBloc extends Bloc<GridComponentEvent, GridComponentState> {
  final GridRepository? gridRepository;
  StreamSubscription? _gridSubscription;

  void _mapLoadGridComponentUpdateToState(String documentId) {
    _gridSubscription?.cancel();
    _gridSubscription = gridRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(GridComponentUpdated(value: value));
      }
    });
  }

  /*
   * Construct GridComponentBloc
   */
  GridComponentBloc({this.gridRepository})
      : super(GridComponentUninitialized()) {
    on<FetchGridComponent>((event, emit) {
      _mapLoadGridComponentUpdateToState(event.id!);
    });
    on<GridComponentUpdated>((event, emit) {
      emit(GridComponentLoaded(value: event.value));
    });
  }

  /*
   * Close the GridComponentBloc
   */
  @override
  Future<void> close() {
    _gridSubscription?.cancel();
    return super.close();
  }
}

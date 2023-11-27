/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_core_main/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals_model/model/model_export.dart';

import 'package:eliud_pkg_fundamentals_model/model/grid_form_event.dart';
import 'package:eliud_pkg_fundamentals_model/model/grid_form_state.dart';

class GridFormBloc extends Bloc<GridFormEvent, GridFormState> {
  final FormAction? formAction;
  final String? appId;

  GridFormBloc(this.appId, {this.formAction}) : super(GridFormUninitialized()) {
    on<InitialiseNewGridFormEvent>((event, emit) {
      GridFormLoaded loaded = GridFormLoaded(
          value: GridModel(
        documentID: "",
        appId: "",
        description: "",
        bodyComponents: [],
      ));
      emit(loaded);
    });

    on<InitialiseGridFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      GridFormLoaded loaded = GridFormLoaded(
          value:
              await gridRepository(appId: appId)!.get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialiseGridFormNoLoadEvent>((event, emit) async {
      GridFormLoaded loaded = GridFormLoaded(value: event.value);
      emit(loaded);
    });
    GridModel? newValue;
    on<ChangedGridDocumentID>((event, emit) async {
      if (state is GridFormInitialized) {
        final currentState = state as GridFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableGridForm(value: newValue));
        }
      }
    });
    on<ChangedGridDescription>((event, emit) async {
      if (state is GridFormInitialized) {
        final currentState = state as GridFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableGridForm(value: newValue));
      }
    });
    on<ChangedGridBodyComponents>((event, emit) async {
      if (state is GridFormInitialized) {
        final currentState = state as GridFormInitialized;
        newValue = currentState.value!.copyWith(bodyComponents: event.value);
        emit(SubmittableGridForm(value: newValue));
      }
    });
    on<ChangedGridGridView>((event, emit) async {
      if (state is GridFormInitialized) {
        final currentState = state as GridFormInitialized;
        if (event.value != null) {
          newValue = currentState.value!.copyWith(
              gridView:
                  await gridViewRepository(appId: appId)!.get(event.value));
        }
        emit(SubmittableGridForm(value: newValue));
      }
    });
    on<ChangedGridConditions>((event, emit) async {
      if (state is GridFormInitialized) {
        final currentState = state as GridFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableGridForm(value: newValue));
      }
    });
  }

  DocumentIDGridFormError error(String message, GridModel newValue) =>
      DocumentIDGridFormError(message: message, value: newValue);

  Future<GridFormState> _isDocumentIDValid(
      String? value, GridModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<GridModel?> findDocument = gridRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableGridForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}

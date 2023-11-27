/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dynamic_widget_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_pkg_fundamentals_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals_model/model/model_export.dart';

import 'package:eliud_pkg_fundamentals_model/model/dynamic_widget_form_event.dart';
import 'package:eliud_pkg_fundamentals_model/model/dynamic_widget_form_state.dart';

class DynamicWidgetFormBloc
    extends Bloc<DynamicWidgetFormEvent, DynamicWidgetFormState> {
  final FormAction? formAction;
  final String? appId;

  DynamicWidgetFormBloc(this.appId, {this.formAction})
      : super(DynamicWidgetFormUninitialized()) {
    on<InitialiseNewDynamicWidgetFormEvent>((event, emit) {
      DynamicWidgetFormLoaded loaded = DynamicWidgetFormLoaded(
          value: DynamicWidgetModel(
        documentID: "",
        appId: "",
        description: "",
        content: "",
      ));
      emit(loaded);
    });

    on<InitialiseDynamicWidgetFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      DynamicWidgetFormLoaded loaded = DynamicWidgetFormLoaded(
          value: await dynamicWidgetRepository(appId: appId)!
              .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialiseDynamicWidgetFormNoLoadEvent>((event, emit) async {
      DynamicWidgetFormLoaded loaded =
          DynamicWidgetFormLoaded(value: event.value);
      emit(loaded);
    });
    DynamicWidgetModel? newValue;
    on<ChangedDynamicWidgetDocumentID>((event, emit) async {
      if (state is DynamicWidgetFormInitialized) {
        final currentState = state as DynamicWidgetFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableDynamicWidgetForm(value: newValue));
        }
      }
    });
    on<ChangedDynamicWidgetDescription>((event, emit) async {
      if (state is DynamicWidgetFormInitialized) {
        final currentState = state as DynamicWidgetFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableDynamicWidgetForm(value: newValue));
      }
    });
    on<ChangedDynamicWidgetContent>((event, emit) async {
      if (state is DynamicWidgetFormInitialized) {
        final currentState = state as DynamicWidgetFormInitialized;
        newValue = currentState.value!.copyWith(content: event.value);
        emit(SubmittableDynamicWidgetForm(value: newValue));
      }
    });
    on<ChangedDynamicWidgetBackground>((event, emit) async {
      if (state is DynamicWidgetFormInitialized) {
        final currentState = state as DynamicWidgetFormInitialized;
        newValue = currentState.value!.copyWith(background: event.value);
        emit(SubmittableDynamicWidgetForm(value: newValue));
      }
    });
    on<ChangedDynamicWidgetConditions>((event, emit) async {
      if (state is DynamicWidgetFormInitialized) {
        final currentState = state as DynamicWidgetFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableDynamicWidgetForm(value: newValue));
      }
    });
  }

  DocumentIDDynamicWidgetFormError error(
          String message, DynamicWidgetModel newValue) =>
      DocumentIDDynamicWidgetFormError(message: message, value: newValue);

  Future<DynamicWidgetFormState> _isDocumentIDValid(
      String? value, DynamicWidgetModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<DynamicWidgetModel?> findDocument =
        dynamicWidgetRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableDynamicWidgetForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}

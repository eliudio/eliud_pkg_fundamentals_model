/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 fader_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_core_helpers/helpers/string_validator.dart';

import 'package:eliud_pkg_fundamentals_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals_model/model/model_export.dart';

import 'package:eliud_pkg_fundamentals_model/model/fader_form_event.dart';
import 'package:eliud_pkg_fundamentals_model/model/fader_form_state.dart';

class FaderFormBloc extends Bloc<FaderFormEvent, FaderFormState> {
  final FormAction? formAction;
  final String? appId;

  FaderFormBloc(this.appId, {this.formAction})
      : super(FaderFormUninitialized()) {
    on<InitialiseNewFaderFormEvent>((event, emit) {
      FaderFormLoaded loaded = FaderFormLoaded(
          value: FaderModel(
        documentID: "",
        appId: "",
        description: "",
        animationMilliseconds: 0,
        imageSeconds: 0,
        items: [],
      ));
      emit(loaded);
    });

    on<InitialiseFaderFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      FaderFormLoaded loaded = FaderFormLoaded(
          value: await faderRepository(appId: appId)!
              .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialiseFaderFormNoLoadEvent>((event, emit) async {
      FaderFormLoaded loaded = FaderFormLoaded(value: event.value);
      emit(loaded);
    });
    FaderModel? newValue;
    on<ChangedFaderDocumentID>((event, emit) async {
      if (state is FaderFormInitialized) {
        final currentState = state as FaderFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableFaderForm(value: newValue));
        }
      }
    });
    on<ChangedFaderDescription>((event, emit) async {
      if (state is FaderFormInitialized) {
        final currentState = state as FaderFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableFaderForm(value: newValue));
      }
    });
    on<ChangedFaderAnimationMilliseconds>((event, emit) async {
      if (state is FaderFormInitialized) {
        final currentState = state as FaderFormInitialized;
        if (isInt(event.value)) {
          newValue = currentState.value!
              .copyWith(animationMilliseconds: int.parse(event.value!));
          emit(SubmittableFaderForm(value: newValue));
        } else {
          newValue = currentState.value!.copyWith(animationMilliseconds: 0);
          emit(AnimationMillisecondsFaderFormError(
              message: "Value should be a number", value: newValue));
        }
      }
    });
    on<ChangedFaderImageSeconds>((event, emit) async {
      if (state is FaderFormInitialized) {
        final currentState = state as FaderFormInitialized;
        if (isInt(event.value)) {
          newValue = currentState.value!
              .copyWith(imageSeconds: int.parse(event.value!));
          emit(SubmittableFaderForm(value: newValue));
        } else {
          newValue = currentState.value!.copyWith(imageSeconds: 0);
          emit(ImageSecondsFaderFormError(
              message: "Value should be a number", value: newValue));
        }
      }
    });
    on<ChangedFaderItems>((event, emit) async {
      if (state is FaderFormInitialized) {
        final currentState = state as FaderFormInitialized;
        newValue = currentState.value!.copyWith(items: event.value);
        emit(SubmittableFaderForm(value: newValue));
      }
    });
    on<ChangedFaderBackground>((event, emit) async {
      if (state is FaderFormInitialized) {
        final currentState = state as FaderFormInitialized;
        newValue = currentState.value!.copyWith(background: event.value);
        emit(SubmittableFaderForm(value: newValue));
      }
    });
    on<ChangedFaderConditions>((event, emit) async {
      if (state is FaderFormInitialized) {
        final currentState = state as FaderFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableFaderForm(value: newValue));
      }
    });
  }

  DocumentIDFaderFormError error(String message, FaderModel newValue) =>
      DocumentIDFaderFormError(message: message, value: newValue);

  Future<FaderFormState> _isDocumentIDValid(
      String? value, FaderModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<FaderModel?> findDocument =
        faderRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableFaderForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}

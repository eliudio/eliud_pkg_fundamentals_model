/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_pkg_fundamentals_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals_model/model/model_export.dart';

import 'package:eliud_pkg_fundamentals_model/model/document_form_event.dart';
import 'package:eliud_pkg_fundamentals_model/model/document_form_state.dart';

class DocumentFormBloc extends Bloc<DocumentFormEvent, DocumentFormState> {
  final FormAction? formAction;
  final String? appId;

  DocumentFormBloc(this.appId, {this.formAction})
      : super(DocumentFormUninitialized()) {
    on<InitialiseNewDocumentFormEvent>((event, emit) {
      DocumentFormLoaded loaded = DocumentFormLoaded(
          value: DocumentModel(
        documentID: "",
        appId: "",
        description: "",
        content: "",
        padding: 0.0,
        images: [],
      ));
      emit(loaded);
    });

    on<InitialiseDocumentFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      DocumentFormLoaded loaded = DocumentFormLoaded(
          value: await documentRepository(appId: appId)!
              .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialiseDocumentFormNoLoadEvent>((event, emit) async {
      DocumentFormLoaded loaded = DocumentFormLoaded(value: event.value);
      emit(loaded);
    });
    DocumentModel? newValue;
    on<ChangedDocumentDocumentID>((event, emit) async {
      if (state is DocumentFormInitialized) {
        final currentState = state as DocumentFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableDocumentForm(value: newValue));
        }
      }
    });
    on<ChangedDocumentDescription>((event, emit) async {
      if (state is DocumentFormInitialized) {
        final currentState = state as DocumentFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableDocumentForm(value: newValue));
      }
    });
    on<ChangedDocumentContent>((event, emit) async {
      if (state is DocumentFormInitialized) {
        final currentState = state as DocumentFormInitialized;
        newValue = currentState.value!.copyWith(content: event.value);
        emit(SubmittableDocumentForm(value: newValue));
      }
    });
    on<ChangedDocumentPadding>((event, emit) async {
      if (state is DocumentFormInitialized) {
        final currentState = state as DocumentFormInitialized;
        if (isDouble(event.value!)) {
          newValue =
              currentState.value!.copyWith(padding: double.parse(event.value!));
          emit(SubmittableDocumentForm(value: newValue));
        } else {
          newValue = currentState.value!.copyWith(padding: 0.0);
          emit(PaddingDocumentFormError(
              message: "Value should be a number or decimal number",
              value: newValue));
        }
      }
    });
    on<ChangedDocumentImages>((event, emit) async {
      if (state is DocumentFormInitialized) {
        final currentState = state as DocumentFormInitialized;
        newValue = currentState.value!.copyWith(images: event.value);
        emit(SubmittableDocumentForm(value: newValue));
      }
    });
    on<ChangedDocumentBackground>((event, emit) async {
      if (state is DocumentFormInitialized) {
        final currentState = state as DocumentFormInitialized;
        newValue = currentState.value!.copyWith(background: event.value);
        emit(SubmittableDocumentForm(value: newValue));
      }
    });
    on<ChangedDocumentConditions>((event, emit) async {
      if (state is DocumentFormInitialized) {
        final currentState = state as DocumentFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableDocumentForm(value: newValue));
      }
    });
  }

  DocumentIDDocumentFormError error(String message, DocumentModel newValue) =>
      DocumentIDDocumentFormError(message: message, value: newValue);

  Future<DocumentFormState> _isDocumentIDValid(
      String? value, DocumentModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<DocumentModel?> findDocument =
        documentRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableDocumentForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}

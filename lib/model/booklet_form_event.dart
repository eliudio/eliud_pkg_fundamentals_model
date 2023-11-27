/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 booklet_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_fundamentals_model/model/model_export.dart';

@immutable
abstract class BookletFormEvent extends Equatable {
  const BookletFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewBookletFormEvent extends BookletFormEvent {}

class InitialiseBookletFormEvent extends BookletFormEvent {
  final BookletModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseBookletFormEvent({this.value});
}

class InitialiseBookletFormNoLoadEvent extends BookletFormEvent {
  final BookletModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseBookletFormNoLoadEvent({this.value});
}

class ChangedBookletDocumentID extends BookletFormEvent {
  final String? value;

  ChangedBookletDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedBookletDocumentID{ value: $value }';
}

class ChangedBookletAppId extends BookletFormEvent {
  final String? value;

  ChangedBookletAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedBookletAppId{ value: $value }';
}

class ChangedBookletDescription extends BookletFormEvent {
  final String? value;

  ChangedBookletDescription({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedBookletDescription{ value: $value }';
}

class ChangedBookletSections extends BookletFormEvent {
  final List<SectionModel>? value;

  ChangedBookletSections({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedBookletSections{ value: $value }';
}

class ChangedBookletConditions extends BookletFormEvent {
  final StorageConditionsModel? value;

  ChangedBookletConditions({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedBookletConditions{ value: $value }';
}

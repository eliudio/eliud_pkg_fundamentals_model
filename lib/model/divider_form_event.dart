/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 divider_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_fundamentals_model/model/model_export.dart';

@immutable
abstract class DividerFormEvent extends Equatable {
  const DividerFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewDividerFormEvent extends DividerFormEvent {}

class InitialiseDividerFormEvent extends DividerFormEvent {
  final DividerModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseDividerFormEvent({this.value});
}

class InitialiseDividerFormNoLoadEvent extends DividerFormEvent {
  final DividerModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseDividerFormNoLoadEvent({this.value});
}

class ChangedDividerDocumentID extends DividerFormEvent {
  final String? value;

  ChangedDividerDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedDividerDocumentID{ value: $value }';
}

class ChangedDividerAppId extends DividerFormEvent {
  final String? value;

  ChangedDividerAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedDividerAppId{ value: $value }';
}

class ChangedDividerDescription extends DividerFormEvent {
  final String? value;

  ChangedDividerDescription({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedDividerDescription{ value: $value }';
}

class ChangedDividerColor extends DividerFormEvent {
  final RgbModel? value;

  ChangedDividerColor({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedDividerColor{ value: $value }';
}

class ChangedDividerHeight extends DividerFormEvent {
  final String? value;

  ChangedDividerHeight({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedDividerHeight{ value: $value }';
}

class ChangedDividerThickness extends DividerFormEvent {
  final String? value;

  ChangedDividerThickness({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedDividerThickness{ value: $value }';
}

class ChangedDividerIndent extends DividerFormEvent {
  final String? value;

  ChangedDividerIndent({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedDividerIndent{ value: $value }';
}

class ChangedDividerEndIndent extends DividerFormEvent {
  final String? value;

  ChangedDividerEndIndent({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedDividerEndIndent{ value: $value }';
}

class ChangedDividerConditions extends DividerFormEvent {
  final StorageConditionsModel? value;

  ChangedDividerConditions({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedDividerConditions{ value: $value }';
}

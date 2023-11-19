/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 fader_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_fundamentals_model/model/model_export.dart';

@immutable
abstract class FaderFormEvent extends Equatable {
  const FaderFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewFaderFormEvent extends FaderFormEvent {}

class InitialiseFaderFormEvent extends FaderFormEvent {
  final FaderModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseFaderFormEvent({this.value});
}

class InitialiseFaderFormNoLoadEvent extends FaderFormEvent {
  final FaderModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseFaderFormNoLoadEvent({this.value});
}

class ChangedFaderDocumentID extends FaderFormEvent {
  final String? value;

  ChangedFaderDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFaderDocumentID{ value: $value }';
}

class ChangedFaderAppId extends FaderFormEvent {
  final String? value;

  ChangedFaderAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFaderAppId{ value: $value }';
}

class ChangedFaderDescription extends FaderFormEvent {
  final String? value;

  ChangedFaderDescription({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFaderDescription{ value: $value }';
}

class ChangedFaderAnimationMilliseconds extends FaderFormEvent {
  final String? value;

  ChangedFaderAnimationMilliseconds({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFaderAnimationMilliseconds{ value: $value }';
}

class ChangedFaderImageSeconds extends FaderFormEvent {
  final String? value;

  ChangedFaderImageSeconds({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFaderImageSeconds{ value: $value }';
}

class ChangedFaderItems extends FaderFormEvent {
  final List<ListedItemModel>? value;

  ChangedFaderItems({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFaderItems{ value: $value }';
}

class ChangedFaderBackground extends FaderFormEvent {
  final BackgroundModel? value;

  ChangedFaderBackground({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFaderBackground{ value: $value }';
}

class ChangedFaderConditions extends FaderFormEvent {
  final StorageConditionsModel? value;

  ChangedFaderConditions({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFaderConditions{ value: $value }';
}

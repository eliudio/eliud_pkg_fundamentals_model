/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_entry_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_main/model/app_model.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';

import 'package:eliud_core_main/apis/apis.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';
import 'package:eliud_core_main/model/internal_component.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_fundamentals_model/model/model_export.dart';

import 'package:eliud_pkg_fundamentals_model/model/tutorial_entry_list_bloc.dart';
import 'package:eliud_pkg_fundamentals_model/model/tutorial_entry_list_event.dart';
import 'package:eliud_pkg_fundamentals_model/model/tutorial_entry_model.dart';
import 'package:eliud_pkg_fundamentals_model/model/tutorial_entry_form_bloc.dart';
import 'package:eliud_pkg_fundamentals_model/model/tutorial_entry_form_event.dart';
import 'package:eliud_pkg_fundamentals_model/model/tutorial_entry_form_state.dart';

class TutorialEntryForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final TutorialEntryModel? value;
  final ActionModel? submitAction;

  TutorialEntryForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the TutorialEntryForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<TutorialEntryFormBloc>(
        create: (context) => TutorialEntryFormBloc(
          appId,
        )..add(InitialiseTutorialEntryFormEvent(value: value)),
        child: _MyTutorialEntryForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<TutorialEntryFormBloc>(
        create: (context) => TutorialEntryFormBloc(
          appId,
        )..add(InitialiseTutorialEntryFormNoLoadEvent(value: value)),
        child: _MyTutorialEntryForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update TutorialEntry'
                      : 'Add TutorialEntry'),
          body: BlocProvider<TutorialEntryFormBloc>(
            create: (context) => TutorialEntryFormBloc(
              appId,
            )..add((formAction == FormAction.updateAction
                ? InitialiseTutorialEntryFormEvent(value: value)
                : InitialiseNewTutorialEntryFormEvent())),
            child: _MyTutorialEntryForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyTutorialEntryForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyTutorialEntryForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyTutorialEntryForm> createState() =>
      _MyTutorialEntryFormState(formAction);
}

class _MyTutorialEntryFormState extends State<_MyTutorialEntryForm> {
  final FormAction? formAction;
  late TutorialEntryFormBloc _myFormBloc;

  final TextEditingController _descriptionController = TextEditingController();
  String? _image;
  final TextEditingController _codeController = TextEditingController();

  _MyTutorialEntryFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<TutorialEntryFormBloc>(context);
    _descriptionController.addListener(_onDescriptionChanged);
    _codeController.addListener(_onCodeChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TutorialEntryFormBloc, TutorialEntryFormState>(
        builder: (context, state) {
      if (state is TutorialEntryFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is TutorialEntryFormLoaded) {
        _descriptionController.text = state.value!.description.toString();
        if (state.value!.image != null) {
          _image = state.value!.image!.documentID;
        } else {
          _image = "";
        }
        if (state.value!.code != null) {
          _codeController.text = state.value!.code.toString();
        } else {
          _codeController.text = "";
        }
      }
      if (state is TutorialEntryFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Description',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _descriptionController,
                keyboardType: TextInputType.text,
                validator: (_) => state is DescriptionTutorialEntryFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Optional Image')));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "platformMediums",
              value: _image,
              trigger: (value, privilegeLevel) => _onImageSelected(value),
              optional: true),
        );

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Optional Code')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Code',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _codeController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is CodeTutorialEntryFormError ? state.message : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        if ((formAction != FormAction.showData) &&
            (formAction != FormAction.showPreloadedData)) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .button(
                widget.app,
                context,
                label: 'Submit',
                onPressed: _readOnly(context, state)
                    ? null
                    : () {
                        if (state is TutorialEntryFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<TutorialEntryListBloc>(context)
                                .add(UpdateTutorialEntryList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              description: state.value!.description,
                              image: state.value!.image,
                              code: state.value!.code,
                            )));
                          } else {
                            BlocProvider.of<TutorialEntryListBloc>(context)
                                .add(AddTutorialEntryList(
                                    value: TutorialEntryModel(
                              documentID: state.value!.documentID,
                              description: state.value!.description,
                              image: state.value!.image,
                              code: state.value!.code,
                            )));
                          }
                          if (widget.submitAction != null) {
                            Apis.apis()
                                .getRouterApi()
                                .navigateTo(context, widget.submitAction!);
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      },
              ));
        }

        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .container(
                widget.app,
                context,
                Form(
                  child: ListView(
                      padding: const EdgeInsets.all(8),
                      physics: ((formAction == FormAction.showData) ||
                              (formAction == FormAction.showPreloadedData))
                          ? NeverScrollableScrollPhysics()
                          : null,
                      shrinkWrap: ((formAction == FormAction.showData) ||
                          (formAction == FormAction.showPreloadedData)),
                      children: children),
                ),
                formAction!);
      } else {
        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminListStyle()
            .progressIndicator(widget.app, context);
      }
    });
  }

  void _onDescriptionChanged() {
    _myFormBloc.add(
        ChangedTutorialEntryDescription(value: _descriptionController.text));
  }

  void _onImageSelected(String? val) {
    setState(() {
      _image = val;
    });
    _myFormBloc.add(ChangedTutorialEntryImage(value: val));
  }

  void _onCodeChanged() {
    _myFormBloc.add(ChangedTutorialEntryCode(value: _codeController.text));
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, TutorialEntryFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}

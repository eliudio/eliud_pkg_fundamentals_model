/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 divider_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_main/model/app_model.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';

import 'package:eliud_core_main/apis/apis.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';
import 'package:eliud_core_main/tools/bespoke_formfields.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_fundamentals_model/model/model_export.dart';

import 'package:eliud_pkg_fundamentals_model/model/divider_list_bloc.dart';
import 'package:eliud_pkg_fundamentals_model/model/divider_list_event.dart';
import 'package:eliud_pkg_fundamentals_model/model/divider_model.dart';
import 'package:eliud_pkg_fundamentals_model/model/divider_form_bloc.dart';
import 'package:eliud_pkg_fundamentals_model/model/divider_form_event.dart';
import 'package:eliud_pkg_fundamentals_model/model/divider_form_state.dart';

class DividerForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final DividerModel? value;
  final ActionModel? submitAction;

  DividerForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the DividerForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<DividerFormBloc>(
        create: (context) => DividerFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseDividerFormEvent(value: value)),
        child: _MyDividerForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<DividerFormBloc>(
        create: (context) => DividerFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseDividerFormNoLoadEvent(value: value)),
        child: _MyDividerForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update Divider'
                      : 'Add Divider'),
          body: BlocProvider<DividerFormBloc>(
            create: (context) => DividerFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseDividerFormEvent(value: value)
                : InitialiseNewDividerFormEvent())),
            child: _MyDividerForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyDividerForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyDividerForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyDividerForm> createState() => _MyDividerFormState(formAction);
}

class _MyDividerFormState extends State<_MyDividerForm> {
  final FormAction? formAction;
  late DividerFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _thicknessController = TextEditingController();
  final TextEditingController _indentController = TextEditingController();
  final TextEditingController _endIndentController = TextEditingController();

  _MyDividerFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<DividerFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _heightController.addListener(_onHeightChanged);
    _thicknessController.addListener(_onThicknessChanged);
    _indentController.addListener(_onIndentChanged);
    _endIndentController.addListener(_onEndIndentChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DividerFormBloc, DividerFormState>(
        builder: (context, state) {
      if (state is DividerFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is DividerFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _descriptionController.text = state.value!.description.toString();
        _heightController.text = state.value!.height.toString();
        _thicknessController.text = state.value!.thickness.toString();
        _indentController.text = state.value!.indent.toString();
        _endIndentController.text = state.value!.endIndent.toString();
      }
      if (state is DividerFormInitialized) {
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
                labelText: 'Document ID',
                icon: Icons.vpn_key,
                readOnly: (formAction == FormAction.updateAction),
                textEditingController: _documentIDController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is DocumentIDDividerFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Description',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _descriptionController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is DescriptionDividerFormError ? state.message : null,
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
                .groupTitle(widget.app, context, 'Shape')));

        children.add(
            RgbField(widget.app, "Color", state.value!.color, _onColorChanged));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Height',
                icon: Icons.vertical_align_top,
                readOnly: _readOnly(context, state),
                textEditingController: _heightController,
                keyboardType: TextInputType.number,
                validator: (_) =>
                    state is HeightDividerFormError ? state.message : null,
                hintText: 'field.remark'));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Thickness',
                icon: Icons.vertical_align_center,
                readOnly: _readOnly(context, state),
                textEditingController: _thicknessController,
                keyboardType: TextInputType.number,
                validator: (_) =>
                    state is ThicknessDividerFormError ? state.message : null,
                hintText: 'field.remark'));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Indent',
                icon: Icons.format_indent_increase,
                readOnly: _readOnly(context, state),
                textEditingController: _indentController,
                keyboardType: TextInputType.number,
                validator: (_) =>
                    state is IndentDividerFormError ? state.message : null,
                hintText: 'field.remark'));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'End Indent',
                icon: Icons.format_indent_decrease,
                readOnly: _readOnly(context, state),
                textEditingController: _endIndentController,
                keyboardType: TextInputType.number,
                validator: (_) =>
                    state is EndIndentDividerFormError ? state.message : null,
                hintText: 'field.remark'));

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
                .groupTitle(widget.app, context, 'Conditions')));

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
                        if (state is DividerFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<DividerListBloc>(context)
                                .add(UpdateDividerList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              color: state.value!.color,
                              height: state.value!.height,
                              thickness: state.value!.thickness,
                              indent: state.value!.indent,
                              endIndent: state.value!.endIndent,
                              conditions: state.value!.conditions,
                            )));
                          } else {
                            BlocProvider.of<DividerListBloc>(context)
                                .add(AddDividerList(
                                    value: DividerModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              color: state.value!.color,
                              height: state.value!.height,
                              thickness: state.value!.thickness,
                              indent: state.value!.indent,
                              endIndent: state.value!.endIndent,
                              conditions: state.value!.conditions,
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

  void _onDocumentIDChanged() {
    _myFormBloc
        .add(ChangedDividerDocumentID(value: _documentIDController.text));
  }

  void _onDescriptionChanged() {
    _myFormBloc
        .add(ChangedDividerDescription(value: _descriptionController.text));
  }

  void _onColorChanged(value) {
    _myFormBloc.add(ChangedDividerColor(value: value));
  }

  void _onHeightChanged() {
    _myFormBloc.add(ChangedDividerHeight(value: _heightController.text));
  }

  void _onThicknessChanged() {
    _myFormBloc.add(ChangedDividerThickness(value: _thicknessController.text));
  }

  void _onIndentChanged() {
    _myFormBloc.add(ChangedDividerIndent(value: _indentController.text));
  }

  void _onEndIndentChanged() {
    _myFormBloc.add(ChangedDividerEndIndent(value: _endIndentController.text));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _descriptionController.dispose();
    _heightController.dispose();
    _thicknessController.dispose();
    _indentController.dispose();
    _endIndentController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, DividerFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}

/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_item_list.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core_model/style/style_registry.dart';
import 'package:eliud_core/tools/has_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_core_model/model/background_model.dart';
import 'package:eliud_core/tools/delete_snackbar.dart';
import 'package:eliud_core/tools/router_builders.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_pkg_fundamentals_model/model/document_item_list_event.dart';
import 'package:eliud_pkg_fundamentals_model/model/document_item_list_state.dart';
import 'package:eliud_pkg_fundamentals_model/model/document_item_list_bloc.dart';
import 'package:eliud_pkg_fundamentals_model/model/document_item_model.dart';

import 'package:eliud_core_model/model/app_model.dart';

import 'document_item_form.dart';

typedef DocumentItemWidgetProvider = Function(DocumentItemModel? value);

class DocumentItemListWidget extends StatefulWidget with HasFab {
  final AppModel app;
  final BackgroundModel? listBackground;
  final DocumentItemWidgetProvider? widgetProvider;
  final bool? readOnly;
  final String? form;
  //final DocumentItemListWidgetState? state;
  final bool? isEmbedded;

  DocumentItemListWidget(
      {super.key,
      required this.app,
      this.readOnly,
      this.form,
      this.widgetProvider,
      this.isEmbedded,
      this.listBackground});

  @override
  DocumentItemListWidgetState createState() {
    return DocumentItemListWidgetState();
  }

  @override
  Widget? fab(BuildContext context) {
    if ((readOnly != null) && readOnly!) return null;
    var state = DocumentItemListWidgetState();
    var accessState = AccessBloc.getState(context);
    return state.fab(context, accessState);
  }
}

class DocumentItemListWidgetState extends State<DocumentItemListWidget> {
  Widget? fab(BuildContext aContext, AccessState accessState) {
    return !accessState.memberIsOwner(widget.app.documentID)
        ? null
        : StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminListStyle()
            .floatingActionButton(
            widget.app,
            context,
            'PageFloatBtnTag',
            Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                pageRouteBuilder(widget.app,
                    page: BlocProvider.value(
                        value: BlocProvider.of<DocumentItemListBloc>(context),
                        child: DocumentItemForm(
                            app: widget.app,
                            value: null,
                            formAction: FormAction.addAction))),
              );
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
      if (accessState is AccessDetermined) {
        return BlocBuilder<DocumentItemListBloc, DocumentItemListState>(
            builder: (context, state) {
          if (state is DocumentItemListLoading) {
            return StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminListStyle()
                .progressIndicator(widget.app, context);
          } else if (state is DocumentItemListLoaded) {
            final values = state.values;
            if ((widget.isEmbedded != null) && widget.isEmbedded!) {
              var children = <Widget>[];
              children.add(theList(context, values, accessState));
              children.add(StyleRegistry.registry()
                  .styleWithApp(widget.app)
                  .adminFormStyle()
                  .button(
                widget.app,
                context,
                label: 'Add',
                onPressed: () {
                  Navigator.of(context).push(
                    pageRouteBuilder(widget.app,
                        page: BlocProvider.value(
                            value:
                                BlocProvider.of<DocumentItemListBloc>(context),
                            child: DocumentItemForm(
                                app: widget.app,
                                value: null,
                                formAction: FormAction.addAction))),
                  );
                },
              ));
              return ListView(
                  padding: const EdgeInsets.all(8),
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  children: children);
            } else {
              return theList(context, values, accessState);
            }
          } else {
            return StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminListStyle()
                .progressIndicator(widget.app, context);
          }
        });
      } else {
        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminListStyle()
            .progressIndicator(widget.app, context);
      }
    });
  }

  Widget theList(BuildContext context, values, AccessState accessState) {
    return Container(
        decoration: widget.listBackground == null
            ? StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminListStyle()
                .boxDecorator(widget.app, context, accessState.getMember())
            : BoxDecorationHelper.boxDecoration(
                widget.app, accessState.getMember(), widget.listBackground),
        child: ListView.separated(
            separatorBuilder: (context, index) => StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminListStyle()
                .divider(widget.app, context),
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: values.length,
            itemBuilder: (context, index) {
              final value = values[index];

              if (widget.widgetProvider != null) {
                return widget.widgetProvider!(value);
              }

              return DocumentItemListItem(
                app: widget.app,
                value: value,
//            app: accessState.app,
                onDismissed: (direction) {
                  BlocProvider.of<DocumentItemListBloc>(context)
                      .add(DeleteDocumentItemList(value: value));
                  ScaffoldMessenger.of(context).showSnackBar(DeleteSnackBar(
                    message: "DocumentItem $value.documentID",
                    onUndo: () => BlocProvider.of<DocumentItemListBloc>(context)
                        .add(AddDocumentItemList(value: value)),
                  ));
                },
                onTap: () async {
                  final removedItem = await Navigator.of(context).push(
                      pageRouteBuilder(widget.app,
                          page: BlocProvider.value(
                              value: BlocProvider.of<DocumentItemListBloc>(
                                  context),
                              child: getForm(value, FormAction.updateAction))));
                  if (removedItem != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      DeleteSnackBar(
                        message: "DocumentItem $value.documentID",
                        onUndo: () =>
                            BlocProvider.of<DocumentItemListBloc>(context)
                                .add(AddDocumentItemList(value: value)),
                      ),
                    );
                  }
                },
              );
            }));
  }

  Widget? getForm(value, action) {
    if (widget.form == null) {
      return DocumentItemForm(
          app: widget.app, value: value, formAction: action);
    } else {
      return null;
    }
  }
}

class DocumentItemListItem extends StatelessWidget {
  final AppModel app;
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final DocumentItemModel value;

  DocumentItemListItem({
    super.key,
    required this.app,
    required this.onDismissed,
    required this.onTap,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__DocumentItem_item_${value.documentID}'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: ImageHelper.getImageFromPlatformModel(
            platformMediumModel: value.image!, width: fullScreenWidth(context)),
        subtitle: value.reference != null
            ? Center(
                child: StyleRegistry.registry()
                    .styleWithApp(app)
                    .frontEndStyle()
                    .textStyle()
                    .text(app, context, value.reference!))
            : Container(),
      ),
    );
  }
}

/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 listed_item_list.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core_model/style/style_registry.dart';
import 'package:eliud_core/tools/has_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_model/model/background_model.dart';
import 'package:eliud_core/tools/delete_snackbar.dart';
import 'package:eliud_core/tools/router_builders.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_pkg_fundamentals_model/model/listed_item_list_event.dart';
import 'package:eliud_pkg_fundamentals_model/model/listed_item_list_state.dart';
import 'package:eliud_pkg_fundamentals_model/model/listed_item_list_bloc.dart';
import 'package:eliud_pkg_fundamentals_model/model/listed_item_model.dart';

import 'package:eliud_core_model/model/app_model.dart';

import 'listed_item_form.dart';

typedef ListedItemWidgetProvider = Function(ListedItemModel? value);

class ListedItemListWidget extends StatefulWidget with HasFab {
  final AppModel app;
  final BackgroundModel? listBackground;
  final ListedItemWidgetProvider? widgetProvider;
  final bool? readOnly;
  final String? form;
  //final ListedItemListWidgetState? state;
  final bool? isEmbedded;

  ListedItemListWidget(
      {super.key,
      required this.app,
      this.readOnly,
      this.form,
      this.widgetProvider,
      this.isEmbedded,
      this.listBackground});

  @override
  ListedItemListWidgetState createState() {
    return ListedItemListWidgetState();
  }

  @override
  Widget? fab(BuildContext context) {
    if ((readOnly != null) && readOnly!) return null;
    var state = ListedItemListWidgetState();
    var accessState = AccessBloc.getState(context);
    return state.fab(context, accessState);
  }
}

class ListedItemListWidgetState extends State<ListedItemListWidget> {
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
                        value: BlocProvider.of<ListedItemListBloc>(context),
                        child: ListedItemForm(
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
        return BlocBuilder<ListedItemListBloc, ListedItemListState>(
            builder: (context, state) {
          if (state is ListedItemListLoading) {
            return StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminListStyle()
                .progressIndicator(widget.app, context);
          } else if (state is ListedItemListLoaded) {
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
                            value: BlocProvider.of<ListedItemListBloc>(context),
                            child: ListedItemForm(
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

              return ListedItemListItem(
                app: widget.app,
                value: value,
//            app: accessState.app,
                onDismissed: (direction) {
                  BlocProvider.of<ListedItemListBloc>(context)
                      .add(DeleteListedItemList(value: value));
                  ScaffoldMessenger.of(context).showSnackBar(DeleteSnackBar(
                    message: "ListedItem $value.documentID",
                    onUndo: () => BlocProvider.of<ListedItemListBloc>(context)
                        .add(AddListedItemList(value: value)),
                  ));
                },
                onTap: () async {
                  final removedItem = await Navigator.of(context).push(
                      pageRouteBuilder(widget.app,
                          page: BlocProvider.value(
                              value:
                                  BlocProvider.of<ListedItemListBloc>(context),
                              child: getForm(value, FormAction.updateAction))));
                  if (removedItem != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      DeleteSnackBar(
                        message: "ListedItem $value.documentID",
                        onUndo: () =>
                            BlocProvider.of<ListedItemListBloc>(context)
                                .add(AddListedItemList(value: value)),
                      ),
                    );
                  }
                },
              );
            }));
  }

  Widget? getForm(value, action) {
    if (widget.form == null) {
      return ListedItemForm(app: widget.app, value: value, formAction: action);
    } else {
      return null;
    }
  }
}

class ListedItemListItem extends StatelessWidget {
  final AppModel app;
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final ListedItemModel value;

  ListedItemListItem({
    super.key,
    required this.app,
    required this.onDismissed,
    required this.onTap,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__ListedItem_item_${value.documentID}'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: value.description != null
            ? Center(
                child: StyleRegistry.registry()
                    .styleWithApp(app)
                    .frontEndStyle()
                    .textStyle()
                    .text(app, context, value.description!))
            : Container(),
      ),
    );
  }
}

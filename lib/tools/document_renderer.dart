import 'package:eliud_core/core/navigate/router.dart' as er;
import 'package:eliud_core/core/tools/document_processor.dart';
import 'package:eliud_core/tools/etc/etc.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/background_model.dart';
import 'package:eliud_core_main/model/member_model.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';
import 'package:eliud_pkg_fundamentals_model/model/document_item_model.dart';
import 'package:eliud_pkg_fundamentals_model/tools/document_processor_extended.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:eliud_core_main/apis/action_api/actions/goto_page.dart';

class ActionListener /*implements ClickListener*/ {
  final BuildContext context;
  final AppModel app;

  ActionListener(this.context, this.app);

  void onClicked(String event) {
    // todo: work with substring, as url.parse seems to discard case sensitivity
    var uri = Uri.parse(event);
    var authority = uri.authority;
    var scheme = uri.scheme;
    if (scheme == "page") {
      // todo, check if access rights to this page, if not... show "???!!!"
      ActionModel action =
          GotoPage(app, pageID: authority); // construct from event
      er.Router.navigateTo(context, action);
    }
  }
}

class DocumentRendererTool {
  Widget _flutterMarkdownDocument(
      BuildContext context, String processedDocument) {
    debugPrint('DocumentRendererTool::_flutterMarkdownDocument()');
    return MarkdownBody(
      selectable: true,
      data: processedDocument,
    );
  }

  Widget _rendered(AppModel app, BuildContext context, String renderThis) {
    return _flutterMarkdownDocument(context, renderThis);
  }

  Widget render(AppModel app, BuildContext context, MemberModel? memberModel,
      String document, List<DocumentItemModel>? images, BackgroundModel? bdm) {
    DocumentParameterProcessor documentParameterProcessor =
        ExtendedDocumentParameterProcessor(context, app, images: images);
    return Container(
        clipBehavior:
            BoxDecorationHelper.determineClipBehaviour(app, memberModel, bdm),
        child: _rendered(
            app, context, documentParameterProcessor.process(document)),
        margin: BoxDecorationHelper.determineMargin(app, memberModel, bdm),
        padding: BoxDecorationHelper.determinePadding(app, memberModel, bdm),
        decoration: BoxDecorationHelper.boxDecoration(app, memberModel, bdm));
  }
}

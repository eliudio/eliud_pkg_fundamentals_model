/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/admin_app.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/admin_app_base.dart';
import '../tools/bespoke_models.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';

class AdminApp extends AdminAppInstallerBase {
  final String appId;
  final DrawerModel _drawer;
  final DrawerModel _endDrawer;
  final AppBarModel _appBar;
  final HomeMenuModel _homeMenu;
  final RgbModel menuItemColor;
  final RgbModel selectedMenuItemColor;
  final RgbModel backgroundColor;

  /// Construct the AdminApp
  AdminApp(
      this.appId,
      this._drawer,
      this._endDrawer,
      this._appBar,
      this._homeMenu,
      this.menuItemColor,
      this.selectedMenuItemColor,
      this.backgroundColor);

  /// Retrieve the admin pages
  PageModel _bookletsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-booklets",
        componentName: "eliud_pkg_fundamentals_model_internalWidgets",
        componentId: "booklets"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_fundamentals_model_booklets_page",
        title: "Booklets",
        description: "Booklets",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _decoratedContentsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-decoratedContents",
        componentName: "eliud_pkg_fundamentals_model_internalWidgets",
        componentId: "decoratedContents"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_fundamentals_model_decoratedcontents_page",
        title: "DecoratedContents",
        description: "DecoratedContents",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _dividersPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-dividers",
        componentName: "eliud_pkg_fundamentals_model_internalWidgets",
        componentId: "dividers"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_fundamentals_model_dividers_page",
        title: "Dividers",
        description: "Dividers",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _documentsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-documents",
        componentName: "eliud_pkg_fundamentals_model_internalWidgets",
        componentId: "documents"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_fundamentals_model_documents_page",
        title: "Documents",
        description: "Documents",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _dynamicWidgetsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-dynamicWidgets",
        componentName: "eliud_pkg_fundamentals_model_internalWidgets",
        componentId: "dynamicWidgets"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_fundamentals_model_dynamicwidgets_page",
        title: "DynamicWidgets",
        description: "DynamicWidgets",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _fadersPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-faders",
        componentName: "eliud_pkg_fundamentals_model_internalWidgets",
        componentId: "faders"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_fundamentals_model_faders_page",
        title: "Faders",
        description: "Faders",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _gridsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-grids",
        componentName: "eliud_pkg_fundamentals_model_internalWidgets",
        componentId: "grids"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_fundamentals_model_grids_page",
        title: "Grids",
        description: "Grids",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _presentationsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-presentations",
        componentName: "eliud_pkg_fundamentals_model_internalWidgets",
        componentId: "presentations"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_fundamentals_model_presentations_page",
        title: "Presentations",
        description: "Presentations",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _simpleImagesPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-simpleImages",
        componentName: "eliud_pkg_fundamentals_model_internalWidgets",
        componentId: "simpleImages"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_fundamentals_model_simpleimages_page",
        title: "SimpleImages",
        description: "SimpleImages",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _simpleTextsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-simpleTexts",
        componentName: "eliud_pkg_fundamentals_model_internalWidgets",
        componentId: "simpleTexts"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_fundamentals_model_simpletexts_page",
        title: "SimpleTexts",
        description: "SimpleTexts",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  /// Retrieve the admin pages
  PageModel _tutorialsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
        documentID: "internalWidget-tutorials",
        componentName: "eliud_pkg_fundamentals_model_internalWidgets",
        componentId: "tutorials"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.ownerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_fundamentals_model_tutorials_page",
        title: "Tutorials",
        description: "Tutorials",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.onlyTheFirstComponent);
    return page;
  }

  Future<void> _setupAdminPages() {
    return pageRepository(appId: appId)!
        .add(_bookletsPages())
        .then(
            (_) => pageRepository(appId: appId)!.add(_decoratedContentsPages()))
        .then((_) => pageRepository(appId: appId)!.add(_dividersPages()))
        .then((_) => pageRepository(appId: appId)!.add(_documentsPages()))
        .then((_) => pageRepository(appId: appId)!.add(_dynamicWidgetsPages()))
        .then((_) => pageRepository(appId: appId)!.add(_fadersPages()))
        .then((_) => pageRepository(appId: appId)!.add(_gridsPages()))
        .then((_) => pageRepository(appId: appId)!.add(_presentationsPages()))
        .then((_) => pageRepository(appId: appId)!.add(_simpleImagesPages()))
        .then((_) => pageRepository(appId: appId)!.add(_simpleTextsPages()))
        .then((_) => pageRepository(appId: appId)!.add(_tutorialsPages()));
  }

  /// Run the admin, i.e setup all admin pages
  @override
  Future<void> run() async {
    return _setupAdminPages();
  }
}

class AdminMenu extends AdminAppMenuInstallerBase {
  /// Construct the admin menu
  @override
  Future<MenuDefModel> menu(AppModel app) async {
    var menuItems = <MenuItemModel>[];

    menuItems.add(MenuItemModel(
        documentID: "Booklets",
        text: "Booklets",
        description: "Booklets",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app,
            pageID: "eliud_pkg_fundamentals_model_booklets_page")));

    menuItems.add(MenuItemModel(
        documentID: "DecoratedContents",
        text: "DecoratedContents",
        description: "DecoratedContents",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app,
            pageID: "eliud_pkg_fundamentals_model_decoratedcontents_page")));

    menuItems.add(MenuItemModel(
        documentID: "Dividers",
        text: "Dividers",
        description: "Dividers",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app,
            pageID: "eliud_pkg_fundamentals_model_dividers_page")));

    menuItems.add(MenuItemModel(
        documentID: "Documents",
        text: "Documents",
        description: "Documents",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app,
            pageID: "eliud_pkg_fundamentals_model_documents_page")));

    menuItems.add(MenuItemModel(
        documentID: "DynamicWidgets",
        text: "DynamicWidgets",
        description: "DynamicWidgets",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app,
            pageID: "eliud_pkg_fundamentals_model_dynamicwidgets_page")));

    menuItems.add(MenuItemModel(
        documentID: "Faders",
        text: "Faders",
        description: "Faders",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action:
            GotoPage(app, pageID: "eliud_pkg_fundamentals_model_faders_page")));

    menuItems.add(MenuItemModel(
        documentID: "Grids",
        text: "Grids",
        description: "Grids",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action:
            GotoPage(app, pageID: "eliud_pkg_fundamentals_model_grids_page")));

    menuItems.add(MenuItemModel(
        documentID: "Presentations",
        text: "Presentations",
        description: "Presentations",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app,
            pageID: "eliud_pkg_fundamentals_model_presentations_page")));

    menuItems.add(MenuItemModel(
        documentID: "SimpleImages",
        text: "SimpleImages",
        description: "SimpleImages",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app,
            pageID: "eliud_pkg_fundamentals_model_simpleimages_page")));

    menuItems.add(MenuItemModel(
        documentID: "SimpleTexts",
        text: "SimpleTexts",
        description: "SimpleTexts",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app,
            pageID: "eliud_pkg_fundamentals_model_simpletexts_page")));

    menuItems.add(MenuItemModel(
        documentID: "Tutorials",
        text: "Tutorials",
        description: "Tutorials",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app,
            pageID: "eliud_pkg_fundamentals_model_tutorials_page")));

    MenuDefModel menu = MenuDefModel(
        admin: true,
        documentID: "eliud_pkg_fundamentals_model_admin_menu",
        appId: app.documentID,
        name: "eliud_pkg_fundamentals_model",
        menuItems: menuItems);
    await menuDefRepository(appId: app.documentID)!.add(menu);
    return menu;
  }
}

class AdminAppWiper extends AdminAppWiperBase {
  /// Delete all admin pages
  @override
  Future<void> deleteAll(String appID) async {}
}

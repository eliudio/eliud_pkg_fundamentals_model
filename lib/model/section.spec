{
  "id": "Section",
  "packageName": "eliud_pkg_fundamentals_model",
  "packageFriendlyName": "fundamentals",
  "isAppModel": false,
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
    "hasPersistentRepository": false,
    "generateFirestoreRepository": false,
    "generateRepositorySingleton": false,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": false,
    "generateList": false,
    "generateDropDownButton": false,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": true,
    "documentSubCollectionOf": "app"
  },
  "fields": [
    {
      "fieldName": "documentID",
      "required": true,
      "displayName": "Document ID",
      "fieldType": "String",
      "group": "general",
      "defaultValue": "IDENTIFIED",
      "iconName": "vpn_key",
      "hidden": true
    },
    {
      "fieldName": "title",
      "displayName": "Title",
      "group": "general",
      "fieldType": "String"
    },
    {
      "fieldName": "description",
      "displayName": "Description",
      "group": "general",
      "fieldType": "String"
    },
    {
      "fieldName": "image",
      "displayName": "Image",
      "fieldType": "PlatformMedium",
      "association": true,
      "group": "image",
      "optional": true
    },
    {
      "fieldName": "imagePositionRelative",
      "displayName": "Relative position of the image",
      "fieldType": "enum",
      "enumName": "RelativeImagePosition",
      "enumValues" : [ "behind", "inFront", "below", "Above", "Aside" ],
      "group": "imagePositionRelative"
    },
    {
      "fieldName": "imageAlignment",
      "displayName": "Alignment of the image",
      "fieldType": "enum",
      "enumName": "SectionImageAlignment",
      "enumValues" : [ "left", "center", "right" ],
      "group": "imageAlignment"
    },
    {
      "fieldName": "imageWidth",
      "displayName": "Image Width (% of screen width)",
      "fieldType": "double",
      "remark": "Width of the image",
      "group": "general"
    },
    {
      "fieldName": "links",
      "displayName": "Links",
      "group": "chapterLinks",
      "fieldType": "Link",
      "arrayType": "Array"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "image",
        "description": "Optional Image"
    },
    {
        "group": "imagePositionRelative",
        "description": "Relative position of the image"
    },
    {
        "group": "imageAlignment",
        "description": "Alignment of the image"
    },
    {
        "group": "chapterLinks",
        "description": "Chapter Links"
    }
  ],
  "listFields": {
    "title": "value.title != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.title!)) : Container()",
    "subTitle": "value.description != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.description!)) : Container()"
  },
  "depends": ["eliud_core_main"]
}

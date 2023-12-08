{
  "id": "TutorialEntry",
  "packageName": "eliud_pkg_fundamentals_model",
  "packageFriendlyName": "fundamentals",
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
    "generateEmbeddedComponent": true
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
      "fieldName": "code",
      "displayName": "Code",
      "fieldType": "String",
      "group": "code",
      "optional": true
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
         "group": "code",
         "description": "Optional Code"
     }
  ],
  "listFields": {
    "title": "value.description != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.description!)) : Container()"
  },
  "depends": ["eliud_core_main"]
}

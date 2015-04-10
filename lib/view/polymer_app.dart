import 'dart:html';
import 'dart:convert';
import 'package:polymer_contact_links/contact_links.dart';
import 'package:polymer/polymer.dart';

@CustomTag('polymer-app')
class PolymerApp extends PolymerElement {
  @observable Contacts contacts;

  PolymerApp.created() : super.created() {
    var contactLinksModel = new ContactLinksModel();
    contacts = contactLinksModel.contacts;

    // load data
    String json = window.localStorage['polymer_contact_links'];
    if (json == null) {
      contactLinksModel.init();
    } else {
      contacts.fromJson(JSON.decode(json));
    }

    contacts.internalList = toObservable(contacts.internalList);
  }

  save(Event e, var detail, Node target) {
    window.localStorage['polymer_contact_links'] =
        JSON.encode(contacts.toJson());
  }
}

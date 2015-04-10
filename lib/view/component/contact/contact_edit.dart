import 'dart:html';
import 'package:polymer_contact_links/contact_links.dart';
import 'package:polymer/polymer.dart';
import 'contact_table.dart';

@CustomTag('contact-edit')
class ContactEdit extends PolymerElement {
  @published Contacts contacts;
  @published Contact contact;
  @published String nomPrenom;

  ContactEdit.created() : super.created();

  attached() {
    super.attached();
    nomPrenom = contact.nomPrenom;
  }

  update(Event e, var detail, Node target) {
    contact.nomPrenom = nomPrenom;
    contacts.order(); // to see a new nomPrenom in the list
    var polymerApp = querySelector('#polymer-app');
    ContactTable contactTable = polymerApp.shadowRoot.querySelector('#contact-table');
    contactTable.showEdit = false;
  }
}

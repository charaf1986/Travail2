import 'dart:html';
import 'package:polymer_contact_links/contact_links.dart';
import 'package:polymer/polymer.dart';

@CustomTag('contact-table')
class ContactTable extends PolymerElement {
  @published Contacts contacts;
  Contact contact;
  @observable bool showAdd = false;
  @observable bool showEdit = false;

  ContactTable.created() : super.created();

  show(Event e, var detail, Node target) {
    ButtonElement addContact = $['show-add'];
    if (addContact.text == 'Show Add') {
      showAdd = true;
      addContact.text = 'Hide Add';
    } else {
      showAdd = false;
      addContact.text = 'Show Add';
    }
  }

  edit(Event e, var detail, Element target) {
    String email = target.attributes['contact-email'];
    contact = contacts.find(email);
    showEdit = true;
  }

  delete(Event e, var detail, Element target) {
    String email = target.attributes['contact-email'];
    contact = contacts.find(email);
    contacts.remove(contact);
  }
}

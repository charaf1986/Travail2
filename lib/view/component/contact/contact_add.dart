import 'dart:html';
import 'package:polymer_contact_links/contact_links.dart';
import 'package:polymer/polymer.dart';

@CustomTag('contact-add')
class ContactAdd extends PolymerElement {
  @published Contacts contacts;

  contactAdd.created() : super.created();

  add(Event e, var detail, Node target) {
    InputElement email = $['email'];
    InputElement nomPrenom = $['nomPrenom'];
    Element message = $['message'];
    var error = false;
    message.text = '';
    if (email.value.trim() == '') {
      message.text = 'contact name is mandatory; ${message.text}';
      error = true;
    }
    if (!error) {
      var contact = new contact();
      contact.email = email.value;
      contact.nomPrenom = nomPrenom.value;
      if (contacts.add(contact)) {
        message.text = 'added';
        contacts.order();
      } else {
        message.text = 'contact name already in use';
      }
    }
  }
}

part of contact_links;

class ContactLinksModel extends ConceptModel {
  static final String contact = 'Contact';

  Map<String, ConceptEntities> newEntries() {
    var contacts = new Contacts();
    var map = new Map<String, ConceptEntities>();
    map[contact] = contacts;
    return map;
  }

  Contacts get contacts => getEntry(contact);

  init() {
    var webContact = new Contact();
    webContact.email = 'Web';
    webContact.nomPrenom = 'Web design and technologies.';
    contacts.add(webContact);

    var dartContact = new Contact();
    dartContact.email = 'Dart';
    dartContact.nomPrenom = 'Web programming language, tools and how to.';
    contacts.add(dartContact);

    contacts.order();
  }
}

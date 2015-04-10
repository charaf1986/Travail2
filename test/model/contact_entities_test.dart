import 'package:unittest/unittest.dart';
import 'package:dartlero/dartlero.dart';
import 'package:polymer_contact_links/contact_links.dart';

testContacts() {
  Contacts contacts;
  group("Testing Contacts: ", () {
    setUp(() {
      ContactLinksModel contactLinksModel = new ContactLinksModel();
      contactLinksModel.init();
      contacts = contactLinksModel.contacts;
    });
    tearDown(() {
      contacts.clear();
      expect(contacts.isEmpty, isTrue);
    });
    test('Add contact', () {
      var contact = new contact();
      contact.email = 'JavaScript';
      contacts.add(contact);
      contacts.display('Add contact');
    });
    test('Add contact without data', () {
      var contact = new Contact();
      expect(contact, isNotNull);
      var added = contacts.add(contact);
      expect(added, isTrue);
      contacts.display('Add contact without data');
    });
    test('Add not unique contact', () {
      var contact = new Contact();
      contact.email = 'Dart';
      var added = contacts.add(contact);
      expect(added, isFalse);
      contacts.display('Add not unique contact');
    });
    test('Order contacts', () {
      contacts.order();
      contacts.display('Contacts ordered by email');
    });
  });
}

main() {
  testContacts();
}

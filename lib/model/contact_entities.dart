part of contact_links;

class Contact extends ConceptEntity<Contact> {
  String nomPrenom;

  Contact newEntity() => new Contact();

  String toString() {
    return '  {\n '
           '    ${super.toString()}, \n '
           '    nomPrenom: ${nomPrenom}\n'
           '  }\n';
  }

  Map<String, Object> toJson() {
    Map<String, Object> entityMap = super.toJson();
    entityMap['nomPrenom'] = nomPrenom;
    return entityMap;
  }

  fromJson(Map<String, Object> entityMap) {
    super.fromJson(entityMap);
    nomPrenom = entityMap['nomPrenom'];
  }

  bool get onProgramming =>
      nomPrenom.contains('programming') ? true : false;
}

class Contacts extends ConceptEntities<Contact> {
  Contacts newEntities() => new Contacts();
  Contact newEntity() => new Contact();
}

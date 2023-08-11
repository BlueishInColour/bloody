import 'dart:convert';
import '../Models/post_model.dart';

import 'package:dart_azure_cosmosdb/dart_azure_cosmosdb.dart';

String dbId = 'userstttttt';
String collectionId = 'firsdb';

CosmosDb connectCosmos() {
  final cosmosDb = CosmosDb(
    connectionUri: 'https://28e91624-0ee0-4-231-b9ee.documents.azure.com:443/',
    primaryKey:
        'k7t3YFb3EcTRQLIHHp7Yai0lMzWsQxmHMGhKlbAtLBuE1R7ksEuY7ZRIbIH8ahQIQfa1L7yqEKyfACDbN0y5KA==',
    authorizationType: 'master',
    authorizationVersion: '1.0',
  );
  return cosmosDb;
}

CosmosDb cosmosdb = connectCosmos();

//list all db

listdb() async {
  CosmosDb cosmosdb = connectCosmos();
  final CosmosDatabaseList databaseList = await cosmosdb.database.list();
  print(databaseList);
  if (databaseList.error.isEmpty) {
    print('data base is so empty');
  }
}

get() async {
  CosmosDb cosmosdb = connectCosmos();
  final CosmosDatabase database = await cosmosdb.database.get(dbId: dbId);
  print(database);
}

createdb() async {
  CosmosDb cosmosdb = connectCosmos();
  final CosmosDatabase database = await cosmosdb.database.create(dbId: dbId);
  print('database created');
  print(database.toMap());
}

deletedb() async {
  CosmosDb cosmosDb = connectCosmos();
  final CosmosDatabase database = await cosmosDb.database.delete(dbId: dbId);
  print('db deleted');
  print(database);
}

/////working with collection in cosmosdb / azure
///

createCollection() async {
  print('connecting collection');
  CosmosDb cosmosdb = connectCosmos();
  print('connected collection');

  Collection collection = await cosmosdb.collection.create(
      dbId: dbId, collectionId: collectionId, partitionKey: '/id', version: 1);
  print('collection created');
  print(collection.toMap());
  print(collection.id);
  if (collection.error.isEmpty) {
    print('there was an errorr');
  }
}

deleteCollection() async {
  CosmosDb cosmosdb = connectCosmos();
  Collection collection =
      await cosmosdb.collection.delete(dbId: dbId, collectionId: collectionId);
  print('collection deleted');
  if (collection.error.isEmpty) {
    print('collection is empty');
  }
}

getCollection() async {
  print('connecting');
  CosmosDb cosmosdb = connectCosmos();
  print('connected');
  Collection collection =
      await cosmosdb.collection.get(dbId: dbId, collectionId: collectionId);
  print('items gotten');
  print(collection.toMap());
}

listCollection() async {
  CosmosDb cosmosdb = connectCosmos();
  CollectionList collection = await cosmosdb.collection.list(dbId: dbId);
  print('list gotten');
  print(collection.toMap());
}

///working with document in azure / cosmosdb
///
///
// Example: Create an instance of a Person to write to the document.
class User {
  final String id;
  final String name;
  final String email;
  User(
      {this.id = 'euie',
      this.name = 'pelumi',
      this.email = 'eyelase@gmail.com'});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'email': email};
  }

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'email': email};
}

createDocument({
  String dbId = 'userstttttt',
  String collectionId = 'firsdb',
  String documentId = '',
  String partitionKey = '',
  Map<String, dynamic> data = const {},
}) async {
  print('connecting');
  CosmosDb cosmosdb = connectCosmos();
  print('connected');
  //conditionally create database
  // await cosmosdb.database.get(dbId: dbId).then((value) async {
  //   value.error.isEmpty
  //       ? print('database contains $dbId')
  //       : await cosmosdb.database.create(dbId: dbId);
  // });

  //conditionally create collection

  await cosmosdb.collection
      .get(dbId: dbId, collectionId: collectionId)
      .then((value) async {
    value.error.isEmpty
        ? print('collection contains $collectionId in $dbId')
        : await cosmosdb.collection
            .create(
                dbId: dbId,
                collectionId: collectionId,
                partitionKey: '/$collectionId',
                version: 1)
            .then((value) => print(value.error));
  });

  //conditionally creates documents
  print(data.toString());
  final CosmosDocument document = await cosmosdb.document
      .get(
          dbId: dbId,
          collectionId: collectionId,
          documentId: documentId,
          partitionKey: documentId)
      .then((value) async {
    value.error.isEmpty
        ? await cosmosdb.document
            .replace(
              dbId: dbId,
              collectionId: collectionId,
              documentId: documentId,
              partitionKey: documentId,
              body: data,
            )
            .then((value) => print(
                'when replacing documents this error ws encountered ${value.error}'))
        : await cosmosdb.document
            .create(
              dbId: dbId,
              collectionId: collectionId,
              //  documentId: documentId,
              partitionKey: partitionKey,
              body: data,
            )
            .then((value) => print(
                'when creating documents this error ws encountered ${value.error}'));

    return value;
  });

  print(cosmosdb.document
      .get(
          dbId: dbId,
          collectionId: collectionId,
          documentId: documentId,
          partitionKey: partitionKey)
      .then((value) => print(value.toMap())));
  return document;
}

listDocument() async {
  CosmosDb cosmosDb = connectCosmos();
  final CosmosDocumentList documentList =
      await cosmosDb.document.list(dbId: dbId, collectionId: collectionId);
  print('list gotten');
  print(documentList.toMap());
}

getDocument(String id) async {
  CosmosDb cosmosdb = connectCosmos();
  final CosmosDocument document = await cosmosdb.document.get(
      dbId: dbId, collectionId: collectionId, documentId: id, partitionKey: id);
  print('gotten document');
  print(document.toMap());
  print('this is the document unmapped value ${document.values}');
  var mapped = document.toMap();
  print(mapped['id']);
  print(mapped['name']);
  print(mapped['email']);
  // var map = mapped.map((key, value) => {'id': id, 'name': name, 'email': email},)
  var fromjson = User.fromJson(document.toMap());
  print('this is the User model ${fromjson.name}');
  print(mapped);
}

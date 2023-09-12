import 'package:deta/deta.dart';
import 'package:dio/dio.dart';
import 'package:dio_client_deta_api/dio_client_deta_api.dart';

String bloodyProjectKey = 'a0pyb8pggbz_VppAp5JxsSeSePk6ebgAvLh2qc2WXBPJ';
String rubicProjectKey = 'a0v1b2pi1rz_weyDeLfaSvsDyumJeFsrYWpMHjLv6FLc';
String baseName = 'posts';
final deta =
    Deta(projectKey: rubicProjectKey, client: DioClientDetaApi(dio: Dio()));
final detabase = deta.base(baseName);

//
put() async {
  print('about to start putting');
  var res =
      await deta.base(baseName).put({'name': 'oluwapelumi', 'age': '324'});
  print(res);
  print('finish putting');

  // Return all element that matched the indicated `query`.
}

get() async {
  print('about to get');
  var res = await detabase.fetch();
  print(res);
  print('this is done');
}

//all youll do is use the final of this to perform CRUD operations in any place flexibly
//PostApi
final postApi = deta.base('posts');

//
final nuggetApi = deta.base('nuggets');

//
final commentApi = deta.base('comments');

//
final associationApi = deta.base('association');

//
final tagApi = deta.base('categories');

//
final userApi = deta.base('users');

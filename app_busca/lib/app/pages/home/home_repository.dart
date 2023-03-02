import 'package:app_busca/app/models/model_return_search.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  final dio = Dio();

  //! Metodo POST de busca
  Future<ModelReturnSearch?> postSearch(String buscar) async {
    var dataBody = {"busca": buscar};
    try {
      Response response = await dio.post(
        "http://localhost:8000/buscar",
        options: Options(
            contentType: 'application/json', responseType: ResponseType.json),
        data: dataBody,
      );
      if (response.statusCode == 200) {
        final saida = ModelReturnSearch.fromJson(response.data);
        return saida;
      }
    } on DioError catch (exc) {
      throw ('Exception ${exc.message}');
    }
    return null;
  }
}

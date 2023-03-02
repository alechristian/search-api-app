import 'package:app_busca/app/models/model_return_search.dart';
import 'package:app_busca/app/pages/home/home_repository.dart';
import 'package:app_busca/utils/enums/model_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final repository = HomeRepository();

  final buscar = TextEditingController();

  //! validar estados da aplicação
  stateButton validadeButton = stateButton.desabled;
  modelState state = modelState.stopped;

  //! Models dos retornos
  ModelReturnSearch? searchReturn;

  //! uma validação simples para habilitar o botao que dispara a pesquisa
  setValidaCampo(value) {
    if (buscar.text.length > 5) {
      validadeButton = stateButton.enabladed;
    } else {
      validadeButton = stateButton.desabled;
    }
    notifyListeners();
  }

  //! faz a pesquisa e valida se houve algum erro
  busca() async {
    if (state == modelState.loading) return;
    try {
      state = modelState.loading;
      notifyListeners();

      searchReturn = await repository.postSearch(buscar.text);

      state = modelState.success;
    } on DioError catch (e) {
      state = modelState.error;
      print(e);
    } catch (error) {
      print(error);
    } finally {
      notifyListeners();
    }
  }
}

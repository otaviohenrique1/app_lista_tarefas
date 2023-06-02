import 'package:flutter/material.dart';
import 'package:app_lista_tarefas/data/tarefa_dao.dart';
import 'package:app_lista_tarefas/models/tarefa_model.dart';

class TarefaProvider2 extends ChangeNotifier {
  Future<List<TarefaModel>> _listaTarefas = [] as Future<List<TarefaModel>>;
  late TarefaModel _dadosTarefa;
  late String _dadosIdTarefa;

  Future<List<TarefaModel>> get listaTarefas => _listaTarefas;
  TarefaModel get dadosTarefa => _dadosTarefa;
  String get dadosIdTarefa => _dadosIdTarefa;

  Future save(TarefaModel tarefa) async {
    await TarefaDao().save(tarefa);
    findAll();
    // notifyListeners();
  }

  Future delete(String idTarefa) async {
    await TarefaDao().delete(idTarefa);
    findAll();
    // notifyListeners();
  }

  Future update(TarefaModel tarefa, String idTarefa) async {
    await TarefaDao().update(tarefa, idTarefa);
    findAll();
    // notifyListeners();
  }

  Future<void> findById(String idTarefa) async {
    List<TarefaModel> data = await TarefaDao().find(idTarefa);
    _dadosTarefa = data.first;
    notifyListeners();
  }

  findAll() async {
    _listaTarefas = TarefaDao().findAll();
    notifyListeners();
  }
}

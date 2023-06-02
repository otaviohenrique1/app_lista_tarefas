import 'package:flutter/material.dart';
import 'package:app_lista_tarefas/data/tarefa_dao.dart';
import 'package:app_lista_tarefas/models/tarefa_model.dart';

class TarefaProvider extends ChangeNotifier {
  List<TarefaModel> _listaTarefas = [];
  TarefaModel _dadosTarefa = TarefaModel(
    id: "",
    titulo: "",
    tarefa: "",
    concluido: "",
    autor: "",
    dataCriacao: "",
  );

  List<TarefaModel> dadosTarefa2 = [];

  List<TarefaModel> get listaTarefas => _listaTarefas;
  TarefaModel get dadosTarefa => _dadosTarefa;

  Future save(TarefaModel tarefa) async {
    await TarefaDao().save(tarefa);
    findAll();
    // notifyListeners();
  }

  Future delete(String idTarefa) async {
    await TarefaDao().delete(idTarefa);
    _dadosTarefa = TarefaModel(
      id: "",
      titulo: "",
      tarefa: "",
      concluido: "",
      autor: "",
      dataCriacao: "",
    );
    findAll();
    // notifyListeners();
  }

  Future update(TarefaModel tarefa, String idTarefa) async {
    await TarefaDao().update(tarefa, idTarefa);
    findAll();
    // notifyListeners();
  }

  findById(String idTarefa) async {
    List<TarefaModel> data = await TarefaDao().find(idTarefa);
    if (data.isNotEmpty) {
      _dadosTarefa = data.first;
      notifyListeners();
    } else {
      _dadosTarefa = TarefaModel(
        id: "",
        titulo: "",
        tarefa: "",
        concluido: "",
        autor: "",
        dataCriacao: "",
      );
      notifyListeners();
    }
  }

  findAll() async {
    _listaTarefas = await TarefaDao().findAll();
    notifyListeners();
  }
}

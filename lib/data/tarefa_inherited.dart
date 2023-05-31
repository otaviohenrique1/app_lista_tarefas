import 'package:app_lista_tarefas/models/tarefa_model.dart';
import 'package:flutter/material.dart';

class TarefaInherited extends InheritedWidget {
  TarefaInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<TarefaModel> _listaTarefas = [];

  void novaTarefa(TarefaModel tarefa) {
    _listaTarefas.add(tarefa);
  }

  void removerTarefa(String idTarefa) {
    _listaTarefas.removeWhere((element) => element.id == idTarefa);
  }

  List<TarefaModel> listarTodasTarefas() {
    return _listaTarefas;
  }

  TarefaModel? buscarTarefaPorId(String idTarefa) {
    return _listaTarefas.firstWhere((element) => element.id == idTarefa);
  }

  void atualizarTarefa(String idTarefa, TarefaModel tarefa) {
    TarefaModel tarefaBuscada =
        _listaTarefas.firstWhere((element) => element.id == idTarefa);

    tarefaBuscada.id = tarefa.id;
    tarefaBuscada.tarefa = tarefa.tarefa;
    tarefaBuscada.concluido = tarefa.concluido;
    tarefaBuscada.autor = tarefa.autor;
    tarefaBuscada.dataCriacao = tarefa.dataCriacao;
  }

  static TarefaInherited of(BuildContext context) {
    final TarefaInherited? result =
        context.dependOnInheritedWidgetOfExactType<TarefaInherited>();
    assert(result != null, "No found in context");
    return result!;
  }

  @override
  bool updateShouldNotify(TarefaInherited oldWidget) {
    throw oldWidget._listaTarefas.length != _listaTarefas.length;
  }
}
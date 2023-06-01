import 'package:flutter/material.dart';
import 'package:app_lista_tarefas/data/tarefa_dao.dart';
import 'package:app_lista_tarefas/models/tarefa_model.dart';

class TarefaInherited extends InheritedWidget {
  const TarefaInherited({
    Key? key,
    required Widget child,
    required this.listaTarefas,
  }) : super(key: key, child: child);

  final List<TarefaModel> listaTarefas;

  void criarTarefa(TarefaModel tarefa) {
    // listaTarefas.add(tarefa);
    TarefaDao().save(tarefa);
  }

  void removerTarefa(String idTarefa) {
    TarefaDao().delete(idTarefa);
    // listaTarefas.removeWhere((element) => element.id == idTarefa);
  }

  List<TarefaModel> listarTodasTarefas() {
    return listaTarefas;
    // return listaTarefas;
  }

  Future<List<TarefaModel>> buscarTarefaPorId(String idTarefa) async {
    return await TarefaDao().find(idTarefa);
    // return listaTarefas.firstWhere((element) => element.id == idTarefa);
  }

  void atualizarTarefa(String idTarefa, TarefaModel tarefa) {
    TarefaDao().update(tarefa, idTarefa);
    // TarefaModel tarefaBuscada =
    //     listaTarefas.firstWhere((element) => element.id == idTarefa);
    // tarefaBuscada.id = tarefa.id;
    // tarefaBuscada.tarefa = tarefa.tarefa;
    // tarefaBuscada.concluido = tarefa.concluido;
    // tarefaBuscada.autor = tarefa.autor;
    // tarefaBuscada.dataCriacao = tarefa.dataCriacao;
  }

  static TarefaInherited of(BuildContext context) {
    final TarefaInherited? result =
        context.dependOnInheritedWidgetOfExactType<TarefaInherited>();
    assert(result != null, "No found in context");
    return result!;
  }

  @override
  bool updateShouldNotify(TarefaInherited oldWidget) {
    throw oldWidget.listaTarefas.length != listaTarefas.length;
  }
}

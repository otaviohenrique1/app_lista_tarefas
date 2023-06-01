import 'package:app_lista_tarefas/data/database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:app_lista_tarefas/data/base_dao.dart';
import 'package:app_lista_tarefas/models/tarefa_model.dart';

class TarefaDao implements BaseDao<TarefaModel> {
  static const String tabelaSql = "CREATE TABLE $_nomeTabela ("
      "$_id TEXT, "
      "$_tarefa TEXT, "
      "$_concluido TEXT, "
      "$_autor TEXT, "
      "$_dataCriacao DATETIME"
      ")";

  static const String _nomeTabela = "tarefaTabela";

  static const String _id = "id";
  static const String _tarefa = "tarefa";
  static const String _concluido = "concluido";
  static const String _autor = "autor";
  static const String _dataCriacao = "dataCriacao";

  @override
  Future<int> save(TarefaModel tarefa) async {
    final Database bancoDeDados = await getDatabase(); // Criar conexao
    Map<String, dynamic> tarefaMap = toMap(tarefa);
    return await bancoDeDados.insert(_nomeTabela, tarefaMap);
  }

  @override
  Future<int> update(TarefaModel tarefa, String idTarefa) async {
    final Database bancoDeDados = await getDatabase(); // Criar conexao
    Map<String, dynamic> tarefaMap = toMap(tarefa);
    return await bancoDeDados.update(_nomeTabela, tarefaMap,
        where: "$_id = ?", whereArgs: [idTarefa]);
  }

  @override
  Future<List<TarefaModel>> findAll() async {
    final Database bancoDeDados = await getDatabase(); // Criar conexao
    final List<Map<String, dynamic>> resultado =
        await bancoDeDados.query(_nomeTabela);
    return toList(resultado);
  }

  @override
  Future<List<TarefaModel>> find(String idTarefa) async {
    final Database bancoDeDados = await getDatabase(); // Criar conexao
    final List<Map<String, dynamic>> resultado = await bancoDeDados.query(
      _nomeTabela,
      where: "$_id = ?",
      whereArgs: [idTarefa],
    );
    return toList(resultado);
  }

  @override
  Future<int> delete(String idTarefa) async {
    final Database bancoDeDados = await getDatabase(); // Criar conexao
    return await bancoDeDados
        .delete(_nomeTabela, where: "$_id = ?", whereArgs: [idTarefa]);
  }

  @override
  Map<String, dynamic> toMap(TarefaModel tarefa) {
    final Map<String, dynamic> mapaTarefa = {};
    mapaTarefa[_id] = tarefa.id;
    mapaTarefa[_tarefa] = tarefa.tarefa;
    mapaTarefa[_concluido] = tarefa.concluido;
    mapaTarefa[_autor] = tarefa.autor;
    mapaTarefa[_dataCriacao] = tarefa.dataCriacao;
    return mapaTarefa;
  }

  @override
  List<TarefaModel> toList(List<Map<String, dynamic>> mapaTarefa) {
    final List<TarefaModel> tarefas = [];
    for (Map<String, dynamic> linha in mapaTarefa) {
      final TarefaModel tarefa = TarefaModel(
        id: linha[_id],
        tarefa: linha[_tarefa],
        concluido: linha[_concluido],
        autor: linha[_autor],
        dataCriacao: linha[_dataCriacao],
      );
      tarefas.add(tarefa);
    }
    return tarefas;
  }
}

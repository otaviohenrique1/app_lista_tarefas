class TarefaModel {
  TarefaModel({
    required this.id,
    required this.tarefa,
    required this.concluido,
    required this.autor,
    required this.dataCriacao,
  });

  String id;
  String tarefa;
  bool concluido;
  String autor;
  String dataCriacao;
}

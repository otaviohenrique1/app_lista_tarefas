import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_lista_tarefas/models/tarefa_model.dart';
import 'package:app_lista_tarefas/pages/tarefa_detalhes.dart';
import 'package:app_lista_tarefas/provider/tarefa_provider.dart';
import 'package:app_lista_tarefas/styles/cores.dart';
import 'package:app_lista_tarefas/styles/fonts.dart';

class ItemListaTarefas extends StatefulWidget {
  const ItemListaTarefas({
    super.key,
    required this.tarefa,
  });

  final TarefaModel tarefa;

  @override
  State<ItemListaTarefas> createState() => _ItemListaTarefasState();
}

class _ItemListaTarefasState extends State<ItemListaTarefas> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    var item = widget.tarefa;

    _isChecked = (item.concluido == "Sim") ? true : false;

    TarefaProvider listTypes =
        Provider.of<TarefaProvider>(context, listen: false);

    updateCheckbox(value) {
      setState(() {
        listTypes.update(
            TarefaModel(
              id: item.id,
              tarefa: item.tarefa,
              autor: item.autor,
              concluido: (_isChecked) ? "Não" : "Sim",
              dataCriacao: item.dataCriacao,
            ),
            item.id);
        _isChecked = value!;
      });
    }

    TextStyle textStyle = TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeightRegular,
      color: preto,
      decoration: (item.concluido == "Sim")
          ? TextDecoration.lineThrough
          : TextDecoration.none,
    );

    String tarefa = "${item.tarefa.substring(0, 40)}...";
    String dataCriacao = item.dataCriacao;

    return Container(
      // key: Key(uuid),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(tarefa, style: textStyle),
        subtitle: Text(dataCriacao, style: textStyle),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          side: BorderSide(color: Colors.black, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TarefaDetalhes(idTarefa: widget.tarefa.id),
            ),
          );
        },
        leading: Checkbox(
          value: _isChecked,
          onChanged: updateCheckbox,
        ),
        trailing: Consumer<TarefaProvider>(
          builder: (context, providerTarefaModel, child) {
            return IconButton(
              onPressed: () {
                providerTarefaModel.delete(item.id);
              },
              icon: const Icon(Icons.delete),
            );
          },
        ),
      ),
    );
  }
}

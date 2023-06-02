import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_lista_tarefas/teste/tarefa_provider2.dart';
import 'package:app_lista_tarefas/models/tarefa_model.dart';

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
    // _isChecked = (widget.tarefa.concluido == "Sim") ? true : false;

    var item = widget.tarefa;

    TarefaProvider2 listTypes =
        Provider.of<TarefaProvider2>(context, listen: false);

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

    return Container(
      // key: Key(uuid),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text("${item.tarefa.substring(0, 40)}..."),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item.autor),
            Text(item.dataCriacao),
            Text(item.concluido),
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          side: BorderSide(color: Colors.black, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        leading: Checkbox(
          value: _isChecked,
          onChanged: updateCheckbox,
        ),
        trailing: Consumer<TarefaProvider2>(
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

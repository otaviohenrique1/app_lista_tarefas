import "package:app_lista_tarefas/data/tarefa_dao.dart";
import "package:sqflite/sqflite.dart";
import "package:path/path.dart";

Future<Database> getDatabase() async {
  final String path = join(
    await getDatabasesPath(),
    "app_lista_tarefa.db",
  );
  return openDatabase(
    path,
    onCreate: (db, version) async {
      await db.execute(TarefaDao.tabelaSql);
    },
    version: 1,
  );
}

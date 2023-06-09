import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_lista_tarefas/pages/homepage.dart';
import 'package:app_lista_tarefas/provider/tarefa_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TarefaProvider(),
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

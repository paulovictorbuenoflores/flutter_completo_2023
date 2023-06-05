import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TextEditingController _textEditingController = TextEditingController();

  List<String> tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold, ola mundo!'),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            //toda vez que preciso de entrada de dados uso textField
            TextField(
              controller: _textEditingController,
            ),
            Container(
              height: 150,
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: tarefas.length,
                reverse: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: InkWell(
                        onLongPress: () {
                          setState(() {
                            tarefas.removeAt(index);
                          });
                          print('pressionou');
                        },
                        child: Text(tarefas[index])),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                if (_textEditingController.text.length > 0) {
                  setState(() {
                    tarefas.add(_textEditingController.text);
                  });

                  _textEditingController.clear();
                }
                print(_textEditingController.value);
              },
              child: Icon(Icons.save),
            ),
            Spacer(),
            FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                setState(() {
                  tarefas = [];
                });

                _textEditingController.clear();

                print(_textEditingController.value);
              },
              child: Icon(Icons.cleaning_services_rounded),
            ),
          ],
        ),
      ),
    );
  }
}

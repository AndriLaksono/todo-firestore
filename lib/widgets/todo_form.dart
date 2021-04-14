import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSaveTodo;

  const TodoFormWidget({
    Key key,
    this.title = '',
    this.description = '',
    @required this.onChangedTitle,
    @required this.onChangedDescription,
    @required this.onSaveTodo,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // controller: controller,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitle(),
          SizedBox(height: 8),
          buildDescription(),
          SizedBox(height: 8),
          buildButton()
        ],
      ),
    );
  }

  Widget buildTitle() => TextFormField(
    maxLines: 1,
    initialValue: title,
    onChanged: onChangedTitle,
    validator: (title) {
      if (title.isEmpty) {
        return 'The title cannot be empty';
      }
      return null;
    },
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Title'
    ),
  );

  Widget buildDescription() => TextFormField(
    maxLines: 3,
    initialValue: description,
    onChanged: onChangedDescription,
    validator: (description) {
      if (description.isEmpty) {
        return 'The description cannot be empty';
      }
      return null;
    },
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Description'
    ),
  );

  Widget buildButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black)
      ),
      onPressed: onSaveTodo,
      child: Text('Save')
    ),
  );
}
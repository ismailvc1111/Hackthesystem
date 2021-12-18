class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "What is a correct syntax to output Hello World in Python?",
    "options": ['p(hello world)', 'echo(hello world)', 'echo hello world', 'print(hello world)'],
    "answer_index": 3,
  },
  {
    "id": 2,
    "question": "How do you insert COMMENTS in Python code?",
    "options": ['//coment', '#coment', '--coment', '¡coment'],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question": "Which one is NOT a legal variable name?",
    "options": ['//m', 'variable', '_variable_', 'variable_'],
    "answer_index": 0,
  },

];

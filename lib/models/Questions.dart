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
        "Aue tipo de datos hay en python",
    "options": ['Numeros , caracteres ,flotantes Y  números complejos ', 'Solo Caracteres', 'Ninguna es correcta', 'Todas Son V'],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "¿Cómo se insertan COMENTARIOS en el código Python?",
    "options": ['//coment', '#coment', '--coment', '¡coment'],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question": "¿Cuál NO es un nombre de variable legal?",
    "options": ['//m', 'variable', '_variable_', 'variable_'],
    "answer_index": 0,
  },

];

class NoteList {
  String noteTitle;
  String noteCategory;

  NoteList({
    required this.noteTitle,
    required this.noteCategory,
  });
}

List<NoteList> noteList = [
  NoteList(noteTitle: "Samsung A52", noteCategory: "Shopping"),
  NoteList(noteTitle: "Shoes", noteCategory: "Shopping"),
  NoteList(noteTitle: 'Gift', noteCategory: 'Shopping'),
  NoteList(noteTitle: 'Chocolate', noteCategory: 'Shopping'),
  NoteList(noteTitle: 'Shoes', noteCategory: 'Packing'),
];

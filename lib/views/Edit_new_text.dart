import 'package:flutter/cupertino.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/Edit_new_notes_body.dart';

class EditNewNotes extends StatelessWidget {
  const EditNewNotes({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return EditNewNotesBody(
      note: note,
    );
  }
}

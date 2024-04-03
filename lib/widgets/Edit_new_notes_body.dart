import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNewNotesBody extends StatefulWidget {
  const EditNewNotesBody({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNewNotesBody> createState() => _EditNewNotesBodyState();
}

class _EditNewNotesBodyState extends State<EditNewNotesBody> {
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(children: [
          SizedBox(
            height: 40,
          ),
          customAppBar(
            onpressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subtitle = subtitle ?? widget.note.subtitle;
              widget.note.save();
              Navigator.pop(context);
            },
            Title: 'NewNote',
            icon: Icons.check,
          ),
          CustomTextField(
              onchanged: (p0) {
                title = p0;
              },
              hint: 'Title'),
          SizedBox(
            height: 40,
          ),
          CustomTextField(
            onchanged: (p0) {
              subtitle = p0;
            },
            hint: 'Content',
            maxlines: 4,
          ),
        ]),
      ),
    );
  }
}

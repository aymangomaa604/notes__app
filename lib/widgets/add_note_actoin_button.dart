import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/consts/const.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit_cubit.dart';

import 'add_note_button.dart';
import 'custom_text_field.dart';

class AddNoteBottonSheet extends StatefulWidget {
  const AddNoteBottonSheet({super.key});

  @override
  State<AddNoteBottonSheet> createState() => _AddNoteBottonSheetState();
}

class _AddNoteBottonSheetState extends State<AddNoteBottonSheet> {
  //bool isloading = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailure) {}
        if (state is AddNoteSuccess) {
          BlocProvider.of<NotesCubitCubit>(context).fetchAllData();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const SingleChildScrollView(child: formWidget()),
        );
      },
    );
  }
}

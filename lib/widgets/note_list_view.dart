import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit_cubit.dart';

import 'custom_noteItem.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<NotesCubitCubit, NotesCubitState>(
      builder: (context, state) {
        var notes =  BlocProvider.of<NotesCubitCubit>(context).notes!;
        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
          return  Padding(
            padding:const EdgeInsets.symmetric(vertical: 4),
            child: NotesItem(
              notes: notes[index],
            ),
          );
        });
      },
    );
  }
}

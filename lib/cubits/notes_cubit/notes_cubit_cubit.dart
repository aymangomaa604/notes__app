import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

import '../../consts/const.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesCubitInitial());
  
List<NoteModel>? notes;
  fetchAllData() async {
    
    var notesBox = Hive.box<NoteModel>(kBoxNotes);
   notes = notesBox.values.toList();
    emit(NotesCubitSuccess());
  }
}

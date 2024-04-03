import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'add_note_actoin_button.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class formWidget extends StatefulWidget {
  const formWidget({
    super.key,
  });

  @override
  State<formWidget> createState() => _formWidgetState();
}

class _formWidgetState extends State<formWidget> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> newkey = GlobalKey();
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: newkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          CustomTextField(
            onsaved: (p0) {
              title = p0;
            },
            hint: 'title',
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            onsaved: (p0) {
              subTitle = p0;
            },
            hint: 'Content ',
            maxlines: 4,
          ),
          const colorListView(),
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                ontap: () {
                  if (newkey.currentState!.validate()) {
                    newkey.currentState!.save();
                    var noteModel = NoteModel(
                        title: title!,
                        subtitle: subTitle!,
                        date: DateTime.now().toString().substring(0, 10),
                        color: Colors.red.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}

class coloritem extends StatelessWidget {
  const coloritem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 32,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 30,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 32,
          );
  }
}

class colorListView extends StatefulWidget {
  const colorListView({super.key});

  @override
  State<colorListView> createState() => _colorListViewState();
}

class _colorListViewState extends State<colorListView> {
  List<Color> colors = const [
    Color(0xffFF0000),
    Color(0xff00FF00),
    Color(0xff0000FF),
    Color(0xffFFFF00),
    Color(0xffFFF000),
  ];

  int currrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2,
      child: ListView.builder(
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: GestureDetector(
                onTap: () {
                  currrentIndex = index;
                  BlocProvider.of<AddNoteCubit>(context).color = colors[index];
                  setState(() {});
                },
                child: coloritem(
                  color: colors[index],
                  isActive: currrentIndex == index,
                ),
              ),
            );
          }),
    );
  }
}

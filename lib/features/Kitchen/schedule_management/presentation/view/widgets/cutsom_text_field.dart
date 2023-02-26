// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../../../../core/injection/injection_container.dart';
import '../../logic/add_delete_meal_bloc/add_delete_meal_bloc.dart';

class CustomTextField extends StatefulWidget {
  int selectedDay;
  CustomTextField({
    required this.selectedDay,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.only(
          left: 20,
          top: 5,
          bottom: 10,
          right: 10,
        ),
        child: TextFormField(
          controller: _textController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a meal description';
            }
            return null;
          },
          decoration: InputDecoration(
            prefix: SizedBox(
              width: 10,
            ),
            hintText: 'Add a meal',
            hintStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            suffixIcon: IconButton(
              iconSize: 30,
              color: Theme.of(context).colorScheme.primary,
              icon: const Icon(UniconsThinline.arrow_circle_right),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await sl<AddDeleteMealBloc>()
                      .addMealUsecase(_textController.text, widget.selectedDay);
                  _textController.clear();
                }
              },
            ),
            fillColor: Colors.transparent,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(
                width: 0.8,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(
                width: 0.8,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(
                width: 0.8,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

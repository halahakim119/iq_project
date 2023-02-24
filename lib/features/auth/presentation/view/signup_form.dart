import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_project/features/auth/domain/entities/signup_entity.dart';

import '../../../../core/injection/injection_container.dart';
import '../logic/cubit/authentication_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  String? _selectedDepartment;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              labelText: 'Full Name',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SingleChildScrollView(
            child: Container(
              width: 100,
              child: DropdownButtonFormField(
                isExpanded: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your department';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  labelText: 'Department',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                value: _selectedDepartment,
                onChanged: (value) {
                  setState(() {
                    _selectedDepartment = value;
                  });
                },
                elevation: 0,
                dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                items: const [
                  DropdownMenuItem(
                    value: 'Sales',
                    child: Text('Sales'),
                  ),
                  DropdownMenuItem(
                    value: 'HR',
                    child: Text('HR'),
                  ),
                  DropdownMenuItem(
                    value: 'Finance',
                    child: Text('Finance'),
                  ),
                  DropdownMenuItem(
                    value: 'Marketing',
                    child: Text('Marketing'),
                  ),
                  DropdownMenuItem(
                    value: 'R&D',
                    child: Text('R&D'),
                  ),
                ],
              ),
            ),
          ),
          TextFormField(
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } 
              // else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)?iq\.email$')
              //     .hasMatch(value)) {
              //   return 'Please enter a valid email address';
              // }
              return null;
            },
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              labelText: 'Email',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            obscureText: _isObscurePassword,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: Colors.transparent,
              labelText: 'Password',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              suffixIcon: IconButton(
                highlightColor: Colors.transparent,
                alignment: Alignment.bottomRight,
                onPressed: () {
                  setState(() {
                    _isObscurePassword = !_isObscurePassword;
                  });
                },
                icon: Icon(
                    size: 20,
                    color: Colors.grey.shade400,
                    _isObscurePassword
                        ? Icons.visibility_off
                        : Icons.visibility),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              } else if (value != _passwordController.text) {
                return 'Passwords do not match';
              }

              return null;
            },
            obscureText: _isObscureConfirmPassword,
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              labelText: 'Confirm Password',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              suffixIcon: IconButton(
                highlightColor: Colors.transparent,
                alignment: Alignment.bottomRight,
                onPressed: () {
                  setState(() {
                    _isObscureConfirmPassword = !_isObscureConfirmPassword;
                  });
                },
                icon: Icon(
                    size: 20,
                    color: Colors.grey.shade400,
                    _isObscureConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                SignupEntity signupEntity = SignupEntity(
                    name: _nameController.text,
                    department: _selectedDepartment.toString(),
                    email: _emailController.text,
                    password: _passwordController.text);
                final authenticationCubit = sl<AuthenticationCubit>();

                authenticationCubit.signUp(signupEntity);
                 context.router.pushNamed('auth');
              }
            },
            child: Text(
              'Sign Up',
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ],
      ),
    );
  }
}

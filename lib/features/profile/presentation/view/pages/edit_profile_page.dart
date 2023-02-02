import 'package:flutter/material.dart';

import '../../../domain/entities/user_entity.dart';
import '../widgets/edit_profile.dart';

class EditProfilePage extends StatefulWidget {
  final UserEntity user;

  const EditProfilePage({required this.user});
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = widget.user.name;
    _emailController.text = widget.user.email;
    _passwordController.text = widget.user.password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 119, 29, 22),
        title: const Text(
          "LUNCH2HQ",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Edit Your Profile',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _usernameController..text = widget.user.name,
                      decoration: const InputDecoration(labelText: "Username"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username can't be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailController..text = widget.user.email,
                      decoration: const InputDecoration(labelText: "Email"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email can't be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordController
                        ..text = widget.user.password,
                      decoration: const InputDecoration(labelText: "Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password can't be empty";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    UserEntity updatedUser = UserEntity(
                        name: _usernameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                        department: widget.user.department);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            EditProfile(userEntity: updatedUser),
                      ),
                    );
                  }
                },
                child: const Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

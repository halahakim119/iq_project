import 'package:flutter/material.dart';
import 'package:iq_project/features/auth/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Profile',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ProfileWidget(),
              Text('More',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              MoreWidget(),
            ],
          ),
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.7,
            child: ElevatedButton(
              onPressed: (() async {
                final prefs = await SharedPreferences.getInstance();
                prefs.remove("token");
                prefs.remove("id");
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              }),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 119, 29, 22),
              ),
              child: const Text(
                'Log Out',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          )
        ],
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Full Name', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('hla hakim', style: TextStyle(color: Colors.grey)),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Department', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('hla hakim', style: TextStyle(color: Colors.grey)),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('hla hakim', style: TextStyle(color: Colors.grey)),
            ],
          ),
          GestureDetector(
            child: Column(
              children: [
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Edit Profile',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                      size: 15,
                    )
                  ],
                ),
                const Divider(),
              ],
            ),
            onTap: () {
              // handle button press
            },
          ),
        ],
      ),
    );
  }
}

class MoreWidget extends StatelessWidget {
  const MoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: Column(
              children: [
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('About Us',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                      size: 15,
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 0.1),
                  child: Divider(),
                ),
              ],
            ),
            onTap: () {
              // handle button press
            },
          ),
          GestureDetector(
            child: Column(
              children: [
                const Divider(height: 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Ordering Policy',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                      size: 15,
                    )
                  ],
                ),
                const Divider(),
              ],
            ),
            onTap: () {
              // handle button press
            },
          ),
        ],
      ),
    );
  }
}

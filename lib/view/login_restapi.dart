import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/constants/textstyle.dart';
import 'package:provider_state/provider/auth_provider.dart';

class LoginApiScreen extends StatefulWidget {
  const LoginApiScreen({super.key});

  @override
  State<LoginApiScreen> createState() => _LoginApiScreenState();
}

class _LoginApiScreenState extends State<LoginApiScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    // final authprovider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginApiScreen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _email,
              decoration: const InputDecoration(
                  hintText: 'email', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _password,
              decoration: const InputDecoration(
                  hintText: 'password', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<AuthProvider>(
              builder: (context, value, child) {
                debugPrint('LoginButton');
                return InkWell(
                  onTap: () {
                    value.login(
                        _email.text.toString(), _password.text.toString());
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.9,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: value.loading
                          ? const CircularProgressIndicator()
                          : const Text(
                              'Login',
                              style: buttontext,
                            ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

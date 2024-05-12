// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redpos/data/datasource/auth_local_datasource.dart';
import 'package:redpos/presentation/auth/bloc/login/login_bloc.dart';
import 'package:redpos/presentation/home/pages/dashboard_page.dart';
// import 'package:flutter_posresto_app/presentation/home/dashboard_page.dart';
// import 'package:redpos/presentation/home/dashboard_page.dart';

import '../../core/components/buttons.dart';
import '../../core/components/custom_text_field.dart';
import '../../core/components/spaces.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 124.0, vertical: 20.0),
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 130.0,
                vertical: 90.0,
              ),
              child: Image.network(
                'https://sbi-pos.ptsiu.id/storage/2024/04/whatsapp-image-2024-03-16-at-162840-1.png',
                width: 90.0,
                height: 90.0,
              )),
          // const SpaceHeight(80.0),
          // const SpaceHeight(24.0),
          // const SpaceHeight(8.0),
          // const Center(
          //   child: Text(
          //     'Aplikasi Kasir',
          //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          //   ),
          // ),
          const SpaceHeight(40.0),
          CustomTextField(
            controller: usernameController,
            label: 'Username',
            hintText: 'Masukkan Username',
          ),
          const SpaceHeight(12.0),
          CustomTextField(
            controller: passwordController,
            label: 'Password',
            hintText: 'Masukkan Password',
            obscureText: true,
          ),
          const SpaceHeight(24.0),
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                success: (authResponseModel) {
                  AuthLocalDataSource().saveAuthData(authResponseModel);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardPage(),
                    ),
                  );
                },
                error: (message) {
                  return ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
              );
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return state.maybeWhen(orElse: () {
                  return Button.filled(
                    onPressed: () {
                      context.read<LoginBloc>().add(
                            LoginEvent.login(
                              username: usernameController.text,
                              password: passwordController.text,
                            ),
                          );
                    },
                    label: 'Masuk',
                  );
                }, loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

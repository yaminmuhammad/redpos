import 'package:flutter/material.dart';
// import 'package:flutter_posresto_app/presentation/home/dashboard_page.dart';
import 'package:redpos/presentation/home/dashboard_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/assets/assets.gen.dart';
import '../../core/components/buttons.dart';
import '../../core/components/custom_text_field.dart';
import '../../core/components/spaces.dart';
import '../../core/constants/colors.dart';

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
          const SpaceHeight(80.0),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 130.0),
              child: SvgPicture.asset(
                Assets.icons.homeResto.path,
                width: 100,
                height: 100,
                color: AppColors.red,
              )),
          const SpaceHeight(24.0),
          const SpaceHeight(8.0),
          const Center(
            child: Text(
              'Aplikasi Kasir',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          const SpaceHeight(40.0),
          CustomTextField(
            controller: usernameController,
            label: 'Username',
          ),
          const SpaceHeight(12.0),
          CustomTextField(
            controller: passwordController,
            label: 'Password',
            obscureText: true,
          ),
          const SpaceHeight(24.0),
          Button.filled(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const DashboardPage(),
                ),
              );
            },
            label: 'Masuk',
          ),
        ],
      ),
    );
  }
}

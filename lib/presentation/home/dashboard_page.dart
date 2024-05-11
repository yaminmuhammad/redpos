import 'package:flutter/material.dart';
import 'package:redpos/data/datasource/auth_local_datasource.dart';
import 'package:redpos/data/models/response/auth_response_model.dart';
import 'package:redpos/presentation/auth/login_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Data? data;

  @override
  void initState() {
    AuthLocalDataSource().getAuthData().then((value) {
      setState(() {
        data = value.data;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text('Welcom to Dashboard'),
            Text('${data?.redirectTo}'),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                AuthLocalDataSource().removeAuthData().then((value) {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }), (route) => false);
                });
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

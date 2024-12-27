import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../routes.dart';
import '../../navigation/bottom_navigation.dart';
import 'widgets/sign_up_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // TextEditingController
  final TextEditingController _txtEmailAddress = TextEditingController();
  final TextEditingController _txtPassword = TextEditingController();

  // FocusNode
  final FocusNode _fnEmailAddress = FocusNode();
  final FocusNode _fnPassword = FocusNode();

  // Trạng thái ẩn/hiện mật khẩu
  bool _obsecureText = true;

  // Giải phóng bộ nhớ
  @override
  void dispose() {
    _txtEmailAddress.dispose();
    _txtPassword.dispose();
    _fnEmailAddress.dispose();
    _fnPassword.dispose();
    super.dispose();
  }

  // Hàm đăng nhập bằng Google
  Future<void> _loginWithGoogle() async {
    try {
      // Tạo một instance của GoogleSignIn
      final GoogleSignIn googleSignIn = GoogleSignIn();

      // Đăng nhập và lấy thông tin người dùng
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception('Người dùng đã hủy đăng nhập.');
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      // Lấy token để xử lý thêm (nếu cần tích hợp backend hoặc Firebase)
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      // Kiểm tra đăng nhập thành công
      if (accessToken != null && idToken != null) {
        print('Đăng nhập Google thành công: ${googleUser.email}');
        // Chuyển đến màn hình chính
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavigation()),
        );
      } else {
        throw Exception('Không lấy được token từ Google.');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đăng nhập Google thất bại: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  semanticsLabel: 'Logo',
                ),
                const SizedBox(height: 16),
                Text(
                  'Đăng nhập tài khoản RUSH',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Chào mừng bạn quay trở lại!',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: _txtEmailAddress,
                          focusNode: _fnEmailAddress,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Nhập địa chỉ email của bạn',
                            labelText: 'Địa chỉ email',
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _txtPassword,
                          focusNode: _fnPassword,
                          obscureText: _obsecureText,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(_obsecureText
                                  ? Icons.visibility_rounded
                                  : Icons.visibility_off_rounded),
                              onPressed: () {
                                setState(() {
                                  _obsecureText = !_obsecureText;
                                });
                              },
                            ),
                            hintText: 'Nhập mật khẩu của bạn',
                            labelText: 'Mật khẩu',
                          ),
                        ),
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: () {
                            NavigateRoute.toForgotPassword(context: context);
                          },
                          child: Text(
                            'Quên mật khẩu?',
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.end,
                          ),
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState!.validate()) {
                              // Xử lý đăng nhập với email/mật khẩu
                              print('Đăng nhập thành công!');
                            }
                          },
                          child: const Text('Đăng nhập'),
                        ),
                        const SizedBox(height: 16),
                        const SignUpText(),
                        const SizedBox(height: 32),
                        const Text(
                          'Hoặc đăng nhập bằng',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const FaIcon(FontAwesomeIcons.facebook,
                                  size: 40, color: Colors.blue),
                              onPressed: () {
                                // Thêm logic đăng nhập Facebook
                              },
                            ),
                            const SizedBox(width: 20),
                            IconButton(
                              icon: const FaIcon(FontAwesomeIcons.google,
                                  size: 40, color: Colors.red),
                              onPressed: _loginWithGoogle, // Gọi hàm đăng nhập Google
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

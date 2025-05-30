import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_groceries_admin/view_model/login_view_model.dart';
import '../../common/color_extension.dart';
import '../../common_widget/line_textfield.dart';
import '../../common_widget/round_button.dart';

//Màn hình đăng nhập cho ứng dụng
class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  // Khởi tạo ViewModel cho đăng nhập sử dụng GetX
  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Stack(children: [
      Container(
        color: Colors.white,
        child: Image.asset("assets/img/bottom_bg.png",
            width: media.width, height: media.height, fit: BoxFit.cover),
      ),  //container
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                "assets/img/back.png",
                width: 20,
                height: 20,
              )),
        ),
        backgroundColor: Colors.transparent,
        // Nội dung chính trong SafeArea
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo ứng dụng ở trung tâm
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/img/color_logo.png",
                        width: 40,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.15,
                  ),
                  Text(
                    "Loging",
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: media.width * 0.03,
                  ),
                  Text(
                    "Enter your emails and password",
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: media.width * 0.1,
                  ),
                  // Ô nhập Email
                  LineTextField(
                    title: "Email",
                    placeholder: "Enter your email address",
                    controller: loginVM.txtEmail.value,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: media.width * 0.07,
                  ),
                  // Ô nhập Password với chức năng ẩn/hiện mật khẩu
                  Obx(
                    () => LineTextField(
                      title: "Password",
                      placeholder: "Enter your password",
                      controller: loginVM.txtPassword.value,
                      obscureText: !loginVM.isShowPassword.value,
                      right: IconButton(
                          onPressed: () {
                            loginVM.showPassword();
                          },
                          icon: Icon(
                            !loginVM.isShowPassword.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: TColor.textTittle,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  RoundButton(
                    title: "Log In",
                    onPressed: () {
                      loginVM.serviceCallLogin();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const MainTabView()));
                    },
                  ),
                  SizedBox(
                    height: media.width * 0.02,
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }
}

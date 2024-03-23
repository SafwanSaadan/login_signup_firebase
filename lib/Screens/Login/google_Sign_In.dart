// ignore_for_file: file_names
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleSignInScreen extends StatefulWidget {
//   @override
//   _GoogleSignInScreenState createState() => _GoogleSignInScreenState();
// }

// class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
//   GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Sign-In'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               child: Text('Sign In with Google'),
//               onPressed: () {
//                 _handleSignIn();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _handleSignIn() async {
//     try {
//       await _googleSignIn.signIn();
//       print('   تسجيل الدخول:');
//       // تم تسجيل الدخول بنجاح
//       // يمكنك القيام بالإجراءات المناسبة هنا، مثل تسجيل المستخدم في التطبيق أو توجيهه إلى الشاشة التالية.
//     } catch (error) {
//       print('حدث خطأ أثناء تسجيل الدخول: $error');
//     }
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:rubber_vision/auth_service.dart';
// import 'package:rubber_vision/pages/login_screen.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';



// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _contactController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   final bool _obscureContact = true;
//   bool _obscureConfirmPassword = true;

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _contactController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             children: [
//               const SizedBox(height: 60),
//               // Logo and title
//               Column(
//                 children: [
//                   Image.asset(
//                     'assets/1.png', // Replace with your logo
//                     height: 100,
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     'Create Account',
//                     style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.deepPurple,
//                         ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     'Join Rubber Vision today',
//                     style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                           color: Colors.grey,
//                         ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 40),
//               // Signup form
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       controller: _nameController,
//                       decoration: const InputDecoration(
//                         labelText: 'Full Name',
//                         prefixIcon: Icon(Icons.person_outline),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your name';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 16),
//                     TextFormField(
//                       controller: _emailController,
//                       decoration: const InputDecoration(
//                         labelText: 'Email',
//                         prefixIcon: Icon(Icons.email_outlined),
//                       ),
//                       keyboardType: TextInputType.emailAddress,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your email';
//                         }
//                         if (!value.contains('@')) {
//                           return 'Please enter a valid email';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 16),
//                     TextFormField(
//                       controller: _contactController,
//                       decoration: const InputDecoration(
//                         labelText: 'Mobile',
//                          prefixIcon:  Icon(Icons.phone),
                        
//                       ),
//                       obscureText: _obscureContact,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your Mobile number';
//                         }
//                         if (value.length < 10) {
//                           return 'Mobile Number Invalid';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 16),
//                     TextFormField(
//                       controller: _contactController,
//                       decoration: const InputDecoration(
//                         labelText: 'Address',
//                          prefixIcon:  Icon(Icons.phone),
                        
//                       ),
//                       obscureText: _obscureContact,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your Address';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 16),
//                     TextFormField(
//                       controller: _confirmPasswordController,
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         prefixIcon: const Icon(Icons.lock_outline),
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             _obscureConfirmPassword
//                                 ? Icons.visibility_off
//                                 : Icons.visibility,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _obscureConfirmPassword = !_obscureConfirmPassword;
//                             });
//                           },
//                         ),
//                       ),
//                       obscureText: _obscureConfirmPassword,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please Enter your password';
//                         }
//                         if (value.length < 6) {
//                           return 'Password must be at least 6 characters';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 24),
//                     SizedBox(
//                       width: double.infinity,
//                       height: 50,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         onPressed: () async {
//   if (_formKey.currentState!.validate()) {
//     final auth = AuthService();
//     final user = await auth.signUpWithEmailAndMySQL(
//        name: _nameController.text.trim(),
//        email: _emailController.text.trim(),
//        mobile: _contactController.text.trim(),
//        password: _confirmPasswordController.text.trim(),
//     );

//     if (user != null) {
//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Signup successful! Please login.")),
//       );
//       Navigator.pushReplacement(
//         // ignore: use_build_context_synchronously
//         context,
//         MaterialPageRoute(builder: (context) => const LoginScreen()),
//       );
//     } else {
//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Signup failed. Try again.")),
//       );
//     }
//   }
// },
//                         child: const Text(
//                           'Sign Up',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 24),
//               // Divider with "or" text
//               Row(
//                 children: [
//                   const Expanded(child: Divider()),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Text(
//                       'OR',
//                       style: TextStyle(
//                         color: Colors.grey.shade600,
//                       ),
//                     ),
//                   ),
//                   const Expanded(child: Divider()),
//                 ],
//               ),
//               const SizedBox(height: 24),
//               Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     IconButton.filledTonal(
//       onPressed: () {},
//       icon: const FaIcon(FontAwesomeIcons.google, size: 20),
//       style: IconButton.styleFrom(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//     ),
//     const SizedBox(width: 16),
//     IconButton.filledTonal(
//       onPressed: () {},
//       icon: const FaIcon(FontAwesomeIcons.facebook, size: 20),
//       style: IconButton.styleFrom(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//     ),
//     const SizedBox(width: 16),
//     IconButton.filledTonal(
//       onPressed: () {},
//       icon: const FaIcon(FontAwesomeIcons.apple, size: 20),
//       style: IconButton.styleFrom(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//     ),
//   ],
// ),
//               const SizedBox(height: 24),
//               // Login prompt
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Already have an account?"),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const LoginScreen(),
//                         ),
//                       );
//                     },
//                     child: const Text('Login'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );




//   }
// }

// signup_screen.dart
import 'package:flutter/material.dart';
import 'package:rubber_vision/auth_service.dart';
import 'package:rubber_vision/pages/login_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _contactController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _addressController = TextEditingController();
  final bool _obscureContact = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _contactController.dispose();
    _confirmPasswordController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              Column(
                children: [
                  Image.asset(
                    'assets/1.png',
                    height: 100,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Create Account',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Join Rubber Vision today',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _contactController,
                      decoration: const InputDecoration(
                        labelText: 'Mobile',
                        prefixIcon: Icon(Icons.phone),
                      ),
                      // obscureText: _obscureContact,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Mobile number';
                        }
                        if (value.length < 10) {
                          return 'Mobile Number Invalid';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _addressController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: 'Address',
                        alignLabelWithHint: true,
                        prefixIcon: const Icon(Icons.home_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 12.0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          },
                        ),
                      ),
                      obscureText: _obscureConfirmPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final auth = AuthService();
                            final user = await auth.signUpWithEmailAndMySQL(
                              name: _nameController.text.trim(),
                              email: _emailController.text.trim(),
                              mobile: _contactController.text.trim(),
                              address: _addressController.text.trim(),
                              password: _confirmPasswordController.text.trim(),
                            );

                            if (user != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Signup successful! Please login.")),
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Signup failed. Try again.")),
                              );
                            }
                          }
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton.filledTonal(
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.google, size: 20),
                    style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton.filledTonal(
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.facebook, size: 20),
                    style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton.filledTonal(
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.apple, size: 20),
                    style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

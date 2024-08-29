

import 'package:ileiwe/app/auth/model/data/register.dart';
import 'package:ileiwe/app/auth/provider/repository/auth_repository_provider.dart';
import 'package:ileiwe/cores/common/returned_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController {
  const AuthController({required this.ref});

  final WidgetRef ref;

  Future<ReturnedStatus> register(Map<String, dynamic> userData)async {

    final registerDetail = Register.fromJson(userData);

    final register = ref.read(firebaseAuthRepositoryProvider);
    
    final response = await register.register(registerDetail);
    print("after controller");
    print(response);

    // register.register(register);
    
    return const ReturnedStatus(message: "dddddd", success: true);
    

  }
}
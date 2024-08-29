
import 'package:ileiwe/app/auth/model/data/kid_info.dart';
import 'package:ileiwe/app/auth/model/data/register.dart';

import 'package:ileiwe/app/auth/model/data_sources/auth_data_source.dart';
import 'package:ileiwe/cores/common/returned_status.dart';

class AuthRepository {

  register(Register register){}

  registerKid(KidInfo kidInfo, String userId){}

  login(){}
}


class FirebaseAuthRepository implements AuthRepository {

  const FirebaseAuthRepository({required this.dataSource});

  final FirebaseAuthDataSource dataSource;

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<ReturnedStatus> register(Register register) {
    
    return dataSource.registerUser(register);
    
  }

  @override
  Future<ReturnedStatus> registerKid(KidInfo kidInfo, String userId) {
    
    return dataSource.registerKid(kidInfo, userId);
  }

}
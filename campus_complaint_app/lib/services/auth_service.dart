// AuthService handles login, signup and logout operations

class AuthService {

  // Login Function
  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {

    // Simulate API delay
    await Future.delayed(
      const Duration(seconds: 2),
    );

    // Temporary login credentials
    if (email == "student@gmail.com" &&
        password == "123456") {
      return true;
    }

    return false;
  }

  // Signup Function
  Future<bool> signupUser({
    required String email,
    required String password,
  }) async {

    // Simulate API delay
    await Future.delayed(
      const Duration(seconds: 2),
    );

    return true;
  }

  // Logout Function
  Future<void> logoutUser() async {

    await Future.delayed(
      const Duration(seconds: 1),
    );
  }
}


class ApiEndPoints{
  static const login = '/v1/login';
  static const setting = '/v1/login';
  static const roles = '/v1/auth/roles';
  //reg or login
  static const registration = '/v1/auth/register';
  //Intiate reg
  static const usernameSuggestions = '/v1/user/username_suggestions';
  static const usernameCheck = '/v1/user/username_check';
  static const sendOtp = '/v1/auth/send_otp';
  static const verifyOtp = '/v1/auth/verify_otp';
  //Academic details
  static const academicMaster = '/v1/academic/masters';
  //fetch Subjets
  static const subjects = '/v1/academic/get_subjects_by_boards';

}
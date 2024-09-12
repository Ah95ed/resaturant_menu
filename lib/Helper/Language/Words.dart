class Words {
  static const String register = 'Register';
  static const String forgetPassword = 'Forget Password';
  static const String forgotPassword = 'Forgot Password';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String name = 'Name';
  static const String phone = 'Phone';
  static const String address = 'Address';
  static const String save = 'Save';
  static const String update = 'Update';
  static const String delete = 'Delete';
  static const String login = 'Login';
  static const totalPrice = 'totalprice';
  static const foods = 'Foods';
  static const drinks = 'drinks';

  static Map<String, Map<String, String>> keyMap = {
    'en': {
      drinks : 'Drinks',
      foods : 'Foods',
      totalPrice: 'Total Price : ',
      register: 'Register',
      forgetPassword: 'Forget Password',
      forgotPassword: 'Forgot Password',
      email: 'Email',
      password: 'Password',
      confirmPassword: 'Confirm Password',
      name: 'Name',
      phone: 'Phone',
      address: 'Address',
      save: 'Save',
      update: 'Update',
      delete: 'Delete',
      login: 'Login',
    },
    'ar': {
      drinks : 'المشروبات',
      foods : 'الأطعمة',
      totalPrice: 'السعر الكلي : ',
      register: 'تسجيل',
      forgetPassword: 'نسيت كلمة المرور',
      forgotPassword: 'نسيت كلمة المرور',
      email: 'البريد الالكتروني',
      password: 'كلمة المرور',
      confirmPassword: 'تأكيد كلمة المرور',
      name: 'الاسم',
      phone: 'رقم الهاتف',
      address: 'العنوان',
      save: 'حفظ',
      update: 'تحديث',
      delete: 'حذف',
      login: 'تسجيل الدخول',
    },
  };
}

class ValidationMixin {
  String validateEmail(String value) {
          // return null if valid
          // otherwise return string if invalid
          if (!value.contains('@')) {
            return "Please enter valid email";
          }
          return null;
      }

  String validatePassword(String value) {
        // return null if valid
          // otherwise return string if invalid
        if (value.length < 4) {
          return "Password must be atleast 4 characters";
        }
        return null;
      }    
}
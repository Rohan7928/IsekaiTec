class Validation{
   static bool isNotNull(String value){
      if(value.isEmpty){
         return true;
      }
      return false;
   }

   static bool isEmailValid(String email) {
      //const pattern = r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))\$';
      const pattern = '[a-zA-Z0-9._-]+@[a-z]+\\.+[a-z]+';
      RegExp regex = RegExp(pattern);
      return regex.hasMatch(email);
   }


   static bool isPasswordValid(String password) {
      if(password.length < 9 && password.length > 1){
         return true;
      }
      return false;
   }

   static bool isConfirmPassword(String password1,String password2){
      if(password1 == password2){
         return true;
      }else{
         return false;
      }
   }
}
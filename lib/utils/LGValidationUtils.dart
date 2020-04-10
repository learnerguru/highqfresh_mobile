class LGValidationUtils{

  static checkString(String text){
    if(text==null || text.isEmpty || text=="null"){
      return "";
    }
    return text;
  }

  static isValidString(String text){
    if(text==null || text.isEmpty || text=="null"){
      return false;
    }
    return true;
  }
}
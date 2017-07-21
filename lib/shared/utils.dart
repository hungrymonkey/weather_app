import 'dart:core';
class Utils{
  static k2c(num){
    return (num-273.13);
  }
  static weekday(num){
    print(num);
    switch(num){

      case DateTime.MONDAY: return "Monday"; break;
      case DateTime.TUESDAY: return "Tuesday"; break;
      case DateTime.WEDNESDAY: return "Wednesday"; break;
      case DateTime.THURSDAY: return "Thursday"; break;
      case DateTime.FRIDAY: return "Friday"; break;
      case DateTime.SATURDAY: return "Saturday"; break;
      case DateTime.SUNDAY: return "Sunday"; break;

      default:
        print("Weekday not possible: Perhaps on a different planet?");
        return "Null";
        break;
    }
  }
}

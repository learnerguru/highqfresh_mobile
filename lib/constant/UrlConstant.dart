
class UrlConstant{

  static String userLogin="god/user/login";

  static String homeRecent="god/home/recent";
  static String homeEvent="god/home/event";
  static String homeMedia="god/home/media";
  static String homeNews="god/home/news";
  static String randomMedia="god/media/get/random";
  static String getMedia="god/media/get";
  static String getBoard="god/board/get";
  static String getPriests="god/user/groupbyusertype";
  static String getAssociationMember="god/associationmember/get/{associationid}/{statusid}";
  static String getGroupParish="god/parish/group/get/{instituteid}";
  static String getGroupDistrict="god/ecclesiasticaldistricts/getbyinstitute/{instituteid}/1";
  static String getParishByDistrict="god/parish/getbyecclesiasticaldistrict/{ecclesiastical_district_id}";
  static String getDiary="god/diary/get";
  static String addDiary="god/diary/add";
  static String getDiaryDetails="god/diary/history/get/{indexValue}/{userId}/{usertypeid}";
  static String getAssociations="god/association/get/{instituteid}/{statusid}";
  static String getParishAssociations="god/association/get/{instituteid}/{parishid}/{statusid}";
  static String getUsersByDesignation="god/user/groupby/designation";
  static String getUsersByCategory="god/user/getby/usercategory/{usercategory}/{parishid}";
  static String replyDiary="god/diary/reply";
  static String getSmsList="god/sms/sentlist";
  static String globalSearch="god/home/global/search";

  //birthday
static String getBirthdayGroupByMonth ='god/birthday/get/group/month/{instituteid}/{status}';
static String getBirthdayGroupByDay ='god/birthday/get/group/day/{instituteid}/{month}/{status}';

//feastday
static String getFeastDayGroupByMonth ='god/user/get/group/feastmonth/{instituteid}/{status}';
static String getFeastDayGroupByDay ='god/user/get/group/feastday/{instituteid}/{month}/{status}';






}
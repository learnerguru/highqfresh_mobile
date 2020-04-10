

class GlobalSearchData {
 /* List<UserMapping> bishob_user;
  List<UserMapping> member_user;
  List<UserMapping> priest_user;
  List<Event> event;
  List<News> news;
  List<Parish> parish;
  List<Association> association;*/

  GlobalSearchData(/*{
    this.bishob_user,
    this.member_user,
    this.priest_user,
    this.event,
    this.news,
    this.parish,
    this.association,
  }*/);

  GlobalSearchData.fromJson(Map<String, dynamic> json) {
    /*if (json['bishob_user'] != null) {
      bishob_user = new List<UserMapping>();
      json['bishob_user'].forEach((v) {
        bishob_user.add(new UserMapping.fromJson(v));
      });
    }
    if (json['member_user'] != null) {
      member_user = new List<UserMapping>();
      json['member_user'].forEach((v) {
        member_user.add(new UserMapping.fromJson(v));
      });
    }
    if (json['priest_user'] != null) {
      priest_user = new List<UserMapping>();
      json['priest_user'].forEach((v) {
        priest_user.add(new UserMapping.fromJson(v));
      });
    }
    if (json['event'] != null) {
      event = new List<Event>();
      json['event'].forEach((v) {
        event.add(new Event.fromJson(v));
      });
    }
    if (json['news'] != null) {
      news = new List<News>();
      json['news'].forEach((v) {
        news.add(new News.fromJson(v));
      });
    }
    if (json['parish'] != null) {
      parish = new List<Parish>();
      json['parish'].forEach((v) {
        parish.add(new Parish.fromJson(v));
      });
    }
    if (json['association'] != null) {
      association = new List<Association>();
      json['association'].forEach((v) {
        association.add(new Association.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
   /* final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bishob_user != null) {
      data['bishob_user'] = this.bishob_user.map((v) => v.toJson()).toList();
    }
    if (this.member_user != null) {
      data['member_user'] = this.member_user.map((v) => v.toJson()).toList();
    }
    if (this.priest_user != null) {
      data['priest_user'] = this.priest_user.map((v) => v.toJson()).toList();
    }
    if (this.event != null) {
      data['event'] = this.event.map((v) => v.toJson()).toList();
    }
    if (this.news != null) {
      data['news'] = this.news.map((v) => v.toJson()).toList();
    }
    if (this.parish != null) {
      data['parish'] = this.parish.map((v) => v.toJson()).toList();
    }
    if (this.association != null) {
      data['association'] = this.association.map((v) => v.toJson()).toList();
    }
    return data;*/
  }
}

/**
 * @Author:      Amuser
 * @CreateDate:   2019-10-16 9:53
 * @Description:
 */

class ChaptersData {
  int curPage;

  List<ChaptersDatasBean> datas;

  int offset;

  bool over;

  int pageCount;

  int size;

  int total;

  ChaptersData(
    this.curPage,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  );

  ChaptersData.fromJson(Map<String, dynamic> json) {
    curPage = json['curPage'];
    offset = json['offset'];
    over = json['over'];
    pageCount = json['pageCount'];
    size = json['size'];
    total = json['total'];
    datas = getListData(json['datas']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['curPage'] = this.curPage;
    map['offset'] = this.offset;
    map['over'] = this.over;
    map['pageCount'] = this.pageCount;
    map['size'] = this.size;
    map['total'] = this.total;
    map['datas'] =this.datas.map((v)=>v.toJson()).toList() ;
//    map['datas'] =toListData(this.datas).toList() ;
    return map;
  }

  List<ChaptersDatasBean> toListData(data) {
//    print("===进来了");
//    List<ChaptersDatasBean> list = new List<ChaptersDatasBean>();
    data.forEach((v) {

//      ChaptersDatasBean bean=v;
//      print("===数据看到"+bean.toJson().toString());
      v.toJson();
//      list.add(bean);
    });
    return data;
  }

  List<ChaptersDatasBean> getListData(data) {
    List<ChaptersDatasBean> list = new List<ChaptersDatasBean>();
    data.forEach((v) {
      list.add(new ChaptersDatasBean.fromJson(v));
    });
    return list;
  }
}

class ChaptersDatasBean {
  String apkLink;
  String author;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String envelopePic;
  bool fresh;
  int id;
  String link;
  String niceDate;
  String origin;
  String prefix;

//  String projectLink;
//  int publishTime;
//  int superChapterId;
//  String superChapterName;
//  String title;
//  int type;
//  int userId;
//  int visible;
//  int zan;

  //,this.projectLink,this.publishTime,this.superChapterId,this.superChapterName,this.tags,this.title,this.type,this.userId,this.visible,this.zan,
  ChaptersDatasBean(this.apkLink, this.author, this.chapterId, this.chapterName, this.collect, this.courseId, this.desc, this.envelopePic,
      this.fresh, this.id, this.link, this.niceDate, this.origin, this.prefix);

  ChaptersDatasBean.fromJson(Map<String, dynamic> json) {
    apkLink = json['apkLink'];
    author = json['author'];
    chapterId = json['chapterId'];
    chapterName = json['chapterName'];
    collect = json['collect'];
    courseId = json['courseId'];
    desc = json['desc'];
    envelopePic = json['envelopePic'];
    fresh = json['fresh'];
    id = json['id'];
    link = json['link'];
    niceDate = json['niceDate'];
    origin = json['origin'];
    prefix = json['prefix'];
  }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map<String, dynamic>();

    json['apkLink'] = this.apkLink;
    json['author'] = this.author;
    json['chapterId'] = this.chapterId;
    json['chapterName'] = this.chapterName;
    json['collect'] = this.collect;
    json['courseId'] = this.courseId;
    json['desc'] = this.desc;
    json['envelopePic'] = this.envelopePic;
    json['fresh'] = this.fresh;
    json['id'] = this.id;
    json['link'] = this.link;
    json['niceDate'] = this.niceDate;
    json['origin'] = this.origin;
    json['prefix'] = this.prefix;
    return json;
  }
//
//  Map<String, dynamic> toJson(ChaptersDatasBean instance) => <String, dynamic>{
//    'apkLink': instance.apkLink,
//    'author': instance.author,
//    'chapterId': instance.chapterId,
//    'chapterName': instance.chapterName,
//    'collect': instance.collect,
//    'courseId': instance.courseId,
//    'desc': instance.desc,
//    'envelopePic': instance.envelopePic,
//    'fresh': instance.fresh,
//    'id': instance.id,
//    'link': instance.link,
//    'niceDate': instance.niceDate,
//    'origin': instance.origin,
//    'prefix': instance.prefix,
//
//  };


}

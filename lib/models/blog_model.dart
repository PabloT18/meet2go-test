import 'dart:convert';

List<BlogModel> blogModelFromJson(String str) =>
    List<BlogModel>.from(json.decode(str).map((x) => BlogModel.fromJson(x)));

String blogModelToJson(List<BlogModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BlogModel {
  BlogModel({
    this.id,
    this.date,
    this.dateGmt,
    this.guid,
    this.modified,
    this.modifiedGmt,
    this.slug,
    this.status,
    this.type,
    this.link,
    this.title,
    this.content,
    this.excerpt,
    this.author,
    this.featuredMedia,
    this.commentStatus,
    this.pingStatus,
    this.sticky,
    this.template,
    this.format,
    this.meta,
    this.categories,
    this.tags,
    this.links,
  });

  int id;
  DateTime date;
  DateTime dateGmt;
  Guid guid;
  DateTime modified;
  DateTime modifiedGmt;
  String slug;
  String status;
  String type;
  String link;
  Guid title;
  Content content;
  Content excerpt;
  int author;
  int featuredMedia;
  String commentStatus;
  String pingStatus;
  bool sticky;
  String template;
  String format;
  Meta meta;
  List<int> categories;
  List<dynamic> tags;
  Links links;

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Guid.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: json["status"],
        type: json["type"],
        link: json["link"],
        title: Guid.fromJson(json["title"]),
        content: Content.fromJson(json["content"]),
        excerpt: Content.fromJson(json["excerpt"]),
        author: json["author"],
        featuredMedia: json["featured_media"],
        commentStatus: json["comment_status"],
        pingStatus: json["ping_status"],
        sticky: json["sticky"],
        template: json["template"],
        format: json["format"],
        meta: Meta.fromJson(json["meta"]),
        categories: List<int>.from(json["categories"].map((x) => x)),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "date_gmt": dateGmt.toIso8601String(),
        "guid": guid.toJson(),
        "modified": modified.toIso8601String(),
        "modified_gmt": modifiedGmt.toIso8601String(),
        "slug": slug,
        "status": status,
        "type": type,
        "link": link,
        "title": title.toJson(),
        "content": content.toJson(),
        "excerpt": excerpt.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "comment_status": commentStatus,
        "ping_status": pingStatus,
        "sticky": sticky,
        "template": template,
        "format": format,
        "meta": meta.toJson(),
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "_links": links.toJson(),
      };
}

class Content {
  Content({
    this.rendered,
    this.protected,
  });

  String rendered;
  bool protected;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json["rendered"],
        protected: json["protected"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
      };
}

class Guid {
  Guid({
    this.rendered,
  });

  String rendered;

  factory Guid.fromJson(Map<String, dynamic> json) => Guid(
        rendered: json["rendered"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
      };
}

class Links {
  Links({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.replies,
    this.versionHistory,
    this.predecessorVersion,
    this.wpFeaturedmedia,
    this.wpAttachment,
    this.wpTerm,
    this.curies,
  });

  List<About> self;
  List<About> collection;
  List<About> about;
  List<Author> author;
  List<Author> replies;
  List<VersionHistory> versionHistory;
  List<PredecessorVersion> predecessorVersion;
  List<Author> wpFeaturedmedia;
  List<About> wpAttachment;
  List<WpTerm> wpTerm;
  List<Cury> curies;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection:
            List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        author:
            List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
        replies:
            List<Author>.from(json["replies"].map((x) => Author.fromJson(x))),
        versionHistory: List<VersionHistory>.from(
            json["version-history"].map((x) => VersionHistory.fromJson(x))),
        predecessorVersion: List<PredecessorVersion>.from(
            json["predecessor-version"]
                .map((x) => PredecessorVersion.fromJson(x))),
        wpFeaturedmedia: List<Author>.from(
            json["wp:featuredmedia"].map((x) => Author.fromJson(x))),
        wpAttachment: List<About>.from(
            json["wp:attachment"].map((x) => About.fromJson(x))),
        wpTerm:
            List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "author": List<dynamic>.from(author.map((x) => x.toJson())),
        "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
        "version-history":
            List<dynamic>.from(versionHistory.map((x) => x.toJson())),
        "predecessor-version":
            List<dynamic>.from(predecessorVersion.map((x) => x.toJson())),
        "wp:featuredmedia":
            List<dynamic>.from(wpFeaturedmedia.map((x) => x.toJson())),
        "wp:attachment":
            List<dynamic>.from(wpAttachment.map((x) => x.toJson())),
        "wp:term": List<dynamic>.from(wpTerm.map((x) => x.toJson())),
        "curies": List<dynamic>.from(curies.map((x) => x.toJson())),
      };
}

class About {
  About({
    this.href,
  });

  String href;

  factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Author {
  Author({
    this.embeddable,
    this.href,
  });

  bool embeddable;
  String href;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
      };
}

class Cury {
  Cury({
    this.name,
    this.href,
    this.templated,
  });

  String name;
  String href;
  bool templated;

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: json["name"],
        href: json["href"],
        templated: json["templated"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "href": href,
        "templated": templated,
      };
}

class PredecessorVersion {
  PredecessorVersion({
    this.id,
    this.href,
  });

  int id;
  String href;

  factory PredecessorVersion.fromJson(Map<String, dynamic> json) =>
      PredecessorVersion(
        id: json["id"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "href": href,
      };
}

class VersionHistory {
  VersionHistory({
    this.count,
    this.href,
  });

  int count;
  String href;

  factory VersionHistory.fromJson(Map<String, dynamic> json) => VersionHistory(
        count: json["count"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "href": href,
      };
}

class WpTerm {
  WpTerm({
    this.taxonomy,
    this.embeddable,
    this.href,
  });

  String taxonomy;
  bool embeddable;
  String href;

  factory WpTerm.fromJson(Map<String, dynamic> json) => WpTerm(
        taxonomy: json["taxonomy"],
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "taxonomy": taxonomy,
        "embeddable": embeddable,
        "href": href,
      };
}

class Meta {
  Meta({
    this.price,
    this.stock,
    this.tribeTicketHeader,
    this.tribeDefaultTicketProvider,
    this.tribeTicketCapacity,
    this.ticketStartDate,
    this.ticketEndDate,
    this.tribeTicketShowDescription,
    this.tribeTicketShowNotGoing,
    this.tribeTicketUseGlobalStock,
    this.tribeTicketGlobalStockLevel,
    this.globalStockMode,
    this.globalStockCap,
    this.tribeRsvpForEvent,
    this.tribeTicketGoingCount,
    this.tribeTicketNotGoingCount,
    this.tribeTicketsList,
    this.tribeBlocksRecurrenceRules,
    this.tribeBlocksRecurrenceExclusions,
    this.tribeBlocksRecurrenceDescription,
    this.ecpCustom12,
    this.ecpCustom14,
    this.ecpCustom16,
    this.ecpCustom17,
    this.ecpCustom18,
    this.ecpCustom19,
    this.ecpCustom20,
    this.ecpCustom21,
    this.ecpCustom22,
    this.ecpCustom23,
    this.ecpCustom24,
    this.ecpCustom27,
    this.ecpCustom28,
    this.ecpCustom30,
    this.ecpCustom32,
    this.ecpCustom35,
  });

  String price;
  String stock;
  String tribeTicketHeader;
  String tribeDefaultTicketProvider;
  String tribeTicketCapacity;
  String ticketStartDate;
  String ticketEndDate;
  String tribeTicketShowDescription;
  bool tribeTicketShowNotGoing;
  String tribeTicketUseGlobalStock;
  String tribeTicketGlobalStockLevel;
  String globalStockMode;
  String globalStockCap;
  String tribeRsvpForEvent;
  String tribeTicketGoingCount;
  String tribeTicketNotGoingCount;
  List<dynamic> tribeTicketsList;
  String tribeBlocksRecurrenceRules;
  String tribeBlocksRecurrenceExclusions;
  String tribeBlocksRecurrenceDescription;
  String ecpCustom12;
  String ecpCustom14;
  String ecpCustom16;
  String ecpCustom17;
  String ecpCustom18;
  String ecpCustom19;
  String ecpCustom20;
  String ecpCustom21;
  String ecpCustom22;
  String ecpCustom23;
  String ecpCustom24;
  String ecpCustom27;
  String ecpCustom28;
  String ecpCustom30;
  String ecpCustom32;
  String ecpCustom35;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        price: json["_price"],
        stock: json["_stock"],
        tribeTicketHeader: json["_tribe_ticket_header"],
        tribeDefaultTicketProvider: json["_tribe_default_ticket_provider"],
        tribeTicketCapacity: json["_tribe_ticket_capacity"],
        ticketStartDate: json["_ticket_start_date"],
        ticketEndDate: json["_ticket_end_date"],
        tribeTicketShowDescription: json["_tribe_ticket_show_description"],
        tribeTicketShowNotGoing: json["_tribe_ticket_show_not_going"],
        tribeTicketUseGlobalStock: json["_tribe_ticket_use_global_stock"],
        tribeTicketGlobalStockLevel: json["_tribe_ticket_global_stock_level"],
        globalStockMode: json["_global_stock_mode"],
        globalStockCap: json["_global_stock_cap"],
        tribeRsvpForEvent: json["_tribe_rsvp_for_event"],
        tribeTicketGoingCount: json["_tribe_ticket_going_count"],
        tribeTicketNotGoingCount: json["_tribe_ticket_not_going_count"],
        tribeTicketsList:
            List<dynamic>.from(json["_tribe_tickets_list"].map((x) => x)),
        tribeBlocksRecurrenceRules: json["_tribe_blocks_recurrence_rules"],
        tribeBlocksRecurrenceExclusions:
            json["_tribe_blocks_recurrence_exclusions"],
        tribeBlocksRecurrenceDescription:
            json["_tribe_blocks_recurrence_description"],
        ecpCustom12: json["_ecp_custom_12"],
        ecpCustom14: json["_ecp_custom_14"],
        ecpCustom16: json["_ecp_custom_16"],
        ecpCustom17: json["_ecp_custom_17"],
        ecpCustom18: json["_ecp_custom_18"],
        ecpCustom19: json["_ecp_custom_19"],
        ecpCustom20: json["_ecp_custom_20"],
        ecpCustom21: json["_ecp_custom_21"],
        ecpCustom22: json["_ecp_custom_22"],
        ecpCustom23: json["_ecp_custom_23"],
        ecpCustom24: json["_ecp_custom_24"],
        ecpCustom27: json["_ecp_custom_27"],
        ecpCustom28: json["_ecp_custom_28"],
        ecpCustom30: json["_ecp_custom_30"],
        ecpCustom32: json["_ecp_custom_32"],
        ecpCustom35: json["_ecp_custom_35"],
      );

  Map<String, dynamic> toJson() => {
        "_price": price,
        "_stock": stock,
        "_tribe_ticket_header": tribeTicketHeader,
        "_tribe_default_ticket_provider": tribeDefaultTicketProvider,
        "_tribe_ticket_capacity": tribeTicketCapacity,
        "_ticket_start_date": ticketStartDate,
        "_ticket_end_date": ticketEndDate,
        "_tribe_ticket_show_description": tribeTicketShowDescription,
        "_tribe_ticket_show_not_going": tribeTicketShowNotGoing,
        "_tribe_ticket_use_global_stock": tribeTicketUseGlobalStock,
        "_tribe_ticket_global_stock_level": tribeTicketGlobalStockLevel,
        "_global_stock_mode": globalStockMode,
        "_global_stock_cap": globalStockCap,
        "_tribe_rsvp_for_event": tribeRsvpForEvent,
        "_tribe_ticket_going_count": tribeTicketGoingCount,
        "_tribe_ticket_not_going_count": tribeTicketNotGoingCount,
        "_tribe_tickets_list":
            List<dynamic>.from(tribeTicketsList.map((x) => x)),
        "_tribe_blocks_recurrence_rules": tribeBlocksRecurrenceRules,
        "_tribe_blocks_recurrence_exclusions": tribeBlocksRecurrenceExclusions,
        "_tribe_blocks_recurrence_description":
            tribeBlocksRecurrenceDescription,
        "_ecp_custom_12": ecpCustom12,
        "_ecp_custom_14": ecpCustom14,
        "_ecp_custom_16": ecpCustom16,
        "_ecp_custom_17": ecpCustom17,
        "_ecp_custom_18": ecpCustom18,
        "_ecp_custom_19": ecpCustom19,
        "_ecp_custom_20": ecpCustom20,
        "_ecp_custom_21": ecpCustom21,
        "_ecp_custom_22": ecpCustom22,
        "_ecp_custom_23": ecpCustom23,
        "_ecp_custom_24": ecpCustom24,
        "_ecp_custom_27": ecpCustom27,
        "_ecp_custom_28": ecpCustom28,
        "_ecp_custom_30": ecpCustom30,
        "_ecp_custom_32": ecpCustom32,
        "_ecp_custom_35": ecpCustom35,
      };
}

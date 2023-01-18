class Species {
    Species({
        this.baseHappiness,
        this.captureRate,
        this.color,
        this.flavorTextEntries,
        this.formDescriptions,
        this.habitat,
        this.hasGenderDifferences,
        this.hatchCounter,
        this.id,
        this.isBaby,
        this.isLegendary,
        this.isMythical,
        this.name,
        this.order,
        this.genera
    });

    int? baseHappiness;
    int? captureRate;
    Color? color;
    List<FlavorTextEntry?>? flavorTextEntries;
    List<dynamic>? formDescriptions;
    Color? habitat;
    bool? hasGenderDifferences;
    int? hatchCounter;
    int? id;
    bool? isBaby;
    bool? isLegendary;
    bool? isMythical;
    String? name;
    int? order;
    List<Genera?>? genera;

    factory Species.fromJson(Map<String, dynamic> json) => Species(
        baseHappiness: json["base_happiness"],
        captureRate: json["capture_rate"],
        color: Color.fromJson(json["color"]),
        flavorTextEntries: json["flavor_text_entries"] == null ? [] : List<FlavorTextEntry?>.from(json["flavor_text_entries"]!.map((x) => FlavorTextEntry.fromJson(x))),
        formDescriptions: json["form_descriptions"] == null ? [] : List<dynamic>.from(json["form_descriptions"]!.map((x) => x)),
        habitat: json["habitat"] == null ? null : Color.fromJson(json["habitat"]),
        hasGenderDifferences: json["has_gender_differences"],
        hatchCounter: json["hatch_counter"],
        id: json["id"],
        isBaby: json["is_baby"],
        isLegendary: json["is_legendary"],
        isMythical: json["is_mythical"],
        name: json["name"],
        order: json["order"],
        genera: json["genera"] == null ? [] : List<Genera?>.from(json["genera"]!.map((x) => Genera.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "base_happiness": baseHappiness,
        "capture_rate": captureRate,
        "color": color!.toJson(),
        "flavor_text_entries": flavorTextEntries == null ? [] : List<dynamic>.from(flavorTextEntries!.map((x) => x!.toJson())),
        "form_descriptions": formDescriptions == null ? [] : List<dynamic>.from(formDescriptions!.map((x) => x)),
        "habitat": habitat!.toJson(),
        "has_gender_differences": hasGenderDifferences,
        "hatch_counter": hatchCounter,
        "id": id,
        "is_baby": isBaby,
        "is_legendary": isLegendary,
        "is_mythical": isMythical,
        "name": name,
        "order": order,
        "genera" : genera
    };
}

class Color {
    Color({
        this.name,
        this.url,
    });

    String? name;
    String? url;

    factory Color.fromJson(Map<String, dynamic> json) => Color(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}

class Genera {
  Genera({
    this.genus, 
  });

  String? genus; 

  factory Genera.fromJson(Map<String, dynamic> json) => Genera(
        genus: json["genus"],
    );

    Map<String, dynamic> toJson() => {
        "genus": genus,
    };
}

class FlavorTextEntry {
    FlavorTextEntry({
        this.flavorText,
    });

    String? flavorText;

    factory FlavorTextEntry.fromJson(Map<String, dynamic> json) => FlavorTextEntry(
        flavorText: json["flavor_text"],
    );

    Map<String, dynamic> toJson() => {
        "flavor_text": flavorText,
    };
}

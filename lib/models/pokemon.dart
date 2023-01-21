class Pokemon {
  Pokemon({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.gameIndices,
    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.pastTypes,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  List<Ability?>? abilities;
  int? baseExperience;
  List<Form?>? forms;
  List<GameIndex?>? gameIndices;
  int? height;
  List<dynamic>? heldItems;
  int? id;
  bool? isDefault;
  String? locationAreaEncounters;
  List<Move?>? moves;
  String? name;
  int? order;
  List<dynamic>? pastTypes;
  Species? species;
  Sprites? sprites;
  List<Stat?>? stats;
  List<Type?>? types;
  int? weight;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        abilities: json["abilities"] == null
            ? []
            : List<Ability?>.from(
                json["abilities"]!.map((x) => Ability.fromJson(x))),
        baseExperience: json["base_experience"],
        forms: json["forms"] == null
            ? []
            : List<Form?>.from(json["forms"]!.map((x) => Form.fromJson(x))),
        gameIndices: json["game_indices"] == null
            ? []
            : List<GameIndex?>.from(
                json["game_indices"]!.map((x) => GameIndex.fromJson(x))),
        height: json["height"],
        heldItems: json["held_items"] == null
            ? []
            : List<dynamic>.from(json["held_items"]!.map((x) => x)),
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        moves: json["moves"] == null
            ? []
            : List<Move?>.from(json["moves"]!.map((x) => Move.fromJson(x))),
        name: json["name"],
        order: json["order"],
        pastTypes: json["past_types"] == null
            ? []
            : List<dynamic>.from(json["past_types"]!.map((x) => x)),
        species: null,
        sprites: Sprites.fromJson(json["sprites"]),
        stats: json["stats"] == null
            ? []
            : List<Stat?>.from(json["stats"]!.map((x) => Stat.fromJson(x))),
        types: json["types"] == null
            ? []
            : List<Type?>.from(json["types"]!.map((x) => Type.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "abilities": abilities == null
            ? []
            : List<dynamic>.from(abilities!.map((x) => x!.toJson())),
        "base_experience": baseExperience,
        "forms": forms == null
            ? []
            : List<dynamic>.from(forms!.map((x) => x!.toJson())),
        "game_indices": gameIndices == null
            ? []
            : List<dynamic>.from(gameIndices!.map((x) => x!.toJson())),
        "height": height,
        "held_items": heldItems == null
            ? []
            : List<dynamic>.from(heldItems!.map((x) => x)),
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "moves": moves == null
            ? []
            : List<dynamic>.from(moves!.map((x) => x!.toJson())),
        "name": name,
        "order": order,
        "past_types": pastTypes == null
            ? []
            : List<dynamic>.from(pastTypes!.map((x) => x)),
        "species": species!.toJson(),
        "sprites": sprites!.toJson(),
        "stats": stats == null
            ? []
            : List<dynamic>.from(stats!.map((x) => x!.toJson())),
        "types": types == null
            ? []
            : List<dynamic>.from(types!.map((x) => x!.toJson())),
        "weight": weight,
      };
}

class Ability {
  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  Form? ability;
  bool? isHidden;
  int? slot;

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Form.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "ability": ability!.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

class Form {
  Form({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory Form.fromJson(Map<String, dynamic> json) => Form(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class GameIndex {
  GameIndex({
    this.gameIndex,
    this.version,
  });

  int? gameIndex;
  Form? version;

  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        version: Form.fromJson(json["version"]),
      );

  Map<String, dynamic> toJson() => {
        "game_index": gameIndex,
        "version": version!.toJson(),
      };
}

class Move {
  Move({
    this.move,
    this.versionGroupDetails,
  });

  Form? move;
  List<VersionGroupDetail?>? versionGroupDetails;

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: Form.fromJson(json["move"]),
        versionGroupDetails: json["version_group_details"] == null
            ? []
            : List<VersionGroupDetail?>.from(json["version_group_details"]!
                .map((x) => VersionGroupDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "move": move!.toJson(),
        "version_group_details": versionGroupDetails == null
            ? []
            : List<dynamic>.from(versionGroupDetails!.map((x) => x!.toJson())),
      };
}

class VersionGroupDetail {
  VersionGroupDetail({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });

  int? levelLearnedAt;
  Form? moveLearnMethod;
  Form? versionGroup;

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) =>
      VersionGroupDetail(
        levelLearnedAt: json["level_learned_at"],
        moveLearnMethod: Form.fromJson(json["move_learn_method"]),
        versionGroup: Form.fromJson(json["version_group"]),
      );

  Map<String, dynamic> toJson() => {
        "level_learned_at": levelLearnedAt,
        "move_learn_method": moveLearnMethod!.toJson(),
        "version_group": versionGroup!.toJson(),
      };
}

class Species {
  Species({
    this.baseHappiness,
    this.captureRate,
    this.color,
    this.eggGroups,
    this.evolutionChain,
    this.evolvesFromSpecies,
    this.flavorTextEntries,
    this.formDescriptions,
    this.formsSwitchable,
    this.genderRate,
    this.genera,
    this.generation,
    this.growthRate,
    this.habitat,
    this.hasGenderDifferences,
    this.hatchCounter,
    this.id,
    this.isBaby,
    this.isLegendary,
    this.isMythical,
    this.name,
    this.order,
    this.palParkEncounters,
    this.pokedexNumbers,
    this.shape,
    this.varieties,
  });

  int? baseHappiness;
  int? captureRate;
  Form? color;
  List<Form?>? eggGroups;
  EvolutionChain? evolutionChain;
  dynamic evolvesFromSpecies;
  List<FlavorTextEntry?>? flavorTextEntries;
  List<dynamic>? formDescriptions;
  bool? formsSwitchable;
  int? genderRate;
  List<Genus?>? genera;
  Form? generation;
  Form? growthRate;
  Form? habitat;
  bool? hasGenderDifferences;
  int? hatchCounter;
  int? id;
  bool? isBaby;
  bool? isLegendary;
  bool? isMythical;
  String? name;
  int? order;
  List<PalParkEncounter?>? palParkEncounters;
  List<PokedexNumber?>? pokedexNumbers;
  Form? shape;
  List<Variety?>? varieties;

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        baseHappiness: json["base_happiness"],
        captureRate: json["capture_rate"],
        color: json["color"] == null ? null : Form.fromJson(json["color"]),
        eggGroups: json["egg_groups"] == null
            ? []
            : List<Form?>.from(
                json["egg_groups"]!.map((x) => Form.fromJson(x))),
        evolutionChain: json["evolution_chain"] == null
            ? null
            : EvolutionChain.fromJson(json["evolution_chain"]),
        evolvesFromSpecies: json["evolves_from_species"],
        flavorTextEntries: json["flavor_text_entries"] == null
            ? []
            : List<FlavorTextEntry?>.from(json["flavor_text_entries"]!
                .map((x) => FlavorTextEntry.fromJson(x))),
        formDescriptions: json["form_descriptions"] == null
            ? []
            : List<dynamic>.from(json["form_descriptions"]!.map((x) => x)),
        formsSwitchable: json["forms_switchable"],
        genderRate: json["gender_rate"],
        genera: json["genera"] == null
            ? []
            : List<Genus?>.from(json["genera"]!.map((x) => Genus.fromJson(x))),
        generation: json["generation"] == null
            ? null
            : Form.fromJson(json["generation"]),
        growthRate: json["growth_rate"] == null
            ? null
            : Form.fromJson(json["growth_rate"]),
        habitat:
            json["habitat"] == null ? null : Form.fromJson(json["habitat"]),
        hasGenderDifferences: json["has_gender_differences"],
        hatchCounter: json["hatch_counter"],
        id: json["id"],
        isBaby: json["is_baby"],
        isLegendary: json["is_legendary"],
        isMythical: json["is_mythical"],
        name: json["name"],
        order: json["order"],
        palParkEncounters: json["pal_park_encounters"] == null
            ? []
            : List<PalParkEncounter?>.from(json["pal_park_encounters"]!
                .map((x) => PalParkEncounter.fromJson(x))),
        pokedexNumbers: json["pokedex_numbers"] == null
            ? []
            : List<PokedexNumber?>.from(
                json["pokedex_numbers"]!.map((x) => PokedexNumber.fromJson(x))),
        shape: json["shape"] == null ? null : Form.fromJson(json["shape"]),
        varieties: json["varieties"] == null
            ? []
            : List<Variety?>.from(
                json["varieties"]!.map((x) => Variety.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "base_happiness": baseHappiness,
        "capture_rate": captureRate,
        "color": color!.toJson(),
        "egg_groups": eggGroups == null
            ? []
            : List<dynamic>.from(eggGroups!.map((x) => x!.toJson())),
        "evolution_chain": evolutionChain!.toJson(),
        "evolves_from_species": evolvesFromSpecies,
        "flavor_text_entries": flavorTextEntries == null
            ? []
            : List<dynamic>.from(flavorTextEntries!.map((x) => x!.toJson())),
        "form_descriptions": formDescriptions == null
            ? []
            : List<dynamic>.from(formDescriptions!.map((x) => x)),
        "forms_switchable": formsSwitchable,
        "gender_rate": genderRate,
        "genera": genera == null
            ? []
            : List<dynamic>.from(genera!.map((x) => x!.toJson())),
        "generation": generation!.toJson(),
        "growth_rate": growthRate!.toJson(),
        "habitat": habitat!.toJson(),
        "has_gender_differences": hasGenderDifferences,
        "hatch_counter": hatchCounter,
        "id": id,
        "is_baby": isBaby,
        "is_legendary": isLegendary,
        "is_mythical": isMythical,
        "name": name,
        "order": order,
        "pal_park_encounters": palParkEncounters == null
            ? []
            : List<dynamic>.from(palParkEncounters!.map((x) => x!.toJson())),
        "pokedex_numbers": pokedexNumbers == null
            ? []
            : List<dynamic>.from(pokedexNumbers!.map((x) => x!.toJson())),
        "shape": shape!.toJson(),
        "varieties": varieties == null
            ? []
            : List<dynamic>.from(varieties!.map((x) => x!.toJson())),
      };
}

class EvolutionChain {
  EvolutionChain({
    this.url,
  });

  String? url;

  factory EvolutionChain.fromJson(Map<String, dynamic> json) => EvolutionChain(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class FlavorTextEntry {
  FlavorTextEntry({
    this.flavorText,
    this.language,
    this.version,
  });

  String? flavorText;
  Form? language;
  Form? version;

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      FlavorTextEntry(
        flavorText: json["flavor_text"],
        language: Form.fromJson(json["language"]),
        version: Form.fromJson(json["version"]),
      );

  Map<String, dynamic> toJson() => {
        "flavor_text": flavorText,
        "language": language!.toJson(),
        "version": version!.toJson(),
      };
}

class Genus {
  Genus({
    this.genus,
    this.language,
  });

  String? genus;
  Form? language;

  factory Genus.fromJson(Map<String, dynamic> json) => Genus(
        genus: json["genus"],
        language: Form.fromJson(json["language"]),
      );

  Map<String, dynamic> toJson() => {
        "genus": genus,
        "language": language!.toJson(),
      };
}

class PalParkEncounter {
  PalParkEncounter({
    this.area,
    this.baseScore,
    this.rate,
  });

  Form? area;
  int? baseScore;
  int? rate;

  factory PalParkEncounter.fromJson(Map<String, dynamic> json) =>
      PalParkEncounter(
        area: Form.fromJson(json["area"]),
        baseScore: json["base_score"],
        rate: json["rate"],
      );

  Map<String, dynamic> toJson() => {
        "area": area!.toJson(),
        "base_score": baseScore,
        "rate": rate,
      };
}

class PokedexNumber {
  PokedexNumber({
    this.entryNumber,
    this.pokedex,
  });

  int? entryNumber;
  Form? pokedex;

  factory PokedexNumber.fromJson(Map<String, dynamic> json) => PokedexNumber(
        entryNumber: json["entry_number"],
        pokedex: Form.fromJson(json["pokedex"]),
      );

  Map<String, dynamic> toJson() => {
        "entry_number": entryNumber,
        "pokedex": pokedex!.toJson(),
      };
}

class Variety {
  Variety({
    this.isDefault,
    this.pokemon,
  });

  bool? isDefault;
  Form? pokemon;

  factory Variety.fromJson(Map<String, dynamic> json) => Variety(
        isDefault: json["is_default"],
        pokemon: Form.fromJson(json["pokemon"]),
      );

  Map<String, dynamic> toJson() => {
        "is_default": isDefault,
        "pokemon": pokemon!.toJson(),
      };
}

class Sprites {
  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
  });

  String? backDefault;
  dynamic backFemale;
  String? backShiny;
  dynamic backShinyFemale;
  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;
  Other? other;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        other: Other.fromJson(json["other"]),
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
        "other": other!.toJson(),
      };
}

class Other {
  Other({
    this.dreamWorld,
    this.home,
    this.officialArtwork,
  });

  DreamWorld? dreamWorld;
  Home? home;
  OfficialArtwork? officialArtwork;

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        dreamWorld: DreamWorld.fromJson(json["dream_world"]),
        home: Home.fromJson(json["home"]),
        officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
      );

  Map<String, dynamic> toJson() => {
        "dream_world": dreamWorld!.toJson(),
        "home": home!.toJson(),
        "official-artwork": officialArtwork!.toJson(),
      };
}

class DreamWorld {
  DreamWorld({
    this.frontDefault,
    this.frontFemale,
  });

  String? frontDefault;
  dynamic frontFemale;

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
      };
}

class Home {
  Home({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}

class OfficialArtwork {
  OfficialArtwork({
    this.frontDefault,
    this.frontShiny,
  });

  String? frontDefault;
  String? frontShiny;

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}

class Stat {
  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  int? baseStat;
  int? effort;
  Form? stat;

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Form.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat!.toJson(),
      };
}

class Type {
  Type({
    this.slot,
    this.type,
  });

  int? slot;
  Form? type;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Form.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type!.toJson(),
      };
}

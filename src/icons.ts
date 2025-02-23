import { faBars } from "@fortawesome/free-solid-svg-icons";
import { faBluesky } from "@fortawesome/free-brands-svg-icons";
import {
  icon,
  library,
  type Icon,
  type IconLookup,
  type IconDefinition,
} from "@fortawesome/fontawesome-svg-core";

class LibraryBuilder<Icons extends {}> {
  private icons: Icons = {} as Icons;

  public register<Name extends string>(
    name: Name,
    definition: IconDefinition,
    lookup: IconLookup
  ): LibraryBuilder<Icons & Record<Name, Icon>> {
    library.add(definition);

    const result = new LibraryBuilder<Icons & Record<Name, Icon>>();
    const registered = icon(lookup);

    if (!registered) {
      throw new Error(
        `Icon '${lookup.iconName}' with prefix '${lookup.prefix}' could not be found.`
      );
    }

    result.icons = {
      ...this.icons,
      [name]: registered,
    } as Icons & Record<Name, Icon>;

    return result;
  }

  public build(): Icons {
    return this.icons;
  }
}

export default new LibraryBuilder()
  .register("bars", faBars, { iconName: "bars", prefix: "fas" })
  .register("bsky", faBluesky, { iconName: "bluesky", prefix: "fab" })
  .build();

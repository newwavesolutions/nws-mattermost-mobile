enum Flavor {
  DEV,
  STG,
  PROD,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'Nws chat dev';
      case Flavor.STG:
        return 'Nws chat stg';
      case Flavor.PROD:
        return 'Nws chat prod';
      default:
        return 'title';
    }
  }

}

class StringFormat {
  String path(String text) {
    var split = text.split('IMG');

    return '/${split[0]}/IMG${split.last}';
  }
}

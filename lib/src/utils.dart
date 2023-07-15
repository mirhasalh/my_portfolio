String viewImagePathFormat(String text) {
  var split = text.split('IMG');

  return '/${split[0]}/IMG${split.last}';
}

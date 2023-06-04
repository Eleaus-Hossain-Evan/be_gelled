part of 'extensions.dart';

extension DateTimeExtension on DateTime {
  String formatToWord() {
    return DateFormat.yMMMMd().format(this);
  }

  String formatToWordWithTime() {
    return "${DateFormat("d MMM y").format(this)}, ${DateFormat.jm().format(this)}";
  }

  String format([String pattern = 'dd/MM/yyyy', String? locale]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  String formatDivider([String pattern = 'dd-MM-yyyy', String? locale]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }
}

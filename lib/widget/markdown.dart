class MD {
  static String dash(String text) => "- $text";
  static String wrap(String text) => "($text)";
  static String ol(String text) => "• $text";
  static String olTab(String text) => "    ◦ $text";
  static String olTabs(List<String> texts) =>
      texts.map((t) => olTab(t.replaceAll("\n", "\n         "))).join("\n");
}

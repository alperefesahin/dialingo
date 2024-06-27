enum RouterEnums {
  dashboardScreen('/dashboard_screen'),
  speakingScreen('/speaking_screen'),
  translateResultScreen('/translate_result_screen');

  final String routeName;

  const RouterEnums(this.routeName);
}
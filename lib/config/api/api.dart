class API {
  static String link =
      "https://radio-world-75-000-worldwide-fm-radio-stations.p.rapidapi.com/all_radios.php?limit=10&order=ASC&page=1&random=false";
  static String apiKey = "20d98e0a0dmsh1749f9de4aae279p138853jsn0b5d7d193174";
  static Map<String, String> requestHeaders = {
    'X-Rapidapi-Key': '$apiKey',
    'X-Rapidapi-Host':
        'radio-world-75-000-worldwide-fm-radio-stations.p.rapidapi.com',
    'Host': 'radio-world-75-000-worldwide-fm-radio-stations.p.rapidapi.com'
  };
}

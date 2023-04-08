const String APIROOT = "https://api.nasa.gov/neo/rest/v1/feed?start_date=2023-01-01&end_date=2023-01-02&api_key=DEMO_KEY";

/// using substring method to get the start date
String date = APIROOT.substring(49, 59);
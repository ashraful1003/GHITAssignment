# Ashraful-01627469311

Here is the Final Output with video representation:

https://user-images.githubusercontent.com/76874409/230725471-704c0ac2-8eec-4469-9c1f-9259d7785557.mp4


## Getting Started

You are given an API of NASA. It should give you extensive information about the asteroids that
might come near or orbit around the planet of earth. API key and the base URL of the API are
given.

“https://api.nasa.gov/neo/rest/v1/feed?start_date=2023-01-01&end_date=2023-01-
02&api_key=DEMO_KEY” // api key: DEMO_KEY


Your task is to complete the following problem-
Task 01: Show all the asteroid information as a list followed by the date category.

Example:
Date: YYYY-MM-DD
…[list]
Date: YYYY-MM-DD
…[list]


Task 02: In listview, you need to show the following information as a Card view:

Name: ‘name’

Magnitude: ‘absolute_magnitude_h’

Close Approach: ‘close_approach_date’

Is_potentially_hazardous_asteroid: ‘is_potentially_hazardous_asteroid’

Relative_velocity (Km): ‘relative_velocity’


Task 03: If Is_potentially_hazardous_asteroid is True then set the background into
‘rgba(0,0,0,0.3)’ OR set as rgba(255,255,255,0.8)


Task 04: The list can be sorted in any order with close_approach_date (There will be a
toggle button to switch between Ascending/Descending)


Task 05: The list can be sorted with respect to ‘relative_velocity’ in any order. (it's
inside close_approach_data). (There will be a toggle button to switch between
Ascending/Descending)

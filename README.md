## Overview

Clone the app and open on your IDE.
The IDE will probably prompt you to install all sorts of dependencies and libraries.

# Basics
This app has three core functionalities:
1) Make an API call

   The JSON file is hosted on this repo, `raw.githubusercontent.com/jiebo/dcube_flutter/master/assets/dcube_projects.json`. After calling, the JSON is parsed into a list of `Project` objects.

2) Display a list

   With the list, the app can then display the individual items. Currently there's only an image and a title. If you want to add more meta data in please feel free.

3) Navigate between screens

   The `onTap()` function of the list item triggers navigation to the `ProjectDetailsScreen`, which displays the description.


# Tasks
This is an `OR` clause, so just pick the one you like.
* UI - Just fancy up the app however you want, look through libraries or samples out there
* API - Consume the Google PlayStore or Apple AppStore APIs and display app-related information

# References
https://github.com/Solido/awesome-flutter

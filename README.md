# Quotes (DB Miner)
A Flutter application to provide inspirational quotes, organized by categories, with features like light and dark themes, splash screen, detailed quote screens, random background images, and font families. This app also allows users to create quote wallpapers and set them as device wallpapers.

## Features ##
Category-wise Organization: Browse quotes by different categories.
Themes: Switch between light and dark themes.
Splash Screen: Initial loading screen with app branding.
Detailed Quote Screens: View quotes with additional details.
Random Background Images: Quotes are displayed with random background images.
Random Font Families: Quotes are shown in various fonts for a better visual experience.
Quote Wallpaper Creation: Create and set wallpapers from quotes.
SQLite Database: Local storage of quotes for offline access.
API Integration: Fetch quotes from a remote API.
Local JSON Bank: Backup source of quotes stored locally.
API
The app fetches quotes from the following API:

Endpoint: https://sheetdb.io/api/v1/accmtecgjck1x
Response Format:
```json
{
  "quote": "Success is not final, failure is not fatal: It is the courage to continue that counts",
  "author": "Winston Churchill",
  "cate": "Success",
  "like": "0"
}
```
##  Screenshots  ##
Add screenshots of your app here to showcase its UI and features.

##  Video  ##
Add screenshots of your app here to showcase its UI and features.


## Dependencies ##
`flutter`

`get`

`sqflite`

`path`

`http`

## Getting Started ##
This project uses GetX for state management and Sqflite for local database handling. The following steps will help you get started with the project:

1. `Setup GetX`:

Create controllers for managing state.
Use `Get.put()` to initialize controllers.
Use Obx or GetX widgets to listen to changes in state.

2. `Setup Sqflite`:

Define your database schema.
Create database helper functions for `CRUD operations`.
Integrate database functions with GetX controllers for state management.

3. `API Integration`:

Use the `http` package to fetch data from the API.
Parse the JSON response and store the data in local database for offline access.

## Contributing ##
Contributions are welcome! Please create a pull request with a clear description of your changes.

## License ##
This project is licensed under the MIT License.

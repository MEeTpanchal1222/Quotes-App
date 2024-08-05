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
<img src = "https://github.com/user-attachments/assets/9ca50bb9-417b-4621-943b-5fd4f3312a95" width = "200" />
<img src = "https://github.com/user-attachments/assets/ead7d29f-dea6-42ea-8a6e-963d22eb00d3" width = "200" />
<img src = "https://github.com/user-attachments/assets/69726067-8f4e-4276-b56b-d2ff14f3ac11" width = "200" />
<img src = "https://github.com/user-attachments/assets/174dc24d-8879-41fc-8c08-dd84467a83f7" width = "200" />

<img src = "https://github.com/user-attachments/assets/81fcd4c2-315f-4e9b-8732-48db663abd44" width = "200" />
<img src = "https://github.com/user-attachments/assets/7b064358-666d-47a8-b886-d63ed9310bcd" width = "200" />
<img src = "https://github.com/user-attachments/assets/9c4a1a8b-26b7-4b7f-9388-1644cc60490f" width = "200" />
<img src = "https://github.com/user-attachments/assets/d9dc373b-310c-4ea4-8b71-dfb80e30d2e0" width = "200" />
<img src = "https://github.com/user-attachments/assets/2cb94c58-6e2c-4dc9-a51b-4f9a2cf40bf7" width = "200" />
<img src = "https://github.com/user-attachments/assets/e252e40e-129a-45b6-9524-e3db724582c9" width = "200" />
<img src = "https://github.com/user-attachments/assets/2451f009-a0f2-474e-b8de-e1092fde09fe" width = "200" />
<img src = "https://github.com/user-attachments/assets/a5029d36-ccb5-418e-9ea5-7e160f2c993d" width = "200" />
<img src = "https://github.com/user-attachments/assets/437c9513-e942-44d7-94d3-1922d60a2cd6" width = "200" />
<img src = "https://github.com/user-attachments/assets/bceebc34-af3d-4a8b-be6f-3cbc1d2a4e6d" width = "200" />
<img src = "https://github.com/user-attachments/assets/8a96a33b-b1b8-4c70-ae14-91bb702ff802" width = "200" />
<img src = "https://github.com/user-attachments/assets/81f26d28-05de-4d22-84c0-726272e182f3" width = "200" />
<img src = "https://github.com/user-attachments/assets/1c204a0b-9a55-46c9-b73f-d9a3d2b1ec72" width = "200" />



##  Video  ##



https://github.com/user-attachments/assets/d9d825da-8282-44be-9421-14489400c0f6



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

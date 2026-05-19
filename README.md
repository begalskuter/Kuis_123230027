# 🎮 Kuis - Mobile Game Store Catalog

A beautiful and modern Flutter mobile application built as the official **Kuis 1** submission for the **Teknologi Pemrograman Mobile (TPM)** course. This application serves as a Game Store catalog where users can log in, view a list of games, interactive liked states, purchase mock games, and view user profiles.

---

## 👤 Developer Identity

<table align="center">
  <tr>
    <td align="center">
      <img src="https://img.icons8.com/color/120/000000/person-male.png" width="100px" alt="Profile Icon"/><br/>
      <b>Muhammad Syahrial Abidin</b>
    </td>
  </tr>
  <tr>
    <td>
      <table>
        <tr>
          <td><b>NIM</b></td>
          <td>: 123230027</td>
        </tr>
        <tr>
          <td><b>Kelas</b></td>
          <td>: Prak TPM IF-E</td>
        </tr>
        <tr>
          <td><b>Instansi</b></td>
          <td>: Universitas Pembangunan Nasional "Veteran" Yogyakarta</td>
        </tr>
        <tr>
          <td><b>Tugas</b></td>
          <td>: Kuis 1 (Game Store Catalog)</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

---

## 🚀 Key Features

The application incorporates a sleek, minimalist aesthetic with standard mobile UI interactions. Below are the key feature modules of the project:

### 🔐 1. Login Module (`login_page.dart`)
* **Secure Gating:** Access is blocked until a password challenge is met.
* **NIM Authentication:** The system validates the password specifically against the developer's last 3 NIM digits (**`027`**).
* **Dynamic Welcome Transfer:** Successfully captures the inputted username and dynamically passes it to the subsequent screens.

### 🎮 2. Game Catalog List Module (`game_list_page.dart`)
* **Dynamic Greeting Header:** Displays a custom personalized top banner: `"Selamat Datang [Username]!"`
* **Custom Card Design:** Elegant grid/card structures with neat black borders presenting game thumbnail artwork, titles, prices, and likes.
* **Interactive Liking System:** Users can click the heart icon on each item card to like/unlike games. The action triggers:
  * Dynamic visual toggle of the heart icon (solid red <--> border grey).
  * Real-time increment/decrement of the local like counts.
* **Navigation Nodes:** Clickable cards redirect users to details pages, and dedicated AppBar buttons guide the user to the profile screen or trigger logout.

### 📝 3. Detailed View Module (`game_detail_page.dart`)
* **Rich Spec Showcase:** Renders full-size game covers, official names, release dates, ratings, review statistics, and dynamic tags mapped inside adaptive `Chip` wraps.
* **About Game Section:** Comprehensive textual overview description.
* **Purchase Simulation:** Includes a stylized `"BELI"` primary action button. Tapping the button shows a native success Toast/SnackBar notification (`"Game berhasil di beli"`) and redirects the user back to the list screen.

### 👤 4. Developer Profile Module (`profile_page.dart`)
* **Clean Avatar Layout:** Circular profile avatar and title tags (`Software Developer`).
* **Dynamic Binding:** Binds and reflects the login username dynamically at the top.
* **Mock Professional Information:** Details dummy accounts representing developer details (Email, Phone, Location) in standard, readable lists.
* **Logout Functionality:** Complete simulated session teardown with proper navigation flow.

---

## 🛠️ Technical Stack & Configuration

* **Framework:** Flutter SDK (>= 3.9.0)
* **Language:** Dart
* **Design System:** Material Design 3 (Clean minimalist aesthetics)
* **Dependencies:**
  * `flutter` (Core SDK)
  * `url_launcher: ^6.3.2` (Used for future integration of external game store redirection link)

---

## 📁 Directory Structure

```text
lib/
├── main.dart                 # Application entry point & MainApp Router
├── models/
│   └── game_data.dart        # Game data model schema and extensive mock list dataset
└── screen/
    ├── login_page.dart       # User authentication with NIM '027' challenge
    ├── game_list_page.dart   # Main catalog showing games list & toggles
    ├── game_detail_page.dart # Detail page with specifications & purchase action
    └── profile_page.dart     # Dynamic developer identity profile details
```

---

## 🏃 Getting Started & How to Run

Follow these guidelines to set up and boot the project on your local machine or simulator:

### 1. Prerequisites
Ensure you have the Flutter environment properly configured. Run `flutter doctor` in your terminal to verify your setup.

### 2. Installation & Run
1. Clone this repository to your local path:
   ```bash
   git clone https://github.com/begalskuter/Kuis_123230027.git
   ```
2. Navigate into the project folder directory:
   ```bash
   cd Kuis_123230027
   ```
3. Fetch the flutter package dependencies:
   ```bash
   flutter pub get
   ```
4. Connect your emulator/physical device and launch the project:
   ```bash
   flutter run
   ```

---

*Made with 💻 by Muhammad Syahrial Abidin - 123230027*

# qrp-freecam (Enhanced Freecam)

A FiveM freecam script for QBCore servers. The player can move a free camera around their character (10 meters by default), adjust the angle and FOV, and hide the UI to take screenshots. Control hints are shown in a small NUI interface written in Vue 3.

Version: `1.0.0` (`fxmanifest.lua`).

## How it works

- When freecam opens, the camera is placed 3 meters behind and 2 meters above the character.
- While freecam is active, the character is frozen, its collision is disabled and it is made invincible. These are reverted when freecam closes.
- If the camera moves more than `distanceLimit` (default 10.0) meters from the point where it was opened, freecam closes on its own and shows the notification "Mesafe sınırını aştınız, freecam kapatıldı." ("You exceeded the distance limit, freecam closed.").
- While freecam is active, almost all game controls are disabled. The mouse, `T` (chat) and `N` stay enabled.
- Notifications are sent with `QBCore.Functions.Notify`.

## Requirements

- `qb-core` (the script calls `exports['qb-core']:GetCoreObject()` on startup)
- Node.js and npm to build the UI
- Tailwind CSS is loaded from `https://cdn.tailwindcss.com` in `web/index.html`. For the UI to render correctly, the player needs to be able to reach that address.

## Installation

1. Clone the repo into your server's `resources` folder:

   ```bash
   git clone https://github.com/Burqk1/qrp-freecam.git
   ```

2. Build the UI. `web/dist/` is not included in git, and the UI won't load without a build:

   ```bash
   cd qrp-freecam/web
   npm install
   npm run build
   ```

   The output is written to `web/dist/`; `fxmanifest.lua` loads the UI from `web/dist/index.html`.

3. Add it to `server.cfg` after `qb-core`:

   ```cfg
   ensure qb-core
   ensure qrp-freecam
   ```

## Controls

| Key | Action |
|-----|-------|
| `F6` | Toggle freecam (`/freecam` command; the key can be changed in FiveM settings) |
| Mouse | Rotate the camera (up/down limited to ±89°) |
| `W` / `S` | Forward / backward |
| `A` / `D` | Left / right |
| `R` / `F` | Up / down |
| `E` / `Q` | Tilt the camera sideways (roll) |
| `SHIFT` (hold) | Fast movement |
| `SPACE` | Increases the speed multiplier by 0.5 (from 1.0 up to 5.0, then wraps back to 1.0) |
| Mouse wheel | Zoom in / out (FOV between 5 and 90) |
| `H` | Switch between the small menu and the full controls menu |
| `Z` | Hide/show the UI (for taking photos) |

The keys in the full controls menu match the key bindings in `client.lua`.

### Command

| Command | Description |
|-------|----------|
| `/freecam` | Opens or closes freecam. Default key is `F6` (`RegisterKeyMapping`). |

There is no permission check on the command; every player on the server can use it.

## Configuration

There is no separate config file. The settings are the variables at the top of `client.lua`:

```lua
local normalSpeed = 0.05         -- Normal hareket hızı
local fastSpeed = 0.1            -- SHIFT basılıyken hareket hızı
local mouseSensitivity = 4.0     -- Fare hassasiyeti
local distanceLimit = 10.0       -- Açılış noktasından en fazla uzaklık (metre)

local minFov = 5.0               -- En küçük FOV (en yakın zoom)
local maxFov = 90.0              -- En büyük FOV
local fovStep = 2.0              -- Tekerlek başına FOV değişimi
local defaultFov = 50.0          -- Açılıştaki FOV

local transitionSpeed = 150      -- Freecam'e geçiş süresi (ms)
local rotationSensitivity = 1.0  -- Dönüş ve roll hassasiyeti çarpanı
```

The notification texts (`Freecam kapatıldı.` ("Freecam closed."), etc.) are inside the `ForceCloseFreecam` function.

## UI

- **Small menu:** Shows only `H - YARDIM` ("H - HELP") on the middle right of the screen.
- **Full menu:** At the bottom center, lists the keys for movement (`W`/`A`/`S`/`D`), rotation (`E`/`Q`), height (`R`/`F`), speed (`SHIFT`, `SPACE`), zoom (wheel) and hiding the menu (`Z`).
- The UI text is in Turkish.

Messages sent from Lua to the UI: `showUI` (`show: true/false`) and `toggleMenu`. There is a single NUI callback from the UI to Lua: `closeUI`.

## Development

Scripts in `web/package.json`:

```bash
cd web
npm run dev       # Vite geliştirme sunucusu (port 3000)
npm run build     # web/dist/ klasörüne derleme
npm run preview   # Derlenmiş çıktıyı önizleme
```

The build entry point chain is `web/index.html` → `web/src/main.js` → `web/src/App.vue`.

## Folder structure

```
qrp-freecam/
├── client.lua          # Freecam mantığı, tuşlar ve ayarlar
├── fxmanifest.lua      # Resource manifest
└── web/
    ├── index.html      # Vite giriş HTML'i (Tailwind CDN burada)
    ├── src/
    │   ├── main.js     # Vue uygulamasını başlatır
    │   └── App.vue     # Menü bileşeni
    ├── vite.config.js  # Çıktı: web/dist/
    └── package.json
```

## License

There is no separate LICENSE file in the repo. `web/package.json` says `"license": "ISC"`.

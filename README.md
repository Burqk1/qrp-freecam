# Enhanced Freecam

FiveM için gelişmiş freecam scripti. Modern UI ve Vue.js ile geliştirilmiştir.

## 🎮 Özellikler

- ✨ Modern ve responsive UI tasarımı
- 🎨 Tailwind CSS ile stillendirilmiş
- ⚡ Vite build sistemi
- 📸 UI gizleme özelliği (foto çekmek için)
- 🔄 İki aşamalı menü sistemi (Küçük info + Büyük kontrol menüsü)
- 🎯 jg-textui benzeri tuş göstergeleri
- 💨 Smooth animasyonlar

## 📦 Kurulum

1. Repoyu klonlayın:
   ```bash
   git clone https://github.com/Burqk1/qrp-freecam.git
   ```

2. Web klasörüne gidin ve bağımlılıkları yükleyin:
   ```bash
   cd enhanced-freecam/web
   npm install
   ```

3. Web dosyalarını build edin:
   ```bash
   npm run build
   ```

4. Resource'u FiveM sunucunuza ekleyin
5. `server.cfg` dosyanıza ekleyin:
   ```
   ensure enhanced-freecam
   ```

## 🛠️ Geliştirme

### Development Mode
Web klasöründe development server başlatın:
```bash
cd web
npm run dev
```

### Production Build
Web klasöründe production build alın:
```bash
cd web
npm run build
```

### Preview Build
Build'i önizlemek için:
```bash
cd web
npm run preview
```

## 🎮 Kontroller

| Tuş | Açıklama |
|-----|----------|
| **F6** | Freecam'i aç/kapat |
| **H** | Menüler arası geçiş (Info ↔ Kontroller) |
| **Z** | UI'yı gizle/göster (foto çekmek için) |
| **W/A/S/D** | İleri/Sol/Geri/Sağ hareket |
| **E/Q/SPACE** | Döndürme kontrolleri |
| **SHIFT** | Hızlı hareket modu |
| **SCROLL** | Yakınlaştırma/Uzaklaştırma |

## 📁 Klasör Yapısı

```
enhanced-freecam/
├── client.lua              # Client-side Lua script
├── fxmanifest.lua         # Resource manifest
├── README.md              # Bu dosya
└── web/                   # UI dosyaları
    ├── index.html         # Ana HTML dosyası
    ├── app.js            # Vue.js uygulama kodu
    ├── package.json      # NPM paket yapılandırması
    ├── vite.config.js    # Vite build yapılandırması
    ├── node_modules/     # NPM bağımlılıkları (gitignore)
    └── dist/             # Build edilmiş dosyalar (gitignore)
        ├── index.html
        └── assets/
            └── main.js
```

## 🔧 Yapılandırma

`client.lua` dosyasında şu ayarları değiştirebilirsiniz:

```lua
local normalSpeed = 0.05        -- Normal hareket hızı
local fastSpeed = 0.1           -- SHIFT ile hızlı hareket
local mouseSensitivity = 4.0    -- Fare hassasiyeti
local distanceLimit = 10.0      -- Maksimum mesafe sınırı
local minFov = 5.0             -- Minimum FOV
local maxFov = 90.0            -- Maximum FOV
local defaultFov = 50.0        -- Başlangıç FOV
```

## 🎨 UI Özellikleri

- **Küçük Menü**: Sağ ortada, sadece "H - YARDIM" gösterir
- **Büyük Menü**: Alt ortada, tüm kontrolleri gösterir
- **Responsive**: Tüm ekran boyutlarına uyumlu
- **Animasyonlu**: Smooth geçişler ve fade efektleri
- **Modern Tasarım**: Dark tema, rounded corners, shadows

## 📝 Lisans

ISC License



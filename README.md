# qrp-freecam (Enhanced Freecam)

QBCore sunucular için FiveM freecam scripti. Oyuncu, karakterinin çevresinde (varsayılan 10 metre) serbest kamerayla gezebilir, açıyı ve FOV'u ayarlayabilir, ekran görüntüsü almak için arayüzü gizleyebilir. Kontrol ipuçları Vue 3 ile yazılmış küçük bir NUI arayüzünde gösterilir.

Sürüm: `1.0.0` (`fxmanifest.lua`).

## Nasıl çalışır

- Freecam açılınca kamera karakterin 3 metre arkasına ve 2 metre yukarısına yerleşir.
- Freecam açıkken karakter dondurulur, çarpışması kapatılır ve ölümsüz yapılır. Kapanınca bunlar geri alınır.
- Kamera, açıldığı noktadan `distanceLimit` (varsayılan 10.0) metreden fazla uzaklaşırsa freecam kendiliğinden kapanır ve "Mesafe sınırını aştınız, freecam kapatıldı." bildirimi çıkar.
- Freecam açıkken neredeyse tüm oyun kontrolleri kapatılır. Fare, `T` (sohbet) ve `N` açık kalır.
- Bildirimler `QBCore.Functions.Notify` ile gönderilir.

## Gereksinimler

- `qb-core` (script başlarken `exports['qb-core']:GetCoreObject()` çağırır)
- Arayüzü derlemek için Node.js ve npm
- Tailwind CSS, `web/index.html` içinden `https://cdn.tailwindcss.com` adresinden yüklenir. Bu yüzden arayüzün düzgün görünmesi için oyuncunun bu adrese erişebilmesi gerekir.

## Kurulum

1. Repoyu sunucunuzun `resources` klasörüne klonlayın:

   ```bash
   git clone https://github.com/Burqk1/qrp-freecam.git
   ```

2. Arayüzü derleyin. `web/dist/` git'e dahil değil, derlemeden arayüz yüklenmez:

   ```bash
   cd qrp-freecam/web
   npm install
   npm run build
   ```

   Çıktı `web/dist/` klasörüne yazılır; `fxmanifest.lua` arayüzü `web/dist/index.html` üzerinden yükler.

3. `server.cfg` dosyasına `qb-core`'dan sonra ekleyin:

   ```cfg
   ensure qb-core
   ensure qrp-freecam
   ```

## Kontroller

| Tuş | İşlev |
|-----|-------|
| `F6` | Freecam'i aç/kapat (`/freecam` komutu, tuş FiveM ayarlarından değiştirilebilir) |
| Fare | Kamerayı döndür (yukarı/aşağı ±89° ile sınırlı) |
| `W` / `S` | İleri / geri |
| `A` / `D` | Sola / sağa |
| `R` / `F` | Yukarı / aşağı |
| `E` / `Q` | Kamerayı yana yatır (roll) |
| `SHIFT` (basılı) | Hızlı hareket |
| `SPACE` | Hız çarpanını 0.5 artırır (1.0'dan 5.0'a kadar, sonra 1.0'a döner) |
| Fare tekerleği | Yakınlaştır / uzaklaştır (FOV 5–90 arası) |
| `H` | Küçük menü ile tam kontrol menüsü arasında geçiş |
| `Z` | Arayüzü gizle/göster (fotoğraf çekmek için) |

Not: Tam kontrol menüsü döndürme satırında `E`, `Q`, `SPACE` tuşlarını gösterir ve `R`/`F` yükseklik kontrolünden bahsetmez. Yukarıdaki tablo `client.lua` içindeki gerçek tuş atamalarına göre hazırlanmıştır.

### Komut

| Komut | Açıklama |
|-------|----------|
| `/freecam` | Freecam'i açar veya kapatır. Varsayılan tuşu `F6` (`RegisterKeyMapping`). |

Komut için herhangi bir yetki kontrolü yoktur; sunucudaki her oyuncu kullanabilir.

## Yapılandırma

Ayrı bir config dosyası yok. Ayarlar `client.lua` dosyasının başındaki değişkenlerdir:

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

Bildirim metinleri (`Freecam kapatıldı.` vb.) `ForceCloseFreecam` fonksiyonunun içindedir.

## Arayüz

- **Küçük menü:** Ekranın sağ ortasında yalnızca `H - YARDIM` yazar.
- **Tam menü:** Alt ortada yönlendirme, döndürme, hız, yakınlaştırma ve menüyü gizleme tuşlarını listeler.
- Arayüz metinleri Türkçedir.

Lua tarafından arayüze giden mesajlar: `showUI` (`show: true/false`) ve `toggleMenu`. Arayüzden Lua'ya tek NUI callback'i vardır: `closeUI`.

## Geliştirme

`web/package.json` içindeki scriptler:

```bash
cd web
npm run dev       # Vite geliştirme sunucusu (port 3000)
npm run build     # web/dist/ klasörüne derleme
npm run preview   # Derlenmiş çıktıyı önizleme
```

Derlemenin giriş noktası `web/index.html` → `web/src/main.js` → `web/src/App.vue` zinciridir. `web/app.js` ve `web/style.css` eski bir sürümden kalma dosyalar gibi görünüyor; derlemeye dahil edilmiyorlar.

## Klasör yapısı

```
qrp-freecam/
├── client.lua          # Freecam mantığı, tuşlar ve ayarlar
├── fxmanifest.lua      # Resource manifest
└── web/
    ├── index.html      # Vite giriş HTML'i (Tailwind CDN burada)
    ├── src/
    │   ├── main.js     # Vue uygulamasını başlatır
    │   └── App.vue     # Menü bileşeni
    ├── app.js          # Kullanılmıyor
    ├── style.css       # Kullanılmıyor
    ├── vite.config.js  # Çıktı: web/dist/
    └── package.json
```

## Lisans

Repoda ayrı bir LICENSE dosyası yok. `web/package.json` içinde `"license": "ISC"` yazıyor.

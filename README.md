# Multi-Framework FiveM Template

Template script FiveM yang kompatibel dengan berbagai framework populer:
- **ES Extended** (Legacy)
- **QB-Core** (Legacy)
- **QBX-Core** (Legacy)
- **OX-Core** (Modern)

## 🚀 Fitur

- ✅ Kompatibilitas multi-framework
- ✅ Auto-detection framework yang digunakan
- ✅ Fallback system untuk framework yang tidak didukung
- ✅ Modular structure
- ✅ Easy configuration
- ✅ TypeScript support (untuk OX-Core)

## 📁 Struktur Folder

```
multi_framework_template/
├── client/
│   ├── main.lua
│   ├── framework/
│   │   ├── es_extended.lua
│   │   ├── qb_core.lua
│   │   ├── qbx_core.lua
│   │   └── ox_core.lua
│   └── modules/
├── server/
│   ├── main.lua
│   ├── framework/
│   │   ├── es_extended.lua
│   │   ├── qb_core.lua
│   │   ├── qbx_core.lua
│   │   └── ox_core.lua
│   └── modules/
├── shared/
│   ├── config.lua
│   ├── framework.lua
│   └── utils.lua
├── fxmanifest.lua
└── README.md
```

## 🔧 Instalasi

1. Copy folder `multi_framework_template` ke folder `resources` server FiveM Anda
2. Tambahkan `ensure multi_framework_template` ke `server.cfg`
3. Restart server

## ⚙️ Konfigurasi

Edit file `shared/config.lua` untuk mengatur script sesuai kebutuhan Anda:

```lua
Config = {}

Config.Framework = 'auto' -- 'auto', 'es_extended', 'qb_core', 'qbx_core', 'ox_core'
Config.Debug = false
Config.Locale = 'id'

-- Tambahkan konfigurasi script Anda di sini
```

## 🎯 Penggunaan

### Client Side

```lua
-- Mendapatkan player data
local playerData = Framework.GetPlayerData()

-- Mendapatkan job player
local job = Framework.GetPlayerJob()

-- Trigger server event
Framework.TriggerServerEvent('eventName', data)
```

### Server Side

```lua
-- Mendapatkan player object
local player = Framework.GetPlayer(source)

-- Mendapatkan player data
local playerData = Framework.GetPlayerData(source)

-- Trigger client event
Framework.TriggerClientEvent(source, 'eventName', data)
```

## 🔄 Framework Detection

Script akan otomatis mendeteksi framework yang digunakan berdasarkan:
1. Resource yang sudah running
2. Export functions yang tersedia
3. Event handlers yang terdaftar

## 📝 Menambahkan Framework Baru

Untuk menambahkan framework baru:

1. Buat file baru di `client/framework/` dan `server/framework/`
2. Implementasikan interface yang sama seperti framework lainnya
3. Tambahkan detection logic di `shared/framework.lua`

## 🐛 Troubleshooting

### Framework tidak terdeteksi
- Pastikan framework resource sudah running
- Check console untuk error messages
- Set `Config.Framework` ke nama framework yang spesifik

### Error "Framework not supported"
- Pastikan framework yang digunakan sudah diimplementasikan
- Check versi framework compatibility

## 📄 License

MIT License - lihat file LICENSE untuk detail lebih lanjut.

## 🤝 Contributing

Kontribusi selalu diterima! Silakan buat pull request atau report issues.

## 📞 Support

Jika ada pertanyaan atau masalah, silakan buat issue di repository ini.

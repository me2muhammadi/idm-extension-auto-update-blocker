# IDM Unpacked Extension Integrator - Legacy Download Power Restored!

## 🚫 Stop Browser Auto-Updates & Restore Blocked Download Features 🚫

**This project is for users who need the classic IDM extension behavior —  
including the ability to download copyright-protected videos that recent IDM versions and extensions intentionally block.**

---

## ❗️Why Is This Needed?

- **Starting with IDM 6.40+, IDM and its official extension refuse to download many protected videos** (such as from major streaming/video sites) due to copyright enforcement and legal pressure.
- **This restriction is enforced both in the IDM desktop app and its browser extension.**
- If you try to use an older or “patched” extension, **Edge and Chrome will aggressively auto-update it to the latest, crippled version**—even if you install it manually.
- **You lose the feature again!**

---

## ✨ What This Project Does

- **Lets you keep the “unlocked” IDM extension version (e.g., 6.39 Build 8) that still downloads videos new versions block.**
- **Prevents browsers from auto-updating or “repairing” the extension** by stripping the `update_url` and installing it in developer mode.
- **Patches IDM’s native messaging config** so integration works with your custom extension.
- **Completely restores your ability to download protected videos** in Edge or Chrome, as before!

---

## 🚦 Key Features

- **Prepares your `.crx` extension for sideloading** (unpacks, strips update URL)
- **Prevents Edge/Chrome from ever auto-updating or overwriting your extension**
- **Automatic native messaging patch for IDM (no manual JSON or registry editing)**
- **All-in-one, no-hassle script workflow**
- **Backs up any files before patching**

---

## 📢 Warning

- **Only the “classic” or patched IDM extension (e.g., 6.39 Build 8) can download protected videos!**
- **Any update—by you, IDM, or your browser—will break this unless you use this script.**
- **The new IDM extension/IDM blocks these downloads by design.**

---

## 🚀 How To Use

1. **Extract all files to a folder.**
2. **Run `idm_patch_edge.ps1` for Edge or `idm_patch_chrome.ps1` for Chrome, as administrator.**
3. **Open your browser’s extensions page (`edge://extensions` or `chrome://extensions`).**
4. **Enable “Developer mode.”**
5. **Click “Load unpacked” and select the folder the script prepared.**
6. **The script will detect and finish all integration steps.**
7. **Restart IDM and your browser.**
8. **Enjoy full IDM video download power—nothing gets “broken” by browser auto-updates again!**

---

## ℹ️ Security & Legality

- Use responsibly and in accordance with your local laws.
- The scripts only patch your IDM/extension, never upload binaries.
- **This repo is for technical and educational purposes.**

---

## ✋ FAQ

**Q: Why not just use the Chrome/Edge store extension?**  
A: They are auto-updated and always include the download blocks.

**Q: Will this keep working after browser or IDM updates?**  
A: Yes, _as long as you don’t manually update IDM or let the browser clear extensions_.

**Q: What happens if I accidentally update?**  
A: Just re-run the script to restore functionality.

---

## 🛡️ Credits

- [7-Zip](https://www.7-zip.org/) for extraction
- IDM by [Tonec Inc.](https://www.internetdownloadmanager.com/)
- Scripting: itsofirk
- [crackingcity.com](https://www.crackingcity.com)

---
## Third-Party Components

### IDM Extension (`*.crx`)
- The included `.crx` file is © Tonec Inc. and is provided for user convenience only.
- All rights to the IDM extension remain with its original creator.
- This repository does **not** license, modify, or claim any rights to IDM or its extension.
- If required, download the original CRX from [internetdownloadmanager.com](https://www.internetdownloadmanager.com/).

### 7za.exe (7-Zip Standalone Extractor)
- Included for archive extraction automation.
- © Igor Pavlov. Licensed under the GNU LGPL.
- For details, see: [7-Zip license](https://www.7-zip.org/license.txt)

---
> **With this, you stay in control of your downloads —  
> no matter what your browser or IDM tries to “fix.”**


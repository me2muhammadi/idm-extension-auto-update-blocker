--------------------------------------------------
Browser Extension Installation (Edge/Chrome):
--------------------------------------------------

This package includes scripts to automatically patch the IDM browser integration for Microsoft Edge or Google Chrome.

Included Files:
- `idm_extension_tools.ps1` (shared logic)
- `idm_patch_edge.ps1` (for Microsoft Edge)
- `idm_patch_chrome.ps1` (for Google Chrome)
- `7za.exe` (portable extractor, required by the script)
- `ngpampappnmepgilojfohadhhmbhlaek-6.40.12.crx` (IDM browser extension)

Steps:

1. Extract all files in this archive to a folder (e.g. `C:\idm_patch`).
2. Right-click on either `idm_patch_edge.ps1` (for Edge) or `idm_patch_chrome.ps1` (for Chrome) and select "Run with PowerShell".  
   - *If you get a security policy error, open PowerShell as administrator, run `Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass` and then run the script through the same powershell session.*
3. Follow the on-screen instructions:
   - The script will unpack and prepare the extension.
   - You will be asked to open your browser’s extensions page:
     - For Edge: go to `edge://extensions`
     - For Chrome: go to `chrome://extensions`
   - Enable "Developer mode" (top right).
   - Click "Load unpacked" and select the folder named `idm_unpacked` created by the script in the same directory.
   - The script will detect and patch the extension automatically.
   - The script will restart your browser or prompt you to do so if necessary.

4. Restart IDM (if it is running).

5. Enjoy full IDM integration with your browser!

--------------------------------
Cracked by: www.crackingcity.com

--------------------------------
Troubleshooting:
--------------------------------
- If you encounter errors, make sure you run the PowerShell scripts as administrator.
- The extension ID is detected automatically—no manual editing required.
- If IDM does not catch downloads, ensure it is running in your system tray.

--------------------------------
For best results, always install browser extensions using the provided scripts!

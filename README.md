# ✨🎮 Skurtyy's GmodRTX Easy Installation 🎮✨

[![skurtyyskirtsbanner](https://raw.githubusercontent.com/skurtyyskirts/GmodRTX/refs/heads/main/imgs/skurtyyskirtsbanner.png)](https://www.moddb.com/members/skurtyyskirts/mods)
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/F1F4XIS5X)

Makes the RTX-Remix install as easy as possible. Features a pre-configured rtx.conf that automatically selects the best DLSS option for your hardware, and hundreds of tagged and preconfigured textures for the runtime. This installer will periodically be updated to have the latest RTX-Runtime with its relative DXVK and Bridge.

⚠️ **Please note: This installation process works only with the 32-bit version of Garry's Mod.**

---

## 🚀 Install Instructions / Usage

### 🔨Download and Install

1. **Download** the latest version of the installer from the [releases section](https://github.com/skurtyyskirts/GmodRTX/releases).

2. **Run the Installer:**
   - Double-click on `GarrysmodRTXInstaller.exe` and follow the on-screen instructions.
   - The installer will prompt you to locate your Garry's Mod directory.
   - Once completed, the installer will set up all necessary files and configurations.

3. **Launch the Game:**
   - Use the `gmodrtx.exe.bat` file created during the installation to launch the game.
   - Ensure all configurations have been applied by following any additional prompts at the first launch.

4. **Subscribe to Required Mods:**
   - Visit the [Steam Workshop Mod Collection](https://steamcommunity.com/sharedfiles/filedetails/?id=3386635300).
   - Click **"Subscribe to All"** to ensure you have all the necessary mods installed. Make sure you don't overwrite your existing mods.

5. **Optional Mods and Maps:**
   - Check out Skurtyy's mods and maps on [ModDB](https://www.moddb.com/members/skurtyyskirts/mods).
   - Optionally, subscribe to [this optional Steam Workshop collection](https://steamcommunity.com/sharedfiles/filedetails/?id=3384083598) for additional mods and maps featured in RTX mods.

6. **In-Game Setup:**
   - Once the game loads, open any map and press `~` to open the console.
   - Enter the following commands:
     ```
     rtx.pseudoplayer_unique_hashes 1
     rtx.pseudoweapon_unique_hashes 1
     ```
     This will allow you to tag your playermodel textures and weapon textures in the runtime without hiding the original textures when they appear in the game. Press save to keep changes.

That's it! You're all set. Enjoy Gmod with path tracing. 🎉

### 🖋 Usage Notes

- **Adjusting Screen Size:** When launching the game through `gmodrtx.exe.bat`, the screen will initially appear small. You can adjust this through the in-game settings. Unfortunately, this adjustment will need to be repeated every time you launch the game.
- **Texture Tagging:** After loading into a map, remember to run the `rtx.pseudo` commands before tagging the original texture hashes as playermodel or weapon textures. For example, if you tag the SMG texture as a playermodel without enabling pseudo, the SMG will disappear anywhere it is found in the game.
- **To tag Playermodel Textures:** Open the RTX-Remix runtime menu with Alt+X. Click "Developer Settings Menu" on the bottom left. Then select "Game Setup" and then "Categorize Textures." Hover your mouse over your playermodel, then tag it as "Player Model Texture."
- **Mirrored Map Fix:** You'll notice in some maps you'll get a mirrored effect where the map will suddenly not look right. To fix this, open the console (`~`) and enter:
  ```
  ent_remove_all func_reflective_glass
  ```

---

## ❤️ Credits

A huge thank you to the following projects and creators for making this possible:

- [**SourceRTXTweaks**](https://github.com/BlueAmulet/SourceRTXTweaks) - Blue Amulet's essential tweaks for Source-based games with RTX.
- [**NVIDIA RTX Remix**](https://github.com/NVIDIAGameWorks/rtx-remix) - The framework that makes RTX magic happen, by Nvidia.
- [**Garry's Mod RTX Support**](https://steamcommunity.com/sharedfiles/filedetails/?id=3038853470) - Xenthio's RTX-Remix fixes mod, making Gmod more compatible with Remix.
- **Watbulb** - For their ongoing support and for streamlining the installation process.
- **CR** - For implementing the Lua water fixes and optimizing the autoexec.cfg.

---

## 💡 Notes

- This is a community-driven project. Contributions and feedback are welcome to improve compatibility and user experience.
- If you encounter any issues, please check the [issues](https://github.com/skurtyyskirts/GmodRTX/issues) section or submit a report.
- Join the [RTX Remix Discord](https://discord.gg/c7J6gUhXMk) to connect with the community!
- Explore the [Garry's Mod ModDB Page](https://www.moddb.com/games/garrys-mod-10) to discover more about the game.
- Check out my [Mod Collection on ModDB](https://www.moddb.com/members/skurtyyskirts/mods) for additional content.
- If you'd like to manually install GmodRTX, follow [this guide.](https://github.com/skurtyyskirts/GmodRTX/wiki/Manual-Installation-Guide)

<div align="center">
  <a href='https://ko-fi.com/F1F4XIS5X' target='_blank'>
    <img height='36' style='border:0px;height:36px;' src='https://storage.ko-fi.com/cdn/kofi6.png?v=6' border='0' alt='Buy Me a Coffee at ko-fi.com' />
  </a>
</div>


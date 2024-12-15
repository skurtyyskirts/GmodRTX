# Skurtyy's GmodRTX  Easy Installation 🎮✨
![skurtyyskirtsbanner](https://github.com/user-attachments/assets/e2bb5b3d-d44b-402e-8ff0-92be12d3bc2d)

Makes the Garrysmod RTX-Remix install as easy as possible. Features a pre-configured rtx.conf that automatically selects the best DLSS option for your hardware, and 397 tagged textures for the runtime. This installer will periodically be updated to have the latest RTX-Runtime with its relative DXVK and Bridge.

---

## 🚀 Install Instructions / Usage

### Download and Install

1. **Download** the provided ZIP file from the releases section.

2. **Unzip** the downloaded folder.

3. **Choose your installation method:**

   - **Option 1:** Place the unzipped files directly into your main Garry's Mod game directory.
   - **Option 2 (Optional for separation):**
     1. Make a copy of your Garry's Mod folder (e.g., `garrysmod`) and rename it to `GarrysmodRTX`.
     2. Place the unzipped files into the new `GarrysmodRTX` folder.

4. **Run the GmodInstaller:**

   - The installer will guide you to locate your `gmod.exe` and `hl2.exe` files based on the directory you selected above.
   - Follow the on-screen instructions to configure the paths correctly.

5. **Subscribe to Required Mods:**

   - Visit your [Steam Workshop Mod Collection](https://steamcommunity.com/sharedfiles/filedetails/?id=3384083598).
   - Click **"Subscribe to All"** to ensure you have all the necessary mods installed.

6. **Launch the Game:**

   - Use the newly created `gmod.rtx.exe` to launch the game.
   - Once the game loads, open any map and press `~` to open the console.
   - Enter the following commands:
     ```
     rtx.pseudoplayer_unique_hashes 1
     rtx.pseudoweapon_unique_hashes 1
     ```
     This will allow you to tag your playermodel textures and weapon textures in the runtime without hiding the original textures when they appear in the game.

### Usage Notes

- **Adjusting Screen Size:** When launching the game through `gmod.rtx.exe`, the screen will initially appear small. You can adjust this through the in-game settings. Unfortunately, this adjustment will need to be repeated every time you launch the game.
- **Texture Tagging:** After loading into a map, remember to run the `rtx.pseudo` commands before tagging the original texture hashes as playermodel or weapon textures. For example, if you tag the SMG texture as a playermodel without enabling pseudo, the SMG will disappear anywhere it is found in the game.
- **To tag Playermodel Textures**, open the RTX-Remix runtime menu with Alt+X. Click "Developer Settings Menu on  the bottom left. Then select "Game Setup" and then "Categorize Textures". Hover your mouse over your playermodel select, then tag it as "Player Model Texture". 

That's it! You’re all set. Enjoy your RTX-enhanced Garry's Mod experience. 🎉

---

## 🙌 Credits

A huge thank you to the following projects and creators for making this possible:

- **[SourceRTXTweaks](https://github.com/BlueAmulet/SourceRTXTweaks)** - Blue Amulet's Essential tweaks for Source-based games with RTX.
- **[NVIDIA RTX Remix](https://github.com/NVIDIAGameWorks/rtx-remix)** - The framework that makes RTX magic happen, by Nvidia.
- **[Garry's Mod RTX Support](https://steamcommunity.com/sharedfiles/filedetails/?id=3038853470)** - Xenthio's RTX-Remix fixes mod, making Gmod more compatible with Remix.
- **Watbulb** - For his continued support and helping make the installation process easier.

---

## 💡 Notes

- This is a community-driven project. Contributions and feedback are welcome to improve compatibility and user experience.
- If you encounter any issues, please check the [issues](https://github.com/your-repo-name/GmodRTX/issues) section or submit a report.
- Join the [RTX Remix Discord](https://discord.gg/c7J6gUhXMk) to connect with the community!
- Explore the [Garry's Mod ModDB Page](https://www.moddb.com/games/garrys-mod-10) to discover more about the game.
- Check out my [Mod Collection on ModDB](https://www.moddb.com/members/skurtyyskirts/mods) for additional content.

---

Enjoy! ✨


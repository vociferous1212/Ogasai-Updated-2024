 # oGasai Scripts for WoW Classic
 Ogasaism

If you find bugs you can message in Discord or make a pull request here. Or if the bot does anything you think it shouldn't be doing or if you have an idea you'd like implemented. I work full time and am currently enrolled in school full time so I am working on these in my spare time and cannot run the bot for hours on end watching for bugs - if you see something I have not seen and want the bot to function better.... This is being done as a hobby and as such, you will find bugs. You will also find many things not incorporated into other bot programs or many thing that will be different. This bot is made to just 'work' as is and the code is a mess. With that being said... if you need help understanding the logic behind any of the code feel free to message on Discord. A lot of the stuff here is a 'proof of concept' just to prove a bot can do it and in hopes it will benefit others in the future. There is also a character limit that makes it very difficult to do heavy commenting on functions and the code.


 Current known bugs - 
 - checkbox to avoid blacklisted targets causes bot to walk circles around the target with no clear path to continue grinding
 - sometimes when creating a new hotspot (while moving) the bot does not understand you are at a hotspot and need to manually move out of range or change hotspots to resolve
 - bot does not and CANNOT detect water and will navigate on the floor and drown - this is not fixable but can be negated with aquatic form or water breathing potions or underwater breathing spells


![oGasai](https://github.com/vociferous1212/Ogasai-pic/blob/main/oGasai.png?raw=true)
![oGasai](https://github.com/vociferous1212/Ogasai-pic/blob/main/blacklist.png?raw=true)
A good idea to get a decent injector.
 https://remotedll.en.lo4d.com/windows

 # LOADER INSTRUCTIONS
 - open loader
 - open game
 - find game process or processes
 - find dll
 - inject dll
 - log into game
 - OR use oGasaiLoader.exe and find WoW.exe in your WoW folder
This bot will not PvP. This can be adjusted to PvP but I will not do it. The bot "may" choose to attack a player for defensive purposes on a PvP server only. Like with any WoW bot, you can change the bot to do PvP, but this can be extremely detrimental to any community and the purpose of this bot is not to harm any server. My choice of using this bot over others is to learn coding from a basic language like LUA.

# Casters - Obtain a wand ASAP. Can be used level 5+.

Bot made by DarkLinux @ OwnedCore

https://www.ownedcore.com/forums/world-of-warcraft/world-of-warcraft-emulator-servers/wow-emu-programs/600785-ogasai-d-j-vu-wow-1-12-1-vanilla-bot.html

https://darkenedlinux.com/

Scripts in this repository by Vociferous / GarBear121 - just a hobby

Improved Error Frames Addon Download (Optional):
 - https://github.com/Vociferous121/Improved-Error-Frames-WoW-Classic

Required to use the bot:
- Nav Mesh Map Files : https://mega.nz/#!g0U2xI4a!aoJICAY34DLvMnWPqgIqygDWIy_91tuoyXz4J3rg9dM
- Visual C++ Redistributable for Visual Studio 2015 : https://www.microsoft.com/en-us/download/details.aspx?id=48145
- DirectX End-User Runtime : https://www.microsoft.com/en-us/download/details.aspx?id=35






                                  Ogasai Scripts - Updates to Logitechs original work
                                     
                                  please turn on auto-self cast in the interface menu
                                  please turn on click-to-move in the interface menu
 
  Changes are too numerous to report. The original design, combat, rest and targeting system, is based on Logitechs original scripts. 


Edited mmaps
https://drive.google.com/file/d/1meo7nDiRBILQMiNJ19h-CTrsam8mfqSV/view?usp=sharing

Edit NavMesh by clicked "edit tiles". Click a tile holder until you see it 'light up' (the circle will become larger) - zoom in camera if needed... Hold 'ctrl' and left click where you want to place the new tile holder marker. Press the 'alt' key to undo last tile holder marker movement. Anything INSIDE the white tiles is an acceptable move path. Anything inside blue tiles is not an acceptable move path. Change as needed. 
![oGasai](https://github.com/vociferous1212/Ogasai-pic/blob/main/mmaps.png?raw=true)

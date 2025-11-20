# Escape the Backrooms Autosplitter
Supports versions 5.0+ (1.0+ in-game)

Based on [uhara by ru-mii](https://github.com/ru-mii/uhara)

Credits and version history can be found in [escape_the_backrooms.asl](https://github.com/ETBCommunity/autosplitter/blob/main/escape_the_backrooms.asl)

## Features
- Auto start
- Auto split on level transitions and cutscenes
- Load removal for level transitions and restarts
- Time pause in cutscenes, main menu or if the game craashes
- Auto timer reset in The Hub gamemode when returning to lobby or dying

## Known issues
- Auto reset in The Hub gamemode doesn't work if host dies before other players in Co-op. Unfortunately, there might not be a fix for this issue.

## Installation & Usage
Autosplitters can use a good deal processing power, which may result in a decline of game and/or overall system performance. Use at your own risk.

### Prerequisites
- [LiveSplit](https://livesplit.org/)
- Escape the Backrooms on Steam

### "Automatic" Installation
1. Right click anywhere in the LiveSplit window -> Edit Splits
2. Type "Escape the Backrooms" into the game name. The window should update to say "Auto splitter and load removal by Reokin".
3. Click the Activate button if it is not already activated. 
4. Click the Settings button to open the autosplitter settings. Tick the checkbox of any settings that you want to use. Hit OK to save.
5. In the splits editor, you should have one split per level; the autosplitter will split on each level.
6. Hit OK to save settings.
7. Right click on LiveSplit and set the "Compare Against" to "Game Time".

### Manual Installation
1. Download [uhara9](https://github.com/ru-mii/uhara/blob/main/bin/uhara9).
2. Put the downloaded file into "Livesplit/Components" folder.
3. Download "escape_the_backrooms.asl" from the [Releases](https://github.com/ETBCommunity/autosplitter/releases) page.
4. Right click anywhere in the LiveSplit window -> Edit Layout
5. Click on the + button in the top left of the window, and go into Control > Scriptable Autosplitter
6. Double click on the Scriptable Autosplitter, which should open a dialog.
7. Press the "Browse" button and path it to the file you downloaded.
8. Configuration options will show up after the autosplitter has initialized.
9. Once configured to you liking, close the Layout Settings and Layout Editor windows.
10. Right click Livesplit -> Edit Splits
11. In the splits editor, you should have one split per level; the autosplitter will split on each level.
12. Hit OK to save splits.
13. Right click on LiveSplit and set the "Compare Against" to "Game Time".

# SpectralRP Public Addons
This repository contains all addons I've developed or modified for SpectralRP that I've made publicly available. All addons contain a README.txt with credit to original authors and requirements where applicable.
Please keep in mind that these addons were all designed to work on the SpectralRP server and whilst I've tried where possible to make things more general, most of these addons will require at least some tweaking/config to get them working on your own server.

## My Addons
Below is a list of the addons currently in the repository developed by me, along with a brief description of what they do.

### SpectralRP Base
The SpectralRP base is a utility addon which implements many helpful functions and acts as a helper to some of my other addons.

Notable features include:
* Custom wanted function with the ability to specify a custom name.
* Combination error-message and compensation function which gives the player an error message, optionally compensates them and keeps a record of the error in the server log.
* The ability to spawn fully-functional money entities with a given position and amount.

### CS:GO C4 Minigame
This addon implements a CS:GO-like minigame surrounding the C4 entity from [TFA](https://steamcommunity.com/workshop/filedetails/?id=415143062), though it can easily be made to work with any other, similar C4 addon.
It is important to note that this addon requires a bit of external setup; you will need to run the C4Planted, C4Detonated and C4Defused hooks in your C4 entity of choice in the appropriate places.

### Evidence System
With this addon installed, players will drop evidence (represented by a skull) when they are killed by another player. Other players with designated roles can then investigate the evidence by interacting with it, which automatically makes the killer wanted with an appropriate reason.

### Christmas Present Entity
This addon adds a functional present entity which, when interacted with, spawns a randomly generated gift entity (currently a weapon or money) with different tiers of rarity.

## Altered Addons
Below is a list of the addons currently in the repository which were modified by me, but originally written by someone else.

### DarkRP Properties (originally by [Alig96](https://github.com/Alig96/drp_Properties))
I found this addon in a non-working state and so made some changes to fix it up and add some new functionality. It essentially adds real-estate agents to buy properties (groups of doors) from instead of the usual method of just buying each door individually.
It also gives previews of the properties based on camera angles you can set in the config. Also includes a newly updated version of the property tool (previously developed by ds2198 and Threebow) to make finding DoorIDs and other info required to configure the addon even easier.

### Door Alarm System (originally by [n00bmobile](https://github.com/n00bmobile/door-alarm-system))
This addon already worked pretty well but I ended up making a fair few changes to improve the polish of it. The main changes are:
* Allowed upgrade boxes to have custom names rather than just using entity names (e.g. "Armor Upgrade" rather than "armor_upgrade").
* Changed the radio tower upgrade (automatically makes the intruder wanted) to work with the SpectralRP base, allowing the issuer to appear as "Door Alarm System" rather than "disconnected player".
* Added compatibility with the door-opening functionality of the [TFA weapon base](https://steamcommunity.com/workshop/filedetails/?id=415143062).
* More specific warning messages for the owner when a door is being broken into.
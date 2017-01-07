Golem Construction for Spellcasters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Version:    2.3
Author:     Argent77

Download:   https://github.com/Argent77/A7-GolemConstruction/releases/latest
Discussion: http://www.shsforums.net/topic/58696-mod-golem-construction-for-spellcasters/
            https://forums.beamdog.com/discussion/60602/mod-golem-construction-for-spellcasters


Overview
~~~~~~~~

A mod for Siege of Dragonspear, BG2:EE and EET (Enhanced Edition Trilogy) that allows spellcasters 
to build their own golems.

You can encounter a great number of golems of various types throughout the game. They are strong, 
resistant, and utterly loyal to their master. Unfortunately they are mostly hostile towards you.

This mod makes an attempt to change it. It scatters a number of tomes across Faerûn containing the 
secret knowledge of how to construct golems. Reading these books allows you to build golems by 
yourself, provided you have enough experience, and all the required materials at hand. Only 
characters knowledgeable in the arcane arts are able to understand the complex theories behind the 
golem construction.

Golems can exist for a virtually unlimited time (with exceptions), or until destroyed. They can 
travel with the party all over the world and follow the commands of their master unconditionally. 


Installation
~~~~~~~~~~~~

This is a WeiDU mod, that means it is very easy to install. Simply unpack the downloaded archive 
into your game directory and run "setup-A7!GolemConstruction.exe".
Follow the instructions and you are ready to start. It is strongly recommend to install the mod 
before starting the "Siege of Dragonspear" campaign (BG:EE), or starting a new game (BG2:EE).

Important: The game must be patched to v2.0 or higher to install this mod.


Components
~~~~~~~~~~

1. Golem Construction Ability for Spellcasters (for BG:SoD, BG2:EE and EET)

The main component of the mod. It installs a number of golem building manuals which can be found 
all over Faerûn. The "Manual of Golem Building" comes in six volumes containing knowledge about 
building different types of golems. Each tome contains a single charge of powerful magic which 
provides the user with the "Construct Golem" and "Repair Golem" abilities. After the tome's magic 
is spent it can still be used as reference about building specific types of golems.

Golem types taught by the Manual of Golem Building:
- Flesh Golems in lesser, regular, greater and perfect variants.
- Clay Golems in lesser, regular, greater and perfect variants.
- Stone Golems in lesser, regular, greater and perfect variants.
- Iron Golems in lesser, regular, greater and perfect variants.
- Mithral Golems in lesser, regular, greater and perfect variants.
- Adamantite Golems in lesser, regular, greater and perfect variants.

It is rumored that there is another secret set of tomes which contains knowledge about constructing 
more exotic types of golems.

Each golem requires materials for constructing the physical shell, and possibly additional 
ingredients to implement specific key features of the golem. Creating perfect variant is a feat 
by itself and requires certain unique artifacts of power for the enchantment process.

The construction of golems takes time and has to be done in places with the right equipment. 
In Siege of Dragonspear you can try Sorcerous Sundries, the Repository of Undeath beneath the 
Dwarven Dig Site and the ruins of Kanaglym which are accessible from the Underground River. 
In Shadows of Amn the Planar Sphere and Jermien's Home in Imnesvale may be suitable. The 
Wizard's Library on the second floor of Watcher's Keep can be used as well. In Throne of Bhaal 
your Pocket Plane may work, after installing some equipment.

Golems may follow simple commands. To change a command simply talk to them (you may have to force 
the talk by pressing the Talk button, or pressing F1).


2. Tweaks (require the main component to be installed)

2.1. Replace original Golem Manual (for BG2:EE and EET only)
This component removes the original Golem Manual and all additional pages completely since it 
becomes largely obsolete with this mod. Instead you will find items related to the Golem 
Construction Manuals provided by this mod.

2.2. Improve enemy spellcaster AI (for BG2:EE and EET only)
This component improves the vanilla AI of mages and priest, so that they will attempt to use more 
effective measures against golems. They are still limited to their selection of memorized spells, 
with one exception. High level spellcasters have access to a single HLA which is randomly chosen.

2.3. Golems for enemy spellcasters (for BG:SoD, BG2:EE and EET)
This component adds one or more golem servants to a number of enemy mages throughout the game to 
help them survive a bit longer. The actual golem types and variants are randomized at install time.

2.4. Greater variety of enemy golem types (for BG:SoD, BG2:EE and EET)
This component adds more variety to the enemy golems you can encounter throughout the game. Some 
encounters may be harder because of it. Golems will also make use of their special abilities more 
effectively.

2.5. Fighter Stronghold golems may continue to serve you (for BG2:EE and EET only)
This component adds a chance that one or more golems from the chapel who survive the siege start 
serving you if you accept de'Arnise Keep as your personal stronghold. You can find them in the 
chapel on the upper floor again, behind the secret doors.
* There is a 50% chance for a flesh golem if one or more flesh golems survive.
* There is a 33% chance for a stone golem if one or more stone golems survive.
* There is a 33% chance for a clay golem if the clay golem survives.
* There is a 15% chance for an iron golem if the iron golem survives.


Details
~~~~~~~

See "golem_information.txt" in the mod's "readme" folder. It provides information about the 
minimum caster level and required materials for each golem type, as well as detailed stats, skills 
and abilities of each golem.


Credits
~~~~~~~

Writing, coding and testing: Argent77

Polish translation: Cahir
French translation: Gwendolyne


Copyright Notice
~~~~~~~~~~~~~~~~

The mod "Golem Construction for Spellcasters" is licensed under the "Creative Commons Attribution-
ShareAlike 4.0 International License" (http://creativecommons.org/licenses/by-sa/4.0/).


History
~~~~~~~

2.4
- Added French translation (big thanks to Gwendolyne)
- Added new creature animations for Flesh Golems
- Added option of listing learned golem types to construction dialog
- Added customized ground icons for a number of items
- Worked around an issue of not having a weapon equipped after being released from Imprisonment
- Fixed a bug which removed yellow tint from enemy brain golems after death
- Traified two remaining dialog lines
- More fixes and minor improvements

2.3
- Improved creature animation for Brain Golems
- Rebalanced level requirements for building golems and level adjustments for bards and thieves
- Fixed duplicate reply options in golem construction dialog when used by mage/thief dual or 
  multiclasses
- Improved level checks for constructing golems which provides better support for mage/thief class 
  combinations
- Fixed incorrect mage level check for perfect adamantite golems

2.2
- Added German translation
- Added Polish translation (big thanks to Cahir)
- Thieves with UAI can also build golems (using Bard level requirements)
- Rebalanced golem building requirements
- Minor adjustments of golem stats
- Improved overall EET compatibility
- Improved basic golem AI
- Adapted previously hardcoded strings regarding familiars not allowed to execute specific actions
- Fixed a bug that gave you duplicate golem-related abilities when continuing an EET game in SoA
- Fixed a bug regarding random treasures found in containers which sometimes contained unremovable 
  items
- Fixed an issue which didn't properly keep track of the number of active golems
- Fixed the golem removal script at the end of the SoD plot which had serious side effects in later 
  campaigns in EET
- Fixed accidental removal of a plot item in WK if "Replace original Golem Manual" tweak have been 
  installed
- Fixed enemy golem behavior if "Golems for enemy spellcasters" or "Greater variety of enemy golem 
  types" tweaks have been installed
- Several textual fixes and updates

2.1
- Removed Dragonspear Castle golems from "Greater variety of enemy golem types" tweak because of 
  scripting issues
- Made item import in SoA more compatible
- Minor textual fixes

2.0
- Added several tweak components
- Fixed missing immunities for adamantite golems
- Made mod fully EET-aware

1.0
- Initial release

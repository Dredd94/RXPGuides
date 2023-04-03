RXPGuides.RegisterGuide([[
#wotlk
#group +Profession leveling
#subgroup Cooking and Fishing

<< Horde
#name 1-450 Horde

step << Mage
    #completewith next
    .zone Thunder Bluff >> Teleport to Thunder Bluff
    .skill fishing,75,1
step << !Mage
    #completewith next
    .hs >> Hearth to Dalaran
    .zoneskip Thunder Bluff
    .skill fishing,75,1
step << !Mage
    #completewith next
    .goto Dalaran,57.3, 22.1
    .zone Thunder Bluff >> In Dalaran, take the portal to Thunder Bluff
    .skill fishing,75,1
step
    .goto Mulgore,37.5, 33.1
    .zone Mulgore >> Exit Thunder Bluff into Mulgore via magical escalators
step
    #label Pyall
    .goto Mulgore,45.4, 58.0
    .train 2550 >> Train Apprentice Cooking (1-75) from Pyall in Bloodhoof Village
    .skill cooking,75,1
step
    .goto Mulgore,47.6, 55.0
    >>Purchase all cooking recipes from Harn Longcast, along with fishing pole and some fishing lures
    .collect 6325,1 --Recipe: Brilliant Smallfish (1)
    .collect 6328,1 --Recipe: Longjaw Mud Snapper (1)
    .collect 6256,1 --Fishing Pole (1)
    .collect 6529,2 --Shiny Bauble (2)
    .skill cooking,50,1
step
    .goto Mulgore,44.6, 60.6
    .train 7620 >> Train Apprentice Fishing (1-75) from Uthan Stillwater
    .skill fishing,75,1
step
    .openmap Mulgore
    .skill fishing,75 >> Find a nice spot, equip your fishing pole, attach your lure and start fishing until you reach skill level of 75
    .goto Mulgore,48.5, 52.9
step
    >>You should have around 60 Raw Brilliant Smallfish and some Raw Longjaw Mud Snapper.
    .goto Mulgore,44.5, 60.6
    .train 7731 >> Train Journeyman Fishing (75-150) from Uthan Stillwater
    .skill fishing,150,1
step
    >>Run back to Thunder Bluff and continue fishing
    .goto Thunder Bluff,39.4, 60.7
    .skill fishing,150 >> Continue fishing to skill level 150
step
    .goto Thunder Bluff,56.0, 46.8
    .train 7732 >> Train Expert Fishing (150-225) from Kah Mistrunner in Thunder Bluff
    .skill fishing,225,1    
step
    .goto Thunder Bluff,55.8, 47.6
    >>Purchase Bright Baubles from Sewa Mistrunner
    .collect 6532,40 --Bright Baubles (40)
    .skill fishing,225,1
step
    #completewith next
    + Learn how to cook Brilliant Smallfish
    .use 6325
step
    >>Time to start cooking
    .goto Thunder Bluff,51.2, 52.9
    .skill cooking,50 >> Cook all your Brilliant Smallfish, this shoud take your skill above level 50 but you can keep cooking them up to 65 if you have extra.
step
    .goto Thunder Bluff,50.9, 52.9
    .train 3102 >> Train Journeyman Cooking (75-150) from Aska Mistrunner
    .skill cooking,150,1
step
    #completewith next
    + Learn how to cook Longjaw Mud Snapper
    .use 6328
    .skill cooking,75,1
step
    .goto Thunder Bluff,41.7, 59.2
    .skill cooking,100 >> Cook all your raw Longjaw Mud Snapper until you reach at least 100 skill in cooking. You can stop making them at level 115 if you have extra.
step
    #completewith next
    >>Purchase all cooking recipes from Naal, right next to Aska
    .collect 6330,1 --Recipe: Bristle Whisker Catfish (1)
    .skill cooking,150,1
step
    #completewith next
    + Learn how to cook Bristle Whisker Catfish
    .use 6330
step
    .goto Thunder Bluff,50.9, 52.9
    .skill cooking,125 >> Cook all your Raw Bristle Whisker Catfish. Your cooking skill should be at least 125.
step
    .goto Thunder Bluff,50.9, 52.9
    .train 18260 >> Train Expert Cooking (150-225) from Aska Mistrunner
    .skill cooking,225,1
step
    .goto Thunder Bluff,46.8,50.1
    .fly Brackenwall Village >> Fly to Brackenwall Village in Dustwallow Marsh
step
    >>Start Using Bright Baubles as your lure of choice
    .skill fishing,225 >> Fish around rivers and pools of dustwallow but avoid going near the ocean.
    .loop 45,Dustwallow Marsh,33.6,40.4, 41.5,40.3, 43.3,27.4, 49.7,27.5, 57.1,36.9, 59.8,33.4, 58.4,23.2, 44.2,15.7, 36.1,14.2, 34.7,31.4, 33.6,40.4,
step
    .skill cooking,175 >> Cook all your Raw Bristle Whisker Catfish. Your cooking skill should rise close to 175. If you don't reach 175 cooking skill, catch more
step
    .goto Dustwallow Marsh,35.5, 32.5
    .fly Ratchet >> Fly to Ratchet in The Barrens
    .skill cooking,225,1
step
    .goto The Barrens,63.5, 38.5
    .zone Stranglethorn Vale >> Take a boat to Stranglethorn Vale
    .skill cooking,225,1
step
    >> Find Kelsey Yance, He is in the large building at the end of the ship dock in Booty Bay. Enter the building and make an immediate left.
    .goto Stranglethorn Vale,28.2, 74.4
    .collect 17062,1 --Recipe: Mithril Head Trout (1)
    .collect 13941,1 --Recipe: Filet of Redgill (1)
    .skill cooking,225,1
step
    #completewith next
    + Learn how to cook Mithril Head Trout
    .use 17062
    .skill cooking,225,1
step
    .skill cooking,225 >> Start cooking Mithril Head Trout. Your cooking skill should rise to 225. Stop cooking at 225 and keep any leftover.
step << Mage
    #completewith next
    .zone Thunder Bluff >> Teleport to Thunder Bluff
step << !Mage
    #completewith next
    .hs >> Hearth to Dalaran
    .zoneskip Thunder Bluff
    .skill cooking,300,1
step << !Mage
    #completewith next
    .goto Dalaran,57.3, 22.1
    .zone Thunder Bluff >> In Dalaran, take the portal to Thunder Bluff
    .skill cooking,300,1
step
    .goto Thunder Bluff,50.9, 52.9
    .train 18260 >> Train Artisan Cooking (225-300) from Aska Mistrunner
    .skill cooking,300,1
step
    .goto Thunder Bluff,56.0, 46.8
    train 18248 >> Train Artisan Fishing (225-300) from Kah Mistrunner in Thunder Bluff
    .skill fishing,300,1
step
    .goto Thunder Bluff,46.8,50.1
    .fly Gadgetzan >> Fly to Gadgetzan, time to buy some more recipes
    .skill fishing,300,1
step
    .goto Tanaris,66.6, 22.0
    >>Purchase cooking recipes from Gikkix
    .collect 13945,1 --Recipe: Nightfin Soup
    .collect 13946,1 --Recipe: Poached Sunscale Salmon
    .skill fishing,300,1
step
    .goto Tanaris,51.5, 25.7
    .fly Camp Mojache >> Fly to Camp Mojache in Feralas
    .skill fishing,300,1
step
    .goto Feralas,74.6, 42.8
    >>Purchase cooking recipe from Sheendra Tallgrass
    .collect 13949,1 --Recipe: Baked Salmon
    .skill cooking,300,1
step
    .skill fishing,255 >> Fish in lakes around Camp Mojache until reaching skill level 255
    .loop 45,Feralas,72.9,48.8, 74.9,43.7, 78.1,43.6, 79.8,49.3, 73.1,55.0, 72.9,48.8
step
    #completewith Feralas
    + Learn to cook Filet of Redgill
    .use 13941
step
    .skill cooking,245 >> Cook your remaining Mithril Headed Trout. You should reach up to skill level 245
step
    #label Feralas
    + Learn to cook fish from feralas, Nightfin Soup and Poached Sunscale Salmon
    .use 13945
    .use 13946
    .skill cooking,290 >> Cook your Redgill before moving on to Nightfin and Sunscale Salmon. If you need Refreshing Spring Water, you can buy some from any innkeeper (Nearest one is in Camp Mojache).
step
    .skill fishing,275 >>Fish at Jademir Lake in Feralas up to skill level 275. Find a nice spot away from patroling mobs and start.
    >>This is also a nice place to start using Aquadynamic Fish Attractor if you managed to get any
    .use 6533 --Aquadynamic Fish Attractor
    .loop 45,Feralas,48.2,13.9, 48.2,4.6, 54.9,7.6, 53.4,15.9, 49.9,15.7, 48.2,13.9
step
    #completewith next
    + Learn to cook Baked Salmon
    .use 13949
step
    .skill cooking,300 >> Cook your Raw Whitescale Salmon until reaching skill level 300
step << Mage
    #completewith next
    .zone Shattrath City >> Teleport to Shattrath City
    .skill fishing,320,1
step << !Mage
    #completewith next
    .hs >> Hearth to Dalaran
    .zoneskip Shattrath City
    .skill fishing,320,1
step << !Mage
    #completewith next
    .goto Dalaran,56.4, 22.8
    .zone Shattrath City >> In Dalaran, take the portal to Shattrath City
    .skill fishing,320,1
step
    .goto Zangarmarsh,78.6, 63.0
    .zone Zangarmarsh >> Exit Shattrath to the north and head to Zangarmarsh
    .skill fishing,375,1
step
    .goto Zangarmarsh,78.6, 63.0
    .train 33359 >> Learn Master Cooking (300-375) from Naka at the Inn
    .skill cooking,375,1
step
    .goto Zangarmarsh,78.0, 66.0
    .train 33095 >> Learn Master Fishing (300-375) from Juno Dufrain, if you are out of lures you can buy more from him.
    .skill fishing,375,1
step
    .goto Zangarmarsh,85.2, 54.6
    >>Purchase the recipe from Zurai
    .collect 27695,1 --Recipe: Feltail Delight (1)
    .skill cooking,375,1
step
    .goto Zangarmarsh,31.6, 49.2
    >>Purchase the recipe from Gambarinka
    .collect 27694,1 --Recipe: Blackened Trout (1)
    .skill cooking,375,1
step
    .goto Terokkar Forest,39.6, 22.5
    .skill fishing,320 >> Fish at the small pool near Shattrath graveyard and make sure to keep using Bright Baubles as a lure.
step
    .goto Terokkar Forest,48.8, 46.0
    >>Purchase two recipes from Rungor
    .collect 27699,1 --Recipe: Golden Fish Sticks (1)
    .collect 27700,1 --Recipe: Spicy Crawdad (1)
    .skill cooking,375,1
step
    #completewith next
    + Learn how to cook Feltail Delight
    .use 27695
step
    .skill cooking,320 >> Cook all your Feltail Delight, skip this step if you dont make it to 320
step
    #completewith next
    + Learn how to cook Blackened Trout
    .use 27694
step
    skill cooking,320 >> Start cooking Blackened Trout and stop when you reach skill level 320, keep the rest of your Barbed Gill Trout
step
    #completewith next
    .goto Shattrath City,75.6, 32.6
    .train 42296 >> Learn how to cook Stewed Trout in Shattrath's Lower City Inn from barmaid Kylene, she walks around the inn
step
    .skill cooking,350 >> Cook all the remaining Trout as Stewed Trout, skip this step if you run out before reaching skill level 350
step
    #completewith next
    + Learn how to cook Golden Fish Sticks
    .use 27699
step
    .skill cooking,350 >> Cook all your Golden Darter into Golden Fish Sticks. Your cooking skill will be around 350
step << Mage
    #completewith next
    .zone Dalaran >> Teleport to Dalaran
    .skill fishing,360,1
step << !Mage
    #completewith next
    .hs >> Hearth to Dalaran
    .zoneskip Howling Fjord
    .skill fishing,360,1
step
    .goto Dalaran, flight Master
    .fly Vengeance Landing >> Fly to Vengeance Landing in Howling Fjord
step
    .goto Howling Fjord,78.6, 29.4
    >> Learn Grand Master Cooking (375-450) and how to cook new Northrend recipes from Thomas Kolichio
    .train 51296 --Grand Master Cooking
    .train 58065 --Dalaran Clam Chowder
    .train 45560 --Smoked Rockfin
    .train 45569 --Baked Manta Ray
step
    .goto Howling Fjord,79.6, 27.2
    .skill fishing,350 >> Start fishing on the pier up to skill level 350
step
    .goto Howling Fjord,79.6, 27.2
    .train 51294 >> Learn Grand Master Fishing (375-450) from Angelina Soren
step
    .goto Howling Fjord,79.6, 27.2
    .skill fishing,60 >> Continue fishing on the pier up to skill level 360
step
    .skill cooking,375 >> Cook the Rockfin Grouper into Smoked Rockfin. Your cooking skill should rise to about 375
step
    .use 36781 >> Open your Darkwater Clams
    .skill cooking,400 >> Cook your Imperial Manta Ray into Baked Manta Ray, and Succulent Clam Meat into Dalaran Clam Chowder. Your cooking skill must be at least 400 to continue
step
    .goto Howling Fjord,78.6, 29.4
    >> Return to cooking trainer and learn to cook Black Jelly
    .train 64358 --Black Jelly
step
    .skill cooking,415 >> Cook all your Borean Man O' War into Black Jelly, this should take you to around skill level 415
step
    .zone Wintergrasp >> Fly to Wintergrasp
step
    .skill fishing,450 >> Fish in Wintergrasp until you catch 60 of one type of fish, after that you can continue to fish anywhere in Northrend up to skill level of 450 and skip to next step
    .collect 41809,60
    .collect 41806,60
    .collect 41813,60
step << Mage
    #completewith next
    .zone Dalaran >> Teleport to Dalaran
step << !Mage
    #completewith next
    .hs >> Hearth to Dalaran
    .zoneskip Dalaran
step
    .goto Dalaran,70.0, 39.0 
    >>Now for the hard part, go to Awilo Lon'gomba in Horde Inn's side room and complete daily quests quests until you have at least 3 Epicurean's Award for a recipe
    >>Purchase one of the following, depending on what type of fish you have 60 of and move on to the next step.
    .collect 43024,1 --Recipe: Firecracker Salmon (1)
    .collect 43025,1 --Recipe: Spicy Blue Nettlefish (1)
    .collect 43023,1 --Recipe: Poached Northern Sculpin (1)
step
    >>Purchase 60 Northern Spices from Cooking vendor or off Auction House, after you get the required recipe
    .collect 43007,60 --Northern Spices(60)
step
    .skill cooking,450 >> Learn The recipe you bought and make it up to max skill level of 450
step
    .goto Dalaran,52.3, 65.3
    .skill fishing,450 >> You can finish of your fishing skill anywhere in Northrend but the closest spot is Dalaran's fountain.
step
    +Congratulations on reaching maximum skill level in both cooking and fishing.
]])

RXPGuides.RegisterGuide([[
#wotlk
#group +Profession leveling
#subgroup Cooking and Fishing

<< Alliance 
#name 1-450 Alliance

step << Mage
    #completewith next
    .zone Stormwind City >> Teleport to Stormwind City
    .skill fishing,75,1
step << !Mage
    #completewith next
    .hs >> Hearth to Dalaran
    .zoneskip Stormwind City
    .skill fishing,75,1
step << !Mage
    #completewith next
    .goto Dalaran,39.9, 62.6
    .zone Stormwind City >> In Dalaran, take the portal to Stormwind City
    .skill fishing,75,1
step
    .goto Elwynn Forest,44.2, 66.0
    .zone Elwynn Forest >> Exit Stormwind City and out to Elwynn Forest
step
    #label Tomas
    .goto Elwynn Forest,44.2, 66.0
    .train 2550 >> Train Apprentice Cooking (1-75) from Tomas in Goldshire Inn's kitchen
    .skill cooking,75,1
step
    .goto Elwynn Forest,41.8, 67.0
    >>Purchase all cooking recipes from Tharynn Bouden, along with fishing pole and some fishing lures
    .collect 6325,1 --Recipe: Brilliant Smallfish (1)
    .collect 6328,1 --Recipe: Longjaw Mud Snapper (1)
    .collect 6256,1 --Fishing Pole (1)
    .collect 6529,2 --Shiny Bauble (2)
    .skill cooking,50,1
step
    .goto Elwynn Forest,47.6, 62.2
    .train 7620 >> Train Apprentice Fishing (1-75) from Lee Brown
    .skill fishing,75,1
step
    .openmap Elwynn Forest
    .skill fishing,75 >> Find a nice spot, equip your fishing pole, attach your lure and start fishing until you reach skill level of 75
    .goto Elwynn Forest,47.6, 62.2
step
    >>You should have around 60 Raw Brilliant Smallfish and some Raw Longjaw Mud Snapper.
    .goto Elwynn Forest,47.6, 62.2
    .train 7731 >> Train Journeyman Fishing (75-150) from Lee Brown
    .skill fishing,150,1
step
    >>Run back to Stormwind City and continue fishing
    .goto Stormwind City,55.0, 69.6
    .skill fishing,150 >> Continue fishing to skill level 150
step
    .goto Stormwind City,55.0, 69.6
    .train 7732 >> Train Expert Fishing (150-225) from Arnold Leland
    .skill fishing,225,1    
step
    .goto Stormwind City,55.0, 69.6
    >>Purchase a recipe and Bright Baubles from Catherine Leland
    .collect 6330,1 --Bristle Whisker Catfish (1)
    .collect 6532,40 --Bright Baubles (40)
    .skill fishing,225,1
step
    #completewith next
    +Learn how to cook Brilliant Smallfish
    .use 6325
step
    >>Time to start cooking
    .goto Stormwind City,78.2, 53.0
    .skill cooking,50 >> Cook all your Brilliant Smallfish, this shoud take your skill above level 50 but you can keep cooking them up to 65 if you have extra.
step
    .goto Stormwind City,78.2, 53.0
    .train 3102 >> Train Journeyman Cooking (75-150) from Stephen Ryback in Stormwind's Old Town Inn
    .skill cooking,150,1
step
    #completewith next
    + Learn how to cook Longjaw Mud Snapper
    .use 6328
    .skill cooking,75,1
step
    .goto Stormwind City,78.2, 53.0
    .skill cooking,100 >> Cook all your raw Longjaw Mud Snapper until you reach at least 100 skill in cooking. You can stop making them at level 115 if you have extra.
step
    #completewith next
    + Learn how to cook Bristle Whisker Catfish
    .use 6330
step
    .goto Stormwind City,78.2, 53.0
    .skill cooking,125 >> Cook all your Raw Bristle Whisker Catfish. Your cooking skill should be at least 125.
step
    .goto Stormwind City,78.2, 53.0
    .train 18260 >> Train Expert Cooking (150-225) from Stephen Ryback
    .skill cooking,225,1
step
    .goto Stormwind City,70.4, 72.2
    .fly Rebel Camp >> Fly to Rebel Camp in Stranglethorn Vale
step
    >>Start Using Bright Baubles as your lure of choice
    .skill fishing,225 >> Fish around rivers of Stranglethorn Vale but avoid going near the ocean.
    .loop 45,Stranglethorn Vale,33.7,10.0, 39.5,14.3, 39.0,24.5, 40.8,24.7, 41.1,22.3, 43.0,21.1, 42.1,15.8, 37.5,8.5, 34.8,7.5, 33.7,10.0
step
    .skill cooking,175 >> Cook all your Raw Bristle Whisker Catfish. Your cooking skill should rise close to 175. If you don't reach 175 cooking skill, catch more
step
    .goto Stranglethorn Vale,38.2, 4.3
    .fly Booty Bay >> Fly to Booty Bay
    .skill cooking,225,1
step
    >> Find Kelsey Yance, He is in the large building at the end of the ship dock in Booty Bay. Enter the building and make an immediate left.
    .goto Stranglethorn Vale,28.2, 74.4
    .collect 17062,1 --Recipe: Mithril Head Trout (1)
    .collect 13941,1 --Recipe: Filet of Redgill (1)
    .skill cooking,225,1
step
    #completewith next
    + Learn how to cook Mithril Head Trout
    .use 17062
    .skill cooking,225,1
step
    .skill cooking,225 >> Start cooking Mithril Head Trout. Your cooking skill should rise to 225. Stop cooking at 225 and keep any leftover.
step << Mage
    .zone Stormwind City >> Teleport to Stormwind City
step << !Mage
    .goto Stranglethorn Vale,27.6, 77.6
    .fly Stormwind City >> Fly back to Stormwind for more training
step
    .goto Stormwind City,78.2, 53.0
    .train 18260 >> Train Artisan Cooking (225-300) from Stephen Ryback
    .skill cooking,300,1
step
    .goto Stormwind City,55.0, 69.6
    train 18248 >> Train Artisan Fishing (225-300) from Arnold Leland
    .skill fishing,300,1
step
    .goto Stormwind City,70.4, 72.2
    .fly Booty Bay >> Fly back to Booty Bay
    .skill fishing,300,1
step
    .goto Stranglethorn Vale,26.1, 73.2
    .zone The Barrens >> Take a boat to Ratchet in The Barrens
step
    .goto The Barrens,63.0, 37.2
    .fly Gadgetzan >> Fly down to Gadgetzan, time to get some more recipes
step
    .goto Tanaris,51.0, 29.2
    >>Purchase cooking recipes from Gikkix
    .collect 13945,1 --Recipe: Nightfin Soup
    .collect 13946,1 --Recipe: Poached Sunscale Salmon
    .skill fishing,300,1
step
    .goto Tanaris,51.5, 25.7
    .fly Feathermoon Stronghold >> Fly to Feathermoon Stronghold in Feralas
    .skill fishing,300,1
step
    .goto Feralas,31.2, 43.4
    >>Purchase cooking recipe from Vivianna
    .collect 13949,1 --Recipe: Baked Salmon
    .skill cooking,300,1
step
    .skill fishing,255 >> Fish in lakes around Feralas until reaching skill level 255
    .loop 45,Feralas,61.2,48.6, 61.7,52.8, 63.8,54.3, 64.4,51.1, 62.7,48.3, 61.2,48.6
step
    #completewith next
    + Learn to cook Filet of Redgill
    .use 13941
step
    #completewith next
    .skill cooking,245 >> Cook your remaining Mithril Headed Trout. You should reach up to skill level 245
step
    #label Feralas
    + Learn to cook fish from feralas, Nightfin Soup and Poached Sunscale Salmon
    .use 13945
    .use 13946
    .skill cooking,290 >> Cook your Redgill before moving on to Nightfin and Sunscale Salmon. If you need Refreshing Spring Water, you can buy some from any innkeeper (Nearest one is in Feathermoon Stronghold).
step
    .skill fishing,275 >>Fish at Jademir Lake in Feralas up to skill level 275. Find a nice spot away from patroling mobs and start.
    >>This is also a nice place to start using Aquadynamic Fish Attractor if you managed to get any
    .use 6533 --Aquadynamic Fish Attractor
    .loop 45,Feralas,48.2,13.9, 48.2,4.6, 54.9,7.6, 53.4,15.9, 49.9,15.7, 48.2,13.9
step
    #completewith next
    + Learn to cook Baked Salmon
    .use 13949
step
    .skill cooking,300 >> Cook your Raw Whitescale Salmon until reaching skill level 300
step << Mage
    .zone Shattrath City >> Teleport to Shattrath City
    .skill fishing,320,1
step << !Mage
    #completewith next
    .hs >> Hearth to Dalaran
    .zoneskip Shattrath City
    .skill fishing,320,1
step << !Mage
    .goto Dalaran,56.4, 22.8
    .zone Shattrath City >> In Dalaran, take the portal to Shattrath City
    .skill fishing,320,1
step
    .goto Zangarmarsh,78.6, 63.0
    .zone Zangarmarsh >> Exit Shattrath to the north and head to Zangarmarsh
    .skill fishing,375,1
step
    .goto Zangarmarsh,78.6, 63.0
    .train 33359 >> Learn Master Cooking (300-375) from Naka at the Inn
    .skill cooking,375,1
step
    .goto Zangarmarsh,78.0, 66.0
    .train 33095 >> Learn Master Fishing (300-375) from Juno Dufrain, if you are out of lures you can buy more from him.
    .skill fishing,375,1

step
    #label Kurenai
    .reputation 978,neutral >> If you haven't done any quests for Kurenai Faction you will need to complete few additional quests
    .goto Zangarmarsh,41.8, 27.2
    .accept 9835 >> Accept Ango'rosh Encroachment
    .accept 10115 >> Accept Daggerfen Deviance
    .accept 10116 >> Accept Wanted: Chieftain Mummaki from the wanted poster
    >> Completing these three quests will give you enough reputation to reach Neutral standing and procede to the next step
step
    .goto Zangarmarsh,42.2, 27.8
    >>Purchase the recipes from Doba 
    .collect 27695,1 --Recipe: Feltail Delight (1)
    .collect 27694,1 --Recipe: Blackened Trout (1)
    .skill cooking,375,1
step
    .goto Terokkar Forest,39.6, 22.5
    .skill fishing,320 >> Fish at the small pool near Shattrath graveyard and make sure to keep using Bright Baubles as a lure
step
    .goto Terokkar Forest,56.6, 53.2
    >>Purchase two recipes from Innkeeper Biribi
    .collect 27699,1 --Recipe: Golden Fish Sticks (1)
    .collect 27700,1 --Recipe: Spicy Crawdad (1)
    .skill cooking,375,1
step
    #completewith next
    + Learn how to cook Feltail Delight
    .use 27695
step
    .skill cooking,320 >> Cook all your Feltail Delight, skip this step if you dont make it to 320
step
    #completewith next
    + Learn how to cook Blackened Trout
    .use 27694
step
    skill cooking,320 >> Start cooking Blackened Trout and stop when you reach skill level 320, keep the rest of your Barbed Gill Trout
step
    #completewith next
    .goto Shattrath City,75.6, 32.6
    .train 42296 >> Learn how to cook Stewed Trout in Shattrath's Lower City Inn from barmaid Kylene, she walks around the inn
step
    .skill cooking,350 >> Cook all the remaining Trout as Stewed Trout, skip this step if you run out before reaching skill level 350
step
    #completewith next
    +Learn how to cook Golden Fish Sticks
    .use 27699
step
    .skill cooking,350 >> Cook all your Golden Darter into Golden Fish Sticks. Your cooking skill will be around 350
step << Mage
    .zone Dalaran >> Teleport to Dalaran
    .skill fishing,360,1
step << !Mage
    #completewith next
    .hs >> Hearth to Dalaran
    .zoneskip Borean Tundra
    .skill fishing,360,1
step
    .goto Dalaran,72.1, 45.8
    .fly Valiance Keep >> Fly to Valiance Keep in Borean Tundra
step
    .goto Borean Tundra,57.8, 71.6
    >> Learn Grand Master Cooking (375-450) and how to cook new Northrend recipes from Rollick MacKreel
    .train 51296 >> Grand Master Cooking
    .train 58065 >> Dalaran Clam Chowder
    .train 45560 >> Smoked Rockfin
    .train 45569 >> Baked Manta Ray
step
    .goto Borean Tundra,57.2, 65.2
    .skill fishing,350 >> Start fishing around Valiance keep. If you start fishing up Bonescale Snapper, you are in a wrong place
step
    .goto Borean Tundra,57.8, 71.6
    .train 51294 >> Learn Grand Master Fishing (375-450) from Old Man Robert
step
    .goto Borean Tundra,57.2, 65.2
    .skill fishing,60 >> Continue fishing on the pier up to skill level 360
step
    .skill cooking,375 >> Cook the Rockfin Grouper into Smoked Rockfin. Your cooking skill should rise to about 375
step
    +Open your Darkwater Clams
    .use 36781
    .skill cooking,400 >> Cook your Imperial Manta Ray into Baked Manta Ray, and Succulent Clam Meat into Dalaran Clam Chowder. Your cooking skill must be at least 400 to continue
step
    .goto Borean Tundra,57.8, 71.6
    >> Return to cooking trainer and learn to cook Black Jelly
    .train 64358 >> Black Jelly
step
    .skill cooking,415 >> Cook all your Borean Man O' War into Black Jelly, this should take you to around skill level 415
step
    .zone Wintergrasp >> Fly to Wintergrasp
step
    .skill fishing,450 >> Fish in Wintergrasp until you catch 60 of one type of fish, after that you can continue to fish anywhere in Northrend up to skill level of 450 and skip to next step
    .collect 41809,60
    .collect 41806,60
    .collect 41813,60
step << Mage
    .zone Dalaran >> Teleport to Dalaran
step << !Mage
    .hs >> Hearth to Dalaran
step
    .goto Dalaran,70.0, 39.0 
    >>Now for the hard part, go to Kathrine Lee in Alliance Inn's kitchen and complete daily quests quests until you have at least 3 Epicurean's Award for a recipe
    >>Purchase one of the following, depending on what type of fish you have 60 of and move on to the next step.
    .collect 43024,1 --Recipe: Firecracker Salmon (1)
    .collect 43025,1 --Recipe: Spicy Blue Nettlefish (1)
    .collect 43023,1 --Recipe: Poached Northern Sculpin (1)
step
    >>Purchase 60 Northern Spices from Cooking vendor or off Auction House, after you get the required recipe
    .collect 43007,60 --Northern Spices(60)
step
    .skill cooking,450 >> Learn The recipe you bought and make it up to max skill level of 450
step
    .goto Dalaran,52.3, 65.3
    .skill fishing,450 >> You can finish of your fishing skill anywhere in Northrend but the closest spot is Dalaran's fountain.
step
    +Congratulations on reaching maximum skill level in both cooking and fishing.
]])
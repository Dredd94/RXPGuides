local addonName, addon = ...

addon.skipPreReq = {
    [9573] = 1,
    [533] = 1,
    [5096] = 1,
    [5092] = 1,
    [1114] = 1,
    [10000] = 1,
    [10008] = 1
}

addon.questConversion = {
    [9684] = 63866 -- blood elf rez quest
}

addon.repStandingID = {
    ["hated"] = 1,
    ["hostile"] = 2,
    ["unfriendly"] = 3,
    ["neutral"] = 4,
    ["friendly"] = 5,
    ["honored"] = 6,
    ["revered"] = 7,
    ["exalted"] = 8
}

addon.repStartValue = {
    -42000, -- hated
    -6000, -- hostile
    -3000, -- unfriendly
    0, -- neutral
    3000, -- friendly
    9000, -- honored
    21000, -- revered
    42000 -- exalted
}



local gameVersion = select(4, GetBuildInfo())
if gameVersion < 30000 then
    addon.mapId = {
        ["Durotar"] = 1411,
        ["Mulgore"] = 1412,
        ["The Barrens"] = 1413,
        ["Alterac Mountains"] = 1416,
        ["Arathi Highlands"] = 1417,
        ["Badlands"] = 1418,
        ["Blasted Lands"] = 1419,
        ["Tirisfal Glades"] = 1420,
        ["Silverpine Forest"] = 1421,
        ["Western Plaguelands"] = 1422,
        ["Eastern Plaguelands"] = 1423,
        ["Hillsbrad Foothills"] = 1424,
        ["The Hinterlands"] = 1425,
        ["Dun Morogh"] = 1426,
        ["Searing Gorge"] = 1427,
        ["Burning Steppes"] = 1428,
        ["Elwynn Forest"] = 1429,
        ["Deadwind Pass"] = 1430,
        ["Duskwood"] = 1431,
        ["Loch Modan"] = 1432,
        ["Redridge Mountains"] = 1433,
        ["Stranglethorn Vale"] = 1434,
        ["Swamp of Sorrows"] = 1435,
        ["Westfall"] = 1436,
        ["Wetlands"] = 1437,
        ["Teldrassil"] = 1438,
        ["Darkshore"] = 1439,
        ["Ashenvale"] = 1440,
        ["Thousand Needles"] = 1441,
        ["Stonetalon Mountains"] = 1442,
        ["Desolace"] = 1443,
        ["Feralas"] = 1444,
        ["Dustwallow Marsh"] = 1445,
        ["Tanaris"] = 1446,
        ["Azshara"] = 1447,
        ["Felwood"] = 1448,
        ["Un'Goro Crater"] = 1449,
        ["Moonglade"] = 1450,
        ["Silithus"] = 1451,
        ["Winterspring"] = 1452,
        ["Stormwind City"] = 1453,
        ["Orgrimmar"] = 1454,
        ["Ironforge"] = 1455,
        ["Thunder Bluff"] = 1456,
        ["Darnassus"] = 1457,
        ["Undercity"] = 1458,
        ["Alterac Valley"] = 1459,
        ["Eversong Woods"] = 1941,
        ["Ghostlands"] = 1942,
        ["Azuremyst Isle"] = 1943,
        ["Hellfire Peninsula"] = 1944,
        ["Zangarmarsh"] = 1946,
        ["The Exodar"] = 1947,
        ["Shadowmoon Valley"] = 1948,
        ["Blade's Edge Mountains"] = 1949,
        ["Bloodmyst Isle"] = 1950,
        ["Nagrand"] = 1951,
        ["Terokkar Forest"] = 1952,
        ["Netherstorm"] = 1953,
        ["Silvermoon City"] = 1954,
        ["Shattrath City"] = 1955,
        ["Isle of Quel'Danas"] = 1957,
        ["Kalimdor"] = 1414,
        ["Eastern Kingdoms"] = 1415,
        ["Outland"] = 987
    }
else
    addon.mapId = {["ScarletEnclave"] = 124}
    for i = 1, 2200 do
        local map = C_Map.GetMapInfo(i)
        if map then
            map = map.name
            if not addon.mapId[map] then addon.mapId[map] = i end
        end
    end
    addon.mapId["IcecrownGlacier"] = addon.mapId["Icecrown"]
    addon.mapId["CrystalsongForest"] = addon.mapId["Crystalsong Forest"]
    addon.mapId["StormPeaks"] = addon.mapId["The Storm Peaks"]
    addon.mapId["TheStormPeaks"] = addon.mapId["The Storm Peaks"]
    addon.mapId["SholazarBasin"] = addon.mapId["Sholazar Basin"]
    addon.mapId["ZulDrak"] = addon.mapId["Zul'Drak"]
    addon.mapId["GrizzlyHills"] = addon.mapId["Grizzly Hills"]
    addon.mapId["HowlingFjord"] = addon.mapId["Howling Fjord"]
    addon.mapId["BoreanTundra"] = addon.mapId["Borean Tundra"]
end

addon.professionID = {
    alchemy = {2259, 3101, 3464, 11611, 28596, 51304},
    blacksmithing = {2018, 3100, 3538, 9785, 29844, 51300},
    enchanting = {13920, 7411, 7412, 7413, 28029, 51313},
    engineering = {4036, 4037, 4038, 12656, 30350, 51306},
    herbalism = {2383},
    inscription = {45357, 45358, 45359, 45360, 45361, 45363},
    jewelcrafting = {25229, 25230, 28894, 28895, 28897, 51311},
    leatherworking = {2108, 3104, 3811, 10662, 32549, 51302},
    mining = {2656},
    skinning = {8613, 8617, 8618, 10768, 32678, 50305},
    tailoring = {3908, 3909, 3910, 12180, 26790, 51309},
    cooking = {2550, 3102, 3413, 18260, 33359, 51296},
    firstaid = {3273, 3274, 7924, 10846, 27028, 45542},
    fishing = {7620, 7731, 7732, 18248, 33095, 51294}
}

C_Spell.RequestLoadSpellData(2575) -- mining
C_Spell.RequestLoadSpellData(9134) -- herbalism
C_Spell.RequestLoadSpellData(33388) -- riding




local function IsPreReqComplete(quest)
    local t = type(quest.previousQuest)
    if t == "table" then
        local state = not quest.preQuestAny
        for _, id in ipairs(quest.previousQuest) do
            if quest.preQuestAny then
                state = state or addon.IsQuestTurnedIn(id)
            else
                state = state and addon.IsQuestTurnedIn(id)
            end
        end
        return state
    elseif t == "number" then
        local preReqComplete
        if quest.uniqueWith then
            local prevQuest = addon.QuestDB[quest.previousQuest]
            if prevQuest and prevQuest.uniqueWith then
                for _,uniqueId in pairs(prevQuest.uniqueWith) do
                    preReqComplete = preReqComplete or addon.IsQuestTurnedIn(uniqueId)
                end
            end
        end
        return preReqComplete or addon.IsQuestTurnedIn(quest.previousQuest)
    else
        return true
    end
end

local function IsQuestAvailable(quest,id,skipRepCheck)
    if not quest then return end
    id = id or quest.Id

    local function ProcessRep(rep,faction)
        local _, _, standing = GetFactionInfoByID(faction)
        local current = addon.repStandingID[strlower(rep)]
        if skipRepCheck then
            if (skipRepCheck == 932 and faction == 934) or
                (skipRepCheck == 934 and faction == 932) then
                return false
            end
        elseif not (current and standing) or standing < current then
            return false
        end
        return true
    end

    local repCheck = true
    if type(quest.repfaction) == "number" then
        repCheck = ProcessRep(quest.reputation,quest.repfaction)
    elseif type(quest.reputation) == "table" then
        for i,rep in pairs(quest.reputation) do
            repCheck = repCheck and ProcessRep(rep,quest.repfaction[i])
        end
    end

    if quest.uniqueWith then
        for _,uniqueId in pairs(quest.uniqueWith) do
            if addon.IsQuestTurnedIn(uniqueId) then
                return false
            end
        end
    end

    if addon.IsQuestTurnedIn(id) or not repCheck then
        return false
    end

    local activeFor = quest.appliesTo
    if activeFor then
        activeFor = addon.applies(activeFor) or
                        addon.GetSkillLevel(activeFor) > 0
    else
        activeFor = true
    end
    return activeFor
end


local questQueryTimer = 0
function addon.GetBestQuests(refreshQuestDB,output)
    output = output or 0
    if not addon.questLogQuests or refreshQuestDB then
        addon.questLogQuests = {}
        for id, v in pairs(addon.QuestDB) do
            v.Id = id

            if IsQuestAvailable(v,id) and not v.itemId and
                v.questLog and (not v.forcePreReq or IsPreReqComplete(v)) then
                table.insert(addon.questLogQuests, v)
                v.isActive = true
            elseif v.questLog then
                v.isActive = false
            end
        end
    end
    local qDB = addon.questLogQuests
    if GetTime() - questQueryTimer > 1 then
        questQueryTimer = GetTime()
        table.sort(qDB, function(k1, k2)
            local x1 = k1.xp or 0
            local x2 = k2.xp or 0
            local q1 = addon.IsQuestTurnedIn(k1.Id)
            local q2 = addon.IsQuestTurnedIn(k2.Id)
            local prev1 = k1.previousQuest and not IsPreReqComplete(k1)
            local prev2 = k2.previousQuest and not IsPreReqComplete(k2)
            local prio1 = k1.priority or 1e3
            local prio2 = k2.priority or 1e3
            if q1 and not q2 then
                return false
            elseif q2 and not q1 then
                return true
            elseif x1 ~= x2 then
                return x1 > x2
            elseif prev1 and not prev2 then
                return false
            elseif prev2 and not prev1 then
                return true
            elseif prio1 < prio2 then
                return true
            elseif prio2 < prio1 then
                return false
            else
                return k1.Id < k2.Id
            end
        end)

        for i = #qDB, 1, -1 do
            local xp = qDB[i].xp or 0
            local id = qDB[i].Id
            if i > 25 and xp < (qDB[25].xp or 1) or addon.IsQuestTurnedIn(id) then
                addon.QuestDB[id].isActive = false
                table.remove(qDB, i)
            end
        end
    end
    --TODO: Sort low priority quests at the bottom of the list

    if output ~= 0 then
        local outputString = ""
        local requestFromServer = true
        for k, v in ipairs(qDB) do
            local id = v.Id
            local qname = addon.GetQuestName(id)
            requestFromServer = qname and requestFromServer
            local xp = v.xp or 0
            outputString = string.format("%s\n%d: %dxp %s (%d)",outputString, k, xp,
                                             qname or "", id)
        end
        outputString = outputString:gsub("^\n","")
        if bit.band(output,0x1) == 0x1 then
            print(outputString)
        end
        return outputString,not requestFromServer
    end
end


local CreatePanel
local requestText = true
local questText = ""
local requestTimer = 0
local SetText = function()
    local ctime = GetTime()
    if requestText and ctime - requestTimer > 0.2 then
        requestTimer = ctime
        questText,requestText = addon.GetBestQuests(false,2)
    end
    return questText
end

local function OnClick(self)
    if not addon.settings.gui.quest then
        CreatePanel()
    end
    _G.InterfaceOptionsFrame_OpenToCategory(addon.settings.gui.quest)
    _G.InterfaceOptionsFrame_OpenToCategory(addon.settings.gui.quest)
end

function addon.functions.show25quests(self,text,flags)
    if type(self) == "string" then
        return { text = text, event = "OnUpdate", hideTooltip = true, tooltip = "Click to view the 25 best quests", icon = addon.icons.link, textOnly = true}
    end
    if self and self.highlight and not self.highlight:IsShown() then
        self.highlight:Show()
        self:SetScript("OnMouseDown", OnClick)
    end
    SetText()

end


function CreatePanel()

    local questDataTable = {
        type = "group",
        name = "RestedXP Quest Data",
        args = {
            importBox = {
                order = 10,
                type = 'input',
                name = 'List of 25 best quests',
                width = "full",
                multiline = 31,
                confirmText = "Refresh",
                -- usage = "Usage string",
                get = SetText,
                set = SetText,
                --validate = function() return true,SetText() end,
            },
            refresh = {
                order = 13,
                name = "Refresh",
                type = 'execute',
                func = function() _G.InterfaceOptionsFrame_OpenToCategory(RXP.settings.gui.quest) end,
            }
        }

    }

    LibStub("AceConfig-3.0"):RegisterOptionsTable("RXP Guides/Quest Data", questDataTable)

    addon.settings.gui.quest = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(
                                    "RXP Guides/Quest Data", "Quest Data", "RXP Guides")

end


function addon.IsGuideQuestActive(id)
    if not addon.QuestDB[id] then
        return false
    elseif not addon.questLogQuests or addon.IsQuestTurnedIn(id) and addon.QuestDB[id].isActive then
        addon.GetBestQuests(true)
    end
    return not addon.IsQuestTurnedIn(id) and addon.QuestDB[id].isActive
end

function addon.functions.requires(self,text,mode,...)
    if type(self) == "string" then
        local args = {...}
        local element = {textOnly = true,text = text, args = args, mode = mode, requestFromServer = true}
        if mode == "quest" then
            element.event = "QUEST_LOG_UPDATE"
        end
        return element
    end

    local element = self.element
    local args = element.args
    local step = element.step
    if element.mode == "quest" then
        local id = tonumber(args[1])
        if id and not addon.IsGuideQuestActive(id) then
            if not (step.hidewindow and step.completed) then
                step.completed = true
                step.hidewindow = true
                addon.updateSteps = true
            end
        elseif step.hidewindow then
            step.hidewindow = false
            addon.updateSteps = true
        end
    end
    element.requestFromServer = false
end

function addon.functions.showtotalxp(self,text,flags)
    if type(self) == "string" then
        return {textOnly = true,rawtext = text or "", text = text, flags = tonumber(flags) or 0, event = "QUEST_LOG_UPDATE"}
    end

    local element = self.element

    local xp = addon.CalculateTotalXP(element.flags)
    text = format("%s %s",element.rawtext,addon.FormatNumber(xp))
    if text ~= element.text then
        element.text = text
        addon.UpdateStepText(element)
    end

end

function addon.CalculateTotalXP(flags)
    local totalXp = 0
    flags = flags or 0
    local output = bit.band(flags,0x2) == 0x2
    local ignorePreReqs
    if bit.band(flags,0x1) == 0x1 then
        local aldor = addon.AldorScryerCheck("Aldor") and 932
        local scryer = addon.AldorScryerCheck("Scryer") and 934
        ignorePreReqs = aldor or scryer or 932
    end

    local function ProcessQuest(quest,qid)
        qid = qid or quest.Id
        if IsQuestAvailable(quest,qid,ignorePreReqs) and (ignorePreReqs or (IsPreReqComplete(quest))) then
            local xp = quest.xp or 0
            totalXp = totalXp + xp
            if output then
                    print(string.format("%dxp %s (%d)", xp,
                                    addon.GetQuestName(qid) or "", qid))
            end
        end
    end
    if not addon.questLogQuests then addon.GetBestQuests(true) end
    for i = 1, 25 do
        local quest = addon.questLogQuests[i]
        if quest and (ignorePreReqs or addon.IsQuestComplete(quest.Id)) then
            ProcessQuest(quest)
        end
    end

    for id, quest in pairs(addon.QuestDB) do
        if not (quest.questLog or addon.IsQuestTurnedIn(id)) then
            local item = quest.itemId
            if ignorePreReqs and item then
                ProcessQuest(quest,id)
            elseif type(item) == "table" then
                local state = true
                for n, itemId in pairs(item) do
                    state = state and GetItemCount(itemId, true) >=
                                quest.itemAmount[n]
                end
                if state then ProcessQuest(quest,id) end
            elseif type(item) == "number" and GetItemCount(item, true) >=
                quest.itemAmount then
                ProcessQuest(quest,id)
            elseif not item then
                ProcessQuest(quest,id)
            end
        end
    end

    return totalXp
end

addon.QuestDB = {
    [11505] = {
        ["questLog"] = true,
        ["xp"] = 10050,
        ["appliesTo"] = "Alliance",
    },
    [9977] = {
        ["priority"] = 2,
        ["questLog"] = true,
        ["xp"] = 17450,
        ["previousQuest"] = 9973,
    },
    [9724] = {
        ["xp"] = 10560,
        ["previousQuest"] = 9731,
    },
    [11003] = {
        ["itemId"] = 32386,
        ["itemAmount"] = 1,
        ["xp"] = 19000,
        ["appliesTo"] = "Horde",
    },
    [11515] = {
        ["priority"] = 11,
        ["questLog"] = true,
        ["xp"] = 12650,
        ["previousQuest"] = 11526,
    },
    [11007] = {
        ["itemAmount"] = 1,
        ["xp"] = 19000,
        ["itemId"] = 32405,
    },
    [10754] = {
        ["itemId"] = {
            31239, -- [1]
            23445, -- [2]
            22445, -- [3]
            22574, -- [4]
        },
        ["itemAmount"] = {
            1, -- [1]
            4, -- [2]
            2, -- [3]
            4, -- [4]
        },
        ["xp"] = 28450,
        ["appliesTo"] = "Alliance",
    },
    [11521] = {
        ["questLog"] = true,
        ["xp"] = 15800,
        ["priority"] = 1,
    },
    [9738] = {
        ["xp"] = 22000,
        ["questLog"] = true,
    },
    [11015] = {
        ["itemAmount"] = 30,
        ["xp"] = 12650,
        ["itemId"] = 32427,
    },
    [11017] = {
        ["appliesTo"] = "herbalism",
        ["itemAmount"] = 40,
        ["xp"] = 12650,
        ["itemId"] = 32468,
    },
    [10509] = {
        ["xp"] = 9500,
        ["previousQuest"] = 10508,
    },
    [11531] = {
        ["itemId"] = 34474,
        ["itemAmount"] = 1,
        ["xp"] = 12650,
        ["appliesTo"] = "Alliance",
    },
    [9493] = {
        ["questLog"] = true,
        ["xp"] = 25300,
        ["appliesTo"] = "Alliance",
    },
    [9495] = {
        ["questLog"] = true,
        ["xp"] = 25300,
        ["appliesTo"] = "Horde",
    },
    [10772] = {
        ["itemId"] = 31310,
        ["itemAmount"] = 1,
        ["xp"] = 9500,
        ["appliesTo"] = "Alliance",
    },
    [11539] = {
        ["questLog"] = true,
        ["xp"] = 12650,
        ["priority"] = 9,
    },
    [11541] = {
        ["questLog"] = true,
        ["xp"] = 12650,
        ["priority"] = 6,
    },
    [10013] = {
        ["itemId"] = 25765,
        ["itemAmount"] = 1,
        ["xp"] = 8600,
        ["appliesTo"] = "Horde",
    },
    [11035] = {
        ["questLog"] = true,
        ["xp"] = 12650,
        ["priority"] = 3,
    },
    [11547] = {
        ["questLog"] = true,
        ["xp"] = 12650,
        ["priority"] = 7,
    },
    [9764] = {
        ["itemAmount"] = {
            1, -- [1]
            1, -- [2]
        },
        ["xp"] = 37950,
        ["itemId"] = {
            24367, -- [1]
            24368, -- [2]
        },
    },
    [10280] = {
        ["xp"] = 19000,
        ["previousQuest"] = 10276,
    },
    [11049] = {
        ["itemAmount"] = 1,
        ["xp"] = 15800,
        ["itemId"] = 32506,
    },
    [10541] = {
        ["xp"] = 6250,
        ["previousQuest"] = 10540,
    },
    [11053] = {
        ["repfaction"] = 1015,
        ["xp"] = 12650,
        ["reputation"] = "friendly",
    },
    [11055] = {
        ["xp"] = 6250,
    },
    [10039] = {
        ["xp"] = 2120,
        ["appliesTo"] = "Horde",
    },
    [10806] = {
        ["previousQuest"] = 10805,
        ["priority"] = 4,
        ["questLog"] = true,
        ["xp"] = 19000,
        ["appliesTo"] = "Alliance",
    },
    [10810] = {
        ["itemAmount"] = 1,
        ["xp"] = 18100,
        ["itemId"] = 31384,
    },
    [9794] = {
        ["itemId"] = 26048,
        ["itemAmount"] = 1,
        ["xp"] = 2700,
        ["appliesTo"] = "Alliance",
    },
    [10306] = {
        ["itemAmount"] = 1,
        ["xp"] = 12300,
        ["itemId"] = 29235,
    },
    [9802] = {
        ["itemAmount"] = 10,
        ["xp"] = 6240,
        ["itemId"] = 24401,
    },
    [9806] = {
        ["itemAmount"] = 6,
        ["xp"] = 8600,
        ["itemId"] = 24449,
    },
    [9808] = {
        ["itemAmount"] = 10,
        ["xp"] = 8600,
        ["itemId"] = 24245,
    },
    [10579] = {
        ["xp"] = 6250,
        ["previousQuest"] = 10578,
    },
    [9563] = {
        ["repfaction"] = 946,
        ["itemId"] = 23848,
        ["reputation"] = "friendly",
        ["itemAmount"] = 1,
        ["xp"] = 4020,
        ["appliesTo"] = "Alliance",
    },
    [11099] = {
        ["repfaction"] = 1015,
        ["xp"] = 12650,
        ["reputation"] = "revered",
    },
    [9828] = {
        ["itemId"] = 24484,
        ["itemAmount"] = 1,
        ["xp"] = 4020,
        ["appliesTo"] = "Horde",
    },
    [10091] = {
        ["questLog"] = true,
        ["xp"] = 25300,
        ["previousQuest"] = 10178,
    },
    [10093] = {
        ["appliesTo"] = "Alliance",
        ["xp"] = 1560,
        ["previousQuest"] = 10047,
    },
    [10095] = {
        ["questLog"] = true,
        ["xp"] = 25300,
        ["previousQuest"] = 10094,
    },
    [10097] = {
        ["xp"] = 24600,
        ["questLog"] = true,
    },
    [11380] = {
        ["daily"] = true,
        ["priority"] = 12,
        ["questLog"] = true,
        ["xp"] = 12650,
        ["appliesTo"] = "cooking",
    },
    [11384] = {
        ["priority"] = 1,
        ["questLog"] = true,
        ["xp"] = 19000,
        ["daily"] = true,
    },
    [10880] = {
        ["itemAmount"] = 1,
        ["xp"] = 4320,
        ["itemId"] = 31707,
    },
    [9866] = {
        ["appliesTo"] = "Horde",
        ["xp"] = 5800,
        ["previousQuest"] = 9865,
    },
    [10633] = {
        ["appliesTo"] = "Horde",
        ["xp"] = 6250,
        ["previousQuest"] = 10625,
    },
    [9870] = {
        ["xp"] = 2850,
        ["appliesTo"] = "Horde",
    },
    [9872] = {
        ["repfaction"] = 941,
        ["itemId"] = 24558,
        ["reputation"] = "neutral",
        ["itemAmount"] = 1,
        ["xp"] = 11650,
        ["appliesTo"] = "Horde",
    },
    [9882] = {
        ["repfaction"] = 933,
        ["reputation"] = "neutral",
        ["itemAmount"] = 10,
        ["xp"] = 11300,
        ["itemId"] = 25416,
    },
    [10649] = {
        ["questLog"] = true,
        ["xp"] = 25300,
        ["previousQuest"] = 10646,
    },
    [10653] = {
        ["repfaction"] = 932,
        ["reputation"] = "neutral",
        ["itemAmount"] = 10,
        ["xp"] = 12650,
        ["itemId"] = 30809,
    },
    [10408] = {
        ["priority"] = 3,
        ["questLog"] = true,
        ["xp"] = 19000,
        ["previousQuest"] = 10406,
    },
    [10410] = {
        ["xp"] = 9500,
        ["previousQuest"] = 10407,
    },
    [10667] = {
        ["questLog"] = true,
        ["xp"] = 33825,
        ["previousQuest"] = {
            10665, -- [1]
            10666, -- [2]
        },
    },
    [10416] = {
        ["repfaction"] = 934,
        ["reputation"] = "neutral",
        ["itemAmount"] = 1,
        ["xp"] = 15800,
        ["itemId"] = 29739,
    },
    [10165] = {
        ["xp"] = 22600,
        ["questLog"] = true,
    },
    [9914] = {
        ["repfaction"] = 933,
        ["reputation"] = "neutral",
        ["itemAmount"] = 27,
        ["xp"] = 11300,
        ["itemId"] = 25463,
    },
    [10434] = {
        ["xp"] = 1250,
        ["previousQuest"] = 10433,
    },
    [9418] = {
        ["itemAmount"] = 1,
        ["xp"] = 6240,
        ["itemId"] = 23580,
    },
    [9934] = {
        ["appliesTo"] = "Horde",
        ["xp"] = 14150,
        ["previousQuest"] = {
            9931, -- [1]
            9932, -- [2]
        },
    },
    [9938] = {
        ["priority"] = 1,
        ["questLog"] = true,
        ["xp"] = 17450,
        ["appliesTo"] = "Alliance",
    },
    [10707] = {
        ["priority"] = 6,
        ["questLog"] = true,
        ["xp"] = 19000,
        ["previousQuest"] = 10706,
    },
    [9944] = {
        ["xp"] = 1150,
        ["appliesTo"] = "Horde",
    },
    [10201] = {
        ["appliesTo"] = "Horde",
        ["xp"] = 8250,
        ["previousQuest"] = 9993,
    },
    [9697] = {
        ["repfaction"] = 942,
        ["xp"] = 9390,
        ["reputation"] = "friendly",
    },
    [10466] = {
        ["repfaction"] = 990,
        ["previousQuest"] = 10462,
        ["reputation"] = "honored",
        ["xp"] = 15800,
        ["uniqueWith"] = {
            10465, -- [1]
            10467, -- [2]
            10464, -- [3]
        },
    },
    [10470] = {
        ["repfaction"] = 990,
        ["previousQuest"] = 10466,
        ["reputation"] = "revered",
        ["xp"] = 15800,
        ["uniqueWith"] = {
            10469, -- [1]
            10471, -- [2]
            10468, -- [3]
        },
    },
    [11492] = {
        ["questLog"] = true,
        ["xp"] = 25300,
        ["previousQuest"] = 11490,
    },
    [10474] = {
        ["repfaction"] = 990,
        ["previousQuest"] = 10470,
        ["reputation"] = "exalted",
        ["xp"] = 15800,
        ["uniqueWith"] = {
            10473, -- [1]
            10475, -- [2]
            10472, -- [3]
        },
    },
    [10476] = {
        ["itemId"] = 25433,
        ["itemAmount"] = 10,
        ["xp"] = 11650,
        ["appliesTo"] = "Alliance",
    },
    [9715] = {
        ["itemAmount"] = 5,
        ["xp"] = 22000,
        ["itemId"] = 24246,
    },
    [11502] = {
        ["priority"] = 13,
        ["questLog"] = true,
        ["xp"] = 12650,
        ["appliesTo"] = "Alliance",
    },
    [11506] = {
        ["questLog"] = true,
        ["xp"] = 10050,
        ["appliesTo"] = "Horde",
    },
    [11000] = {
        ["questLog"] = true,
        ["xp"] = 25300,
        ["previousQuest"] = 10998,
    },
    [11002] = {
        ["itemId"] = 32385,
        ["itemAmount"] = 1,
        ["xp"] = 19000,
        ["appliesTo"] = "Alliance",
    },
    [11004] = {
        ["itemAmount"] = 6,
        ["xp"] = 12650,
        ["itemId"] = 32388,
    },
    [11516] = {
        ["priority"] = 5,
        ["questLog"] = true,
        ["xp"] = 9500,
        ["previousQuest"] = 11526,
    },
    [11008] = {
        ["priority"] = 10,
        ["questLog"] = true,
        ["xp"] = 12650,
        ["previousQuest"] = 11098,
    },
    [10755] = {
        ["itemId"] = {
            31241, -- [1]
            23445, -- [2]
            22445, -- [3]
            22574, -- [4]
        },
        ["itemAmount"] = {
            1, -- [1]
            4, -- [2]
            2, -- [3]
            4, -- [4]
        },
        ["xp"] = 28450,
        ["appliesTo"] = "Horde",
    },
    [9373] = {
        ["itemAmount"] = 1,
        ["xp"] = 1960,
        ["itemId"] = 23338,
    },
    [9739] = {
        ["itemAmount"] = 10,
        ["xp"] = 6240,
        ["itemId"] = 24290,
    },
    [11016] = {
        ["appliesTo"] = "skinning",
        ["itemAmount"] = 35,
        ["xp"] = 12650,
        ["itemId"] = 32470,
    },
    [11018] = {
        ["appliesTo"] = "mining",
        ["itemAmount"] = 40,
        ["xp"] = 12650,
        ["itemId"] = 32464,
    },
    [11020] = {
        ["questLog"] = true,
        ["xp"] = 12650,
        ["priority"] = 2,
    },
    [9492] = {
        ["questLog"] = true,
        ["xp"] = 25300,
        ["appliesTo"] = "Alliance",
    },
    [9494] = {
        ["questLog"] = true,
        ["xp"] = 25300,
        ["appliesTo"] = "Alliance",
    },
    [9496] = {
        ["questLog"] = true,
        ["xp"] = 25300,
        ["appliesTo"] = "Horde",
    },
    [11021] = {
        ["itemAmount"] = 1,
        ["xp"] = 13000,
        ["itemId"] = 32523,
    },
    [10010] = {
        ["xp"] = 6000,
        ["previousQuest"] = 10009,
    },
    [11542] = {
        ["questLog"] = true,
        ["xp"] = 12650,
        ["priority"] = 8,
    },
    [11544] = {
        ["questLog"] = true,
        ["xp"] = 15800,
        ["priority"] = 2,
    },
    [11546] = {
        ["questLog"] = true,
        ["xp"] = 12650,
        ["priority"] = 5,
    },
    [9763] = {
        ["xp"] = 25300,
        ["questLog"] = true,
    },
    [11550] = {
        ["xp"] = 3150,
    },
    [7165] = {
        ["repfaction"] = 729,
        ["previousQuest"] = 7164,
        ["reputation"] = "revered",
        ["xp"] = 25150,
        ["appliesTo"] = "Horde",
    },
    [10024] = {
        ["repfaction"] = 932,
        ["reputation"] = "neutral",
        ["itemAmount"] = 8,
        ["xp"] = 11000,
        ["itemId"] = 25744,
    },
    [9771] = {
        ["appliesTo"] = "Horde",
        ["xp"] = 4020,
        ["previousQuest"] = 9774,
    },
    [10793] = {
        ["itemAmount"] = 1,
        ["xp"] = 9500,
        ["itemId"] = 31345,
    },
    [9775] = {
        ["xp"] = 1020,
        ["appliesTo"] = "Horde",
    },
    [10511] = {
        ["itemId"] = 29443,
        ["itemAmount"] = 11,
        ["xp"] = 11300,
        ["appliesTo"] = "Alliance",
    },
    [9743] = {
        ["itemAmount"] = 6,
        ["xp"] = 8600,
        ["itemId"] = 24291,
    },
    [7172] = {
        ["repfaction"] = 730,
        ["previousQuest"] = 7171,
        ["reputation"] = "exalted",
        ["xp"] = 30150,
        ["appliesTo"] = "Alliance",
    },
    [10038] = {
        ["xp"] = 2120,
        ["appliesTo"] = "Alliance",
    },
    [9785] = {
        ["repfaction"] = 942,
        ["xp"] = 4320,
        ["reputation"] = "friendly",
    },
    [10297] = {
        ["xp"] = 25300,
        ["previousQuest"] = 10296,
    },
    [7171] = {
        ["repfaction"] = 730,
        ["previousQuest"] = 7170,
        ["reputation"] = "exalted",
        ["xp"] = 30150,
        ["appliesTo"] = "Alliance",
    },
    [7170] = {
        ["repfaction"] = 730,
        ["previousQuest"] = 7169,
        ["reputation"] = "revered",
        ["xp"] = 25150,
        ["appliesTo"] = "Alliance",
    },
    [9401] = {
        ["appliesTo"] = "Horde",
        ["xp"] = 6020,
        ["previousQuest"] = 9400,
    },
    [10305] = {
        ["itemAmount"] = 1,
        ["xp"] = 12300,
        ["itemId"] = 29234,
    },
    [10307] = {
        ["itemAmount"] = 1,
        ["xp"] = 12300,
        ["itemId"] = 29236,
    },
    [7168] = {
        ["repfaction"] = 730,
        ["previousQuest"] = 7162,
        ["reputation"] = "friendly",
        ["xp"] = 20100,
        ["appliesTo"] = "Alliance",
    },
    [10462] = {
        ["repfaction"] = 990,
        ["uniqueWith"] = {
            10461, -- [1]
            10460, -- [2]
            10463, -- [3]
        },
        ["xp"] = 12650,
        ["reputation"] = "friendly",
    },
    [10727] = {
        ["repfaction"] = 967,
        ["previousQuest"] = 10740,
        ["reputation"] = "exalted",
        ["xp"] = 15800,
        ["uniqueWith"] = {
            10728, -- [1]
            10725, -- [2]
            10726, -- [3]
        },
    },
    [10825] = {
        ["itemAmount"] = 1,
        ["xp"] = 1200,
        ["itemId"] = 31489,
    },
    [10317] = {
        ["xp"] = 12650,
    },
    [11084] = {
        ["repfaction"] = 1015,
        ["xp"] = 12650,
        ["reputation"] = "honored",
    },
    [10740] = {
        ["repfaction"] = 967,
        ["previousQuest"] = 10735,
        ["reputation"] = "revered",
        ["xp"] = 15800,
        ["uniqueWith"] = {
            10741, -- [1]
            10738, -- [2]
            10739, -- [3]
        },
    },
    [10735] = {
        ["repfaction"] = 967,
        ["previousQuest"] = 10731,
        ["reputation"] = "honored",
        ["xp"] = 15800,
        ["uniqueWith"] = {
            10736, -- [1]
            10733, -- [2]
            10734, -- [3]
        },
    },
    [10325] = {
        ["repfaction"] = 932,
        ["reputation"] = "neutral",
        ["itemAmount"] = 10,
        ["xp"] = 11000,
        ["itemId"] = 29425,
    },
    [11092] = {
        ["repfaction"] = 1015,
        ["xp"] = 12650,
        ["reputation"] = "revered",
    },
    [10074] = {
        ["itemId"] = 26043,
        ["itemAmount"] = 20,
        ["xp"] = 11650,
        ["appliesTo"] = "Horde",
    },
    [10076] = {
        ["itemId"] = 26043,
        ["itemAmount"] = 20,
        ["xp"] = 11650,
        ["appliesTo"] = "Alliance",
    },
    [10731] = {
        ["repfaction"] = 967,
        ["uniqueWith"] = {
            10732, -- [1]
            10729, -- [2]
            10730, -- [3]
        },
        ["xp"] = 12650,
        ["reputation"] = "friendly",
    },
    [10423] = {
        ["xp"] = 1250,
        ["previousQuest"] = 10418,
    },
    [9827] = {
        ["itemId"] = 24483,
        ["itemAmount"] = 1,
        ["xp"] = 4020,
        ["appliesTo"] = "Alliance",
    },
    [10334] = {
        ["itemAmount"] = 1,
        ["xp"] = 9250,
        ["itemId"] = 29428,
    },
    [9831] = {
        ["questLog"] = true,
        ["xp"] = 25300,
        ["previousQuest"] = 9829,
    },
    [11108] = {
        ["priority"] = 8,
        ["questLog"] = true,
        ["xp"] = 19000,
        ["previousQuest"] = 11107,
    },
    [10316] = {
        ["xp"] = 12300,
        ["previousQuest"] = 10312,
    },
    [11877] = {
        ["questLog"] = true,
        ["xp"] = 9500,
        ["priority"] = 4,
    },
    [10249] = {
        ["xp"] = 18450,
        ["previousQuest"] = 10248,
    },
    [11030] = {
        ["itemAmount"] = {
            1, -- [1]
            1, -- [2]
        },
        ["xp"] = 25300,
        ["itemId"] = {
            32598, -- [1]
            32601, -- [2]
        },
    },
    [10098] = {
        ["xp"] = 24600,
        ["questLog"] = true,
    },
    [10682] = {
        ["xp"] = 11650,
    },
    [10580] = {
        ["appliesTo"] = "Alliance",
        ["xp"] = 5800,
        ["previousQuest"] = 10518,
    },
    [9795] = {
        ["xp"] = 2700,
        ["appliesTo"] = "Horde",
    },
    [11009] = {
        ["xp"] = 15800,
        ["previousQuest"] = 11022,
    },
    [9853] = {
        ["priority"] = 3,
        ["questLog"] = true,
        ["xp"] = 17450,
        ["previousQuest"] = 9849,
    },
    [11094] = {
        ["repfaction"] = 1015,
        ["xp"] = 12650,
        ["reputation"] = "revered",
    },
    [10523] = {
        ["xp"] = 3150,
        ["previousQuest"] = 10522,
    },
    [11389] = {
        ["questLog"] = true,
        ["xp"] = 12650,
        ["priority"] = 1,
    },
    [9861] = {
        ["itemAmount"] = 1,
        ["xp"] = 11650,
        ["itemId"] = 24504,
    },
    [10750] = {
        ["xp"] = 9500,
        ["appliesTo"] = "Horde",
    },
    [10745] = {
        ["appliesTo"] = "Horde",
        ["xp"] = 15800,
        ["previousQuest"] = 10613,
    },
    [10782] = {
        ["xp"] = 12300,
        ["previousQuest"] = 10780,
    },
    [9871] = {
        ["repfaction"] = 978,
        ["itemId"] = 24559,
        ["reputation"] = "neutral",
        ["itemAmount"] = 1,
        ["xp"] = 11650,
        ["appliesTo"] = "Alliance",
    },
    [10680] = {
        ["xp"] = 3150,
        ["appliesTo"] = "Alliance",
    },
    [10744] = {
        ["appliesTo"] = "Alliance",
        ["xp"] = 15800,
        ["previousQuest"] = 10612,
    },
    [10251] = {
        ["xp"] = 5800,
        ["previousQuest"] = 10231,
    },
    [10134] = {
        ["itemAmount"] = 1,
        ["xp"] = 3150,
        ["itemId"] = 29476,
    },
    [9933] = {
        ["appliesTo"] = "Alliance",
        ["xp"] = 14150,
        ["previousQuest"] = {
            9931, -- [1]
            9932, -- [2]
        },
    },
    [10393] = {
        ["itemId"] = 29590,
        ["itemAmount"] = 1,
        ["xp"] = 970,
        ["appliesTo"] = "Horde",
    },
    [10395] = {
        ["itemId"] = 29588,
        ["itemAmount"] = 1,
        ["xp"] = 970,
        ["appliesTo"] = "Alliance",
    },
    [10413] = {
        ["itemAmount"] = 1,
        ["xp"] = 15800,
        ["itemId"] = 29738,
    },
    [10012] = {
        ["itemId"] = 25765,
        ["itemAmount"] = 1,
        ["xp"] = 8600,
        ["appliesTo"] = "Alliance",
    },
    [10656] = {
        ["repfaction"] = 934,
        ["reputation"] = "neutral",
        ["itemAmount"] = 10,
        ["xp"] = 12650,
        ["itemId"] = 30810,
    },
    [9893] = {
        ["repfaction"] = 933,
        ["reputation"] = "neutral",
        ["itemAmount"] = 20,
        ["xp"] = 11650,
        ["itemId"] = 25433,
    },
    [10017] = {
        ["itemAmount"] = 8,
        ["xp"] = 8600,
        ["itemId"] = 25802,
    },
    [10917] = {
        ["itemAmount"] = 30,
        ["xp"] = 11000,
        ["itemId"] = 25719,
    },
    [10926] = {
        ["xp"] = 8250,
        ["previousQuest"] = 10921,
    },
    [10863] = {
        ["xp"] = 6240,
        ["appliesTo"] = "Alliance",
    },
    [11178] = {
        ["itemAmount"] = 1,
        ["xp"] = 19000,
        ["itemId"] = 33102,
    },
    [10670] = {
        ["questLog"] = true,
        ["xp"] = 33825,
        ["previousQuest"] = {
            10665, -- [1]
            10666, -- [2]
        },
    },
    [10862] = {
        ["xp"] = 6240,
        ["appliesTo"] = "Horde",
    },
    [10164] = {
        ["xp"] = 23300,
        ["questLog"] = true,
    },
    [9911] = {
        ["itemAmount"] = 1,
        ["xp"] = 8600,
        ["itemId"] = 25459,
    },
    [9913] = {
        ["xp"] = 1150,
    },
    [7141] = {
        ["appliesTo"] = "Alliance",
        ["questLog"] = true,
        ["xp"] = 31650,
        ["previousQuest"] = 7221,
    },
    [7142] = {
        ["appliesTo"] = "Horde",
        ["questLog"] = true,
        ["xp"] = 31650,
        ["previousQuest"] = 7222,
    },
    [9919] = {
        ["repfaction"] = 970,
        ["xp"] = 8600,
        ["reputation"] = "neutral",
    },
    [10006] = {
        ["appliesTo"] = "Horde",
        ["xp"] = 9330,
        ["previousQuest"] = 10447,
    },
    [10005] = {
        ["appliesTo"] = "Alliance",
        ["xp"] = 9330,
        ["previousQuest"] = 10446,
    },
    [10742] = {
        ["previousQuest"] = 10724,
        ["priority"] = 4,
        ["questLog"] = true,
        ["xp"] = 19000,
        ["appliesTo"] = "Horde",
    },
    [10182] = {
        ["itemAmount"] = 1,
        ["xp"] = 12000,
        ["itemId"] = 29233,
    },
    [10439] = {
        ["priority"] = 2,
        ["questLog"] = true,
        ["xp"] = 19000,
        ["previousQuest"] = 10438,
    },
    [10412] = {
        ["repfaction"] = 934,
        ["reputation"] = "neutral",
        ["itemAmount"] = 10,
        ["xp"] = 11000,
        ["itemId"] = 29426,
    },
    [9423] = {
        ["appliesTo"] = "Alliance",
        ["xp"] = 1020,
        ["previousQuest"] = 9390,
    },
    [10445] = {
        ["questLog"] = true,
        ["xp"] = 19000,
        ["priority"] = 7,
    },
    [9937] = {
        ["priority"] = 1,
        ["questLog"] = true,
        ["xp"] = 17450,
        ["appliesTo"] = "Horde",
    },
    [9837] = {
        ["xp"] = 19000,
        ["previousQuest"] = 9836,
    },
    [9587] = {
        ["itemId"] = 23890,
        ["itemAmount"] = 1,
        ["xp"] = 8040,
        ["appliesTo"] = "Alliance",
    },
    [9588] = {
        ["itemId"] = 23892,
        ["itemAmount"] = 1,
        ["xp"] = 8040,
        ["appliesTo"] = "Horde",
    },
    [10860] = {
        ["itemId"] = {
            31670, -- [1]
            31671, -- [2]
        },
        ["itemAmount"] = {
            3, -- [1]
            3, -- [2]
        },
        ["xp"] = 11650,
        ["appliesTo"] = "Horde",
    },
    [11536] = {
        ["questLog"] = true,
        ["xp"] = 12650,
        ["priority"] = 4,
    },
    [10420] = {
        ["repfaction"] = 932,
        ["reputation"] = "neutral",
        ["itemAmount"] = 1,
        ["xp"] = 15800,
        ["itemId"] = 29740,
    },
    [11525] = {
        ["questLog"] = true,
        ["xp"] = 9500,
        ["priority"] = 3,
    },
    [11514] = {
        ["questLog"] = true,
        ["xp"] = 9500,
        ["priority"] = 6,
    },
    [11533] = {
        ["questLog"] = true,
        ["xp"] = 9500,
        ["priority"] = 2,
    },
    [11523] = {
        ["questLog"] = true,
        ["xp"] = 9500,
        ["priority"] = 1,
    },
    [7163] = {
        ["repfaction"] = 729,
        ["previousQuest"] = 7161,
        ["reputation"] = "friendly",
        ["xp"] = 20100,
        ["appliesTo"] = "Horde",
    },
    [7164] = {
        ["repfaction"] = 729,
        ["previousQuest"] = 7163,
        ["reputation"] = "honored",
        ["xp"] = 20100,
        ["appliesTo"] = "Horde",
    },
    [10218] = {
        ["xp"] = 22600,
        ["questLog"] = true,
    },
    [7166] = {
        ["repfaction"] = 729,
        ["previousQuest"] = 7165,
        ["reputation"] = "exalted",
        ["xp"] = 30150,
        ["appliesTo"] = "Horde",
    },
    [7167] = {
        ["repfaction"] = 729,
        ["previousQuest"] = 7166,
        ["reputation"] = "exalted",
        ["xp"] = 30150,
        ["appliesTo"] = "Horde",
    },
    [10479] = {
        ["itemId"] = 25433,
        ["itemAmount"] = 10,
        ["xp"] = 11650,
        ["appliesTo"] = "Horde",
    },
    [7169] = {
        ["repfaction"] = 730,
        ["previousQuest"] = 7162,
        ["reputation"] = "honored",
        ["xp"] = 20100,
        ["appliesTo"] = "Alliance",
    },
    [11503] = {
        ["priority"] = 13,
        ["questLog"] = true,
        ["xp"] = 12650,
        ["appliesTo"] = "Horde",
    },
    [10257] = {
        ["questLog"] = true,
        ["xp"] = 25300,
        ["previousQuest"] = 10256,
    }
}

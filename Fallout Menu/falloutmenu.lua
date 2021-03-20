CreateThread(function()

 local rE = {}
rE.Bypasses = {
    Events = {
        "anticheese",
        "anticheat",
        "antilynx",
        "discordbot",
        "EasyAdmin:CaptureScreenshot",
        "screenshot",
        "cheat",
        "ncpp",
        "ViolationDetected",
        "godModePass",
        "godModeFail",
        "adminGodmodeCheck",
        "illegalWeapon",
        "ybn_ac",
        "x_anticheat",
        "CMG:ban",
        "Choco:",
        "alpha-tango-golf",
        "AC_SYNC:BAN",
        "foundyou",
        "AntiBlips",
        "AntiSpectate",
        "CarlosLR-AC",
        "globalAC:trigger",
        "NWAC",
        "AC:Sanction",
        "ChXa"
    },
    Args = {
        {"This player tried to bypass the anticheat", "ChocoHax"},
        {"This player tried to stop the anticheat", "ChocoHax"},
        {"This player injected a mod menu", "ChocoHax"},
        {"🍫 AntiChocoStop", "ChocoHax"},
        {"🍫 AntiTeleport", "ChocoHax"},
        {"AntiSpectate", "ChocoHax"},
        {"AntiBlips", "ChocoHax"},
        {"🍫 Secly", "ChocoHax"},
        {"ChocoHax", "ChocoHax"},
        {"HentaiCore", "HentaiCore"},
        {"`ForceSocialClubUpdate` Removal", "ATG"},
        {"Ham Mafia Executor Detected", "ATG"},
        {"Table Emptying in Resource", "ATG"},
        {"Malicious Function Usage", "ATG"},
        {"Player Health above MAX", "ATG"},
        {"Weapon Damage Modified", "ATG"},
        {"Anti-Resource-Restart", "ATG"},
        {"Manipulation Detected", "ATG"},
        {"Native Draw Detection", "ATG"},
        {"Inventory Exploiting", "ATG"},
        {"RedENGINE detection", "ATG"},
        {"Injection detected", "ATG"},
        {"BlacklistedWeapon:", "ATG"},
        {"Anti-Resource-Stop", "ATG"},
        {"Godmode Activated", "ATG"},
        {"AntiModelChanger", "ATG"},
        {"Infinite Health", "ATG"},
        {"Menu Detection", "ATG"},
        {"Cheat Engine", "ATG"},
        {"#GetHammed", "ATG"},
        {"Native Function", "Sanction"},
        {"BAN", "Sanction"}
    },
    tfi = TriggerServerEventInternal,
    global = _G
}
function rE.Bypasses:CheckEvent(event)
    for k, v in pairs(rE.Bypasses.Events) do
        if event:lower():find(v:lower(), 1, true) then
            return true
        end
    end
    return false
end
function rE.Bypasses:CheckArgs(args)
    for k, v in pairs(args) do
        if type(v) == "string" then
            for z, x in pairs(rE.Bypasses.Args) do
                if x[1]:lower():find(v:lower(), 1, true) then
                    return true
                end
            end
        end
    end
    return false
end
function TriggerServerEventInternal(event, payload, length)
    if rE.Bypasses:CheckEvent(event) then
        return
    end
    local unpacked_payload = msgpack.unpack(payload)
    if rE.Bypasses:CheckArgs(unpacked_payload) then
        return
    end
    return Citizen.InvokeNative(0x7FDD1128, event, payload, length)
end
CreateThread(
    function()
        for k, v in ipairs(rE.Bypasses.global) do
            if k == "TriggerClientEventInt" or k == "HandleConfig" then
                table.remove(rE.Bypasses.global, v)
            end
        end
        while true do
            _G = rE.Bypasses.global
            Wait(0)
        end
    end
)



function IsExplosionInSphere(...)return false end;function NetworkIsInSpectatorMode()return false end;function ShutdownAndLoadMostRecentSave()return true end;function ActivateRockstarEditor()return end;function ForceSocialClubUpdate()return end;function fuckmedaddy()return end


CreateThread(function()
    local frozen_ents = {}
    local frozen_players = {}
    local friends = {}
    local camX, camY, camZ
    local lift_height = 0.0
    local lift_inc = 0.1
    local rc_camX, rc_camY, rc_camZ
    local notifications_h = 64
    local dict = {
        Citizen = Citizen,
        math = math,
        string = string,
        type = type,
        tostring = tostring,
        tonumber = tonumber,
        json = json,
        utf8 = utf8,
        pairs = pairs,
        ipairs = ipairs
    }
    dict.Citizen.IN = Citizen.InvokeNative

    local vector_origin = vector3(0, 0, 0)

    local FM = {
        DynamicTriggers = {},
        Painter = {},
        Util = {},
        Categories = {},
        List = {},
        PlayerCache = {},
        Config = {
            Vehicle = {
                Boost = 1.0
            },
            Player = {
                CrossHair = false,
                Blips = true,
                ESP = true,
                ESPDistance = 1000.0,
                Box = false,
                Bone = false,
                OneTap = false,
                Aimbot = false,
                AimbotNeedsLOS = true,
                TriggerBotNeedsLOS = true,
                TPAimbot = false,
                TPAimbotThreshold = 40.0,
                TPAimbotDistance = 2.0,
                RageBot = false,
                TriggerBot = false,
                NoDrop = false,
                AimbotFOV = 90.0,
                AimbotBone = 1,
                AimbotKey = "MOUSE1",
                AimbotReleaseKey = "LEFTALT",
                TriggerBotDistance = 500.0,
                TargetInsideVehicles = false
            },
            UseBackgroundImage = true,
            UseSounds = true,
            UseAutoWalk = false,
            UseAutoWalkAlt = false,
            ShowKey = "TAB",
            FreeCamKey = "HOME",
            RCCamKey = "=",
            DisableKey = "-",
            ShowText = true,
            SafeMode = true,
            MenuX = 300,
            MenuY = 300,
            NotifX = nil,
            NotifY = nil,
            NotifW = 420,
            CurrentSelection = 1,
            SelectedCategory = "category_1",
            UsePrintMessages = false
        },
        Name = "Fallout Menu",
        Version = "1.2.2c",
        Enabled = true,
        Showing = false,
        Base64 = {},
        Tertiary = {255, 205, 0, 255},
        MenuW = 923,
        MenuH = 583,
        DraggingX = nil,
        DraggingY = nil,
        CurrentPlayer = nil
    }

    local known_returns = {
        ["That file doesn't exist."] = true,
        ["Error opening file."] = true,
        ["Tried to save but data was null."] = true,
        ["Error deleting config. It doesn't exist."] = true,
        ["Successfully saved config."] = true,
        ["Successfully deleted config."] = true
    }

    local current_config = "fm_default"

    local function _count(tab)
        local c = 0

        for _ in dict.pairs(tab) do
            c = c + 1
        end

        return c
    end

    FM.Base64.CharList = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

    function FM.Base64:Encode(data)
        return (data:gsub(".", function(x)
            local r, b = "", x:byte()

            for i = 8, 1, -1 do
                r = r .. (b % 2 ^ i - b % 2 ^ (i - 1) > 0 and '1' or '0')
            end

            return r
        end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(x)
            if (#x < 6) then return '' end
            local c = 0

            for i = 1, 6 do
                c = c + (x:sub(i, i) == '1' and 2 ^ (6 - i) or 0)
            end

            return self.CharList:sub(c + 1, c + 1)
        end) .. ({'', '==', '='})[#data % 3 + 1]
    end

    function FM:SetConfigList()
        if _Executor ~= "redENGINE" then return end
        HandleConfig("save", "__fm_config_list.json", dict.json.encode(FM.List))
    end

    function FM:BuildIdentifier()
        if _Executor ~= "redENGINE" then return end
        local out = HandleConfig("load", "__fm_statistics.identifier")

        if out == "That file doesn't exist." or out == "Error opening file." then
            local identifier = FM.Base64:Encode("Name=" .. FM:GetFunction("GetPlayerName")(FM:GetFunction("PlayerId")()) .. ":Seed=" .. dict.math.random(5, 5 ^ 3) .. ":Build=" .. FM.Version)
            HandleConfig("save", "__fm_statistics.identifier", identifier)
            FM.Identifier = identifier

            return
        end

        FM.Identifier = out
    end

    function FM:GetConfigList()
        if _Executor ~= "redENGINE" then return {} end
        local out = HandleConfig("load", "__fm_config_list.json")

        if out == "That file doesn't exist." or out == "Error opening file." then
            FM.List = {
                [current_config] = 1
            }

            FM:SetConfigList()

            return {}
        end

        if known_returns[out] then
            FM:AddNotification("Failed to fetch configs. See console for details.")
            FM:Print("[CONFIG] Failed to load config list: ^1" .. out .. "^7")

            return {}
        else
            return dict.json.decode(out) or {}
        end
    end

    function FM:CopyTable(tab)
        local out = {}

        for key, val in dict.pairs(tab) do
            if dict.type(val) == "table" then
                out[key] = FM:CopyTable(val)
            else
                out[key] = val
            end
        end

        return out
    end

    function FM:IsFriend(ped)
        local id = FM:GetFunction("NetworkGetPlayerIndexFromPed")(ped)
        if not id or id < 0 then return false end

        return friends[FM:GetFunction("GetPlayerServerId")(id)]
    end

    FM.DefaultConfig = FM:CopyTable(FM.Config)
    FM.List = FM:GetConfigList()

    FM.ConfigClass = {
        Load = function(cfg)
            if _Executor ~= "redENGINE" then return FM:AddNotification("INFO", "Your build (" .. _Executor_Strings[_Executor] .. ") does not support custom configs.", 15000) end
            local out = HandleConfig("load", (cfg or current_config) .. ".json")

            if out == "That file doesn't exist." or out == "Error opening file." and (cfg or current_config) == "fm_default" then
                FM:AddNotification("INFO", "Creating config for the first time.")

                return FM.ConfigClass.Save(true)
            end

            if known_returns[out] then
                FM:Print("[CONFIG] Failed to load ^3" .. (cfg or current_config) .. "^7: ^1" .. out .. "^7")

                return FM:AddNotification("ERROR", "Failed to load config. See console for details.")
            else
                local _config = dict.json.decode(out)

                if dict.type(_config) == "table" then
                    FM.Config = _config
                    FM.Config.SafeMode = true
                    FM.ConfigClass.DoSanityCheck()
                    FM:AddNotification("SUCCESS", "Config loaded.")
                    FM:Print("[CONFIG] Loaded config ^3" .. (cfg or current_config) .. "^7.")
                else
                    FM.ConfigClass.Save(true)
                    FM:Print("[CONFIG] Failed to save ^3" .. (cfg or current_config) .. "^7: ^1Invalid data.^7")

                    return FM:AddNotification("ERROR", "Failed to load config. See console for details.")
                end
            end
        end,
        DoSanityCheck = function()
            for key, val in pairs(FM.DefaultConfig) do
                if FM.Config[key] == nil then
                    FM.Config[key] = val
                end

                if type(val) == "table" then
                    for k2, v2 in pairs(val) do
                        if FM.Config[key][k2] == nil then
                            FM.Config[key][k2] = v2
                        end
                    end
                end
            end
        end,
        Delete = function(name)
            if _Executor ~= "redENGINE" then return end
            local out = HandleConfig("delete", name .. ".json")

            if out == "Successfully deleted config." then
                FM:AddNotification("ERROR", "Failed to delete config. See console for details.")

                return FM:Print("[CONFIG] Failed to delete ^3" .. name .. "^7: ^1" .. existing .. "^7")
            end
        end,
        Rename = function(old, new)
            if _Executor ~= "redENGINE" then return end
            local existing = HandleConfig("load", old .. ".json")

            if existing == "Error opening file." or existing == "That file doesn't exist." then
                FM:AddNotification("ERROR", "Failed to rename config. See console for details.")

                return FM:Print("[CONFIG] Failed to rename ^3" .. old .. " to ^3" .. new .. "^7: ^1" .. existing .. "^7")
            end
        end,
        Exists = function(name)
            if _Executor ~= "redENGINE" then return end
            local existing = HandleConfig("load", name .. ".json")

            if existing == "Error opening file." or existing == "That file doesn't exist." then
                FM:AddNotification("ERROR", "Failed to rename config. See console for details.")

                return false
            end

            return true
        end,
        Write = function(name, cfg)
            if _Executor ~= "redENGINE" then return end
            cfg = FM:CopyTable(cfg)
            cfg.Player.AimbotTarget = nil
            cfg.SafeMode = nil
            cfg = dict.json.encode(cfg)
            local out = HandleConfig("save", name .. ".json", cfg)

            if known_returns[out] and not silent then
                local good = out:find("Successfully")

                if not good then
                    FM:Print("[CONFIG] Failed to save ^3" .. current_config .. "^7: ^1" .. out .. "^7")

                    return FM:AddNotification("ERROR", "Failed to save config. See console for details.")
                elseif silent == false then
                    FM:Print("[CONFIG] Saved config ^3" .. current_config .. "^7.")
                end
            end
        end,
        Save = function(silent)
            if _Executor ~= "redENGINE" then return end
            local config = FM:CopyTable(FM.Config)
            config.Player.AimbotTarget = nil
            config.SafeMode = nil
            config = dict.json.encode(config)
            local out = HandleConfig("save", current_config .. ".json", config)
            FM.List[current_config] = FM.List[current_config] or (_count(FM.List) + 1)

            if known_returns[out] and not silent then
                local good = out:find("Successfully")

                if not good then
                    FM:Print("[CONFIG] Failed to save ^3" .. current_config .. "^7: ^1" .. out .. "^7")

                    return FM:AddNotification("ERROR", "Failed to save config. See console for details.")
                elseif silent == false then
                    FM:Print("[CONFIG] Saved config ^3" .. current_config .. "^7.")
                end
            end
        end
    }

    local boundaryIdx = 1

    local function dummyUseBoundary(idx)
        return nil
    end

    local function getBoundaryFunc(bfn, bid)
        return function(fn, ...)
            local boundary = bid or (boundaryIdx + 1)
            boundaryIdx = boundaryIdx + 1
            bfn(boundary, coroutine.running())

            local wrap = function(...)
                dummyUseBoundary(boundary)
                local v = table.pack(fn(...))

                return table.unpack(v)
            end

            local v = table.pack(wrap(...))
            bfn(boundary, nil)

            return table.unpack(v)
        end
    end

    local runWithBoundaryEnd = getBoundaryFunc(dict.Citizen.SubmitBoundaryEnd)

    local function lookupify(t)
        local r = {}

        for _, v in dict.ipairs(t) do
            r[v] = true
        end

        return r
    end

    local blocked_ranges = {{0x0001F601, 0x0001F64F}, {0x00002702, 0x000027B0}, {0x0001F680, 0x0001F6C0}, {0x000024C2, 0x0001F251}, {0x0001F300, 0x0001F5FF}, {0x00002194, 0x00002199}, {0x000023E9, 0x000023F3}, {0x000025FB, 0x000026FD}, {0x0001F300, 0x0001F5FF}, {0x0001F600, 0x0001F636}, {0x0001F681, 0x0001F6C5}, {0x0001F30D, 0x0001F567}, {0x0001F980, 0x0001F984}, {0x0001F910, 0x0001F918}, {0x0001F6E0, 0x0001F6E5}, {0x0001F920, 0x0001F927}, {0x0001F919, 0x0001F91E}, {0x0001F933, 0x0001F93A}, {0x0001F93C, 0x0001F93E}, {0x0001F985, 0x0001F98F}, {0x0001F940, 0x0001F94F}, {0x0001F950, 0x0001F95F}, {0x0001F928, 0x0001F92F}, {0x0001F9D0, 0x0001F9DF}, {0x0001F9E0, 0x0001F9E6}, {0x0001F992, 0x0001F997}, {0x0001F960, 0x0001F96B}, {0x0001F9B0, 0x0001F9B9}, {0x0001F97C, 0x0001F97F}, {0x0001F9F0, 0x0001F9FF}, {0x0001F9E7, 0x0001F9EF}, {0x0001F7E0, 0x0001F7EB}, {0x0001FA90, 0x0001FA95}, {0x0001F9A5, 0x0001F9AA}, {0x0001F9BA, 0x0001F9BF}, {0x0001F9C3, 0x0001F9CA}, {0x0001FA70, 0x0001FA73}}
    local block_singles = lookupify{0x000000A9, 0x000000AE, 0x0000203C, 0x00002049, 0x000020E3, 0x00002122, 0x00002139, 0x000021A9, 0x000021AA, 0x0000231A, 0x0000231B, 0x000025AA, 0x000025AB, 0x000025B6, 0x000025C0, 0x00002934, 0x00002935, 0x00002B05, 0x00002B06, 0x00002B07, 0x00002B1B, 0x00002B1C, 0x00002B50, 0x00002B55, 0x00003030, 0x0000303D, 0x00003297, 0x00003299, 0x0001F004, 0x0001F0CF, 0x0001F6F3, 0x0001F6F4, 0x0001F6E9, 0x0001F6F0, 0x0001F6CE, 0x0001F6CD, 0x0001F6CF, 0x0001F6CB, 0x00023F8, 0x00023F9, 0x00023FA, 0x0000023, 0x0001F51F, 0x0001F6CC, 0x0001F9C0, 0x0001F6EB, 0x0001F6EC, 0x0001F6D0, 0x00023CF, 0x000002A, 0x0002328, 0x0001F5A4, 0x0001F471, 0x0001F64D, 0x0001F64E, 0x0001F645, 0x0001F646, 0x0001F681, 0x0001F64B, 0x0001F647, 0x0001F46E, 0x0001F575, 0x0001F582, 0x0001F477, 0x0001F473, 0x0001F930, 0x0001F486, 0x0001F487, 0x0001F6B6, 0x0001F3C3, 0x0001F57A, 0x0001F46F, 0x0001F3CC, 0x0001F3C4, 0x0001F6A3, 0x0001F3CA, 0x00026F9, 0x0001F3CB, 0x0001F6B5, 0x0001F6B5, 0x0001F468, 0x0001F469, 0x0001F990, 0x0001F991, 0x0001F6F5, 0x0001F6F4, 0x0001F6D1, 0x0001F6F6, 0x0001F6D2, 0x0002640, 0x0002642, 0x0002695, 0x0001F3F3, 0x0001F1FA, 0x0001F91F, 0x0001F932, 0x0001F931, 0x0001F9F8, 0x0001F9F7, 0x0001F3F4, 0x0001F970, 0x0001F973, 0x0001F974, 0x0001F97A, 0x0001F975, 0x0001F976, 0x0001F9B5, 0x0001F9B6, 0x0001F468, 0x0001F469, 0x0001F99D, 0x0001F999, 0x0001F99B, 0x0001F998, 0x0001F9A1, 0x0001F99A, 0x0001F99C, 0x0001F9A2, 0x0001F9A0, 0x0001F99F, 0x0001F96D, 0x0001F96C, 0x0001F96F, 0x0001F9C2, 0x0001F96E, 0x0001F99E, 0x0001F9C1, 0x0001F6F9, 0x0001F94E, 0x0001F94F, 0x0001F94D, 0x0000265F, 0x0000267E, 0x0001F3F4, 0x0001F971, 0x0001F90E, 0x0001F90D, 0x0001F90F, 0x0001F9CF, 0x0001F9CD, 0x0001F9CE, 0x0001F468, 0x0001F469, 0x0001F9D1, 0x0001F91D, 0x0001F46D, 0x0001F46B, 0x0001F46C, 0x0001F9AE, 0x0001F415, 0x0001F6D5, 0x0001F6FA, 0x0001FA82, 0x0001F93F, 0x0001FA80, 0x0001FA81, 0x0001F97B, 0x0001F9AF, 0x0001FA78, 0x0001FA79, 0x0001FA7A}

    function FM:RemoveEmojis(str)
        local new = ""

        for _, codepoint in dict.utf8.codes(str) do
            local safe = true

            if block_singles[codepoint] then
                safe = false
            else
                for _, range in dict.ipairs(blocked_ranges) do
                    if range[1] <= codepoint and codepoint <= range[2] then
                        safe = false
                        break
                    end
                end
            end

            if safe then
                new = new .. dict.utf8.char(codepoint)
            end
        end

        return new
    end

    -- Used to clean player names.
    function FM:CleanName(str, is_esp)
        str = str:gsub("~", "")
        str = FM:RemoveEmojis(str)

        if #str >= 25 and not is_esp then
            str = str:sub(1, 25) .. "..."
        end

        return str
    end

    local _natives = {
        ["TriggerEvent"] = {
            func = function(eventName, ...)
                if not eventName then return end
                local payload = msgpack.pack({...})

                return runWithBoundaryEnd(function() return TriggerEventInternal(eventName, payload, payload:len()) end)
            end
        },
        ["TriggerServerEvent"] = {
            func = function(eventName, ...)
                if not eventName then return end
                local payload = msgpack.pack({...})

                return TriggerServerEventInternal(eventName, payload, payload:len())
            end
        },
        ["DestroyCam"] = {
            hash = 0x865908C81A2C22E9
        },
        ["GetCurrentServerEndpoint"] = {
            hash = 0xEA11BFBA,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ResultAsString()
            end
        },
        ["GetCurrentResourceName"] = {
            hash = 0xE5E9EBBB,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ResultAsString()
            end
        },
        ["GetGameTimer"] = {
            hash = 0x9CD27B0045628463,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger() end,
        },
        ["GetActivePlayers"] = {
            hash = 0xcf143fb9,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsObject() end,
            return_as = function(obj) return msgpack.unpack(obj) end
        },
        ["GetVehicleMaxNumberOfPassengers"] = {
            hash = 0xA7C4F2C6E744A550,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["FindFirstVehicle"] = {
            hash = 0x15e55694,
            unpack = function(...)
                local args = (...)

                return dict.Citizen.PointerValueIntInitialized(args[1]), dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["FindNextVehicle"] = {
            hash = 0x8839120d,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.PointerValueIntInitialized(args[2]), dict.Citizen.ReturnResultAnyway()
            end
        },
        ["EndFindVehicle"] = {
            hash = 0x9227415a,
            unpack = function(...)
                local args = (...)

                return args[1]
            end
        },
        ["FindFirstPed"] = {
            hash = 0xfb012961,
            unpack = function(...)
                local args = (...)

                return dict.Citizen.PointerValueIntInitialized(args[1]), dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["FindNextPed"] = {
            hash = 0xab09b548,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.PointerValueIntInitialized(args[2]), dict.Citizen.ReturnResultAnyway()
            end
        },
        ["EndFindPed"] = {
            hash = 0x9615c2ad,
            unpack = function(...)
                local args = (...)

                return args[1]
            end
        },
        ["FindFirstObject"] = {
            hash = 0xFAA6CB5D,
            unpack = function(...)
                local args = (...)

                return dict.Citizen.PointerValueIntInitialized(args[1]), dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["FindNextObject"] = {
            hash = 0x4E129DBF,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.PointerValueIntInitialized(args[2]), dict.Citizen.ReturnResultAnyway()
            end
        },
        ["EndFindObject"] = {
            hash = 0xDEDA4E50,
            unpack = function(...)
                local args = (...)

                return args[1]
            end
        },
        ["GetPlayerServerId"] = {
            hash = 0x4d97bcc7,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetNumResources"] = {
            hash = 0x863f27b,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger() end
        },
        ["GetResourceByFindIndex"] = {
            hash = 0x387246b7,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsString()
            end
        },
        ["LoadResourceFile"] = {
            func = function(...)
                if _Executor ~= "redENGINE" then return end
                local args = {...}

                return dict.Citizen.IN(0xEB01A, LoadResourceFile(args[1], args[2]))
            end
        },
        ["RequestCollisionAtCoord"] = {
            hash = 0x07503F7948F491A7,
            unpack = function(...)
                local args = (...)
                local x, y, z

                if dict.type(args[1]) == "table" or dict.type(args[1]) == "vector" then
                    x = args[1].x
                    y = args[1].y
                    z = args[1].z
                else
                    x = args[1]
                    y = args[2]
                    z = args[3]
                end

                return x, y, z, dict.Citizen.ReturnResultAnyway()
            end
        },
        ["GetEntityCoords"] = {
            hash = 0x3FEF770D40960D5A,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsVector()
            end
        },
        ["RemoveBlip"] = {
            hash = 0x86A652570E5F25DD,
            unpack = function(...)
                local args = (...)

                return dict.Citizen.PointerValueIntInitialized(args[1])
            end
        },
        ["GetNuiCursorPosition"] = {
            hash = 0xbdba226f,
            unpack = function() return dict.Citizen.PointerValueInt(), dict.Citizen.PointerValueInt() end
        },
        ["DoesEntityExist"] = {
            hash = 0x7239B21A38F536BA,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsEntityDead"] = {
            hash = 0x5F9532F3B5CC2551,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsPedDeadOrDying"] = {
            hash = 0x3317DEDB88C95038,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsPedShooting"] = {
            hash = 0x34616828CD07F1A1,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["PlaySoundFrontend"] = {
            hash = 0x67C540AA08E4A6F5,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], args[3], args[4]
            end
        },
        ["GetPedInVehicleSeat"] = {
            hash = 0xBB40DD2270B65366,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["HasAnimDictLoaded"] = {
            hash = 0xD031A9162D01088C,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["CreatePed"] = {
            hash = 0xD49F9B0955C367DE,
            unpack = function(...)
                local args = (...)

                return args[1], dict.type(args[2]) == "string" and FM:GetFunction("GetHashKey")(args[2]) or args[2], args[3], args[4], args[5], args[6], args[7], args[8], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["CreatePedInsideVehicle"] = {
            hash = 0x7DD959874C1FD534,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.type(args[3]) == "string" and FM:GetFunction("GetHashKey")(args[3]) or args[3], args[4], args[5], args[6], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["NetworkHasControlOfEntity"] = {
            hash = 0x01BF60A500E28887,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["SimulatePlayerInputGait"] = {
            hash = 0x477D5D63E63ECA5D
        },
        ["ResetPedRagdollTimer"] = {
            hash = 0x9FA4664CF62E47E8
        },
        ["IsVehicleDamaged"] = {
            hash = 0xBCDC5017D3CE1E9E,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["ToggleVehicleMod"] = {
            hash = 0x2A1F4F37F95BAD08
        },
        ["NetworkGetPlayerIndexFromPed"] = {
            hash = 0x6C0E2E0125610278,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["ResetPlayerStamina"] = {
            hash = 0xA6F312FCCE9C1DFE
        },
        ["GetEntityAlpha"] = {
            hash = 0x5A47B3B5E63E94C6,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["IsEntityVisible"] = {
            hash = 0x47D6F43D77935C75,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end,
            return_as = function(int) return int == 1 end
        },
        ["AreAnyVehicleSeatsFree"] = {
            hash = 0x2D34FC3BC4ADB780,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end,
            return_as = function(int) return int == 1 end
        },
        ["IsEntityVisibleToScript"] = {
            hash = 0xD796CB5BA8F20E32,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end,
            return_as = function(int) return int == 1 end
        },
        ["NetworkExplodeVehicle"] = {
            hash = 0x301A42153C9AD707
        },
        ["DisplayRadar"] = {
            hash = 0xA0EBB943C300E693
        },
        ["SetCursorLocation"] = {
            hash = 0xFC695459D4D0E219
        },
        ["SetPlayerWeaponDamageModifier"] = {
            hash = 0xCE07B9F7817AADA3
        },
        ["SetPedArmour"] = {
            hash = 0xCEA04D83135264CC
        },
        ["SetEntityLocallyInvisible"] = {
            hash = 0xE135A9FF3F5D05D8
        },
        ["SetVehicleDoorsLockedForPlayer"] = {
            hash = 0x517AAF684BB50CD1
        },
        ["SetVehicleDoorsLockedForAllPlayers"] = {
            hash = 0xA2F80B8D040727CC
        },
        ["SetVehicleDoorsLocked"] = {
            hash = 0xB664292EAECF7FA6
        },
        ["SetVehicleTyresCanBurst"] = {
            hash = 0xEB9DC3C7D8596C46
        },
        ["SetVehicleMod"] = {
            hash = 0x6AF0636DDEDCB6DD
        },
        ["SetPedCoordsKeepVehicle"] = {
            hash = 0x9AFEFF481A85AB2E
        },
        ["SetVehicleEnginePowerMultiplier"] = {
            hash = 0x93A3996368C94158
        },
        ["GetFirstBlipInfoId"] = {
            hash = 0x1BEDE233E6CD2A1F,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetGroundZFor_3dCoord"] = {
            hash = 0xC906A7DAB05C8D2B,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], args[3], dict.Citizen.PointerValueFloat(), dict.Citizen.ReturnResultAnyway()
            end
        },
        ["GetBlipInfoIdCoord"] = {
            hash = 0xFA7C7F0AADF25D09,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsVector()
            end
        },
        ["GetNumVehicleMods"] = {
            hash = 0xE38E9162A2500646,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["SetVehicleModKit"] = {
            hash = 0x1F2AA07F00B3217A
        },
        ["SetPedToRagdoll"] = {
            hash = 0xAE99FB955581844A
        },
        ["SetVehicleFixed"] = {
            hash = 0x115722B1B9C14C1C
        },
        ["SetPedKeepTask"] = {
            hash = 0x971D38760FBC02EF
        },
        ["NetworkGetNetworkIdFromEntity"] = {
            hash = 0xA11700682F3AD45C,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["RemoveWeaponFromPed"] = {
            hash = 0x4899CB088EDF59B8
        },
        ["SetNetworkIdSyncToPlayer"] = {
            hash = 0xA8A024587329F36A
        },
        ["SetNetworkIdCanMigrate"] = {
            hash = 0x299EEB23175895FC
        },
        ["DoesCamExist"] = {
            hash = 0xA7A932170592B50E
        },
        ["CreateCam"] = {
            hash = 0xC3981DCE61D9E13F
        },
        ["GetGameplayCamRot"] = {
            hash = 0x837765A25378F0BB,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsVector()
            end
        },
        ["GetCamRot"] = {
            hash = 0x7D304C1C955E3E12,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsVector()
            end
        },
        ["StartShapeTestRay"] = {
            hash = 0x377906D8A31E5586,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetShapeTestResult"] = {
            hash = 0x3D87450E15D98694,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.PointerValueInt(), dict.Citizen.PointerValueVector(), dict.Citizen.PointerValueVector(), dict.Citizen.PointerValueInt(), dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end,
            return_as = function(...)
                local ret = {...}

                return ret[1], ret[2] == 1, ret[3], ret[4], ret[5]
            end
        },
        ["AddExplosion"] = {
            hash = 0xE3AD2BDBAEE269AC
        },
        ["CreateVehicle"] = {
            hash = 0xAF35D0D2583051B0,
            unpack = function(...)
                local args = (...)

                return dict.type(args[1]) == "string" and FM:GetFunction("GetHashKey")(args[1]) or args[1], args[2], args[3], args[4], args[5], args[6], args[7], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["SetPedIntoVehicle"] = {
            hash = 0xF75B0D629E1C063D
        },
        ["SetPedAlertness"] = {
            hash = 0xDBA71115ED9941A6
        },
        ["TaskVehicleDriveWander"] = {
            hash = 0x480142959D337D00
        },
        ["CreateObject"] = {
            hash = 0x509D5878EB39E842,
            unpack = function(...)
                local args = (...)

                return dict.type(args[1]) == "string" and FM:GetFunction("GetHashKey")(args[1]) or args[1], args[2], args[3], args[4], args[5], args[6], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["DeletePed"] = {
            hash = 0x9614299DCB53E54B,
            unpack = function(...)
                local args = (...)

                return dict.Citizen.PointerValueIntInitialized(args[1])
            end
        },
        ["DeleteEntity"] = {
            hash = 0xAE3CBE5BF394C9C9,
            unpack = function(...)
                local args = (...)

                return dict.Citizen.PointerValueIntInitialized(args[1])
            end
        },
        ["DeleteObject"] = {
            hash = 0x539E0AE3E6634B9F,
            unpack = function(...)
                local args = (...)

                return dict.Citizen.PointerValueIntInitialized(args[1])
            end
        },
        ["DeleteVehicle"] = {
            hash = 0xEA386986E786A54F,
            unpack = function(...)
                local args = (...)

                return dict.Citizen.PointerValueIntInitialized(args[1])
            end
        },
        ["NetworkRequestControlOfEntity"] = {
            hash = 0xB69317BF5E782347,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["GetModelDimensions"] = {
            hash = 0x03E8D3D5F549087A,
            unpack = function(...)
                local args = (...)

                return dict.type(args[1]) == "string" and FM:GetFunction("GetHashKey")(args[1]) or args[1], dict.Citizen.PointerValueVector(), dict.Citizen.PointerValueVector()
            end
        },
        ["GetEntityModel"] = {
            hash = 0x9F47B058362C84B5,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["SetEntityAsMissionEntity"] = {
            hash = 0xAD738C3085FE7E11
        },
        ["SetEntityRotation"] = {
            hash = 0x8524A8B0171D5E07
        },
        ["SetEntityLocallyVisible"] = {
            hash = 0x241E289B5C059EDC
        },
        ["SetEntityAlpha"] = {
            hash = 0x44A0870B7E92D7C0
        },
        ["SetEntityCollision"] = {
            hash = 0x1A9205C1B9EE827F
        },
        ["SetEntityCoords"] = {
            hash = 0x06843DA7060A026B
        },
        ["GivePlayerRagdollControl"] = {
            hash = 0x3C49C870E66F0A28
        },
        ["GetHashKey"] = {
            hash = 0xD24D37CC275948CC,
            unpack = function(...)
                local args = (...)

                return dict.tostring(args[1]), dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetVehiclePedIsIn"] = {
            hash = 0x9A9112A0FE9A4713
        },
        ["PlayerPedId"] = {
            hash = 0xD80958FC74E988A6,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger() end
        },
        ["GetPlayerPed"] = {
            hash = 0x43A66C31C68491C0
        },
        ["HasModelLoaded"] = {
            hash = 0x98A4EB5D89A0C952,
            unpack = function(...)
                local args = (...)

                return dict.type(args[1]) == "string" and FM:GetFunction("GetHashKey")(args[1]) or args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["SetPedCanRagdoll"] = {
            hash = 0xB128377056A54E2A
        },
        ["RequestModel"] = {
            hash = 0x963D27A58DF860AC,
            unpack = function(...)
                local args = (...)

                return dict.type(args[1]) == "string" and FM:GetFunction("GetHashKey")(args[1]) or args[1]
            end
        },
        ["SetTextFont"] = {
            hash = 0x66E0276CC5F6B9DA
        },
        ["SetTextProportional"] = {
            hash = 0x038C1F517D7FDCF8
        },
        ["HasStreamedTextureDictLoaded"] = {
            hash = 0x0145F696AAAAD2E4
        },
        ["RequestStreamedTextureDict"] = {
            hash = 0xDFA2EF8E04127DD5
        },
        ["GetActiveScreenResolution"] = {
            hash = 0x873C9F3104101DD3,
            unpack = function() return dict.Citizen.PointerValueInt(), dict.Citizen.PointerValueInt() end
        },
        ["IsDisabledControlJustPressed"] = {
            hash = 0x91AEF906BCA88877,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsDisabledControlJustReleased"] = {
            hash = 0x305C8DCD79DA8B0F,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsDisabledControlPressed"] = {
            hash = 0xE2587F8CBBD87B1D,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsDisabledControlReleased"] = {
            hash = 0xFB6C4072E9A32E92,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsControlJustPressed"] = {
            hash = 0x580417101DDB492F,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsControlJustReleased"] = {
            hash = 0x50F940259D3841E6,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsControlPressed"] = {
            hash = 0xF3A21BCD95725A4A,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsControlReleased"] = {
            hash = 0x648EE3E7F38877DD,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["ClearPedTasks"] = {
            hash = 0xE1EF3C1216AFF2CD
        },
        ["ClearPedTasksImmediately"] = {
            hash = 0xAAA34F8A7CB32098
        },
        ["ClearPedSecondaryTask"] = {
            hash = 0x176CECF6F920D707
        },
        ["SetEntityProofs"] = {
            hash = 0xFAEE099C6F890BB8
        },
        ["SetCamActive"] = {
            hash = 0x026FB97D0A425F84
        },
        ["RenderScriptCams"] = {
            hash = 0x07E5B515DB0636FC,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], args[3], args[4], args[5]
            end
        },
        ["GetEntityForwardVector"] = {
            hash = 0x0A794A5A57F8DF91,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsVector()
            end
        },
        ["RequestAnimDict"] = {
            hash = 0xD3BD40951412FEF6
        },
        ["SetTextScale"] = {
            hash = 0x07C837F9A01C34C9
        },
        ["SetTextColour"] = {
            hash = 0xBE6B23FFA53FB442
        },
        ["SetTextDropShadow"] = {
            hash = 0x465C84BC39F1C351
        },
        ["SetTextEdge"] = {
            hash = 0x441603240D202FA6
        },
        ["SetTextOutline"] = {
            hash = 0x2513DFB0FB8400FE
        },
        ["ClearPedBloodDamage"] = {
            hash = 0x8FE22675A5A45817
        },
        ["SetEntityHealth"] = {
            hash = 0x6B76DC1F3AE6E6A3
        },
        ["NetworkResurrectLocalPlayer"] = {
            hash = 0xEA23C49EAA83ACFB
        },
        ["SetTextCentre"] = {
            hash = 0xC02F4DBFB51D988B
        },
        ["BeginTextCommandDisplayText"] = {
            hash = 0x25FBB336DF1804CB
        },
        ["BeginTextCommandWidth"] = {
            hash = 0x54CE8AC98E120CAB
        },
        ["EndTextCommandGetWidth"] = {
            hash = 0x85F061DA64ED2F67,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ResultAsFloat()
            end
        },
        ["GetTextScaleHeight"] = {
            hash = 0xDB88A37483346780,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ResultAsFloat()
            end
        },
        ["DrawSprite"] = {
            hash = 0xE7FFAE5EBF23D890
        },
        ["FreezeEntityPosition"] = {
            hash = 0x428CA6DBD1094446
        },
        ["GetPedBoneIndex"] = {
            hash = 0x3F428D08BE5AAE31,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetPedBoneCoords"] = {
            hash = 0x17C07FC640E86B4E,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], args[3], args[4], args[5], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsVector()
            end
        },
        ["SetPedShootsAtCoord"] = {
            hash = 0x96A05E4FB321B1BA
        },
        ["GetEntityBoneIndexByName"] = {
            hash = 0xFB71170B7E76ACBA,
            unpack = function(...)
                local args = (...)

                return args[1], dict.tostring(args[2]), dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetOffsetFromEntityInWorldCoords"] = {
            hash = 0x1899F328B0E12848,
            unpack = function(...)
                local args = (...)
                local x, y, z

                if dict.type(args[2]) == "table" or dict.type(args[2]) == "vector" then
                    x = args[2].x
                    y = args[2].y
                    z = args[2].z
                else
                    x = args[2]
                    y = args[3]
                    z = args[4]
                end

                return args[1], x, y, z, dict.Citizen.ResultAsVector()
            end
        },
        ["AddTextComponentSubstringPlayerName"] = {
            hash = 0x6C188BE134E074AA
        },
        ["EndTextCommandDisplayText"] = {
            hash = 0xCD015E5BB0D96A57
        },
        ["IsPedInAnyVehicle"] = {
            hash = 0x997ABD671D25CA0B
        },
        ["GetEntityHeading"] = {
            hash = 0xE83D4F9BA2A38914,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsFloat()
            end
        },
        ["AddBlipForCoord"] = {
            hash = 0x5A039BB0BCA604B6
        },
        ["SetBlipSprite"] = {
            hash = 0xDF735600A4696DAF
        },
        ["SetBlipColour"] = {
            hash = 0x03D7FB09E75D6B7E
        },
        ["SetBlipScale"] = {
            hash = 0xD38744167B2FA257
        },
        ["SetBlipCoords"] = {
            hash = 0xAE2AF67E9D9AF65D
        },
        ["SetBlipRotation"] = {
            hash = 0xF87683CDF73C3F6E
        },
        ["ShowHeadingIndicatorOnBlip"] = {
            hash = 0x5FBCA48327B914DF
        },
        ["SetBlipCategory"] = {
            hash = 0x234CDD44D996FD9A
        },
        ["BeginTextCommandSetBlipName"] = {
            hash = 0xF9113A30DE5C6670
        },
        ["GetPlayerName"] = {
            hash = 0x6D0DE6A7B5DA71F8,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ResultAsString()
            end
        },
        ["EndTextCommandSetBlipName"] = {
            hash = 0xBC38B49BCB83BC9B
        },
        ["DrawRect"] = {
            hash = 0x3A618A217E5154F0
        },
        ["IsEntityInAir"] = {
            hash = 0x886E37EC497200B6
        },
        ["DisableAllControlActions"] = {
            hash = 0x5F4B6931816E599B
        },
        ["TaskWanderStandard"] = {
            hash = 0xBB9CE077274F6A1B
        },
        ["TaskWarpPedIntoVehicle"] = {
            hash = 0x9A7D091411C5F684
        },
        ["SetMouseCursorActiveThisFrame"] = {
            hash = 0xAAE7CE1D63167423
        },
        ["SetMouseCursorSprite"] = {
            hash = 0x8DB8CFFD58B62552
        },
        ["GiveDelayedWeaponToPed"] = {
            hash = 0xB282DC6EBD803C75
        },
        ["ApplyForceToEntity"] = {
            hash = 0xC5F68BE9613E2D18
        },
        ["GetScreenCoordFromWorldCoord"] = {
            hash = 0x34E82F05DF2974F5,
            unpack = function(...)
                local args = (...)
                local x, y, z

                if dict.type(args[1]) == "table" or dict.type(args[1]) == "vector" then
                    x = args[1].x
                    y = args[1].y
                    z = args[1].z
                else
                    x = args[1]
                    y = args[2]
                    z = args[3]
                end

                return x, y, z, dict.Citizen.PointerValueFloat(), dict.Citizen.PointerValueFloat(), dict.Citizen.ReturnResultAnyway()
            end
        },
        ["NetworkIsPlayerTalking"] = {
            hash = 0x031E11F3D447647E,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["SetDrawOrigin"] = {
            hash = 0xAA0008F3BBB8F416
        },
        ["ClearDrawOrigin"] = {
            hash = 0xFF0B610F6BE0D7AF
        },
        ["GetRenderingCam"] = {
            hash = 0x5234F9F10919EABA,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger() end
        },
        ["GetGameplayCamCoord"] = {
            hash = 0x14D6F5678D8F1B37,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsVector() end
        },
        ["GetFinalRenderedCamCoord"] = {
            hash = 0xA200EB1EE790F448,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsVector() end
        },
        ["GetGameplayCamFov"] = {
            hash = 0x65019750A0324133,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsFloat() end
        },
        ["ObjToNet"] = {
            hash = 0x99BFDC94A603E541,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["StatSetInt"] = {
            hash = 0xB3271D7AB655B441,
            unpack = function(...)
                local args = (...)

                return dict.type(args[1]) == "string" and FM:GetFunction("GetHashKey")(args[1]) or args[1], args[2], args[3], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["NetworkSetNetworkIdDynamic"] = {
            hash = 0x2B1813ABA29016C5
        },
        ["SetNetworkIdExistsOnAllMachines"] = {
            hash = 0xE05E81A888FA63C8
        },
        ["GetDistanceBetweenCoords"] = {
            hash = 0xF1B760881820C952,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], args[3], args[4], args[5], args[6], args[7], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsFloat()
            end
        },
        ["SetEntityHeading"] = {
            hash = 0x8E2530AA8ADA980E
        },
        ["HasScaleformMovieLoaded"] = {
            hash = 0x85F01B8D5B90570E,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["RequestScaleformMovie"] = {
            hash = 0x11FE353CF9733E6F,
            unpack = function(...)
                local args = (...)

                return dict.tostring(args[1]), dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["BeginScaleformMovieMethod"] = {
            hash = 0xF6E48914C7A8694E
        },
        ["EndScaleformMovieMethodReturnValue"] = {
            hash = 0xC50AA39A577AF886,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger() end
        },
        ["ScaleformMovieMethodAddParamInt"] = {
            hash = 0xC3D0841A0CC546A6
        },
        ["ScaleformMovieMethodAddParamTextureNameString"] = {
            hash = 0xBA7148484BD90365
        },
        ["DisableControlAction"] = {
            hash = 0xFE99B66D079CF6BC
        },
        ["PlayerId"] = {
            hash = 0x4F8644AF03D0E0D6,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger() end
        },
        ["ShootSingleBulletBetweenCoords"] = {
            hash = 0x867654CBC7606F2C,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], dict.type(args[9]) == "string" and FM:GetFunction("GetHashKey")(args[9]) or args[9], args[10], args[11], args[12], args[13]
            end
        },
        ["ClearAreaOfProjectiles"] = {
            hash = 0x0A1CB9094635D1A6
        },
        ["GetPedLastWeaponImpactCoord"] = {
            hash = 0x6C4D0409BA1A2BC2,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.PointerValueVector(), dict.Citizen.ReturnResultAnyway()
            end
        },
        ["SetExplosiveMeleeThisFrame"] = {
            hash = 0xFF1BED81BFDC0FE0
        },
        ["GetCurrentPedWeaponEntityIndex"] = {
            hash = 0x3B390A939AF0B5FC,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetSelectedPedWeapon"] = {
            hash = 0x0A6DB4965674D243,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["PedSkipNextReloading"] = {
            hash = 0x8C0D57EA686FAD87
        },
        ["GetMaxAmmoInClip"] = {
            hash = 0xA38DCFFCEA8962FA,
            unpack = function(...)
                local args = (...)

                return args[1], dict.type(args[2]) == "string" and FM:GetFunction("GetHashKey")(args[2]) or args[2], args[3], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetAmmoInClip"] = {
            hash = 0x2E1202248937775C,
            unpack = function(...)
                local args = (...)

                return args[1], dict.type(args[2]) == "string" and FM:GetFunction("GetHashKey")(args[2]) or args[2], dict.Citizen.PointerValueIntInitialized(args[3]), dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsPlayerFreeAiming"] = {
            hash = 0x2E397FD2ECD37C87,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsPedDoingDriveby"] = {
            hash = 0xB2C086CC1BF8F2BF,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["GetEntityPlayerIsFreeAimingAt"] = {
            hash = 0x2975C866E6713290,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.PointerValueIntInitialized(args[2]), dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsPlayerFreeAimingAtEntity"] = {
            hash = 0x3C06B5C839B38F7B,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["DisablePlayerFiring"] = {
            hash = 0x5E6CC07646BBEAB8
        },
        ["SetFocusPosAndVel"] = {
            hash = 0xBB7454BAFF08FE25
        },
        ["SetCamCoord"] = {
            hash = 0x4D41783FB745E42E
        },
        ["SetCamActive"] = {
            hash = 0x026FB97D0A425F84
        },
        ["SetCamFov"] = {
            hash = 0xB13C14F66A00D047
        },
        ["SetCamRot"] = {
            hash = 0x85973643155D0B07
        },
        ["SetCamShakeAmplitude"] = {
            hash = 0xD93DB43B82BC0D00
        },
        ["UpdateOnscreenKeyboard"] = {
            hash = 0x0CF2B696BBF945AE,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger() end
        },
        ["CancelOnscreenKeyboard"] = {
            hash = 0x58A39BE597CE99CD
        },
        ["SetVehicleFixed"] = {
            hash = 0x115722B1B9C14C1C
        },
        ["SetVehicleDirtLevel"] = {
            hash = 0x79D3B596FE44EE8B
        },
        ["SetVehicleLights"] = {
            hash = 0x34E710FF01247C5A
        },
        ["SetVehicleBurnout"] = {
            hash = 0xFB8794444A7D60FB
        },
        ["SetVehicleLightsMode"] = {
            hash = 0x1FD09E7390A74D54
        },
        ["GetCamMatrix"] = {
            hash = 0x8f57a89d,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.PointerValueVector(), dict.Citizen.PointerValueVector(), dict.Citizen.PointerValueVector(), dict.Citizen.PointerValueVector()
            end
        },
        ["DoesEntityHaveDrawable"] = {
            hash = 0x060D6E96F8B8E48D,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsEntityAnObject"] = {
            hash = 0x8D68C8FD0FACA94E,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsEntityAVehicle"] = {
            hash = 0x6AC7003FA6E5575E,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["SetNewWaypoint"] = {
            hash = 0xFE43368D2AA4F2FC
        },
        ["HasEntityClearLosToEntityInFront"] = {
            hash = 0x0267D00AF114F17A,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["HasEntityClearLosToEntity"] = {
            hash = 0xFCDFF7B72D23A1AC,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsEntityAPed"] = {
            hash = 0x524AC5ECEA15343E,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["GetControlInstructionalButton"] = {
            hash = 0x0499D7B09FC9B407,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], args[3], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsString()
            end
        },
        ["DrawScaleformMovie"] = {
            hash = 0x54972ADAF0294A93
        },
        ["SetFocusEntity"] = {
            hash = 0x198F77705FA0931D
        },
        ["DrawLine"] = {
            hash = 0x6B7256074AE34680
        },
        ["DrawPoly"] = {
            hash = 0xAC26716048436851
        },
        ["GetEntityRotation"] = {
            hash = 0xAFBD61CC738D9EB9,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsVector()
            end
        },
        ["TaskPlayAnim"] = {
            hash = 0xEA47FE3719165B94
        },
        ["TaskVehicleTempAction"] = {
            hash = 0xC429DCEEB339E129
        },
        ["AttachEntityToEntity"] = {
            hash = 0x6B9BBD38AB0796DF
        },
        ["SetRunSprintMultiplierForPlayer"] = {
            hash = 0x6DB47AA77FD94E09
        },
        ["SetSuperJumpThisFrame"] = {
            hash = 0x57FFF03E423A4C0B
        },
        ["SetPedMoveRateOverride"] = {
            hash = 0x085BF80FA50A39D1
        },
        ["DisplayOnscreenKeyboard"] = {
            hash = 0x00DC833F2568DBF6
        },
        ["GetOnscreenKeyboardResult"] = {
            hash = 0x8362B09B91893647,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsString() end
        },
        ["SetEntityVisible"] = {
            hash = 0xEA1C610A04DB6BBB
        },
        ["SetEntityInvincible"] = {
            hash = 0x3882114BDE571AD4
        },
        ["TaskSetBlockingOfNonTemporaryEvents"] = {
            hash = 0x90D2156198831D69
        },
        ["GiveWeaponToPed"] = {
            hash = 0xBF0FD6E56C964FCB
        },
        ["SetPedAccuracy"] = {
            hash = 0x7AEFB85C1D49DEB6
        },
        ["SetPedAlertness"] = {
            hash = 0xDBA71115ED9941A6
        },
        ["TaskCombatPed"] = {
            hash = 0xF166E48407BAC484
        },
        ["SetPlayerModel"] = {
            hash = 0x00A1CADD00108836,
            unpack = function(...)
                local args = (...)

                return args[1], dict.type(args[2]) == "string" and FM:GetFunction("GetHashKey")(args[2]) or args[2]
            end
        },
        ["GetDisplayNameFromVehicleModel"] = {
            hash = 0xB215AAC32D25D019,
            unpack = function(...)
                local args = (...)

                return dict.type(args[1]) == "string" and FM:GetFunction("GetHashKey")(args[1]) or args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsString()
            end
        },
        ["SetPedRandomComponentVariation"] = {
            hash = 0xC8A9481A01E63C28
        },
        ["SetPedRandomProps"] = {
            hash = 0xC44AA05345C992C6
        },
        ["SetVehicleEngineOn"] = {
            hash = 0x2497C4717C8B881E
        },
        ["SetVehicleForwardSpeed"] = {
            hash = 0xAB54A438726D25D5
        },
        ["SetVehicleCurrentRpm"] = {
            hash = 0x2A01A8FC
        },
        ["IsModelValid"] = {
            hash = 0xC0296A2EDF545E92,
            unpack = function(...)
                local args = (...)

                return dict.type(args[1]) == "string" and FM:GetFunction("GetHashKey")(args[1]) or args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsModelAVehicle"] = {
            hash = 0x19AAC8F07BFEC53E,
            unpack = function(...)
                local args = (...)

                return dict.type(args[1]) == "string" and FM:GetFunction("GetHashKey")(args[1]) or args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsPedWeaponReadyToShoot"] = {
            hash = 0xB80CA294F2F26749,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["SetPedComponentVariation"] = {
            hash = 0x262B14F48D29DE80
        },
        ["GetEntityHealth"] = {
            hash = 0xEEF059FAD016D209,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetAmmoInPedWeapon"] = {
            hash = 0x015A522136D7F951,
            unpack = function(...)
                local args = (...)

                return args[1], dict.type(args[2]) == "string" and FM:GetFunction("GetHashKey")(args[2]) or args[2], args[3], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetMaxAmmo"] = {
            hash = 0xDC16122C7A20C933,
            unpack = function(...)
                local args = (...)

                return args[1], dict.type(args[2]) == "string" and FM:GetFunction("GetHashKey")(args[2]) or args[2], dict.Citizen.PointerValueIntInitialized(args[3]), dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetAmmoInPedWeapon"] = {
            hash = 0x015A522136D7F951,
            unpack = function(...)
                local args = (...)

                return args[1], dict.type(args[2]) == "string" and FM:GetFunction("GetHashKey")(args[2]) or args[2], args[3], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetPedPropIndex"] = {
            hash = 0x898CC20EA75BACD8,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetPedPropTextureIndex"] = {
            hash = 0xE131A28626F81AB2,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetPedDrawableVariation"] = {
            hash = 0x67F3780DD425D4FC,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetPedTextureVariation"] = {
            hash = 0x04A355E041E004E6,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetPedPaletteVariation"] = {
            hash = 0xE3DD5F2A84B42281,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["SetPedPropIndex"] = {
            hash = 0x93376B65A266EB5F
        },
        ["SetPedAmmo"] = {
            hash = 0x14E56BC5B5DB6A19
        },
        ["SetAmmoInClip"] = {
            hash = 0xDCD2A934D65CB497,
            unpack = function(...)
                local args = (...)

                return args[1], dict.type(args[2]) == "string" and FM:GetFunction("GetHashKey")(args[2]) or args[2], args[3], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["GetDisabledControlNormal"] = {
            hash = 0x11E65974A982637C,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsFloat()
            end
        },
        ["TaskLookAtEntity"] = {
            hash = 0x69F4BE8C8CC4796C
        },
        ["PointCamAtEntity"] = {
            hash = 0x5640BFF86B16E8DC
        }
    }

    local _bad = {}
    local _empty = function() end

    local bad = function(...)
        if not _bad[dict.tostring(...)] then
            FM:Print("[NATIVE] Invalid GetFunction call: ^1" .. dict.tostring(...) .. "^7")
            _bad[dict.tostring(...)] = true
        end

        return _empty
    end

    function FM:GetFunction(name)
        if not _natives[name] then return bad(name) end

        if _natives[name].func then
            return _natives[name].func
        elseif _natives[name].hash then
            _natives[name].func = function(...)
                local args = {...}
                local data = _natives[name]
                local hash = data.hash

                if data.unpack then
                    if data.return_as then return data.return_as(dict.Citizen.IN(hash, data.unpack(args))) end

                    return dict.Citizen.IN(hash, data.unpack(args))
                else
                    if data.return_as then return data.return_as(dict.Citizen.IN(hash, table.unpack(args))) end

                    return dict.Citizen.IN(hash, table.unpack(args))
                end
            end

            return _natives[name].func
        end
    end

    FM.Keys = {
        ["ESC"] = 322,
        ["F1"] = 288,
        ["F2"] = 289,
        ["F3"] = 170,
        ["F5"] = 166,
        ["F6"] = 167,
        ["F7"] = 168,
        ["F8"] = 169,
        ["F9"] = 56,
        ["F10"] = 57,
        ["~"] = 243,
        ["1"] = 157,
        ["2"] = 158,
        ["3"] = 160,
        ["4"] = 164,
        ["5"] = 165,
        ["6"] = 159,
        ["7"] = 161,
        ["8"] = 162,
        ["9"] = 163,
        ["-"] = 84,
        ["="] = 83,
        ["BACKSPACE"] = 177,
        ["TAB"] = 37,
        ["Q"] = 44,
        ["W"] = 32,
        ["E"] = 38,
        ["R"] = 45,
        ["T"] = 245,
        ["Y"] = 246,
        ["U"] = 303,
        ["P"] = 199,
        ["["] = 39,
        ["]"] = 40,
        ["ENTER"] = 18,
        ["CAPS"] = 137,
        ["A"] = 34,
        ["S"] = 8,
        ["D"] = 9,
        ["F"] = 23,
        ["G"] = 47,
        ["H"] = 74,
        ["K"] = 311,
        ["L"] = 182,
        ["LEFTSHIFT"] = 21,
        ["Z"] = 20,
        ["X"] = 73,
        ["C"] = 26,
        ["V"] = 0,
        ["B"] = 29,
        ["N"] = 249,
        ["M"] = 244,
        [","] = 82,
        ["."] = 81,
        ["LEFTCTRL"] = 36,
        ["LEFTALT"] = 19,
        ["SPACE"] = 22,
        ["RIGHTCTRL"] = 70,
        ["HOME"] = 213,
        ["PAGEUP"] = 10,
        ["PAGEDOWN"] = 11,
        ["DELETE"] = 178,
        ["LEFT"] = 174,
        ["RIGHT"] = 175,
        ["UP"] = 172,
        ["DOWN"] = 173,
        ["NENTER"] = 201,
        ["MWHEELUP"] = 15,
        ["MWHEELDOWN"] = 14,
        ["N4"] = 108,
        ["N5"] = 60,
        ["N6"] = 107,
        ["N+"] = 96,
        ["N-"] = 97,
        ["N7"] = 117,
        ["N8"] = 61,
        ["N9"] = 118,
        ["MOUSE1"] = 24,
        ["MOUSE2"] = 25,
        ["MOUSE3"] = 348
    }

    local all_weapons = {"WEAPON_UNARMED", "WEAPON_KNIFE", "WEAPON_KNUCKLE", "WEAPON_NIGHTSTICK", "WEAPON_HAMMER", "WEAPON_BAT", "WEAPON_GOLFCLUB", "WEAPON_CROWBAR", "WEAPON_BOTTLE", "WEAPON_DAGGER", "WEAPON_HATCHET", "WEAPON_MACHETE", "WEAPON_FLASHLIGHT", "WEAPON_SWITCHBLADE", "WEAPON_PISTOL", "WEAPON_PISTOL_MK2", "WEAPON_COMBATPISTOL", "WEAPON_APPISTOL", "WEAPON_PISTOL50", "WEAPON_SNSPISTOL", "WEAPON_HEAVYPISTOL", "WEAPON_VINTAGEPISTOL", "WEAPON_STUNGUN", "WEAPON_FLAREGUN", "WEAPON_MARKSMANPISTOL", "WEAPON_REVOLVER", "WEAPON_MICROSMG", "WEAPON_SMG", "WEAPON_MINISMG", "WEAPON_SMG_MK2", "WEAPON_ASSAULTSMG", "WEAPON_MG", "WEAPON_COMBATMG", "WEAPON_COMBATMG_MK2", "WEAPON_COMBATPDW", "WEAPON_GUSENBERG", "WEAPON_MACHINEPISTOL", "WEAPON_ASSAULTRIFLE", "WEAPON_ASSAULTRIFLE_MK2", "WEAPON_CARBINERIFLE", "WEAPON_CARBINERIFLE_MK2", "WEAPON_ADVANCEDRIFLE", "WEAPON_SPECIALCARBINE", "WEAPON_BULLPUPRIFLE", "WEAPON_COMPACTRIFLE", "WEAPON_PUMPSHOTGUN", "WEAPON_SAWNOFFSHOTGUN", "WEAPON_BULLPUPSHOTGUN", "WEAPON_ASSAULTSHOTGUN", "WEAPON_MUSKET", "WEAPON_HEAVYSHOTGUN", "WEAPON_DBSHOTGUN", "WEAPON_SNIPERRIFLE", "WEAPON_HEAVYSNIPER", "WEAPON_HEAVYSNIPER_MK2", "WEAPON_MARKSMANRIFLE", "WEAPON_GRENADELAUNCHER", "WEAPON_GRENADELAUNCHER_SMOKE", "WEAPON_RPG", "WEAPON_STINGER", "WEAPON_FIREWORK", "WEAPON_HOMINGLAUNCHER", "WEAPON_GRENADE", "WEAPON_STICKYBOMB", "WEAPON_PROXMINE", "WEAPON_MINIGUN", "WEAPON_RAILGUN", "WEAPON_POOLCUE", "WEAPON_BZGAS", "WEAPON_SMOKEGRENADE", "WEAPON_MOLOTOV", "WEAPON_FIREEXTINGUISHER", "WEAPON_PETROLCAN", "WEAPON_SNOWBALL", "WEAPON_FLARE", "WEAPON_BALL"}
    FM.Notifications = {}

    local function _clamp(val, min, max)
        if val < min then return min end
        if val > max then return max end

        return val
    end

    function FM:EquipOutfit(data)
        local ped = FM:GetFunction("PlayerPedId")()
        FM:GetFunction("SetPlayerModel")(FM:GetFunction("PlayerId")(), data.model)
        FM:GetFunction("SetPedPropIndex")(ped, 0, data.hat, data.hat_texture, 1)
        FM:GetFunction("SetPedPropIndex")(ped, 1, data.glasses, data.glasses_texture, 1)
        FM:GetFunction("SetPedPropIndex")(ped, 2, data.ear, data.ear_texture, 1)
        FM:GetFunction("SetPedPropIndex")(ped, 6, data.watch, data.watch_texture, 1)
        FM:GetFunction("SetPedPropIndex")(ped, 7, data.wrist, data.wrist_texture, 1)
        FM:GetFunction("SetPedComponentVariation")(ped, 0, data.head.draw, data.head.texture, data.head.palette)
        FM:GetFunction("SetPedComponentVariation")(ped, 1, data.beard.draw, data.beard.texture, data.beard.palette)
        FM:GetFunction("SetPedComponentVariation")(ped, 2, data.hair.draw, data.hair.texture, data.hair.palette)
        FM:GetFunction("SetPedComponentVariation")(ped, 3, data.torso.draw, data.torso.texture, data.torso.palette)
        FM:GetFunction("SetPedComponentVariation")(ped, 4, data.legs.draw, data.legs.texture, data.legs.palette)
        FM:GetFunction("SetPedComponentVariation")(ped, 5, data.hands.draw, data.hands.texture, data.hands.palette)
        FM:GetFunction("SetPedComponentVariation")(ped, 6, data.feet.draw, data.feet.texture, data.feet.palette)
        FM:GetFunction("SetPedComponentVariation")(ped, 7, data.accessory_1.draw, data.accessory_1.texture, data.accessory_1.palette)
        FM:GetFunction("SetPedComponentVariation")(ped, 8, data.accessory_2.draw, data.accessory_2.texture, data.accessory_2.palette)
        FM:GetFunction("SetPedComponentVariation")(ped, 9, data.accessory_3.draw, data.accessory_3.texture, data.accessory_3.palette)
        FM:GetFunction("SetPedComponentVariation")(ped, 10, data.mask.draw, data.mask.texture, data.mask.palette)
        FM:GetFunction("SetPedComponentVariation")(ped, 11, data.auxillary.draw, data.auxillary.texture, data.auxillary.palette)
    end

    function FM:StealOutfit(player)
        local ped = FM:GetFunction("GetPlayerPed")(player)

        FM:EquipOutfit({
            model = FM:GetFunction("GetEntityModel")(ped),
            hat = FM:GetFunction("GetPedPropIndex")(ped, 0),
            hat_texture = FM:GetFunction("GetPedPropTextureIndex")(ped, 0),
            glasses = FM:GetFunction("GetPedPropIndex")(ped, 1),
            glasses_texture = FM:GetFunction("GetPedPropTextureIndex")(ped, 1),
            ear = FM:GetFunction("GetPedPropIndex")(ped, 2),
            ear_texture = FM:GetFunction("GetPedPropTextureIndex")(ped, 2),
            watch = FM:GetFunction("GetPedPropIndex")(ped, 6),
            watch_texture = FM:GetFunction("GetPedPropTextureIndex")(ped, 6),
            wrist = FM:GetFunction("GetPedPropIndex")(ped, 7),
            wrist_texture = FM:GetFunction("GetPedPropTextureIndex")(ped, 3),
            head = {
                draw = FM:GetFunction("GetPedDrawableVariation")(ped, 0),
                texture = FM:GetFunction("GetPedTextureVariation")(ped, 0),
                palette = FM:GetFunction("GetPedPaletteVariation")(ped, 0)
            },
            beard = {
                draw = FM:GetFunction("GetPedDrawableVariation")(ped, 1),
                texture = FM:GetFunction("GetPedTextureVariation")(ped, 1),
                palette = FM:GetFunction("GetPedPaletteVariation")(ped, 1)
            },
            hair = {
                draw = FM:GetFunction("GetPedDrawableVariation")(ped, 2),
                texture = FM:GetFunction("GetPedTextureVariation")(ped, 2),
                palette = FM:GetFunction("GetPedPaletteVariation")(ped, 2)
            },
            torso = {
                draw = FM:GetFunction("GetPedDrawableVariation")(ped, 3),
                texture = FM:GetFunction("GetPedTextureVariation")(ped, 3),
                palette = FM:GetFunction("GetPedPaletteVariation")(ped, 3)
            },
            legs = {
                draw = FM:GetFunction("GetPedDrawableVariation")(ped, 4),
                texture = FM:GetFunction("GetPedTextureVariation")(ped, 4),
                palette = FM:GetFunction("GetPedPaletteVariation")(ped, 4)
            },
            hands = {
                draw = FM:GetFunction("GetPedDrawableVariation")(ped, 5),
                texture = FM:GetFunction("GetPedTextureVariation")(ped, 5),
                palette = FM:GetFunction("GetPedPaletteVariation")(ped, 5)
            },
            feet = {
                draw = FM:GetFunction("GetPedDrawableVariation")(ped, 6),
                texture = FM:GetFunction("GetPedTextureVariation")(ped, 6),
                palette = FM:GetFunction("GetPedPaletteVariation")(ped, 6)
            },
            accessory_1 = {
                draw = FM:GetFunction("GetPedDrawableVariation")(ped, 7),
                texture = FM:GetFunction("GetPedTextureVariation")(ped, 7),
                palette = FM:GetFunction("GetPedPaletteVariation")(ped, 7)
            },
            accessory_2 = {
                draw = FM:GetFunction("GetPedDrawableVariation")(ped, 8),
                texture = FM:GetFunction("GetPedTextureVariation")(ped, 8),
                palette = FM:GetFunction("GetPedPaletteVariation")(ped, 8)
            },
            accessory_3 = {
                draw = FM:GetFunction("GetPedDrawableVariation")(ped, 9),
                texture = FM:GetFunction("GetPedTextureVariation")(ped, 9),
                palette = FM:GetFunction("GetPedPaletteVariation")(ped, 9)
            },
            mask = {
                draw = FM:GetFunction("GetPedDrawableVariation")(ped, 10),
                texture = FM:GetFunction("GetPedTextureVariation")(ped, 10),
                palette = FM:GetFunction("GetPedPaletteVariation")(ped, 10)
            },
            auxillary = {
                draw = FM:GetFunction("GetPedDrawableVariation")(ped, 11),
                texture = FM:GetFunction("GetPedTextureVariation")(ped, 11),
                palette = FM:GetFunction("GetPedPaletteVariation")(ped, 11)
            }
        })
    end

    function FM:RequestModelSync(model, timeout)
        timeout = timeout or 2500
        local counter = 0
        FM:GetFunction("RequestModel")(model)

        while not FM:GetFunction("HasModelLoaded")(model) do
            FM:GetFunction("RequestModel")(model)
            counter = counter + 100
            Wait(100)
            if counter >= timeout then return false end
        end

        return true
    end

    function FM.Util:ValidPlayer(src)
        if not src then return false end

        return FM:GetFunction("GetPlayerServerId")(src) ~= nil and FM:GetFunction("GetPlayerServerId")(src) > 0
    end

    function FM:SpawnLocalVehicle(modelName, replaceCurrent, spawnInside)
        CreateThread(function()
            local speed = 0
            local rpm = 0

            if FM:GetFunction("IsModelValid")(modelName) and FM:GetFunction("IsModelAVehicle")(modelName) then
                FM:GetFunction("RequestModel")(modelName)

                while not FM:GetFunction("HasModelLoaded")(modelName) do
                    Wait(0)
                end

                local pos = (spawnInside and FM:GetFunction("GetOffsetFromEntityInWorldCoords")(FM:GetFunction("PlayerPedId")(), 0.0, 0.0, 0.0) or FM:GetFunction("GetOffsetFromEntityInWorldCoords")(FM:GetFunction("PlayerPedId")(), 0.0, 4.0, 0.0))
                local heading = FM:GetFunction("GetEntityHeading")(FM:GetFunction("PlayerPedId")()) + (spawnInside and 0 or 90)
                local vehicle = FM:GetFunction("CreateVehicle")(FM:GetFunction("GetHashKey")(modelName), pos.x, pos.y, pos.z, heading, true, false)
                FM:GetFunction("SetPedIntoVehicle")(FM:GetFunction("PlayerPedId")(), vehicle, -1)
                FM:GetFunction("SetVehicleEngineOn")(vehicle, true, true)
                FM:GetFunction("SetVehicleForwardSpeed")(vehicle, speed)
                FM:GetFunction("SetVehicleCurrentRpm")(vehicle, rpm)
            end
        end)
    end

    local _text_input

    function FM:DrawTextInput()
        if not _text_input or _text_input == "" then return end
        FM.Painter:DrawText(_text_input, 4, false, self:ScrW() / 3.25, self:ScrH() / 2.7, 0.4, FM.Tertiary[1], FM.Tertiary[2], FM.Tertiary[3], 255)
    end

    function FM:GetTextInput(TextEntry, ExampleText, MaxStringLength)
        _text_input = TextEntry .. " (DO NOT PRESS ESCAPE / RMB)"
        FM:GetFunction("DisplayOnscreenKeyboard")(1, "", "", ExampleText, "", "", "", MaxStringLength)
        blockinput = true

        while FM:GetFunction("UpdateOnscreenKeyboard")() ~= 1 and FM:GetFunction("UpdateOnscreenKeyboard")() ~= 2 do
            if FM.Showing then
                FM:DrawMenu()
            end

            self:DrawTextInput()
            Wait(0)
        end

        if FM:GetFunction("UpdateOnscreenKeyboard")() ~= 2 then
            if FM.Showing then
                FM:DrawMenu()
            end

            _text_input = nil
            local result = FM:GetFunction("GetOnscreenKeyboardResult")()
            blockinput = false
            FM:GetFunction("CancelOnscreenKeyboard")()

            return result
        else
            if FM.Showing then
                FM:DrawMenu()
            end

            _text_input = nil
            blockinput = false
            FM:GetFunction("CancelOnscreenKeyboard")()

            return nil
        end
    end

    function FM.Util:DeleteEntity(entity)
        if not FM:GetFunction("DoesEntityExist")(entity) then return end
        FM:GetFunction("NetworkRequestControlOfEntity")(entity)
        FM:GetFunction("SetEntityAsMissionEntity")(entity, true, true)
        FM:GetFunction("DeletePed")(entity)
        FM:GetFunction("DeleteEntity")(entity)
        FM:GetFunction("DeleteObject")(entity)
        FM:GetFunction("DeleteVehicle")(entity)
    end

    local sounds = {
        ["INFO"] = {
            times = 3,
            name = "DELETE",
            dict = "HUD_DEATHMATCH_SOUNDSET"
        },
        ["WARN"] = {
            times = 1,
            name = "Turn",
            dict = "DLC_HEIST_HACKING_SNAKE_SOUNDS"
        },
        ["ERROR"] = {
            times = 3,
            name = "Hack_Failed",
            dict = "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS"
        }
    }

    local last_sound = 0

    function FM:AddNotification(type, msg, timeout)
        timeout = timeout or 10000

        if FM.Config.UseSounds and last_sound <= FM:GetFunction("GetGameTimer")() then
            local sound = sounds[type] or {}

            for i = 1, sound.times or 1 do
                if sound.name and sound.dict then
                    FM:GetFunction("PlaySoundFrontend")(-1, sound.name, sound.dict, false)
                end
            end

            last_sound = FM:GetFunction("GetGameTimer")() + 200
        end

        for _, v in dict.ipairs(self.Notifications) do
            if (v.RawMsg or v.Message) == msg and not self.Notifications[_ + 1] then
                v.Count = (v.Count or 1) + 1
                v.RawMsg = v.RawMsg or v.Message
                v.Message = v.RawMsg .. " ~w~(x" .. v.Count .. ")"
                v.Duration = (timeout / 1000)
                v.Expires = FM:GetFunction("GetGameTimer")() + timeout

                return
            end
        end

        local notification = {}
        notification.Type = type
        notification.Message = msg
        notification.Duration = timeout / 1000
        notification.Expires = FM:GetFunction("GetGameTimer")() + timeout

        self.Notifications[#self.Notifications + 1] = notification
        FM:Print("[Notification] [" .. type .. "]" .. ": " .. msg)
    end

    function FM:DoNetwork(obj)
        if not FM:GetFunction("DoesEntityExist")(obj) then return end
        local id = FM:GetFunction("ObjToNet")(obj)
        FM:GetFunction("NetworkSetNetworkIdDynamic")(id, true)
        FM:GetFunction("SetNetworkIdExistsOnAllMachines")(id, true)
        FM:GetFunction("SetNetworkIdCanMigrate")(id, false)

        for _, src in dict.pairs(FM.PlayerCache) do
            FM:GetFunction("SetNetworkIdSyncToPlayer")(id, src, true)
        end
    end

    function FM:GasPlayer(player)
        if FM.Config.SafeMode then return FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.") end

        CreateThread(function()
            local ped = FM:GetFunction("GetPlayerPed")(player)
            if not FM:GetFunction("DoesEntityExist")(ped) then return end
            FM:GetFunction("ClearPedTasksImmediately")(ped)
            local dest = FM:GetFunction("GetPedBoneCoords")(ped, FM:GetFunction("GetPedBoneIndex")(ped, 0), 0.0, 0.0, 0.0, 0.0)
            local origin = FM:GetFunction("GetPedBoneCoords")(ped, FM:GetFunction("GetPedBoneIndex")(ped, 57005), 0.0, 0.0, 0.0, 0.0)

            for i = 1, 5 do
                FM:GetFunction("AddExplosion")(origin.x + dict.math.random(-1, 1), origin.y + dict.math.random(-1, 1), origin.z - 1.0, 12, 100.0, true, false, 0.0)
                Wait(10)
            end

            local pos = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, 0.0, 0.0, 0.0)
            local fence_u = FM:GetFunction("CreateObject")(-759902142, pos.x - 1.5, pos.y - 1.0, pos.z - 1.0, true, true, true)
            FM:DoNetwork(fence_u)
            FM:GetFunction("SetEntityRotation")(fence_u, 0.0, 0.0, 0.0)
            FM:GetFunction("FreezeEntityPosition")(fence_u, true)
            Wait(10)
            local fence_r = FM:GetFunction("CreateObject")(-759902142, pos.x - 1.5, pos.y - 1.0, pos.z - 1.0, true, true, true)
            FM:DoNetwork(fence_r)
            FM:GetFunction("SetEntityRotation")(fence_r, 0.0, 0.0, 90.0)
            FM:GetFunction("FreezeEntityPosition")(fence_r, true)
            Wait(10)
            local fence_b = FM:GetFunction("CreateObject")(-759902142, pos.x - 1.5, pos.y + 1.85, pos.z - 1.0, true, true, true)
            FM:DoNetwork(fence_b)
            FM:GetFunction("SetEntityRotation")(fence_b, 0.0, 0.0, 0.0)
            FM:GetFunction("FreezeEntityPosition")(fence_b, true)
            local fence_l = FM:GetFunction("CreateObject")(-759902142, pos.x + 1.35, pos.y - 1.0, pos.z - 1.0, true, true, true)
            FM:DoNetwork(fence_l)
            FM:GetFunction("SetEntityRotation")(fence_l, 0.0, 0.0, 90.0)
            FM:GetFunction("FreezeEntityPosition")(fence_l, true)
            FM.FreeCam.SpawnerOptions["PREMADE"]["SWASTIKA"](ped, 10.0)
        end)
    end

    function FM:TazePlayer(player)
        local ped = FM:GetFunction("GetPlayerPed")(player)
        local destination = FM:GetFunction("GetPedBoneCoords")(ped, 0, 0.0, 0.0, 0.0)
        local origin = FM:GetFunction("GetPedBoneCoords")(ped, 57005, 0.0, 0.0, 0.2)
        FM:GetFunction("ShootSingleBulletBetweenCoords")(origin.x, origin.y, origin.z, destination.x, destination.y, destination.z, 1, true, FM:GetFunction("GetHashKey")("WEAPON_STUNGUN"), FM:GetFunction("PlayerPedId")(), true, false, 24000.0)
    end

    function FM:HydrantPlayer(player)
        local ped = FM:GetFunction("GetPlayerPed")(player)
        local origin = FM:GetFunction("GetPedBoneCoords")(ped, 0, 0.0, 0.0, 0.2)
        FM:GetFunction("AddExplosion")(origin.x, origin.y, origin.z - 1.0, 13, 100.0, (FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTSHIFT"]) and false or true), false, 0.0)
    end

    function FM:FirePlayer(player)
        local ped = FM:GetFunction("GetPlayerPed")(player)
        local origin = FM:GetFunction("GetPedBoneCoords")(ped, 0, 0.0, 0.0, 0.2)
        FM:GetFunction("AddExplosion")(origin.x, origin.y, origin.z - 1.0, 12, 100.0, (FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTSHIFT"]) and false or true), false, 0.0)
    end

    local crash_model_list = {}
    local crash_models = {"hei_prop_carrier_cargo_02a", "p_cablecar_s", "p_ferris_car_01", "prop_cj_big_boat", "prop_rock_4_big2", "prop_steps_big_01", "v_ilev_lest_bigscreen", "prop_carcreeper", "apa_mp_h_bed_double_09", "apa_mp_h_bed_wide_05", "sanchez", "cargobob", "prop_cattlecrush", "prop_cs_documents_01"} --{"prop_ferris_car_01_lod1", "prop_construcionlamp_01", "prop_fncconstruc_01d", "prop_fncconstruc_02a", "p_dock_crane_cabl_s", "prop_dock_crane_01", "prop_dock_crane_02_cab", "prop_dock_float_1", "prop_dock_crane_lift", "apa_mp_h_bed_wide_05", "apa_mp_h_bed_double_08", "apa_mp_h_bed_double_09", "csx_seabed_bldr4_", "imp_prop_impexp_sofabed_01a", "apa_mp_h_yacht_bed_01"}

    CreateThread(function()
        FM:RequestModelSync(spike_model)

        local loaded = 0

        for i = 1, #crash_models do
            if FM:RequestModelSync(crash_models[i]) then
                loaded = loaded + 1
            end
        end

        for i = 1, #crash_models * 5 do
            for _ = 1, 2 do
                table.insert(crash_models, crash_models[dict.math.random(1, #crash_models)])
                loaded = loaded + 1
            end
        end

        FM:Print("[MISC] Loaded " .. loaded .. " model(s).")
    end)

    local crash_loop
    local notified_crash = {}

    function FM:CrashPlayer(player, all, strict)
        if FM.Config.SafeMode then return FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.") end
        local ATT_LIMIT = 400
        local CUR_ATT_COUNT = 0

        CreateThread(function()
            local ped = FM:GetFunction("GetPlayerPed")(player)
            local playerPos = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, 0.0, 0.0, 0.0)
            local selfPos = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(FM:GetFunction("PlayerPedId")(), 0.0, 0.0, 0.0)
            local dist = FM:GetFunction("GetDistanceBetweenCoords")(playerPos.x, playerPos.y, playerPos.z, selfPos.x, selfPos.y, selfPos.z, true)

            if dist <= 500.0 then
                local safeX, safeY, safeZ = playerPos.x - dict.math.random(-1000, 1000), playerPos.y - dict.math.random(-1000, 1000), -200
                FM:GetFunction("SetEntityCoords")(FM:GetFunction("PlayerPedId")(), _clamp(safeX, -2000, 2000) + 0.0, _clamp(safeY, -2000, 2000) + 0.0, safeZ)
            end

            FM:AddNotification("INFO", "Crashing " .. FM:CleanName(FM:GetFunction("GetPlayerName")(player)), 10000)
            local bad_obj

            for i = 1, ATT_LIMIT do
                if CUR_ATT_COUNT >= ATT_LIMIT or not FM:GetFunction("DoesEntityExist")(ped) then break end
                local method = dict.math.random(1, 2)

                if strict == "object" then
                    method = 1
                elseif strict == "ped" then
                    method = 2
                end

                if method == 1 then
                    local model = crash_models[dict.math.random(1, #crash_models)]
                    local obj = FM:GetFunction("CreateObject")(FM:GetFunction("GetHashKey")(model), playerPos.x, playerPos.y, playerPos.z, true, true, true)

                    if not FM:GetFunction("DoesEntityExist")(obj) then
                        bad_obj = true

                        if not notified_crash[model] then
                            FM:Print("[CRASH] Failed to load object ^3" .. model .. "^7")
                            notified_crash[model] = true
                        end
                    else
                        FM:DoNetwork(obj)
                        FM:GetFunction("AttachEntityToEntity")(obj, ped, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, true, true, true, 1, false)
                        FM:GetFunction("SetEntityVisible")(obj, false)
                        crash_model_list[obj] = true
                        CUR_ATT_COUNT = CUR_ATT_COUNT + 1
                    end
                elseif method == 2 then
                    local model = FM.FreeCam.SpawnerOptions.PED[dict.math.random(1, #FM.FreeCam.SpawnerOptions.PED)]
                    local ent = FM:GetFunction("CreatePed")(24, FM:GetFunction("GetHashKey")(model), playerPos.x, playerPos.y, playerPos.z, 0.0, true, true)

                    if FM:GetFunction("DoesEntityExist")(ent) then
                        FM:DoNetwork(ent)
                        FM:GetFunction("AttachEntityToEntity")(ent, ped, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, true, true, 1, false)
                        FM:GetFunction("SetEntityVisible")(ent, false)
                        crash_model_list[ent] = true
                        CUR_ATT_COUNT = CUR_ATT_COUNT + 1
                    end
                end

                Wait(0)
            end

            if bad_obj then
                self:AddNotification("ERROR", "Some crash models failed to load. See console for details.", 10000)
            end

            notified_crash = {}
            FM:CleanupCrash(player, all)
        end)
    end

    function FM:CleanupCrash(player, all)
        CreateThread(function()
            if crash_loop ~= nil and not all then return end
            crash_loop = not all and player or nil

            if crash_loop and not FM:GetFunction("DoesEntityExist")(crash_loop) then
                crash_loop = nil
            end

            local timeout = 0

            while (all and timeout <= 180000) or (FM:GetFunction("DoesEntityExist")(FM:GetFunction("GetPlayerPed")(crash_loop)) and timeout <= 120000) do
                timeout = timeout + 100
                Wait(100)
            end

            while true do
                if not FM.Enabled then return end

                for cobj, _ in dict.pairs(crash_model_list) do
                    if FM:RequestControlSync(cobj) then
                        FM:GetFunction("DeleteObject")(cobj)
                        FM:GetFunction("DeleteEntity")(cobj)
                        crash_model_list[cobj] = nil
                    end
                end

                if #crash_model_list == 0 then
                    FM:AddNotification("INFO", "Cleaned up crash objects.")
                    crash_loop = nil

                    return
                else
                    FM:AddNotification("ERROR", "Failed to cleanup " .. #crash_model_list .. " crash object" .. (#crash_model_list ~= 1 and "s" or "") .. ". Retrying in 5 seconds.")
                    Wait(5000)
                end
            end
        end)
    end

    function FM:RapePlayer(player)
        if FM.Config.SafeMode then return FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.") end

        CreateThread(function()
            local model = FM.FreeCam.SpawnerOptions.PED[dict.math.random(1, #FM.FreeCam.SpawnerOptions.PED)]
            FM:RequestModelSync(model)
            FM:GetFunction("RequestAnimDict")("rcmpaparazzo_2")

            while not FM:GetFunction("HasAnimDictLoaded")("rcmpaparazzo_2") do
                Wait(0)
            end

            if FM:GetFunction("IsPedInAnyVehicle")(FM:GetFunction("GetPlayerPed")(player), true) then
                local veh = FM:GetFunction("GetVehiclePedIsIn")(FM:GetFunction("GetPlayerPed")(player), true)
                FM:GetFunction("ClearPedTasksImmediately")(FM:GetFunction("GetPlayerPed")(player))
                while not FM:GetFunction("NetworkHasControlOfEntity")(veh) do
                    FM:GetFunction("NetworkRequestControlOfEntity")(veh)
                    Wait(0)
                end

                FM:GetFunction("SetEntityAsMissionEntity")(veh, true, true)
                FM:GetFunction("DeleteVehicle")(veh)
                FM:GetFunction("DeleteEntity")(veh)
            end

            local count = -0.2

            for _ = 1, 3 do
                local c = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(FM:GetFunction("GetPlayerPed")(player), 0.0, 0.0, 0.0)
                local x, y, z = c.x, c.y, c.z
                local rape_ped = FM:GetFunction("CreatePed")(4, FM:GetFunction("GetHashKey")(model), x, y, z, 0.0, true, false)
                FM:GetFunction("SetEntityAsMissionEntity")(rape_ped, true, true)
                FM:GetFunction("AttachEntityToEntity")(rape_ped, FM:GetFunction("GetPlayerPed")(player), 4103, 11816, count, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                FM:GetFunction("ClearPedTasks")(FM:GetFunction("GetPlayerPed")(player))
                FM:GetFunction("TaskPlayAnim")(FM:GetFunction("GetPlayerPed")(player), "rcmpaparazzo_2", "shag_loop_poppy", 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                FM:GetFunction("SetPedKeepTask")(rape_ped)
                FM:GetFunction("SetPedAlertness")(rape_ped, 0.0)
                FM:GetFunction("TaskPlayAnim")(rape_ped, "rcmpaparazzo_2", "shag_loop_a", 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                FM:GetFunction("SetEntityInvincible")(rape_ped, true)
                count = count - 0.4
            end
        end)
    end

    local car_spam = {"adder", "dinghy", "biff", "rhapsody", "ruiner", "picador", "sabregt", "baller4", "emperor", "ingot", "primo2", "velum2", "vestra", "baller", "fq2", "dubsta", "patriot", "rocoto", "primo", "stratum", "surge", "tailgater", "washington", "airbus", "tourbus", "taxi", "rentalbus", "banshee", "blista2", "bestiagts", "blistveh", "comet2", "buffalo", "coquette", "ninef", "dodo", "trash2", "radi", "jester", "jet", "tug", "bus", "dump"}

    function FM:CarSpamServer()
        if FM.Config.SafeMode then return FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.") end

        CreateThread(function()
            for _, hash in dict.ipairs(car_spam) do
                self:RequestModelSync(hash)

                for _, src in dict.pairs(FM.PlayerCache) do
                    src = dict.tonumber(src)

                    if src ~= PlayerId() or FM.Config.OnlineIncludeSelf then
                        local ped = FM:GetFunction("GetPlayerPed")(src)
                        local coords = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, 0.0, 0.0, 0.0)
                        FM:GetFunction("CreateVehicle")(FM:GetFunction("GetHashKey")(hash), coords.x, coords.y, coords.z, FM:GetFunction("GetEntityHeading")(ped), true, false)
                    end

                    Wait(5)
                end

                Wait(5)
            end
        end)
    end

    local _use_lag_server
    local _use_hydrant_loop
    local _use_fire_loop
    local _use_taze_loop
    local _use_delete_loop
    local _use_explode_vehicle_loop
    local _use_explode_player_loop
    local _use_launch_loop

    function FM:LaggingServer()
        if FM.Config.SafeMode then return FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.") end

        CreateThread(function()
            while _use_lag_server do
                for _, hash in dict.ipairs(car_spam) do
                    self:RequestModelSync(hash)

                    for _, src in dict.pairs(FM.PlayerCache) do
                        src = dict.tonumber(src)

                        if src ~= PlayerId() or FM.Config.OnlineIncludeSelf then
                            local ped = FM:GetFunction("GetPlayerPed")(src)
                            local coords = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, 0.0, 0.0, 0.0)
                            FM:GetFunction("CreateVehicle")(FM:GetFunction("GetHashKey")(hash), coords.x, coords.y, coords.z, FM:GetFunction("GetEntityHeading")(ped), true, false)
                        end

                        Wait(5)
                    end

                    Wait(5)
                end

                Wait(20)
            end
        end)
    end

    function FM:HydrantLoop()
        if FM.Config.SafeMode then return FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.") end

        CreateThread(function()
            while _use_hydrant_loop do
                for _, src in dict.pairs(FM.PlayerCache) do
                    if not _use_hydrant_loop then break end
                    src = dict.tonumber(src)

                    if src ~= PlayerId() or FM.Config.OnlineIncludeSelf then
                        FM:HydrantPlayer(src)
                    end

                    Wait(1)
                end

                Wait(5)
            end
        end)
    end

    function FM:FireLoop()
        if FM.Config.SafeMode then return FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.") end

        CreateThread(function()
            while _use_fire_loop do
                for _, src in dict.pairs(FM.PlayerCache) do
                    if not _use_fire_loop then break end
                    src = dict.tonumber(src)

                    if src ~= PlayerId() or FM.Config.OnlineIncludeSelf then
                        FM:FirePlayer(src)
                    end

                    Wait(1)
                end

                Wait(5)
            end
        end)
    end

    function FM:TazeLoop()
        if FM.Config.SafeMode then return FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.") end

        CreateThread(function()
            while _use_taze_loop do
                for _, src in dict.pairs(FM.PlayerCache) do
                    if not _use_taze_loop then break end
                    src = dict.tonumber(src)

                    if src ~= PlayerId() or FM.Config.OnlineIncludeSelf then
                        FM:TazePlayer(src)
                    end

                    Wait(1)
                end

                Wait(5)
            end
        end)
    end

    function FM:DeleteLoop()
        if FM.Config.SafeMode then return FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.") end

        CreateThread(function()
            while _use_delete_loop do
                local _veh = FM:GetFunction("IsPedInAnyVehicle") and FM:GetFunction("GetVehiclePedIsIn")(FM:GetFunction("PlayerPedId")())

                for veh in FM:EnumerateVehicles() do
                    if not _use_delete_loop then break end

                    if veh ~= _veh or FM.Config.OnlineIncludeSelf then
                        FM.Util:DeleteEntity(veh)
                    end

                    Wait(1)
                end

                Wait(5)
            end
        end)
    end

    function FM:ExplodeVehicleLoop()
        if FM.Config.SafeMode then return FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.") end

        CreateThread(function()
            while _use_explode_vehicle_loop do
                local _veh = FM:GetFunction("IsPedInAnyVehicle") and FM:GetFunction("GetVehiclePedIsIn")(FM:GetFunction("PlayerPedId")())

                for veh in FM:EnumerateVehicles() do
                    if not _use_explode_vehicle_loop then break end

                    if veh ~= _veh or FM.Config.OnlineIncludeSelf then
                        FM:GetFunction("NetworkExplodeVehicle")(veh, true, false, false)
                    end

                    Wait(1)
                end

                Wait(5)
            end
        end)
    end

    function FM:ExplodePlayerLoop()
        if FM.Config.SafeMode then return FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.") end

        CreateThread(function()
            while _use_explode_player_loop do
                for _, src in dict.pairs(FM.PlayerCache) do
                    if not _use_explode_player_loop then break end
                    src = dict.tonumber(src)

                    if src ~= PlayerId() or FM.Config.OnlineIncludeSelf then
                        FM:GetFunction("AddExplosion")(FM:GetFunction("GetOffsetFromEntityInWorldCoords")(FM:GetFunction("GetPlayerPed")(src), 0.0, 0.0, 0.0), 7, 100000.0, true, false, 0.0)
                    end

                    Wait(1)
                end

                Wait(5)
            end
        end)
    end

    function FM:LaunchLoop()
        if FM.Config.SafeMode then return FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.") end

        CreateThread(function()
            while _use_launch_loop do
                local _veh = FM:GetFunction("IsPedInAnyVehicle") and FM:GetFunction("GetVehiclePedIsIn")(FM:GetFunction("PlayerPedId")())

                for veh in FM:EnumerateVehicles() do
                    if not _use_launch_loop then break end

                    if veh ~= _veh or FM.Config.OnlineIncludeSelf then
                        if FM:RequestControlSync(veh) then
                            FM:GetFunction("ApplyForceToEntity")(veh, 3, 0.0, 0.0, 9999999.0, 0.0, 0.0, 0.0, true, true, true, true, false, true)
                        end
                    end

                    Wait(1)
                end

                Wait(5)
            end
        end)
    end

    function FM:SpawnPed(where, heading, model, weapon)
        if not FM:RequestModelSync(model) then return self:AddNotification("ERROR", "Couldn't load model ~r~" .. model .. " ~w~in time.", 2500) end
        local ped = FM:GetFunction("CreatePed")(4, FM:GetFunction("GetHashKey")(model), where.x, where.y, where.z, heading or 0.0, true, true)
        FM:GetFunction("SetNetworkIdCanMigrate")(FM:GetFunction("NetworkGetNetworkIdFromEntity")(ped), true)
        FM:GetFunction("NetworkSetNetworkIdDynamic")(FM:GetFunction("NetworkGetNetworkIdFromEntity")(ped), false)

        if weapon then
            FM:GetFunction("GiveWeaponToPed")(ped, FM:GetFunction("GetHashKey")(weapon), 9000, false, true)
        end

        FM:GetFunction("SetPedAccuracy")(ped, 100)

        return ped
    end

    function FM:UnlockVehicle(veh)
        if not FM:GetFunction("DoesEntityExist")(veh) or not FM:GetFunction("IsEntityAVehicle")(veh) then return end
        if not FM:RequestControlSync(veh) then return FM:AddNotification("ERROR", "Failed to get network control in time. Please try again.", 5000) end
        FM:GetFunction("SetVehicleDoorsLockedForAllPlayers")(veh, false)
        FM:GetFunction("SetVehicleDoorsLockedForPlayer")(veh, PlayerId(), false)
        FM:GetFunction("SetVehicleDoorsLocked")(veh, false)
        FM:AddNotification("SUCCESS", "Vehicle unlocked.", 5000)
    end

    function FM:DisableVehicle(veh)
        if not FM:GetFunction("DoesEntityExist")(veh) or not FM:GetFunction("IsEntityAVehicle")(veh) then return end
        if not FM:RequestControlSync(veh) then return FM:AddNotification("ERROR", "Failed to get network control in time. Please try again.", 5000) end
        SetVehicleUndriveable(veh, true)
        SetVehicleWheelWidth(veh, 100.0)

        for i = 0, GetVehicleNumberOfWheels(veh) do
            SetVehicleWheelTireColliderSize(veh, i, 100.0)
            SetVehicleWheelSize(veh, i, 100.0)
            SetVehicleWheelTireColliderWidth(veh, i, 100.0)
        end

        SetVehicleLights(veh, 2)
        SetVehicleLightsMode(veh, 2)
        SetVehicleEngineTemperature(veh, dict.math.huge + 0.0)
        SetVehicleEngineOn(veh, true, true, true)
        SetVehicleEngineCanDegrade(veh, true)
        ModifyVehicleTopSpeed(veh, 1.0)
        FM:AddNotification("SUCCESS", "Vehicle disabled.", 5000)
    end

    function FM:StealVehicleThread(who, veh, nodrive)
        if not FM:GetFunction("DoesEntityExist")(veh) or not FM:GetFunction("IsEntityAVehicle")(veh) then return end
        FM:GetFunction("TaskSetBlockingOfNonTemporaryEvents")(who, true)
        FM:GetFunction("ClearPedTasks")(who)
        local driver = FM:GetFunction("GetPedInVehicleSeat")(veh, -1)
        local timeout = 0

        if FM:GetFunction("DoesEntityExist")(driver) then
            while FM:GetFunction("DoesEntityExist")(veh) and FM:GetFunction("GetPedInVehicleSeat")(veh, -1) == driver and timeout <= 25000 do
                FM:GetFunction("TaskCombatPed")(who, driver, 0, 16)
                timeout = timeout + 100
                FM:GetFunction("SetVehicleDoorsLockedForAllPlayers")(veh, false)
                FM:GetFunction("SetVehicleDoorsLocked")(veh, 7)

                if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["R"]) then
                    self.Util:DeleteEntity(who)
                    FM:AddNotification("INFO", "Hijack cancelled.")

                    return false
                end

                Wait(100)
            end

            FM:GetFunction("ClearPedTasks")(who)
            FM:GetFunction("TaskEnterVehicle")(who, veh, 10000, -1, 2.0, 1, 0)

            while FM:GetFunction("DoesEntityExist")(veh) and FM:GetFunction("GetPedInVehicleSeat")(veh, -1) ~= who and timeout <= 25000 do
                timeout = timeout + 100
                FM:GetFunction("SetVehicleDoorsLockedForAllPlayers")(veh, false)
                FM:GetFunction("SetVehicleDoorsLocked")(veh, 7)
                FM:GetFunction("NetworkRequestControlOfEntity")(veh)

                if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["R"]) then
                    self.Util:DeleteEntity(who)
                    FM:AddNotification("INFO", "Hijack cancelled.")

                    return false
                end

                Wait(100)
            end
        else
            FM:GetFunction("TaskEnterVehicle")(who, veh, 10000, -1, 2.0, 1, 0)

            while FM:GetFunction("DoesEntityExist")(veh) and FM:GetFunction("GetPedInVehicleSeat")(veh, -1) ~= who and timeout <= 25000 do
                timeout = timeout + 100
                FM:GetFunction("SetVehicleDoorsLockedForAllPlayers")(veh, false)
                FM:GetFunction("SetVehicleDoorsLocked")(veh, 7)
                FM:GetFunction("NetworkRequestControlOfEntity")(veh)

                if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["R"]) then
                    self.Util:DeleteEntity(who)
                    FM:AddNotification("INFO", "Hijack cancelled.")

                    return false
                end

                Wait(100)
            end
        end

        FM:GetFunction("ClearPedTasks")(who)
        FM:GetFunction("TaskSetBlockingOfNonTemporaryEvents")(who, false)
        FM:GetFunction("SetVehicleEngineOn")(veh, true)
        FM:GetFunction("NetworkRequestControlOfEntity")(veh)

        if not nodrive then
            for i = 1, 5 do
                FM:GetFunction("TaskVehicleDriveWander")(who, veh, 120.0, 0)
            end
        end

        FM:GetFunction("SetVehicleDoorsLockedForAllPlayers")(veh, true)
        FM:GetFunction("SetVehicleDoorsLocked")(veh, 2)

        return true
    end

    function FM:ScrW()
        return self._ScrW
    end

    function FM:ScrH()
        return self._ScrH
    end

    local print = _print or print

    function FM:Print(...)
        local str = (...)
        if not FM.Config.UsePrintMessages then return false end
        print("[Fallout Menu] " .. str)

        return true
    end

    function FM:GetMousePos()
        return self._MouseX, self._MouseY
    end

    function FM:RequestControlOnce(entity)
        if FM:GetFunction("NetworkHasControlOfEntity")(entity) then return true end
        FM:GetFunction("SetNetworkIdCanMigrate")(FM:GetFunction("NetworkGetNetworkIdFromEntity")(entity), true)

        return FM:GetFunction("NetworkRequestControlOfEntity")(entity)
    end

    function FM:RequestControlSync(veh, timeout)
        timeout = timeout or 2000
        local counter = 0
        self:RequestControlOnce(veh)

        while not FM:GetFunction("NetworkHasControlOfEntity")(veh) do
            counter = counter + 100
            Wait(100)
            if counter >= timeout then return false end
        end

        return true
    end

    function FM:aG(aH, aI, aJ)
        return coroutine.wrap(function()
            local aK, t = aH()

            if not t or t == 0 then
                aJ(aK)

                return
            end

            local aF = {
                handle = aK,
                destructor = aJ
            }

            setmetatable(aF, aE)
            local aL = true
            repeat
                coroutine.yield(t)
                aL, t = aI(aK)
            until not aL
            aF.destructor, aF.handle = nil, nil
            aJ(aK)
        end)
    end

    function FM:EnumerateVehicles()
        return FM:aG(FM:GetFunction("FindFirstVehicle"), FM:GetFunction("FindNextVehicle"), FM:GetFunction("EndFindVehicle"))
    end

    function FM:EnumeratePeds()
        return FM:aG(FM:GetFunction("FindFirstPed"), FM:GetFunction("FindNextPed"), FM:GetFunction("EndFindPed"))
    end

    function FM:EnumerateObjects()
        return FM:aG(FM:GetFunction("FindFirstObject"), FM:GetFunction("FindNextObject"), FM:GetFunction("EndFindObject"))
    end

    function FM:GetClosestVehicle(max_dist)
        local veh, dist = nil, dict.math.huge
        local cur = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(FM:GetFunction("PlayerPedId")(), 0.0, 0.0, 0.0)

        for vehicle in self:EnumerateVehicles() do
            local this = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(vehicle, 0.0, 0.0, 0.0)

            if FM:GetFunction("DoesEntityExist")(vehicle) then
                local distance = FM:GetFunction("GetDistanceBetweenCoords")(cur.x, cur.y, cur.z, this.x, this.y, this.z)

                if distance < dist then
                    dist = distance
                    veh = vehicle
                end
            end
        end

        if dist > (max_dist or 10.0) then return end

        return veh, dist
    end

    function FM:GetClosestPed(max_dist)
        local ped, dist = nil, dict.math.huge
        local cur = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(FM:GetFunction("PlayerPedId")(), 0.0, 0.0, 0.0)

        for pedestrian in self:EnumeratePeds() do
            local this = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(pedestrian, 0.0, 0.0, 0.0)

            if FM:GetFunction("DoesEntityExist")(pedestrian) then
                local distance = FM:GetFunction("GetDistanceBetweenCoords")(cur.x, cur.y, cur.z, this.x, this.y, this.z)

                if distance < dist then
                    dist = distance
                    ped = pedestrian
                end
            end
        end

        if dist > (max_dist or 10.0) then return end

        return ped, dist
    end

    function FM:GetClosestObject(max_dist)
        local obj, dist = nil, dict.math.huge
        local cur = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(FM:GetFunction("PlayerPedId")(), 0.0, 0.0, 0.0)

        for object in self:EnumeratePeds() do
            local this = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(object, 0.0, 0.0, 0.0)

            if FM:GetFunction("DoesEntityExist")(object) then
                local distance = FM:GetFunction("GetDistanceBetweenCoords")(cur.x, cur.y, cur.z, this.x, this.y, this.z)

                if distance < dist then
                    dist = distance
                    obj = object
                end
            end
        end

        if dist > (max_dist or 10.0) then return end

        return obj, dist
    end

    function FM:DeleteVehicles()
        local _veh = FM:GetFunction("IsPedInAnyVehicle") and FM:GetFunction("GetVehiclePedIsIn")(FM:GetFunction("PlayerPedId")())

        CreateThread(function()
            for veh in FM:EnumerateVehicles() do
                if self:RequestControlSync(veh) and (veh ~= _veh or FM.Config.OnlineIncludeSelf) then
                    FM.Util:DeleteEntity(veh)
                end
            end
        end)
    end

    function FM:RepairVehicle(vehicle)
        if vehicle == 0 then return false end
        FM:RequestControlOnce(vehicle)
        FM:GetFunction("SetVehicleFixed")(vehicle)

        return true
    end

    local was_dragging

    function FM:TranslateMouse(wx, wy, ww, wh, drag_id)
        local mx, my = self:GetMousePos()

        if not self.DraggingX and not self.DraggingY then
            self.DraggingX = mx
            self.DraggingY = my
        end

        local mpx = self.DraggingX - wx
        local mpy = self.DraggingY - wy

        if self.DraggingX ~= mx or self.DraggingY ~= my then
            self.DraggingX = mx
            self.DraggingY = my
        end

        local dx = wx - (self.DraggingX - mpx)
        local dy = wy - (self.DraggingY - mpy)

        was_dragging = drag_id

        return wx - dx, wy - dy
    end

    local scroller_y

    function FM:TranslateScroller(sy, sh, by)
        local _, my = self:GetMousePos()

        if not scroller_y then
            scroller_y = my
        end

        local mpy = scroller_y - sy

        if scroller_y ~= my then
            scroller_y = my
        end

        return mpy
    end

    local text_cache = {}

    local function _text_width(str, font, scale)
        font = font or 4
        scale = scale or 0.35
        text_cache[font] = text_cache[font] or {}
        text_cache[font][scale] = text_cache[font][scale] or {}
        if text_cache[font][scale][str] then return text_cache[font][scale][str].length end
        FM:GetFunction("BeginTextCommandWidth")("STRING")
        FM:GetFunction("AddTextComponentSubstringPlayerName")(str)
        FM:GetFunction("SetTextFont")(font or 4)
        FM:GetFunction("SetTextScale")(scale or 0.35, scale or 0.35)
        local length = FM:GetFunction("EndTextCommandGetWidth")(1)

        text_cache[font][scale][str] = {
            length = length
        }

        return length
    end

    function FM.Painter:GetTextWidth(str, font, scale)
        return _text_width(str, font, scale) * FM:ScrW()
    end

    function FM.Painter:DrawText(text, font, centered, x, y, scale, r, g, b, a)
        FM:GetFunction("SetTextFont")(font)
        FM:GetFunction("SetTextScale")(scale, scale)
        FM:GetFunction("SetTextCentre")(centered)
        FM:GetFunction("SetTextColour")(r, g, b, a)
        FM:GetFunction("BeginTextCommandDisplayText")("STRING")
        FM:GetFunction("AddTextComponentSubstringPlayerName")(text)
        FM:GetFunction("EndTextCommandDisplayText")(x / FM:ScrW(), y / FM:ScrH())
    end

    local listing

    local function _lerp(delta, from, to)
        if delta > 1 then return to end
        if delta < 0 then return from end

        return from + (to - from) * delta
    end

    local color_lists = {}

    function FM.Painter:ListItem(label, px, py, x, y, w, h, r, g, b, a, id)
        if listing and not FM:GetFunction("IsDisabledControlReleased")(0, 24) then
            listing = nil
        end

        if not color_lists[id] then
            color_lists[id] = {
                r = 0,
                g = 0,
                b = 0
            }
        end

        local bool = FM.Config.SelectedCategory == id

        if bool then
            color_lists[id].r = _lerp(0.1, color_lists[id].r, FM.Tertiary[1])
            color_lists[id].g = _lerp(0.1, color_lists[id].g, FM.Tertiary[2])
            color_lists[id].b = _lerp(0.1, color_lists[id].b, FM.Tertiary[3])
        else
            color_lists[id].r = _lerp(0.1, color_lists[id].r, 255)
            color_lists[id].g = _lerp(0.1, color_lists[id].g, 255)
            color_lists[id].b = _lerp(0.1, color_lists[id].b, 255)
        end

        self:DrawRect(px + x, py + y, w, h, r, g, b, a)
        self:DrawText(label, 4, true, px + w / 2, py + y - 5, 0.34, dict.math.ceil(color_lists[id].r), dict.math.ceil(color_lists[id].g), dict.math.ceil(color_lists[id].b), 255)

        if self:Holding(px + x, py + y, w, h, id) or FM.Config.SelectedCategory == id then
            if not listing and FM.Config.SelectedCategory ~= id then
                listing = true

                return true
            else
                return false
            end
        end

        return false
    end

    local selector
    local list_choices = {}

    function FM.Painter:DrawSprite(x, y, w, h, heading, dict, name, r, g, b, a, custom)
        if not FM:GetFunction("HasStreamedTextureDictLoaded")(dict) and not custom then
            FM:GetFunction("RequestStreamedTextureDict")(dict)
        end

        FM:GetFunction("DrawSprite")(dict, name, x / FM:ScrW(), y / FM:ScrH(), w / FM:ScrW(), h / FM:ScrH(), heading, r, g, b, a)
    end

    local left_active, right_active

    function FM.Painter:ListChoice(label, options, px, py, x, y, w, h, r, g, b, a, id, selected, unbind_caller)
        list_choices[id] = list_choices[id] or {
            selected = selected or 1,
            options = options
        }

        local ret
        local lR, lG, lB = 255, 255, 255
        local rR, rG, rB = 255, 255, 255
        self:DrawText(label, 4, false, px + x, py + y, 0.4, 255, 255, 255, 255)
        local width = self:GetTextWidth(label, 4, 0.4)
        local left_x, left_y = px + x + (width - 16.0), py + y + 13

        if self:Holding(left_x + 18 - 9.1, left_y - 5, 38.4, 19.2, 13.5, id .. "_left") then
            if not left_active or left_active == id .. "_left" then
                lR, lG, lB = FM.Tertiary[1], FM.Tertiary[2], FM.Tertiary[3]
            end

            if not left_active then
                left_active = id .. "_left"
                local cur = list_choices[id].selected
                local new = cur - 1

                if not list_choices[id].options[new] then
                    new = #list_choices[id].options
                end

                list_choices[id].selected = new
                ret = true
            end
        elseif left_active == id .. "_left" then
            left_active = nil
        end

        local cur = list_choices[id].options[list_choices[id].selected]

        if not cur then
            cur = "NONE"
        end

        local cur_width = self:GetTextWidth(cur, 4, 0.4)

        if self:Holding(left_x + 18 + cur_width + 16.0 - 9.1, left_y - 5, 19.2, 13.5, id .. "_right") then
            if not right_active or right_active == id .. "_right" then
                rR, rG, rB = FM.Tertiary[1], FM.Tertiary[2], FM.Tertiary[3]
            end

            if not right_active then
                right_active = id .. "_right"
                local cur = list_choices[id].selected
                local new = cur + 1

                if not list_choices[id].options[new] then
                    new = 1
                end

                list_choices[id].selected = new
                ret = true
            end
        elseif right_active == id .. "_right" then
            right_active = nil
        end

        self:DrawText(cur, 4, false, left_x + 27, left_y - 14, 0.4, 255, 255, 255, 255)
        self:DrawSprite(left_x + 18, left_y + 2, 38.4, 27.0, 0.0, "commonmenu", "arrowleft", lR, lG, lB, 255)
        self:DrawSprite(left_x + 18 + cur_width + 16.0, left_y + 2, 38.4, 27.0, 0.0, "commonmenu", "arrowright", rR, rG, rB, 255)

        if self:Hovered(px + x, py + y + 8, width + 27 + cur_width, 10) and unbind_caller and FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["MOUSE2"]) and FM.Config[unbind_caller] ~= "NONE" then
            FM.Config[unbind_caller] = "NONE"
            list_choices[id].selected = -1
            FM.ConfigClass.Save(true)
            ret = false
        end


        return ret
    end

    local checked
    local color_checks = {}

    function FM.Painter:CheckBox(label, bool, px, py, x, y, w, h, r, g, b, a, id, centered, size)
        if not FM:GetFunction("IsDisabledControlPressed")(0, 24) and checked then
            checked = nil
        end

        if not color_checks[id] then
            color_checks[id] = {
                r = 0,
                g = 0,
                b = 0,
                a = 0
            }
        end

        self:DrawRect(px + x, py + y, 20, 20, 25, 25, 25, 200)

        if bool then
            color_checks[id].r = _lerp(0.1, color_checks[id].r, FM.Tertiary[1])
            color_checks[id].g = _lerp(0.1, color_checks[id].g, FM.Tertiary[2])
            color_checks[id].b = _lerp(0.1, color_checks[id].b, FM.Tertiary[3])
            color_checks[id].a = _lerp(0.1, color_checks[id].a, 200)
        else
            color_checks[id].r = _lerp(0.1, color_checks[id].r, 20)
            color_checks[id].g = _lerp(0.1, color_checks[id].g, 20)
            color_checks[id].b = _lerp(0.1, color_checks[id].b, 20)
            color_checks[id].a = _lerp(0.1, color_checks[id].a, 0)
        end

        self:DrawRect(px + x + 2.5, py + y + 2.5, 15, 15, dict.math.ceil(color_checks[id].r), dict.math.ceil(color_checks[id].g), dict.math.ceil(color_checks[id].b), dict.math.ceil(color_checks[id].a))
        self:DrawText(label, 4, centered, centered and (px + w / 2) or (px + x + 25), py + y - 4, size or 0.37, r, g, b, a)

        if self:Holding(px + x, py + y, w, h, id) then
            if not checked then
                checked = id

                if FM.Config.UseSounds then
                    FM:GetFunction("PlaySoundFrontend")(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", false)
                end

                return true
            else
                return false
            end
        end

        return false
    end

    local activated

    function FM.Painter:Button(label, px, py, x, y, w, h, r, g, b, a, id, centered, size)
        if not FM:GetFunction("IsDisabledControlPressed")(0, 24) and activated then
            activated = nil
        end

        if not w then
            w = self:GetTextWidth(label, 4, size or 0.37)
        end

        if self:Holding(px + x, py + y, w, h, id) then
            self:DrawText(label, 4, centered, centered and (px + w / 2) or (px + x), py + y, size or 0.37, FM.Tertiary[1], FM.Tertiary[2], FM.Tertiary[3], FM.Tertiary[4])

            if not activated then
                activated = id

                if FM.Config.UseSounds then
                    FM:GetFunction("PlaySoundFrontend")(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", false)
                end

                return true
            else
                return false
            end
        end

        self:DrawText(label, 4, centered, centered and (px + w / 2) or (px + x), py + y, size or 0.37, r, g, b, a)

        return false
    end

    function FM.Painter:DrawRect(x, y, w, h, r, g, b, a)
        local _w, _h = w / FM:ScrW(), h / FM:ScrH()
        local _x, _y = x / FM:ScrW() + _w / 2, y / FM:ScrH() + _h / 2
        FM:GetFunction("DrawRect")(_x, _y, _w, _h, r, g, b, a)
    end

    function FM.Painter:Hovered(x, y, w, h)
        local mx, my = FM:GetMousePos()

        if mx >= x and mx <= x + w and my >= y and my <= y + h then
            return true
        else
            return false
        end
    end

    local holding

    function FM.Painter:Holding(x, y, w, h, id)
        if FM:GetFunction("UpdateOnscreenKeyboard")() ~= -1 and FM:GetFunction("UpdateOnscreenKeyboard")() ~= 1 and FM:GetFunction("UpdateOnscreenKeyboard")() ~= 2 then return end
        if holding == id and FM:GetFunction("IsDisabledControlPressed")(0, 24) then return true end
        if holding ~= nil and FM:GetFunction("IsDisabledControlPressed")(0, 24) then return end

        if self:Hovered(x, y, w, h) and FM:GetFunction("IsDisabledControlPressed")(0, 24) then
            holding = id

            return true
        elseif holding == id and not self:Hovered(x, y, w, h) or not FM:GetFunction("IsDisabledControlPressed")(0, 24) then
            holding = nil
        end

        return false
    end

    local clicked

    function FM.Painter:Clicked(x, y, w, h)
        if clicked then
            if not FM:GetFunction("IsDisabledControlPressed")(0, 24) then
                clicked = false
            end

            return false
        end

        if self:Hovered(x, y, w, h) and FM:GetFunction("IsDisabledControlJustReleased")(0, 24) then
            clicked = true

            return true
        end

        return false
    end

    function FM:Clamp(what, min, max)
        if what < min then
            return min
        elseif what > max then
            return max
        else
            return what
        end
    end

    function FM:LimitRenderBounds()
        local cx, cy = self.Config.MenuX, self.Config.MenuY
        cx = self:Clamp(cx, 5, FM:ScrW() - self.MenuW - 5)
        cy = self:Clamp(cy, 42, FM:ScrH() - self.MenuH - 5)
        local nx, ny = self.Config.NotifX, self.Config.NotifY

        if nx and ny and self.Config.NotifW then
            nx = self:Clamp(nx, 30, FM:ScrW() - self.Config.NotifW - 30)
            ny = self:Clamp(ny, 30, FM:ScrH() - notifications_h - 30)

            self.Config.NotifX = nx
            self.Config.NotifY = ny
        end

        self.Config.MenuX = cx
        self.Config.MenuY = cy
    end

    function FM:AddCategory(title, func)
        self.Categories[#self.Categories + 1] = {
            Title = title,
            Build = func
        }
    end

    function FM:SetPedModel(model)
        if not self:RequestModelSync(model) then return self:AddNotification("ERROR", "Couldn't load model ~r~" .. model .. " ~w~in time.") end
        FM:GetFunction("SetPlayerModel")(FM:GetFunction("PlayerId")(), model)
    end

    function FM:GetPedVehicleSeat(ped)
        local vehicle = FM:GetFunction("GetVehiclePedIsIn")(ped, false)
        local invehicle = FM:GetFunction("IsPedInAnyVehicle")(ped, false)

        if invehicle then
            for i = -2, FM:GetFunction("GetVehicleMaxNumberOfPassengers")(vehicle) do
                if (FM:GetFunction("GetPedInVehicleSeat")(vehicle, i) == ped) then return i end
            end
        end

        return -2
    end

    function FM:GetModelLength(ent)
        local min, max = FM:GetFunction("GetModelDimensions")(FM:GetFunction("GetEntityModel")(ent))

        return max.y - min.y
    end

    function FM:GetModelHeight(ent)
        local min, max = FM:GetFunction("GetModelDimensions")(FM:GetFunction("GetEntityModel")(ent))

        return max.z - min.z
    end

    function FM:Tracker()
        if not self.TrackingPlayer then return end

        if not FM:GetFunction("DoesEntityExist")(FM:GetFunction("GetPlayerPed")(self.TrackingPlayer)) then
            self.TrackingPlayer = nil

            return
        end

        local coords = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(FM:GetFunction("GetPlayerPed")(self.TrackingPlayer, 0.0, 0.0, 0.0))
        FM:GetFunction("SetNewWaypoint")(coords.x, coords.y)
    end

    function FM:DoFrozen()
        for src, bool in dict.pairs(frozen_players) do
            src = dict.tonumber(src)
            local ped = FM:GetFunction("GetPlayerPed")(src)

            if FM:GetFunction("DoesEntityExist")(ped) and bool then
                FM:GetFunction("ClearPedTasks")(ped)
                FM:GetFunction("ClearPedTasksImmediately")(ped)
                FM:GetFunction("DisablePlayerFiring")(src, true)
            end
        end
    end

    local blips = {}

    function FM:DoBlips(remove)
        if remove or not FM.Config.Player.Blips or not FM.Enabled then
            if remove or #blips > 0 then
                for src, blip in dict.pairs(blips) do
                    FM:GetFunction("RemoveBlip")(blip)
                    blips[src] = nil
                end
            end

            return
        end

        for src, blip in dict.pairs(blips) do
            if not FM:GetFunction("DoesEntityExist")(FM:GetFunction("GetPlayerPed")(src)) then
                FM:GetFunction("RemoveBlip")(blip)
                blips[src] = nil
            else
                local coords = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(FM:GetFunction("GetPlayerPed")(src, 0.0, 0.0, 0.0))
                local head = FM:GetFunction("GetEntityHeading")(FM:GetFunction("GetPlayerPed")(src))
                FM:GetFunction("SetBlipCoords")(blip, coords.x, coords.y, coords.z)
                FM:GetFunction("SetBlipRotation")(blip, dict.math.ceil(head))
                FM:GetFunction("SetBlipCategory")(blip, 7)
                FM:GetFunction("SetBlipScale")(blip, 0.87)
            end
        end

        for id, src in dict.pairs(FM.PlayerCache) do
            src = dict.tonumber(src)

            if FM:GetFunction("DoesEntityExist")(FM:GetFunction("GetPlayerPed")(src)) and not blips[src] and src ~= PlayerId() then
                local coords = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(FM:GetFunction("GetPlayerPed")(src, 0.0, 0.0, 0.0))
                local head = FM:GetFunction("GetEntityHeading")(FM:GetFunction("GetPlayerPed")(src))
                local blip = FM:GetFunction("AddBlipForCoord")(coords.x, coords.y, coords.z)
                FM:GetFunction("SetBlipSprite")(blip, 1)
                FM:GetFunction("ShowHeadingIndicatorOnBlip")(blip, true)
                FM:GetFunction("SetBlipRotation")(blip, dict.math.ceil(head))
                FM:GetFunction("SetBlipScale")(blip, 0.87)
                FM:GetFunction("SetBlipCategory")(blip, 7)
                FM:GetFunction("BeginTextCommandSetBlipName")("STRING")
                FM:GetFunction("AddTextComponentSubstringPlayerName")(FM:GetFunction("GetPlayerName")(src))
                FM:GetFunction("EndTextCommandSetBlipName")(blip)
                blips[src] = blip
            end
        end
    end

    function FM:DoAntiAim()
        if not self.Config.Player.AntiAim then return end

        for id, src in dict.pairs(FM.PlayerCache) do
            src = dict.tonumber(src)
            local ped = FM:GetFunction("GetPlayerPed")(src)
            local ret, ent = FM:GetFunction("GetEntityPlayerIsFreeAimingAt")(src)

            if ret and ent == FM:GetFunction("PlayerPedId")() then
                local pos = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, 0.0, 0.0, 0.0)
                FM:GetFunction("AddExplosion")(pos.x, pos.y, pos.z, 18, 1.0, false, true, 10.0)
            end
        end
    end

    function FM:TeleportToWaypoint()
        local waypoint = FM:GetFunction("GetFirstBlipInfoId")(8)
        if not DoesBlipExist(waypoint) then return FM:AddNotification("ERROR", "No waypoint!", 5000) end
        local coords = FM:GetFunction("GetBlipInfoIdCoord")(waypoint)

        CreateThread(function()
            for height = 100, -100, -5 do
                FM:GetFunction("SetPedCoordsKeepVehicle")(FM:GetFunction("PlayerPedId")(), coords.x, coords.y, height + 0.0)
                local foundGround, zPos = FM:GetFunction("GetGroundZFor_3dCoord")(coords.x, coords.y, height + 0.0)

                if foundGround then
                    FM:GetFunction("SetPedCoordsKeepVehicle")(FM:GetFunction("PlayerPedId")(), coords.x, coords.y, zPos + 0.0)
                    break
                end

                Wait(5)
            end

            FM:AddNotification("SUCCESS", "Teleported to waypoint.")
        end)
    end

    local esp_talk_col = FM.Tertiary

    function FM:DoESP()
        if not self.Config.Player.ESP then return end
        local spot = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(FM:GetFunction("PlayerPedId")(), 0.0, 0.0, 0.0)

        if self.FreeCam and self.FreeCam.On and camX and camY and camZ then
            spot = vector3(camX, camY, camZ)
        elseif self.SpectatingPlayer and FM:GetFunction("DoesEntityExist")(FM:GetFunction("GetPlayerPed")(self.SpectatingPlayer)) then
            spot = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(FM:GetFunction("GetPlayerPed")(self.SpectatingPlayer, 0.0, 0.0, 0.0))
        elseif self.RCCam and self.RCCam.On and rc_camX and rc_camY and rc_camZ then
            spot = vector3(rc_camX, rc_camY, rc_camZ)
        end

        for id, src in dict.pairs(FM.PlayerCache) do
            src = dict.tonumber(src)
            local ped = FM:GetFunction("GetPlayerPed")(src)

            if FM:GetFunction("DoesEntityExist")(ped) and ped ~= FM:GetFunction("PlayerPedId")() then
                local _id = dict.tonumber(FM:GetFunction("GetPlayerServerId")(src))
                local coords = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, vector_origin.x, vector_origin.y, vector_origin.z)
                local dist = FM:GetFunction("GetDistanceBetweenCoords")(spot.x, spot.y, spot.z, coords.x, coords.y, coords.z)
                local seat = dict.tonumber(FM:GetPedVehicleSeat(ped))

                if seat ~= -2 then
                    seat = seat + 0.25
                end

                if dist <= FM.Config.Player.ESPDistance then
                    local pos_z = coords.z + 1.2

                    if seat ~= -2 then
                        pos_z = pos_z + seat
                    end

                    local _on_screen, _, _ = FM:GetFunction("GetScreenCoordFromWorldCoord")(coords.x, coords.y, pos_z)

                    if _on_screen then
                        if self.Config.Player.Box then
                            self:DoBoxESP(src, ped)
                        end

                        if FM:GetFunction("NetworkIsPlayerTalking")(src) then
                            self:Draw3DText(coords.x, coords.y, pos_z, _id .. " | " .. FM:CleanName(FM:GetFunction("GetPlayerName")(src), true) .. " [" .. dict.math.ceil(dist) .. "M" .. "]", esp_talk_col[1], esp_talk_col[2], esp_talk_col[3])
                        else
                            self:Draw3DText(coords.x, coords.y, pos_z, _id .. " | " .. FM:CleanName(FM:GetFunction("GetPlayerName")(src), true) .. " [" .. dict.math.ceil(dist) .. "M" .. "]", 255, 255, 255)
                        end
                    end
                end
            end
        end
    end

    function FM:DoBoxESP(src, ped)
        local r, g, b, a = 255, 255, 255, 255

        if FM:GetFunction("NetworkIsPlayerTalking")(src) then
            r, g, b = esp_talk_col[1], esp_talk_col[2], esp_talk_col[3]
        end

        local model = FM:GetFunction("GetEntityModel")(ped)
        local min, max = FM:GetFunction("GetModelDimensions")(model)
        local top_front_right = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, max)
        local top_back_right = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, vector3(max.x, min.y, max.z))
        local bottom_front_right = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, vector3(max.x, max.y, min.z))
        local bottom_back_right = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, vector3(max.x, min.y, min.z))
        local top_front_left = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, vector3(min.x, max.y, max.z))
        local top_back_left = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, vector3(min.x, min.y, max.z))
        local bottom_front_left = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, vector3(min.x, max.y, min.z))
        local bottom_back_left = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, min)
        -- LINES
        -- RIGHT SIDE
        FM:GetFunction("DrawLine")(top_front_right, top_back_right, r, g, b, a)
        FM:GetFunction("DrawLine")(top_front_right, bottom_front_right, r, g, b, a)
        FM:GetFunction("DrawLine")(bottom_front_right, bottom_back_right, r, g, b, a)
        FM:GetFunction("DrawLine")(top_back_right, bottom_back_right, r, g, b, a)
        -- LEFT SIDE
        FM:GetFunction("DrawLine")(top_front_left, top_back_left, r, g, b, a)
        FM:GetFunction("DrawLine")(top_back_left, bottom_back_left, r, g, b, a)
        FM:GetFunction("DrawLine")(top_front_left, bottom_front_left, r, g, b, a)
        FM:GetFunction("DrawLine")(bottom_front_left, bottom_back_left, r, g, b, a)
        -- Connection
        FM:GetFunction("DrawLine")(top_front_right, top_front_left, r, g, b, a)
        FM:GetFunction("DrawLine")(top_back_right, top_back_left, r, g, b, a)
        FM:GetFunction("DrawLine")(bottom_front_left, bottom_front_right, r, g, b, a)
        FM:GetFunction("DrawLine")(bottom_back_left, bottom_back_right, r, g, b, a)
    end

    FM:AddCategory("Self", function(self, x, y, w, h)
        local curY = 5

        if self.Painter:CheckBox("GOD MODE", self.Config.Player.God, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "god_enabled") then
            if FM.Config.SafeMode then
                FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.")
            else
                self.Config.Player.God = not self.Config.Player.God
                FM.ConfigClass.Save(true)
            end
        end

        local _w = (self.Painter:GetTextWidth("TELEPORT TO COORDS", 4, 0.37)) + 2

        if self.Painter:Button("TELEPORT TO COORDS", x, y, w - _w, curY, 200, 20, 255, 255, 255, 255, "teleport_to_coords") then
            local x, y, z
            _x = FM:GetTextInput("Enter X Coordinate.", 0, 15)

            if _x and dict.tonumber(_x) then
                x = _x
            end

            if x then
                local _y = FM:GetTextInput("Enter Y Coordinate.", 0, 15)

                if _y and dict.tonumber(_y) then
                    y = _y
                end
            end

            if x and y then
                local _z = FM:GetTextInput("Enter Z Coordinate.", 0, 15)

                if _z and dict.tonumber(_z) then
                    z = _z
                end
            end

            if x and y and z then
                x = dict.tonumber(x) + 0.0
                y = dict.tonumber(y) + 0.0
                z = dict.tonumber(z) + 0.0
                FM:GetFunction("SetEntityCoords")(FM:GetFunction("PlayerPedId")(), x, y, z)
                FM:AddNotification("SUCCESS", "Teleported to coords.", 5000)
            else
                FM:AddNotification("INFO", "Cancelled.", 5000)
            end
        end

        local _w = (self.Painter:GetTextWidth("TELEPORT TO WAYPOINT", 4, 0.37)) + 2

        if self.Painter:Button("TELEPORT TO WAYPOINT", x, y, w - _w, curY + 25, 200, 20, 255, 255, 255, 255, "teleport_to_waypoint") then
            FM:TeleportToWaypoint()
        end

        curY = curY + 25

        if self.Painter:CheckBox("SEMI GOD MODE", self.Config.Player.SemiGod, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "semi_god_enabled") then
            self.Config.Player.SemiGod = not self.Config.Player.SemiGod
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("ANTI AFK", self.Config.Player.AntiAFK, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "anti_afk") then
            self.Config.Player.AntiAFK = not self.Config.Player.AntiAFK
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("INFINITE STAMINA", self.Config.Player.InfiniteStamina, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "infinite_stamina") then
            self.Config.Player.InfiniteStamina = not self.Config.Player.InfiniteStamina
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("NO RAGDOLL", self.Config.Player.NoRagdoll, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "no_ragdoll_enabled") then
            self.Config.Player.NoRagdoll = not self.Config.Player.NoRagdoll
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("INVISIBILITY", self.Config.Player.Invisibility, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "invisibility_enabled") then
            self.Config.Player.Invisibility = not self.Config.Player.Invisibility
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("REVEAL INVISIBLE PLAYERS", self.Config.Player.RevealInvisibles, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "reveal_invis_players") then
            self.Config.Player.RevealInvisibles = not self.Config.Player.RevealInvisibles
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("FAST RUN", self.Config.Player.FastRun, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "fast_af_runna_enabled") then
            self.Config.Player.FastRun = not self.Config.Player.FastRun
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("SUPER JUMP", self.Config.Player.SuperJump, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "big_jump_enabled") then
            self.Config.Player.SuperJump = not self.Config.Player.SuperJump
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("SUPER MAN", self.Config.Player.SuperMan, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "super_man_enabled") then
            self.Config.Player.SuperMan = not self.Config.Player.SuperMan
            FM.ConfigClass.Save(true)

            if self.Config.Player.SuperMan then
                FM:AddNotification("INFO", "Press ~y~SPACE~w~ to go up / ~y~W~w~ to go forward.")
            end
        end

        curY = curY + 25

        if self.Painter:CheckBox("MAGIC CARPET", self.Config.Player.MagicCarpet, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "magic_carpet_enabled") then
            self.Config.Player.MagicCarpet = not self.Config.Player.MagicCarpet
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("FAKE DEAD", self.Config.Player.FakeDead, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "fake_dead") then
            self.Config.Player.FakeDead = not self.Config.Player.FakeDead
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("FORCE RADAR", self.Config.Player.ForceRadar, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "force_radar") then
            self.Config.Player.ForceRadar = not self.Config.Player.ForceRadar
            FM.ConfigClass.Save(true)
        end

        curY = curY + 20

        if self.Painter:Button("HEAL", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "heal_option") then
            FM:GetFunction("SetEntityHealth")(FM:GetFunction("PlayerPedId")(), 200)
            FM:GetFunction("ClearPedBloodDamage")(FM:GetFunction("PlayerPedId")())
            FM:AddNotification("INFO", "Healed.")
        end

        curY = curY + 25

        if self.Painter:Button("GIVE ARMOR", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "armor_option") then
            FM:GetFunction("SetPedArmour")(FM:GetFunction("PlayerPedId")(), 200)
            FM:AddNotification("INFO", "Armour given.")
        end

        curY = curY + 25

        if self.Painter:Button("SUICIDE", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "suicide_option") then
            FM:GetFunction("SetEntityHealth")(FM:GetFunction("PlayerPedId")(), 0)
            FM:AddNotification("INFO", "Killed.")
        end

        curY = curY + 25

        if self.DynamicTriggers["esx_ambulancejob"] and self.DynamicTriggers["esx_ambulancejob"]["esx_ambulancejob:revive"] then
            if self.Painter:Button("REVIVE ~g~ESX", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "esx_revive") then
                FM:GetFunction("TriggerEvent")(self.DynamicTriggers["esx_ambulancejob"]["esx_ambulancejob:revive"])
                FM:AddNotification("INFO", "Revived.")
            end

            curY = curY + 25
        end

        if self.Painter:Button("REVIVE", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "native_revive") then
            FM:GetFunction("NetworkResurrectLocalPlayer")(FM:GetFunction("GetOffsetFromEntityInWorldCoords")(FM:GetFunction("PlayerPedId")(), 0.0, 0.0, 0.0), FM:GetFunction("GetEntityHeading")(FM:GetFunction("PlayerPedId")()))
            FM:AddNotification("INFO", "Revived.")
        end
    end)

    FM:AddCategory("ESP", function(self, x, y)
        local curY = 5

        if self.Painter:CheckBox("ESP", self.Config.Player.ESP, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "esp_enabled") then
            self.Config.Player.ESP = not self.Config.Player.ESP
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("BOX", self.Config.Player.Box, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "esp_box_enabled") then
            self.Config.Player.Box = not self.Config.Player.Box
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("BLIPS", self.Config.Player.Blips, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "esp_blips_enabled") then
            if self.Config.Player.Blips then
                self:DoBlips(true)
            end

            self.Config.Player.Blips = not self.Config.Player.Blips
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("CROSSHAIR", self.Config.Player.CrossHair, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "crosshair_enabled") then
            self.Config.Player.CrossHair = not self.Config.Player.CrossHair
            FM.ConfigClass.Save(true)
        end

        curY = curY + 20

        if self.Painter:Button("ESP DRAW DISTANCE: " .. self.Config.Player.ESPDistance, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "set_aimbot_fov") then
            local new = FM:GetTextInput("Enter ESP Draw Distance [35-50000]", self.Config.Player.ESPDistance, 7)
            if not dict.tonumber(new) then return FM:AddNotification("ERROR", "Invalid distance.") end
            if dict.tonumber(new) < 35 or dict.tonumber(new) > 50000 then return FM:AddNotification("ERROR", "Invalid distance.") end
            self.Config.Player.ESPDistance = dict.tonumber(new) + 0.0
            FM:AddNotification("SUCCESS", "ESP Draw Distance changed to " .. self.Config.Player.ESPDistance .. ".")
            FM.ConfigClass.Save(true)
        end
    end)

    local bone_check = {{31086, "SKEL_HEAD"}, {0, "SKEL_ROOT"}, {22711, "SKEL_L_Forearm"}, {28252, "SKEL_R_Forearm"}, {45509, "SKEL_L_UpperArm"}, {40269, "SKEL_R_UpperArm"}, {58271, "SKEL_L_Thigh"}, {51826, "SKEL_R_Thigh"}, {24816, "SKEL_Spine1"}, {24817, "SKEL_Spine2"}, {24818, "SKEL_Spine3"}, {14201, "SKEL_L_Foot"}, {52301, "SKEL_R_Foot"}}
    local aimbot_bones = {"SKEL_HEAD", "SKEL_ROOT", "SKEL_L_Forearm", "SKEL_R_Forearm", "SKEL_L_UpperArm", "SKEL_R_UpperArm", "SKEL_L_Thigh", "SKEL_R_Thigh", "SKEL_Spine1", "SKEL_Spine2", "SKEL_Spine3", "SKEL_L_Foot", "SKEL_R_Foot"}

    FM:AddCategory("Combat", function(self, x, y, w, h)
        local curY = 5

        if self.Painter:CheckBox("TRIGGER BOT", self.Config.Player.TriggerBot, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "trigger_bot_enabled") then
            self.Config.Player.TriggerBot = not self.Config.Player.TriggerBot
            FM.ConfigClass.Save(true)
        end

        local _w = (self.Painter:GetTextWidth("ANTI AIM", 4, 0.35)) + 20

        if self.Painter:CheckBox("ANTI AIM", self.Config.Player.AntiAim, x, y, w - _w - 10, curY, 200, 20, 255, 255, 255, 255, "anti_aim_enabled") then
            self.Config.Player.AntiAim = not self.Config.Player.AntiAim
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("TRIGGER BOT NEEDS LOS", self.Config.Player.TriggerBotNeedsLOS, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "triggerbot_need_los_enabled") then
            self.Config.Player.TriggerBotNeedsLOS = not self.Config.Player.TriggerBotNeedsLOS
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("AIMBOT", self.Config.Player.Aimbot, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "aimbot_enabled") then
            self.Config.Player.Aimbot = not self.Config.Player.Aimbot
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("AIMBOT NEEDS LOS", self.Config.Player.AimbotNeedsLOS, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "aimbot_need_los_enabled") then
            self.Config.Player.AimbotNeedsLOS = not self.Config.Player.AimbotNeedsLOS
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("TP TO AIMBOT TARGET", self.Config.Player.TPAimbot, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "tpaimbot_enabled") then
            self.Config.Player.TPAimbot = not self.Config.Player.TPAimbot
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("DRAW AIMBOT FOV", self.Config.Player.AimbotDrawFOV, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "draw_aimbot_fov") then
            self.Config.Player.AimbotDrawFOV = not self.Config.Player.AimbotDrawFOV
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("ONLY TARGET PLAYERS", self.Config.Player.OnlyTargetPlayers, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "only_target_players") then
            self.Config.Player.OnlyTargetPlayers = not self.Config.Player.OnlyTargetPlayers
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("TRIGGER BOT TARGET VEHICLES", self.Config.Player.TargetInsideVehicles, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "target_inside_vehicles") then
            self.Config.Player.TargetInsideVehicles = not self.Config.Player.TargetInsideVehicles
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("INFINITE COMBAT ROLL", self.Config.Player.InfiniteCombatRoll, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "infinite_combat_roll") then
            self.Config.Player.InfiniteCombatRoll = not self.Config.Player.InfiniteCombatRoll
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("~r~RAGE ~w~BOT", self.Config.Player.RageBot, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "rage_bot") then
            self.Config.Player.RageBot = not self.Config.Player.RageBot
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("NO BULLET DROP", self.Config.Player.NoDrop, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "no_bullet_drop") then
            self.Config.Player.NoDrop = not self.Config.Player.NoDrop
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("NO RELOAD", self.Config.Player.NoReload, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "no_reload") then
            self.Config.Player.NoReload = not self.Config.Player.NoReload
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("INFINITE AMMO", self.Config.Player.InfiniteAmmo, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "infinite_ammo") then
            self.Config.Player.InfiniteAmmo = not self.Config.Player.InfiniteAmmo
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("RAPID FIRE", self.Config.Player.RapidFire, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "rapid_fire") then
            self.Config.Player.RapidFire = not self.Config.Player.RapidFire
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("EXPLOSIVE AMMO", self.Config.Player.ExplosiveAmmo, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "explosive_ammo") then
            self.Config.Player.ExplosiveAmmo = not self.Config.Player.ExplosiveAmmo
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("ONE TAP", self.Config.Player.OneTap, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "one_tap_enabled") then
            if FM.Config.SafeMode then
                FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.")
            else
                self.Config.Player.OneTap = not self.Config.Player.OneTap
                FM.ConfigClass.Save(true)
            end
        end

        curY = curY + 20

        if self.Painter:ListChoice("AIMBOT BONE: ", aimbot_bones, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "aimbot_bone") then
            self.Config.Player.AimbotBone = list_choices["aimbot_bone"].selected
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:Button("AIMBOT FOV: " .. self.Config.Player.AimbotFOV, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "set_aimbot_fov") then
            local new = FM:GetTextInput("Enter Aimbot FOV [35-500]", self.Config.Player.AimbotFOV, 7)
            if not dict.tonumber(new) then return FM:AddNotification("ERROR", "Invalid FOV.") end
            if dict.tonumber(new) < 35 or dict.tonumber(new) > 500 then return FM:AddNotification("ERROR", "Invalid FOV.") end
            self.Config.Player.AimbotFOV = dict.tonumber(new) + 0.0
            FM:AddNotification("SUCCESS", "Aimbot FOV changed to " .. self.Config.Player.AimbotFOV .. ".")
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:Button("TRIGGER BOT DISTANCE: " .. self.Config.Player.TriggerBotDistance, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "set_trigger_bot_distance") then
            local new = FM:GetTextInput("Enter Trigger Bot Distance [10-10000]", self.Config.Player.TriggerBotDistance, 7)
            if not dict.tonumber(new) then return FM:AddNotification("ERROR", "Invalid distance.") end
            if dict.tonumber(new) < 10 or dict.tonumber(new) > 10000 then return FM:AddNotification("ERROR", "Invalid distance.") end
            self.Config.Player.TriggerBotDistance = dict.tonumber(new) + 0.0
            FM:AddNotification("SUCCESS", "Trigger Bot distance changed to " .. self.Config.Player.TriggerBotDistance .. ".")
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:Button("TP AIMBOT THRESHOLD: " .. self.Config.Player.TPAimbotThreshold, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "set_tp_aimbot_threshold") then
            local new = FM:GetTextInput("Enter TP Aimbot Distance [10-1000]", self.Config.Player.TPAimbotThreshold, 7)
            if not dict.tonumber(new) then return FM:AddNotification("ERROR", "Invalid distance.") end
            if dict.tonumber(new) < 10 or dict.tonumber(new) > 1000 then return FM:AddNotification("ERROR", "Invalid distance.") end
            self.Config.Player.TPAimbotThreshold = dict.tonumber(new) + 0.0
            FM:AddNotification("SUCCESS", "TP Aimbot threshold changed to " .. self.Config.Player.TPAimbotThreshold .. ".")
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:Button("TP AIMBOT DISTANCE: " .. self.Config.Player.TPAimbotDistance, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "set_tp_aimbot_distance") then
            local new = FM:GetTextInput("Enter TP Aimbot Distance [0-10]", self.Config.Player.TPAimbotDistance, 7)
            if not dict.tonumber(new) then return FM:AddNotification("ERROR", "Invalid distance.") end
            if dict.tonumber(new) < 0 or dict.tonumber(new) > 10 then return FM:AddNotification("ERROR", "Invalid distance.") end
            self.Config.Player.TPAimbotDistance = dict.tonumber(new) + 0.0
            FM:AddNotification("SUCCESS", "TP Aimbot distance changed to " .. self.Config.Player.TPAimbotDistance .. ".")
            FM.ConfigClass.Save(true)
        end
    end)

    local function _is_ped_player(ped)
        local id = FM:GetFunction("NetworkGetPlayerIndexFromPed")(ped)

        return id and id > 0
    end

    local function rot_to_dir(rot)
        local radZ = rot.z * 0.0174532924
        local radX = rot.x * 0.0174532924
        local num = dict.math.abs(dict.math.cos(radX))
        local dir = vector3(-dict.math.sin(radZ) * num, dict.math.cos(radZ) * num, radX)

        return dir
    end

    local function _multiply(vector, mult)
        return vector3(vector.x * mult, vector.y * mult, vector.z * mult)
    end

    local function _get_ped_hovered_over()
        local cur = FM:GetFunction("GetGameplayCamCoord")()
        local _dir = FM:GetFunction("GetGameplayCamRot")(0)
        local dir = rot_to_dir(_dir)
        local len = _multiply(dir, FM.Config.Player.TriggerBotDistance)
        local targ = cur + len
        local handle = FM:GetFunction("StartShapeTestRay")(cur.x, cur.y, cur.z, targ.x, targ.y, targ.z, -1)
        local _, hit, hit_pos, _, entity = FM:GetFunction("GetShapeTestResult")(handle)
        local force
        local _seat

        if FM:GetFunction("DoesEntityExist")(entity) and FM:GetFunction("IsEntityAVehicle")(entity) and FM.Config.Player.TargetInsideVehicles and FM:GetFunction("HasEntityClearLosToEntityInFront")(FM:GetFunction("PlayerPedId")(), entity) then
            local driver = FM:GetFunction("GetPedInVehicleSeat")(entity, -1)

            if FM:GetFunction("DoesEntityExist")(driver) and not FM:GetFunction("IsPedDeadOrDying")(driver) then
                entity = driver
                force = true
                _seat = -1
            else
                local _dist = dict.math.huge
                local _ped

                for i = -2, FM:GetFunction("GetVehicleMaxNumberOfPassengers")(vehicle) do
                    local who = FM:GetFunction("GetPedInVehicleSeat")(entity, i)

                    if FM:GetFunction("DoesEntityExist")(who) and FM:GetFunction("IsEntityAPed")(who) and not FM:GetFunction("IsPedDeadOrDying")(who) then
                        local s_pos = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(who, 0.0, 0.0, 0.0)
                        local s_dist = FM:GetFunction("GetDistanceBetweenCoords")(hit_pos.x, hit_pos.y, hit_pos.z, s_pos.x, s_pos.y, s_pos.z, true)

                        if s_dist < _dist then
                            _dist = s_dist
                            _ped = who
                            _seat = i
                        end
                    end
                end

                if FM:GetFunction("DoesEntityExist")(_ped) and FM:GetFunction("IsEntityAPed")(_ped) then
                    entity = _ped
                    force = true
                end
            end
        end

        if hit and FM:GetFunction("DoesEntityExist")(entity) and FM:GetFunction("DoesEntityHaveDrawable")(entity) and FM:GetFunction("IsEntityAPed")(entity) and (force or FM:GetFunction("HasEntityClearLosToEntityInFront")(FM:GetFunction("PlayerPedId")(), entity)) then return true, entity, _seat end

        return nil, false, nil
    end

    local _aimbot_poly = {}

    local function _within_poly(point, poly)
        local inside = false
        local j = #poly

        for i = 1, #poly do
            if (poly[i].y < point.y and poly[j].y >= point.y or poly[j].y < point.y and poly[i].y >= point.y) and (poly[i].x + (point.y - poly[i].y) / (poly[j].y - poly[i].y) * (poly[j].x - poly[i].x) < point.x) then
                inside = not inside
            end

            j = i
        end

        return inside
    end

    local function _is_ped_in_aimbot_fov(ped)
        local pos = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, 0.0, 0.0, 0.0)
        local showing, sx, sy = FM:GetFunction("GetScreenCoordFromWorldCoord")(pos.x, pos.y, pos.z)
        if not showing then return false end

        return _within_poly({
            x = sx,
            y = sy
        }, _aimbot_poly.points)
    end

    local function _get_ped_in_aimbot_fov()
        local fov = FM.Config.Player.AimbotFOV
        local closest = dict.math.huge
        local selected

        for ped in FM:EnumeratePeds() do
            if not FM:IsFriend(ped) and (not FM.Config.Player.OnlyTargetPlayers or _is_ped_player(ped)) then
                local pos = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, 0.0, 0.0, 0.0)
                local showing, sx, sy = FM:GetFunction("GetScreenCoordFromWorldCoord")(pos.x, pos.y, pos.z)

                if ped ~= FM:GetFunction("PlayerPedId")() and showing and (not FM.Config.Player.AimbotNeedsLOS or FM:GetFunction("HasEntityClearLosToEntityInFront")(FM:GetFunction("PlayerPedId")(), ped)) then
                    local in_fov = _is_ped_in_aimbot_fov(ped)
                    local us = FM:GetFunction("GetGameplayCamCoord")()
                    local dist = FM:GetFunction("GetDistanceBetweenCoords")(pos.x, pos.y, pos.z, us.x, us.y, us.z)

                    if in_fov and dist < closest then
                        dist = closest
                        selected = ped
                    end
                end
            end
        end

        if selected and (not FM:GetFunction("DoesEntityExist")(FM.Config.Player.AimbotTarget) or FM:GetFunction("IsEntityDead")(FM.Config.Player.AimbotTarget)) and not FM:IsFriend(selected) and FM:GetFunction("HasEntityClearLosToEntity")(FM:GetFunction("PlayerPedId")(), selected) then
            FM.Config.Player.AimbotTarget = selected
        end

        local _ped = _get_ped_hovered_over()

        if not FM.Config.Player.AimbotTarget and FM:GetFunction("DoesEntityExist")(_ped) and not FM:IsFriend(_ped) and (not FM.Config.Player.OnlyTargetPlayers or _is_ped_player(_ped)) then
            local pos = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(_ped, 0.0, 0.0, 0.0)
            local showing, sx, sy = FM:GetFunction("GetScreenCoordFromWorldCoord")(pos.x, pos.y, pos.z)

            -- and FM:GetFunction("HasEntityClearLosToEntityInFront")(FM:GetFunction("PlayerPedId")(), ped) then
            if _ped ~= FM:GetFunction("PlayerPedId")() and showing and (not FM.Config.Player.AimbotNeedsLOS or FM:GetFunction("HasEntityClearLosToEntityInFront")(FM:GetFunction("PlayerPedId")(), ped)) then
                local in_fov = _is_ped_in_aimbot_fov(_ped)

                if in_fov and not FM:GetFunction("DoesEntityExist")(FM.Config.Player.AimbotTarget) then
                    FM.Config.Player.AimbotTarget = _ped
                end
            end
        end
    end

    local function _get_closest_bone(ped, _seat)
        local cur = FM:GetFunction("GetGameplayCamCoord")()
        local _dir = FM:GetFunction("GetGameplayCamRot")(0)
        local dir = rot_to_dir(_dir)
        local where = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, 0.0, 0.0, 0.0)
        local dist = FM:GetFunction("GetDistanceBetweenCoords")(cur.x, cur.y, cur.z, where.x, where.y, where.z) + 25.0
        local len = _multiply(dir, dist)
        local targ = cur + len
        local handle = FM:GetFunction("StartShapeTestRay")(cur.x, cur.y, cur.z, targ.x, targ.y, targ.z, -1)
        local _, hit, hit_pos, _, entity = FM:GetFunction("GetShapeTestResult")(handle)

        if FM:GetFunction("IsEntityAVehicle")(entity) then
            entity = FM:GetFunction("GetPedInVehicleSeat")(entity, _seat)
        end

        if entity ~= ped then return false end
        local _dist, bone, _name = dict.math.huge, 0

        if hit then
            for _, dat in dict.ipairs(bone_check) do
                local id = dat[1]

                if id ~= -1 then
                    local bone_coords = FM:GetFunction("GetPedBoneCoords")(ped, id, 0.0, 0.0, 0.0)
                    local b_dist = FM:GetFunction("GetDistanceBetweenCoords")(bone_coords.x, bone_coords.y, bone_coords.z, hit_pos.x, hit_pos.y, hit_pos.z, true)

                    if b_dist < _dist then
                        _dist = b_dist
                        bone = id
                        _name = dat[2]
                    end
                end
            end
        end

        return bone, _dist, _name
    end

    function FM:DoAimbotPoly()
        local sx, sy = _aimbot_poly.sx, _aimbot_poly.sy
        local fov = self.Config.Player.AimbotFOV
        if not fov then return end
        if sx and FM:ScrW() == sx and sy and FM:ScrH() == sy and _aimbot_poly.fov == self.Config.Player.AimbotFOV then return end
        _aimbot_poly.sx = FM:ScrW()
        _aimbot_poly.sy = FM:ScrH()
        _aimbot_poly.fov = self.Config.Player.AimbotFOV
        _aimbot_poly.points = {}

        for i = 1, 360 do
            local x = dict.math.cos(dict.math.rad(i)) / FM:ScrW()
            local y = dict.math.sin(dict.math.rad(i)) / FM:ScrH()
            local sx, sy = x * fov, y * fov

            _aimbot_poly.points[#_aimbot_poly.points + 1] = {
                x = sx + ((FM:ScrW() / 2) / FM:ScrW()),
                y = sy + ((FM:ScrH() / 2) / FM:ScrH())
            }
        end
    end

    function FM:DrawAimbotFOV()
        for _, dat in dict.ipairs(_aimbot_poly.points) do
            DrawRect(dat.x, dat.y, 5 / FM:ScrW(), 5 / FM:ScrH(), FM.Tertiary[1], FM.Tertiary[2], FM.Tertiary[3], 70)
        end
    end

    function FM:_rage_bot()
        for ped in FM:EnumeratePeds() do
            if FM:GetFunction("DoesEntityExist")(ped) and FM:GetFunction("IsEntityAPed")(ped) and ped ~= FM:GetFunction("PlayerPedId")() and not FM:GetFunction("IsPedDeadOrDying")(ped) then
                if not FM:IsFriend(ped) and (not FM.Config.Player.OnlyTargetPlayers or _is_ped_player(ped)) then
                    if FM.Config.Player.OneTap then
                        FM:GetFunction("SetPlayerWeaponDamageModifier")(FM:GetFunction("PlayerId")(), 100.0)
                    end

                    local destination = FM:GetFunction("GetPedBoneCoords")(ped, 0, 0.0, 0.0, 0.0)
                    local origin = FM:GetFunction("GetPedBoneCoords")(ped, 57005, 0.0, 0.0, 0.2)
                    local where = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, 0.0, 0.0, 1.0)

                    if self.Config.ShowText then
                        self:Draw3DText(where.x, where.y, where.z, "*RAGED*", 255, 55, 70, 255)
                    end

                    FM:GetFunction("ShootSingleBulletBetweenCoords")(origin.x, origin.y, origin.z, destination.x, destination.y, destination.z, 1, true, FM:GetFunction("GetSelectedPedWeapon")(FM:GetFunction("PlayerPedId")()), FM:GetFunction("PlayerPedId")(), true, false, 24000.0)

                    if FM.Config.Player.OneTap then
                        FM:GetFunction("SetPlayerWeaponDamageModifier")(FM:GetFunction("PlayerId")(), 1.0)
                    end
                end
            end
        end
    end

    function FM:_no_bullet_drop()
        if IsDisabledControlPressed(0, FM.Keys["MOUSE1"]) and not FM.Showing and (not FM.FreeCam.On and not FM.RCCar.CamOn) then
            local curWep = FM:GetFunction("GetSelectedPedWeapon")(FM:GetFunction("PlayerPedId")())
            local cur = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(FM:GetFunction("GetCurrentPedWeaponEntityIndex")(FM:GetFunction("PlayerPedId")()), 0.0, 0.0, 0.0)
            local _dir = FM:GetFunction("GetGameplayCamRot")(0)
            local dir = rot_to_dir(_dir)
            local dist = 99999.9
            local len = _multiply(dir, dist)
            local targ = cur + len
            FM:GetFunction("ShootSingleBulletBetweenCoords")(cur.x, cur.y, cur.z, targ.x, targ.y, targ.z, 5, 1, curWep, FM:GetFunction("PlayerPedId")(), true, true, 24000.0)
            FM:GetFunction("SetPedShootsAtCoord")(FM:GetFunction("PlayerPedId")(), targ.x, targ.y, targ.z, true)
        end
    end

    function FM:_trigger_bot()
        local found, ent, _seat = _get_ped_hovered_over()

        if found and FM:GetFunction("DoesEntityExist")(ent) and FM:GetFunction("IsEntityAPed")(ent) and not FM:IsFriend(ent) and FM:GetFunction("IsPedWeaponReadyToShoot")(FM:GetFunction("PlayerPedId")()) and (not FM.Config.Player.OnlyTargetPlayers or _is_ped_player(ent)) and (not FM.Config.Player.TriggerBotNeedsLOS or FM:GetFunction("HasEntityClearLosToEntityInFront")(FM:GetFunction("PlayerPedId")(), ent)) then
            local _bone, _dist, _name = _get_closest_bone(ent, _seat)

            -- SKEL_HEAD
            if _seat ~= nil then
                _bone = 31086
            end

            if _bone and not FM:GetFunction("IsPedDeadOrDying")(ent) then
                if FM.Config.Player.OneTap then
                    FM:GetFunction("SetPlayerWeaponDamageModifier")(FM:GetFunction("PlayerId")(), 100.0)
                end

                local _pos = FM:GetFunction("GetPedBoneCoords")(ent, _bone, 0.0, 0.0, 0.0)
                local where = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ent, 0.0, 0.0, 1.0)
                self:Draw3DText(where.x, where.y, where.z + 0.2, "*TRIGGER BOT SHOOTING*", 255, 0, 0, 255)
                FM:GetFunction("SetPedShootsAtCoord")(FM:GetFunction("PlayerPedId")(), _pos.x, _pos.y, _pos.z, true)

                if FM.Config.Player.OneTap then
                    FM:GetFunction("SetPlayerWeaponDamageModifier")(FM:GetFunction("PlayerId")(), 1.0)
                end
            end
        end
    end

    function FM:_aimbot()
        SetCamAffectsAiming(GetRenderingCam(), false)
        local _ped = _get_ped_in_aimbot_fov()

        if self.Config.Player.AimbotTarget and (not FM:GetFunction("DoesEntityExist")(self.Config.Player.AimbotTarget) or FM:GetFunction("IsPedDeadOrDying")(self.Config.Player.AimbotTarget)) then
            self.Config.Player.AimbotTarget = nil
        end

        if self.Config.Player.AimbotTarget and FM:GetFunction("DoesEntityExist")(self.Config.Player.AimbotTarget) and not FM:GetFunction("IsPedDeadOrDying")(self.Config.Player.AimbotTarget) then
            _ped = self.Config.Player.AimbotTarget
        end


        if FM:GetFunction("DoesEntityExist")(_ped) and not FM:GetFunction("IsPedDeadOrDying")(_ped) then
            if not self.Config.Player.AimbotTarget then
                self.Config.Player.AimbotTarget = _ped
            end

            local where = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(_ped, 0.0, 0.0, 1.0)
            local _pos = FM:GetFunction("GetPedBoneCoords")(_ped, bone_check[self.Config.Player.AimbotBone][1], 0.0, 0.0, 0.0)

            if self.Config.ShowText then
                self:Draw3DText(where.x, where.y, where.z, "*AIMBOT LOCKED*", 255, 0, 0, 255)
            end

            FM:GetFunction("DisableControlAction", 0, FM.Keys[self.Config.Player.AimbotKey], true)

            if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys[self.Config.Player.AimbotKey]) then
                if FM.Config.Player.OneTap then
                    FM:GetFunction("SetPlayerWeaponDamageModifier")(FM:GetFunction("PlayerId")(), 9999.9)
                end

                FM:GetFunction("SetPedShootsAtCoord")(FM:GetFunction("PlayerPedId")(), _pos.x, _pos.y, _pos.z, true)
                local _on_screen, sx, sy = FM:GetFunction("GetScreenCoordFromWorldCoord")(_pos.x, _pos.y, _pos.z)
                FM:GetFunction("SetCursorLocation")(sx, sy)

                if FM.Config.Player.OneTap then
                    FM:GetFunction("SetPlayerWeaponDamageModifier")(FM:GetFunction("PlayerId")(), 1.0)
                end
            end
        end
    end

    function FM:_tp_aimbot()
        local them = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(self.Config.Player.AimbotTarget, 0.0, 0.0, 0.0)
        local us = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(FM:GetFunction("PlayerPedId")(), 0.0, 0.0, 0.0)
        local dist = FM:GetFunction("GetDistanceBetweenCoords")(them.x, them.y, them.z, us.x, us.y, us.z)

        if dist > self.Config.Player.TPAimbotThreshold then
            local fwd = FM:GetFunction("GetEntityForwardVector")(self.Config.Player.AimbotTarget)
            local spot = them + (fwd * -self.Config.Player.TPAimbotDistance)
            FM:GetFunction("SetEntityCoords")(FM:GetFunction("PlayerPedId")(), spot.x, spot.y, spot.z - 1.0)
            local rot = FM:GetFunction("GetEntityRotation")(self.Config.Player.AimbotTarget)
            FM:GetFunction("SetEntityRotation")(FM:GetFunction("PlayerPedId")(), rot.x, rot.y, rot.z, 0, true)
        end
    end

    function FM:DoAimbot()
        if not self.Config.Player.AimbotFOV or not self._ScrW or not self._ScrH then return end
        self:DoAimbotPoly()

        if self.Config.Player.AimbotDrawFOV then
            self:DrawAimbotFOV()
        end

        if not FM:GetFunction("IsPlayerFreeAiming")(FM:GetFunction("PlayerId")()) and not FM:GetFunction("IsPedDoingDriveby")(FM:GetFunction("PlayerPedId")()) then
            self.Config.Player.AimbotTarget = nil

            return
        end

        if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys[self.Config.Player.AimbotReleaseKey]) then
            self.Config.Player.AimbotTarget = nil
        end

        if self.Config.Player.RageBot then
            self:_rage_bot()
        end

        if self.Config.Player.TriggerBot then
            self:_trigger_bot()
        end

        if self.Config.Player.NoDrop then
            self:_no_bullet_drop()
        end

        if self.Config.Player.Aimbot then
            self:_aimbot()
        end

        if self.Config.Player.TPAimbot and self.Config.Player.Aimbot and self.Config.Player.AimbotTarget and FM:GetFunction("DoesEntityExist")(self.Config.Player.AimbotTarget) and not FM:GetFunction("IsPedDeadOrDying")(self.Config.Player.AimbotTarget) then
            self:_tp_aimbot()
        end
    end

    CreateThread(function()
        while FM.Enabled do
            Wait(0)
            FM:DoAimbot()
        end
    end)

    FM:AddCategory("Model", function(self, x, y)
        local curY = 0

        if self.Painter:Button("RANDOM COMPONENTS", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "skin_random") then
            CreateThread(function()
                FM:SetPedModel("mp_m_freemode_01")
                FM:GetFunction("SetPedRandomComponentVariation")(FM:GetFunction("PlayerPedId")(), true)
                FM:GetFunction("SetPedRandomProps")(FM:GetFunction("PlayerPedId")(), true)
            end)
        end

        curY = curY + 25

        if self.Painter:Button("MP GREEN ALIEN", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "alien_green") then
            CreateThread(function()
                FM:SetPedModel("mp_m_freemode_01")
                FM:GetFunction("SetPedComponentVariation")(FM:GetFunction("PlayerPedId")(), 1, 134, 8)
                FM:GetFunction("SetPedComponentVariation")(FM:GetFunction("PlayerPedId")(), 2, 0, 0)
                FM:GetFunction("SetPedComponentVariation")(FM:GetFunction("PlayerPedId")(), 3, 13, 1)
                FM:GetFunction("SetPedComponentVariation")(FM:GetFunction("PlayerPedId")(), 4, 106, 8)
                FM:GetFunction("SetPedComponentVariation")(FM:GetFunction("PlayerPedId")(), 5, 0, 0)
                FM:GetFunction("SetPedComponentVariation")(FM:GetFunction("PlayerPedId")(), 6, 6, 1)
                FM:GetFunction("SetPedComponentVariation")(FM:GetFunction("PlayerPedId")(), 7, 0, 0)
                FM:GetFunction("SetPedComponentVariation")(FM:GetFunction("PlayerPedId")(), 8, 15, 1)
                FM:GetFunction("SetPedComponentVariation")(FM:GetFunction("PlayerPedId")(), 11, 274, 8)
            end)
        end

        curY = curY + 25

        if self.Painter:Button("MP PURPLE ALIEN", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "alien_purple") then
            CreateThread(function()
                FM:SetPedModel("mp_m_freemode_01")
                FM:GetFunction("SetPedComponentVariation")(FM:GetFunction("PlayerPedId")(), 1, 134, 9)
                FM:GetFunction("SetPedComponentVariation")(FM:GetFunction("PlayerPedId")(), 2, 0, 0)
                FM:GetFunction("SetPedComponentVariation")(FM:GetFunction("PlayerPedId")(), 3, 13, 1)
                FM:GetFunction("SetPedComponentVariation")(FM:GetFunction("PlayerPedId")(), 4, 106, 9)
                FM:GetFunction("SetPedComponentVariation")(FM:GetFunction("PlayerPedId")(), 5, 0, 0)
                FM:GetFunction("SetPedComponentVariation")(FM:GetFunction("PlayerPedId")(), 6, 6, 1)
                FM:GetFunction("SetPedComponentVariation")(FM:GetFunction("PlayerPedId")(), 7, 0, 0)
                FM:GetFunction("SetPedComponentVariation")(FM:GetFunction("PlayerPedId")(), 8, 15, 1)
                FM:GetFunction("SetPedComponentVariation")(FM:GetFunction("PlayerPedId")(), 11, 274, 9)
            end)
        end

        curY = curY + 25

        if self.Painter:Button("COVID-19 PED", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "covid_19") then
            CreateThread(function()
                FM:SetPedModel("g_m_m_chemwork_01")
            end)
        end

        curY = curY + 25

        if self.Painter:Button("CUSTOM MODEL", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "custom_model") then
            CreateThread(function()
                local mdl = FM:GetTextInput("Enter model name.", "", 50)

                if not mdl or mdl == "" then
                    FM:AddNotification("INFO", "Cancelled.", 5000)
                else
                    FM:SetPedModel(mdl)
                end
            end)
        end

        curY = curY + 25

        if self.Painter:Button("RESET PLAYER MODEL", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "ped_reset") then
            CreateThread(function()
                FM:SetPedModel("mp_m_freemode_01")
                FM:GetFunction("SetPedRandomComponentVariation")(FM:GetFunction("PlayerPedId")(), true)
                FM:GetFunction("SetPedRandomProps")(FM:GetFunction("PlayerPedId")(), true)
            end)
        end

        curY = curY + 25
    end)

    local function _has_value(tab, val)
        for key, value in dict.pairs(tab) do
            if value == val then return true end
        end

        return false
    end

    local function _find_weapon(str)
        if _has_value(all_weapons, str) then return str end

        for _, wep in dict.ipairs(all_weapons) do
            if wep:lower():find(str:lower()) then return wep end
        end

        return false
    end

    FM:AddCategory("Weapon", function(self, x, y)
        local curY = 0

        if self.Painter:Button("GIVE ALL WEAPONS", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "give_self_all_weapons") then
            for _, wep in dict.ipairs(all_weapons) do
                FM:GetFunction("GiveWeaponToPed")(FM:GetFunction("PlayerPedId")(), FM:GetFunction("GetHashKey")(wep), 500, false, true)
            end

            FM:AddNotification("SUCCESS", "Weapons given!", 10000)
        end

        curY = curY + 25

        if self.Painter:Button("GIVE SPECIFIC", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "give_self_specific_weapon") then
            local name = FM:GetTextInput("Enter weapon name", "", 30)

            if name then
                local wep = _find_weapon(name)
                if not wep then return FM:AddNotification("ERROR", "Invalid weapon.", 5000) end
                FM:GetFunction("GiveWeaponToPed")(FM:GetFunction("PlayerPedId")(), FM:GetFunction("GetHashKey")(wep), 500, false, true)
                FM:AddNotification("SUCCESS", "Weapon given!", 10000)
            end
        end

        curY = curY + 25

        if self.Painter:Button("REMOVE ALL WEAPONS", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "remove_self_all_weapons") then
            for _, wep in dict.ipairs(all_weapons) do
                FM:GetFunction("RemoveWeaponFromPed")(FM:GetFunction("PlayerPedId")(), FM:GetFunction("GetHashKey")(wep), 500, false, true)
            end

            FM:AddNotification("SUCCESS", "Weapons removed!", 10000)
        end

        curY = curY + 25
    end)

    local boost_options = {"1.0", "2.0", "4.0", "8.0", "16.0", "32.0", "64.0", "128.0", "256.0", "512.0"}

    FM:AddCategory("Vehicle", function(self, x, y)
        local curY = 5

        if self.Painter:CheckBox("VEHICLE GOD MODE", self.Config.Vehicle.GodMode, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "vehicle_god_mode") then
            self.Config.Vehicle.GodMode = not self.Config.Vehicle.GodMode
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("BULLET PROOF TIRES", self.Config.Vehicle.BulletProofTires, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "bulletproof_enabled") then
            self.Config.Vehicle.BulletProofTires = not self.Config.Vehicle.BulletProofTires
            FM.ConfigClass.Save(true)
        end

        curY = curY + 20

        if self.Painter:Button("DELETE VEHICLE", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "delete_self_vehicle") then
            local veh = FM:GetFunction("GetVehiclePedIsIn")(FM:GetFunction("PlayerPedId")())

            if not FM:GetFunction("DoesEntityExist")(veh) then
                FM:AddNotification("ERROR", "You must be in a vehicle to use this!")
            else
                FM.Util:DeleteEntity(veh)
                FM:AddNotification("SUCCESS", "Vehicle deleted!", 10000)
            end
        end

        curY = curY + 20

        if self.Painter:Button("SPAWN VEHICLE", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "spawn_self_vehicle") then
            local modelName = FM:GetTextInput("Enter vehicle spawn name", "", 20)

            if modelName ~= "" and FM:GetFunction("IsModelValid")(modelName) and FM:GetFunction("IsModelAVehicle")(modelName) then
                FM:SpawnLocalVehicle(modelName)
                FM:AddNotification("SUCCESS", "Spawned vehicle " .. modelName, 10000)
            else
                FM:AddNotification("ERROR", "That is not a vaild vehicle model.", 10000)
            end
        end

        curY = curY + 25

        if self.Painter:Button("REPAIR VEHICLE", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "repair_vehicle") then
            local veh = FM:GetFunction("GetVehiclePedIsIn")(FM:GetFunction("PlayerPedId")(), false)
            if not FM:GetFunction("DoesEntityExist")(veh) then return FM:AddNotification("ERROR", "You must be in a vehicle to use this!") end
            FM:RepairVehicle(veh)
            FM:AddNotification("SUCCESS", "Vehicle repaired!", 10000)
        end

        curY = curY + 25

        if self.Painter:Button("MAX VEHICLE OUT", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "max_out_vehicle") then
            local veh = FM:GetFunction("GetVehiclePedIsIn")(FM:GetFunction("PlayerPedId")(), false)
            FM:GetFunction("SetVehicleModKit")(veh, 0)
            FM:GetFunction("SetVehicleMod")(veh, 11, FM:GetFunction("GetNumVehicleMods")(veh, 11) - 1, false)
            FM:GetFunction("SetVehicleMod")(veh, 12, FM:GetFunction("GetNumVehicleMods")(veh, 12) - 1, false)
            FM:GetFunction("SetVehicleMod")(veh, 13, FM:GetFunction("GetNumVehicleMods")(veh, 13) - 1, false)
            FM:GetFunction("SetVehicleMod")(veh, 15, FM:GetFunction("GetNumVehicleMods")(veh, 15) - 2, false)
            FM:GetFunction("SetVehicleMod")(veh, 16, FM:GetFunction("GetNumVehicleMods")(veh, 16) - 1, false)
            FM:GetFunction("ToggleVehicleMod")(veh, 17, true)
            FM:GetFunction("ToggleVehicleMod")(veh, 18, true)
            FM:GetFunction("ToggleVehicleMod")(veh, 19, true)
            FM:GetFunction("ToggleVehicleMod")(veh, 21, true)
            FM:AddNotification("SUCCESS", "Vehicle maxed out.", 10000)
        end

        curY = curY + 25

        if self.Painter:ListChoice("VEHICLE ENGINE BOOST: ", boost_options, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "vehicle_boost") then
            self.Config.Vehicle.Boost = dict.tonumber(boost_options[list_choices["vehicle_boost"].selected])
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:Button("UNLOCK CLOSEST VEHICLE", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "unlock_closest_vehicle") then
            local closestVeh = FM:GetClosestVehicle()
            if not FM:GetFunction("DoesEntityExist")(closestVeh) then return FM:AddNotification("ERROR", "No vehicle!") end
            FM:AddNotification("INFO", "Unlocking vehicle.", 5000)
            FM:UnlockVehicle(closestVeh)
        end

        curY = curY + 25

        if self.Painter:Button("DISABLE CLOSEST VEHICLE", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "disable_closest_vehicle") then
            local closestVeh = FM:GetClosestVehicle()
            if not FM:GetFunction("DoesEntityExist")(closestVeh) then return FM:AddNotification("ERROR", "No vehicle!") end
            FM:DisableVehicle(closestVeh)
        end

        curY = curY + 25

        if self.Painter:Button("DELETE CLOSEST VEHICLE", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "delete_closest_vehicle") then
            local closestVeh = FM:GetClosestVehicle()
            if not FM:GetFunction("DoesEntityExist")(closestVeh) then return FM:AddNotification("ERROR", "No vehicle!") end
            FM.Util:DeleteEntity(closestVeh)
        end
    end)

    FM:AddCategory("Online", function(self, x, y)
        local curY = 5

        if self.Painter:CheckBox("INCLUDE SELF", FM.Config.OnlineIncludeSelf, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "online_include_self") then
            FM.Config.OnlineIncludeSelf = not FM.Config.OnlineIncludeSelf
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("LAG SERVER", _use_lag_server, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "lag_server_out") then
            if FM.Config.SafeMode then
                FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.")
            else
                _use_lag_server = not _use_lag_server
                FM:LaggingServer()

                if _use_lag_server then
                    FM:AddNotification("INFO", "Lagging server!", 10000)
                else
                    FM:AddNotification("INFO", "Stopped lagger.", 10000)
                end
            end
        end

        curY = curY + 25

        if self.Painter:CheckBox("HYDRANT LOOP", _use_hydrant_loop, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "hydrant_loop_all") then
            if FM.Config.SafeMode then
                FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.")
            else
                _use_hydrant_loop = not _use_hydrant_loop
                FM:HydrantLoop()

                if _use_hydrant_loop then
                    FM:AddNotification("INFO", "Water for all!", 10000)
                else
                    FM:AddNotification("INFO", "Stopped water.", 10000)
                end
            end
        end

        curY = curY + 25

        if self.Painter:CheckBox("FIRE LOOP", _use_fire_loop, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "fire_loop_all") then
            if FM.Config.SafeMode then
                FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.")
            else
                _use_fire_loop = not _use_fire_loop
                FM:FireLoop()

                if _use_fire_loop then
                    FM:AddNotification("INFO", "Fire for all!", 10000)
                else
                    FM:AddNotification("INFO", "Stopped fire.", 10000)
                end
            end
        end

        curY = curY + 25

        if self.Painter:CheckBox("TAZE LOOP", _use_taze_loop, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "taze_loop_all") then
            if FM.Config.SafeMode then
                FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.")
            else
                _use_taze_loop = not _use_taze_loop
                FM:TazeLoop()

                if _use_taze_loop then
                    FM:AddNotification("INFO", "Tazing for all!", 10000)
                else
                    FM:AddNotification("INFO", "Stopped tazing.", 10000)
                end
            end
        end

        curY = curY + 25

        if self.Painter:CheckBox("DELETE VEHICLES LOOP", _use_delete_loop, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "delete_all_vehicles_loop") then
            if FM.Config.SafeMode then
                FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.")
            else
                _use_delete_loop = not _use_delete_loop
                FM:DeleteLoop()

                if _use_delete_loop then
                    FM:AddNotification("INFO", "No more cars!", 10000)
                else
                    FM:AddNotification("INFO", "Stopped deleting.", 10000)
                end
            end
        end

        curY = curY + 25

        if self.Painter:CheckBox("EXPLODE VEHICLES LOOP", _use_explode_vehicle_loop, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "explode_vehicles_loop") then
            if FM.Config.SafeMode then
                FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.")
            else
                _use_explode_vehicle_loop = not _use_explode_vehicle_loop
                FM:ExplodeVehicleLoop()

                if _use_explode_vehicle_loop then
                    FM:AddNotification("INFO", "Crisp cars for all!", 10000)
                else
                    FM:AddNotification("INFO", "Stopped exploding.", 10000)
                end
            end
        end

        curY = curY + 25

        if self.Painter:CheckBox("EXPLODE PLAYERS LOOP", _use_explode_player_loop, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "explode_player_loop") then
            if FM.Config.SafeMode then
                FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.")
            else
                _use_explode_player_loop = not _use_explode_player_loop
                FM:ExplodePlayerLoop()

                if _use_explode_player_loop then
                    FM:AddNotification("INFO", "ISIS for all!", 10000)
                else
                    FM:AddNotification("INFO", "Stopped exploding.", 10000)
                end
            end
        end

        curY = curY + 25

        if self.Painter:CheckBox("LAUNCH VEHICLE LOOP", _use_launch_loop, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "_use_launch_loop") then
            if FM.Config.SafeMode then
                FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.")
            else
                _use_launch_loop = not _use_launch_loop
                FM:LaunchLoop()

                if _use_launch_loop then
                    FM:AddNotification("INFO", "Time to go to space!", 10000)
                else
                    FM:AddNotification("INFO", "Stopped launching.", 10000)
                end
            end
        end

        curY = curY + 20

        if self.DynamicTriggers["esx-qalle-jail"] and self.DynamicTriggers["esx-qalle-jail"]["esx-qalle-jail:jailPlayer"] then
            if self.Painter:Button("JAIL ALL ~g~ESX ~w~(SHIFT FOR REASON)", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "jail_all_bitches") then
                CreateThread(function()
                    local reason = "^3#FalloutMenu"

                    if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTSHIFT"]) then
                        local _msg = FM:GetTextInput("Enter jail reason.", reason, 200)

                        if _msg then
                            reason = _msg
                        end
                    end

                    for id, src in dict.pairs(FM.PlayerCache) do
                        src = dict.tonumber(src)

                        if src ~= PlayerId() or FM.Config.OnlineIncludeSelf then
                            local _id = dict.tonumber(FM:GetFunction("GetPlayerServerId")(src))
                            FM:GetFunction("TriggerServerEvent")(self.DynamicTriggers["esx-qalle-jail"]["esx-qalle-jail:jailPlayer"], _id, dict.math.random(500, 5000), reason)
                        end
                    end

                    FM:AddNotification("INFO", "All players jailed!", 10000)
                end)
            end

            curY = curY + 25
        end

        if self.Painter:Button("REMOVE ALL WEAPONS", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "remove_everyones_weapons") then
            CreateThread(function()
                for id, src in dict.pairs(FM.PlayerCache) do
                    src = dict.tonumber(src)

                    if src ~= PlayerId() or FM.Config.OnlineIncludeSelf then
                        local ped = FM:GetFunction("GetPlayerPed")(src)

                        for _, wep in dict.pairs(all_weapons) do
                            FM:GetFunction("RemoveWeaponFromPed")(ped, FM:GetFunction("GetHashKey")(wep), 9000, false, true)
                        end
                    end
                end
            end)

            FM:AddNotification("INFO", "Weapons removed!", 10000)
        end

        curY = curY + 25

        if self.Painter:Button("GIVE ALL WEAPONS", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "give_everyone_weapons") then
            CreateThread(function()
                for id, src, wep in dict.pairs(FM.PlayerCache, all_weapons) do
                    src = dict.tonumber(src)

                    if src ~= PlayerId() or FM.Config.OnlineIncludeSelf then
                        local ped = FM:GetFunction("GetPlayerPed")(src)

                        for _, wep in dict.pairs(all_weapons) do
                            FM:GetFunction("GiveWeaponToPed")(ped, FM:GetFunction("GetHashKey")(wep), 9000, false, true)
                        end
                    end
                end
            end)

            FM:AddNotification("INFO", "Weapons given!", 10000)
        end

        curY = curY + 25

        if self.Painter:Button("EXPLODE EVERYONE", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "explode_everyone") then
            if FM.Config.SafeMode then
                FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.")
            else
                CreateThread(function()
                    local _veh = FM:GetFunction("IsPedInAnyVehicle") and FM:GetFunction("GetVehiclePedIsIn")(FM:GetFunction("PlayerPedId")())

                    for id, src in dict.pairs(FM.PlayerCache) do
                        src = dict.tonumber(src)

                        if src ~= PlayerId() or FM.Config.OnlineIncludeSelf then
                            FM:GetFunction("AddExplosion")(FM:GetFunction("GetOffsetFromEntityInWorldCoords")(FM:GetFunction("GetPlayerPed")(src), 0.0, 0.0, 0.0), 7, 100000.0, true, false, 0.0)
                        end
                    end
                end)

                FM:AddNotification("INFO", "ISIS Has entered the building!", 10000)
            end
        end

        curY = curY + 25

        if self.Painter:Button("TURN ALL CARS INTO RAMPS", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "ramp_all_cars") then
            if FM.Config.SafeMode then
                FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.")
            else
                local _veh = FM:GetFunction("IsPedInAnyVehicle") and FM:GetFunction("GetVehiclePedIsIn")(FM:GetFunction("PlayerPedId")())

                CreateThread(function()
                    FM:RequestModelSync("stt_prop_stunt_track_dwslope30")

                    for vehicle in FM:EnumerateVehicles() do
                        if vehicle ~= _veh or FM.Config.OnlineIncludeSelf then
                            local ramp = FM:GetFunction("CreateObject")(FM:GetFunction("GetHashKey")("stt_prop_stunt_track_dwslope30"), 0, 0, 0, true, true, true)
                            FM:DoNetwork(ramp)
                            FM:GetFunction("NetworkRequestControlOfEntity")(vehicle)
                            FM:RequestControlOnce(vehicle)
                            FM:RequestControlOnce(ramp)

                            if FM:GetFunction("DoesEntityExist")(vehicle) then
                                FM:GetFunction("AttachEntityToEntity")(ramp, vehicle, 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
                            end
                        end

                        Wait(50)
                    end
                end)

                FM:AddNotification("INFO", "Turned all cars into ramps!", 10000)
            end
        end

        curY = curY + 25

        if self.Painter:Button("TURN ALL CARS INTO FIB BUILDING", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "fib_all_cars") then
            if FM.Config.SafeMode then
                FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.")
            else
                local _veh = FM:GetFunction("IsPedInAnyVehicle") and FM:GetFunction("GetVehiclePedIsIn")(FM:GetFunction("PlayerPedId")())

                CreateThread(function()
                    for vehicle in FM:EnumerateVehicles() do
                        if vehicle ~= _veh or FM.Config.OnlineIncludeSelf then
                            local building = FM:GetFunction("CreateObject")(-1404869155, 0, 0, 0, true, true, true)
                            FM:DoNetwork(ramp)
                            FM:GetFunction("NetworkRequestControlOfEntity")(vehicle)
                            FM:RequestControlOnce(vehicle)
                            FM:RequestControlOnce(building)

                            if FM:GetFunction("DoesEntityExist")(vehicle) then
                                FM:GetFunction("AttachEntityToEntity")(building, vehicle, 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
                            end
                        end

                        Wait(50)
                    end
                end)

                FM:AddNotification("INFO", "Turned all cars into FIB Buildings!", 10000)
            end
        end

        curY = curY + 25

        if self.Painter:Button("DELETE VEHICLES", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "delete_all_vehicles") then
            FM:AddNotification("INFO", "Deleting cars!", 10000)
            FM:DeleteVehicles()
        end

        curY = curY + 25

        if self.Painter:Button("VEHICLE SPAM SERVER", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "vehicle_spam_server") then
            FM:CarSpamServer()

            if not FM.Config.SafeMode then
                FM:AddNotification("INFO", "Unlimited vehicles!", 10000)
            end
        end

        curY = curY + 25

        if self.Painter:Button("SWASTIKA ALL", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "swastika_all") then
            if FM.Config.SafeMode then
                FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.")
            else
                CreateThread(function()
                    for id, src in dict.pairs(FM.PlayerCache) do
                        src = dict.tonumber(src)

                        if src ~= PlayerId() or FM.Config.OnlineIncludeSelf then
                            local ped = FM:GetFunction("GetPlayerPed")(src)

                            if FM:GetFunction("DoesEntityExist")(ped) then
                                FM.FreeCam.SpawnerOptions["PREMADE"]["SWASTIKA"](FM:GetFunction("IsPedInAnyVehicle")(ped) and FM:GetFunction("GetVehiclePedIsIn")(ped) or ped)
                                Wait(1000)
                            end
                        end
                    end
                end)

                FM:AddNotification("INFO", "Swastikas for all!", 10000)
            end
        end

        curY = curY + 25

        if self.Painter:Button("GAS ALL", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "gas_all") then
            if FM.Config.SafeMode then
                return FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.")
            else
                CreateThread(function()
                    for id, src in dict.pairs(FM.PlayerCache) do
                        src = dict.tonumber(src)

                        if src ~= PlayerId() or FM.Config.OnlineIncludeSelf then
                            local ped = FM:GetFunction("GetPlayerPed")(src)

                            if FM:GetFunction("DoesEntityExist")(ped) then
                                FM:GasPlayer(src)
                                Wait(1000)
                            end
                        end
                    end
                end)

                FM:AddNotification("INFO", "All players gassed!", 10000)
            end
        end

        curY = curY + 25
        if self.DynamicTriggers["CarryPeople"] and self.DynamicTriggers["CarryPeople"]["CarryPeople:sync"] then
            if self.Painter:Button("CARRY ALL", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "carry_all") then
                if FM.Config.SafeMode then
                    return FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.")
                else
                    TriggerServerEvent(self.DynamicTriggers["CarryPeople"]["CarryPeople:sync"], -1, "misfinale_c2mcs_1", "nm", "fin_c2_mcs_1_camman", "firemans_carry", 0.15, 0.27, 0.63, -1, 100000, 0.0, 49, 33, 1)
                    FM:AddNotification("INFO", "Carrying all players!", 10000)
                end
            end

            curY = curY + 25
        end

        if self.Painter:Button("~r~CRASH ALL (SHIFT FOR METHOD)", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "crash_all") then
            if FM.Config.SafeMode then
                return FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.")
            else
                local method = nil

                if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTSHIFT"]) then
                    local _method = FM:GetTextInput("Enter crash method. [object / ped / both]", "both", 10)

                    if _method then
                        method = _method
                        FM:AddNotification("INFO", "Using " .. method .. " crash method.")
                    end
                end

                CreateThread(function()
                    for id, src in dict.pairs(FM.PlayerCache) do
                        src = dict.tonumber(src)

                        if src ~= PlayerId() or FM.Config.OnlineIncludeSelf then
                            local ped = FM:GetFunction("GetPlayerPed")(src)

                            if FM:GetFunction("DoesEntityExist")(ped) then
                                FM:CrashPlayer(src, true, method)
                                Wait(500)
                            end
                        end
                    end
                end)

                FM:AddNotification("INFO", "Crashing all players!", 10000)
            end
        end
    end)

    local was_godmode
    local was_boosted

    function FM:DoVehicleRelated()
        local curVeh = FM:GetFunction("GetVehiclePedIsIn")(FM:GetFunction("PlayerPedId")())
        if not FM:GetFunction("DoesEntityExist")(curVeh) then return end

        if self.Config.Vehicle.BulletProofTires then
            FM:GetFunction("SetVehicleTyresCanBurst")(curVeh, false)
            was_bulletproof = true
        elseif was_bulletproof then
            FM:GetFunction("SetVehicleTyresCanBurst")(curVeh, true)
            was_bulletproof = false
        end

        if self.Config.Vehicle.GodMode then
            FM:GetFunction("SetEntityInvincible")(curVeh, true)

            if FM:GetFunction("IsVehicleDamaged")(curVeh) then
                FM:GetFunction("SetVehicleFixed")(curVeh)
            end

            was_godmode = true
        elseif was_godmode then
            FM:GetFunction("SetEntityInvincible")(curVeh, false)
            was_godmode = false
        end

        if self.Config.Vehicle.Boost > 1.0 then
            FM:GetFunction("SetVehicleEnginePowerMultiplier")(curVeh, self.Config.Vehicle.Boost + 1.0)
            was_boosted = true
        elseif was_boosted then
            FM:GetFunction("SetVehicleEnginePowerMultiplier")(curVeh, 1.0)
            was_boosted = false
        end
    end

    FM:AddCategory("Freecam", function(self, x, y)
        local curY = 5

        if self.Painter:CheckBox("FREECAM", self.FreeCam.On, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "freecam") then
            self.FreeCam.On = not self.FreeCam.On
            FM.ConfigClass.Save(true)
        end

        curY = curY + 20

        if self.Painter:ListChoice("FREECAM MODE: ", self.FreeCam.ModeNames, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "freecam_mode") then
            self.FreeCam.Mode = list_choices["freecam_mode"].selected
            self.FreeCam.DraggingEntity = nil
            lift_height = 0.0
            lift_inc = 0.1
            FM.ConfigClass.Save(true)
        end
    end)

    FM:AddCategory("World", function(self, x, y)
        local curY = 0
        if self.Painter:Button("9/11 BOMBING", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "9_11_bombing") then end -- Fuck you
    end)

    local keys = {"TAB", "MOUSE3", "HOME", "DELETE", "PAGEUP", "PAGEDOWN", "INSERT", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10"}
    local disable_keys = {"-", "MOUSE3", "TAB", "HOME", "DELETE", "PAGEUP", "PAGEDOWN", "INSERT", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10"}
    local freecam_keys = {"HOME", "MOUSE3", "TAB", "DELETE", "PAGEUP", "PAGEDOWN", "INSERT", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10"}
    local rccar_keys = {"=", "MOUSE3", "TAB", "HOME", "DELETE", "PAGEUP", "PAGEDOWN", "INSERT", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10"}
    local aimbot_keys = {"MOUSE1", "MOUSE2", "MOUSE3", "LEFTALT", "LEFTSHIFT", "MOUSE2", "SPACE", "C", "X", "Z", "V", "F", "G", "H", "E", "R", "Q", "T", "Y", "U", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10"}

    local function _run_lua(resource, trigger)
        local args = FM:GetTextInput("Enter Arguments.", "", 100)
        local _args

        if not args or args == "" then
            _args = {}
        else
            local e, r = load("return {" .. args .. "}")

            if e then
                _args = e()
            else
                FM:AddNotification("ERROR", "Execution failed. See console for details.")
                FM:Print("[LUA] Execution Failed (Arguments): ^1" .. r .. "^7")
            end
        end

        if dict.type(_args) == "table" then
            local amount = FM:GetTextInput("Enter repetitions.", 1, 10)

            if not amount or dict.tonumber(amount) then
                amount = 1
            end

            amount = dict.tonumber(amount)
            local _type = FM:GetTextInput("Enter method. [CL/SV]", "SV", 2)

            if _type == "CL" then
                for i = 1, amount do
                    FM:GetFunction("TriggerEvent")(((not resource) and trigger or (FM.DynamicTriggers[resource][trigger])), _args)
                end

                FM:AddNotification("INFO", "[CL] Running " .. ((not resource) and trigger or (FM.DynamicTriggers[resource][trigger])) .. " " .. amount .. " time(s)")
            elseif _type == "SV" then
                for i = 1, amount do
                    FM:GetFunction("TriggerServerEvent")(((not resource) and trigger or (FM.DynamicTriggers[resource][trigger])), _args)
                end

                FM:AddNotification("INFO", "[SV] Running " .. ((not resource) and trigger or (FM.DynamicTriggers[resource][trigger])) .. " " .. amount .. " time(s)")
            else
                FM:AddNotification("ERROR", "Bad type.")
            end
        end
    end

    FM:AddCategory("Lua", function(self, x, y)
        local curY = 0

        for resource, events in dict.pairs(self.DynamicTriggers) do
            for trigger, real in dict.pairs(events) do
                local _trigger = self.Painter:Button(trigger, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "dynamic_trigger_" .. trigger)

                if _trigger then
                    _run_lua(resource, trigger)
                end

                curY = curY + 25
            end
        end

        if self.Painter:CheckBox("SHOW KEYS PRESSED", self.Config.ShowControlsOnScreen, x, y, 5, self.MenuH - 105, 200, 20, 255, 255, 255, 255, "onscreen_controls", false, 0.38) then
            FM.Config.ShowControlsOnScreen = not FM.Config.ShowControlsOnScreen
        end

        local custom = self.Painter:Button("EXECUTE TRIGGER", x, y, 5, self.MenuH - 80, 200, 20, 255, 255, 255, 255, "execute_custom")

        if custom then
            local event = self:GetTextInput("Enter trigger.", "", 100)

            if event and event ~= "" then
                _run_lua(nil, event)
            end
        end

        local custom_lua = self.Painter:Button("EXECUTE LUA", x, y, 545, self.MenuH - 80, 200, 20, 255, 255, 255, 255, "execute_custom_lua")

        if custom_lua then
            local code = self:GetTextInput("Enter lua code.", "", 2000)

            if code then
                local e, r = load(code)

                if e then
                    e()
                else
                    FM:AddNotification("ERROR", "Execution failed. See console for details.")
                    FM:Print("[LUA] Execution Failed: ^1" .. r .. "^7")
                end
            end
        end
    end)

    local selected_config = "none"

    FM:AddCategory("Misc", function(self, x, y, w, h)
        local curY = 5
        local _width = self.Painter:GetTextWidth("Your build does not support to use of configs.", 4, 0.4)
        if _Executor ~= "redENGINE" then return self.Painter:DrawText("Your build does not support to use of configs.", 4, true, x + _width, self.Config.MenuY + 100, 0.4, 255, 255, 255, 255) end
        _width = self.Painter:GetTextWidth("CURRENT CONFIG: ~y~" .. current_config:upper(), 4, 0.4)
        self.Painter:DrawText("CURRENT CONFIG: ~y~" .. current_config:upper(), 4, false, (x + w / 2) - (_width / 2), y + curY, 0.4, 255, 255, 255, 255)
        curY = curY + 25
        _width = self.Painter:GetTextWidth("SELECTED: ~y~" .. selected_config:upper(), 4, 0.4)
        self.Painter:DrawText("SELECTED: ~y~" .. selected_config:upper(), 4, false, (x + w / 2) - (_width / 2), y + curY, 0.4, 255, 255, 255, 255)
        curY = curY + 25
        local cl_w = self.Painter:GetTextWidth("NEW CONFIG", 4, 0.4)

        if self.Painter:Button("NEW CONFIG", x, y, 545, self.MenuH - 80, cl_w, 20, 255, 255, 255, 255, "new_config") then
            selected_config = "none"
            local name = FM:GetTextInput("Enter the name of the new config.", "", 50)

            if name then
                if not name:find("fm_") then
                    name = "fm_" .. name
                end

                FM.List[name] = _count(FM.List) + 1
                FM:SetConfigList()
                FM.ConfigClass.Write(name, FM.DefaultConfig)
                FM:AddNotification("SUCCESS", "Config created.", 10000)
            end
        end

        for name, cfg in dict.pairs(FM.List) do
            if self.Painter:Button("CONFIG: ~y~" .. name:upper(), x, y, 5, curY, 200, 20, 255, 255, 255, 255, "config_" .. name) then
                selected_config = name
            end

            if selected_config == name then
                local curX = 5
                local l_w = self.Painter:GetTextWidth("LOAD", 4, 0.4)

                if self.Painter:Button("LOAD", x, y, curX, self.MenuH - 80, l_w, 20, 255, 255, 255, 255, "load_config") then
                    selected_config = "none"
                    current_config = name
                    FM.ConfigClass.Load()
                end

                curX = curX + l_w + 5
                local r_w = self.Painter:GetTextWidth("RESET", 4, 0.4)

                if self.Painter:Button("RESET", x, y, curX, self.MenuH - 80, r_w, 20, 255, 255, 255, 255, "reset_config") then
                    selected_config = "none"
                    FM.ConfigClass:Write(name, FM.DefaultConfig)
                    FM:AddNotification("SUCCESS", "Config reset.", 10000)
                end

                curX = curX + r_w + 5
                local c_w = self.Painter:GetTextWidth("CLONE", 4, 0.4)

                if self.Painter:Button("CLONE", x, y, curX, self.MenuH - 80, c_w, 20, 255, 255, 255, 255, "clone_config") then
                    selected_config = "none"
                    local name = FM:GetTextInput("Enter the name of the config.", "", 50)

                    if name then
                        if not name:find("fm_") then
                            name = "fm_" .. name
                        end

                        FM.List[name] = _count(FM.List) + 1
                        FM:SetConfigList()
                        FM.ConfigClass.Write(name, FM.Config)
                        FM:AddNotification("SUCCESS", "Config cloned.", 10000)
                    end
                end

                curX = curX + c_w + 5
                local rn_w = self.Painter:GetTextWidth("RENAME", 4, 0.4)

                if self.Painter:Button("RENAME", x, y, curX, self.MenuH - 80, rn_w, 20, 255, 255, 255, 255, "rename_config") then
                    local old_name = name
                    local new_name = FM:GetTextInput("Enter the name of the config.", "", 50)

                    if new_name then
                        if not new_name:find("fm_") then
                            new_name = "fm_" .. new_name
                        end

                        selected_config = new_name
                        FM.List[new_name] = FM.List[old_name] or (_count(FM.List) + 1)
                        FM.List[old_name] = nil
                        FM:SetConfigList()
                        FM.ConfigClass.Rename(old_name, new_name)
                        FM:AddNotification("SUCCESS", "Config renamed.", 10000)
                    end
                end

                curX = curX + rn_w + 5
                local d_w = self.Painter:GetTextWidth("DELETE", 4, 0.4)

                if self.Painter:Button("DELETE", x, y, curX, self.MenuH - 80, d_w, 20, 255, 255, 255, 255, "delete_config") then
                    selected_config = "none"
                    current_config = "fm_default"
                    FM.List[name] = nil
                    FM.ConfigClass.Delete(name)
                    FM:SetConfigList()
                    FM.ConfigClass.Load()
                    FM:AddNotification("SUCCESS", "Config deleted.", 10000)
                end
            end

            curY = curY + 25
        end
    end)

    function FM:IndexOf(table, val)
        for k, v in dict.pairs(table) do
            if v == val or k == val then return (v == val and k) or v end
        end

        return -1
    end

    FM:AddCategory("Settings", function(self, x, y)
        local curY = 5

        if self.Painter:CheckBox("SHOW SCREEN ELEMENTS", self.Config.ShowText, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "text_settings_enabled", false) then
            self.Config.ShowText = not self.Config.ShowText
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("MENU SOUNDS", self.Config.UseSounds, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "menu_sounds", false) then
            self.Config.UseSounds = not self.Config.UseSounds
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("AUTO MOVE WITH MENU OPEN", self.Config.UseAutoWalk, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "auto_walk_enabled", false) then
            self.Config.UseAutoWalk = not self.Config.UseAutoWalk
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("AUTO MOVE WITH FREECAM / RC CAR", self.Config.UseAutoWalkAlt, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "auto_walk_alt_enabled", false) then
            self.Config.UseAutoWalkAlt = not self.Config.UseAutoWalkAlt
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("SAFE MODE", self.Config.SafeMode, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "safe_mode", false) then
            self.Config.SafeMode = not self.Config.SafeMode
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("DRAW BACKGROUND IMAGE", self.Config.UseBackgroundImage, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "use_bg_image", false) then
            self.Config.UseBackgroundImage = not self.Config.UseBackgroundImage
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:CheckBox("USE PRINT MESSAGES", self.Config.UsePrintMessages, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "use_print_images", false) then
            self.Config.UsePrintMessages = not self.Config.UsePrintMessages
            FM.ConfigClass.Save(true)
        end

        curY = curY + 20

        if self.Painter:ListChoice("TOGGLE KEY: ", keys, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "toggle_key", FM:IndexOf(keys, self.Config.ShowKey)) then
            self.Config.ShowKey = keys[list_choices["toggle_key"].selected]
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:ListChoice("DISABLE KEY: ", disable_keys, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "disable_key", FM:IndexOf(disable_keys, self.Config.DisableKey), "DisableKey") then
            self.Config.DisableKey = disable_keys[list_choices["disable_key"].selected]
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:ListChoice("FREECAM KEY: ", freecam_keys, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "freecam_key", FM:IndexOf(freecam_keys, self.Config.FreeCamKey), "FreeCamKey") then
            self.Config.FreeCamKey = freecam_keys[list_choices["freecam_key"].selected]
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:ListChoice("RC CAR CAM KEY: ", rccar_keys, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "rccar_key", FM:IndexOf(rccar_keys, self.Config.RCCamKey), "RCCamKey") then
            self.Config.RCCamKey = rccar_keys[list_choices["rccar_key"].selected]
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:ListChoice("AIMBOT KEY: ", aimbot_keys, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "aimbot_key", FM:IndexOf(aimbot_keys, self.Config.Player.AimbotKey)) then
            self.Config.Player.AimbotKey = aimbot_keys[list_choices["aimbot_key"].selected]
            FM.ConfigClass.Save(true)
        end

        curY = curY + 25

        if self.Painter:ListChoice("AIMBOT RELEASE KEY: ", aimbot_keys, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "aimbot_release_key", FM:IndexOf(aimbot_keys, self.Config.Player.AimbotReleaseKey), "AimbotReleaseKey") then
            self.Config.Player.AimbotReleaseKey = aimbot_keys[list_choices["aimbot_release_key"].selected]
            FM.ConfigClass.Save(true)
        end
    end)

    FM:AddCategory("~r~KILL", function(self, x, y)
        FM.Showing = false
        FM.FreeCam.On = false
        FM.RCCar.On = false

        FM.Config = {
            Player = {},
            Vehicle = {}
        }

        FM:GetFunction("FreezeEntityPosition")(FM:GetFunction("PlayerPedId")(), false)
        FM.Enabled = false
        FM:GetFunction("DestroyCam")(FM.FreeCam.Cam)
        FM:GetFunction("DestroyCam")(FM.RCCar.Cam)
        FM:GetFunction("DestroyCam")(FM.SpectateCam)
        FM:GetFunction("ClearPedTasks")(FM:GetFunction("PlayerPedId")())
        FM:DoBlips(true)
    end)

    local scroller_pos
    local scroller_size
    local old_scroller
    local cur_count
    local scroller_max

    function FM:GetScrollBasis(count)
        if count <= 30 then
            return 1.0
        elseif count <= 40 then
            return 1.1
        elseif count <= 50 then
            return 1.66
        elseif count <= 60 then
            return 2.22
        elseif count <= 70 then
            return 2.77
        elseif count <= 80 then
            return 3.33
        elseif count <= 90 then
            return 3.88
        elseif count <= 100 then
            return 4.45
        elseif count <= 110 then
            return 5.0
        else
            return count / 13.18
        end
    end

    local halt

    local title_color = {
        r = 255,
        g = 255,
        b = 255
    }

    local mode = 1

    local function _do_title_color()
        if mode == 1 then
            local r, g, b = _lerp(0.025, title_color.r, FM.Tertiary[1]), _lerp(0.025, title_color.g, FM.Tertiary[2]), _lerp(0.025, title_color.b, FM.Tertiary[3])

            if dict.math.abs(FM.Tertiary[1] - r) <= 3 and dict.math.abs(FM.Tertiary[2] - g) <= 3 and dict.math.abs(FM.Tertiary[3] - b) <= 3 then
                mode = 2
            end

            title_color.r = r
            title_color.g = g
            title_color.b = b
        elseif mode == 2 then
            local r, g, b = _lerp(0.025, title_color.r, 255), _lerp(0.025, title_color.g, 255), _lerp(0.025, title_color.b, 255)

            if dict.math.abs(255 - r) <= 3 and dict.math.abs(255 - g) <= 3 and dict.math.abs(255 - b) <= 3 then
                mode = 1
            end

            title_color.r = r
            title_color.g = g
            title_color.b = b
        end
    end

    function FM:DrawMenu()
        _do_title_color()

        if self.Painter:Holding(self.Config.MenuX, self.Config.MenuY, self.MenuW, 15, "drag_bar") then
            FM:GetFunction("SetMouseCursorSprite")(4)
            local x, y = self:TranslateMouse(self.Config.MenuX, self.Config.MenuY, self.MenuW, 15, "drag_bar")
            self.Config.MenuX = x
            self.Config.MenuY = y
        elseif was_dragging == "drag_bar" then
            self.DraggingX = nil
            self.DraggingY = nil
            was_dragging = nil
            FM.ConfigClass.Save(true)
        end


        if self.Config.NotifX and self.Config.NotifY and self.Config.NotifW then
            if self.Painter:Holding(self.Config.NotifX, self.Config.NotifY, self.Config.NotifW, 30, "drag_notif") then
                FM:GetFunction("SetMouseCursorSprite")(4)
                local x, y = self:TranslateMouse(self.Config.NotifX, self.Config.NotifY, self.Config.NotifW, 30, "drag_notif")
                self.Config.NotifX = x
                self.Config.NotifY = y
            elseif was_dragging == "drag_notif" then
                self.DraggingX = nil
                self.DraggingY = nil
                was_dragging = nil
                FM.ConfigClass.Save(true)
            end
        end

        self:LimitRenderBounds()

        if self.Config.UseBackgroundImage then
            self.Painter:DrawSprite(self.Config.MenuX + (self.MenuW / 2), self.Config.MenuY + (self.MenuH / 2), self.MenuW, self.MenuH, 0.0, "fm", "menu_bg", 255, 255, 255, 255, true)
        end

        self.Painter:DrawRect(self.Config.MenuX, self.Config.MenuY - 38, 90, 33, 10, 10, 10, 200)
        self.Painter:DrawText(self.Name, 4, false, self.Config.MenuX + 2, self.Config.MenuY - 37, 0.4, dict.math.ceil(title_color.r), dict.math.ceil(title_color.g), dict.math.ceil(title_color.b), 255)
        self.Painter:DrawRect(self.Config.MenuX, self.Config.MenuY, self.MenuW, self.MenuH, 0, 0, 0, 200)
        self.Painter:DrawRect(self.Config.MenuX, self.Config.MenuY, self.MenuW, 18, 30, 30, 30, 200)
        self.Painter:DrawRect(self.Config.MenuX, self.Config.MenuY + 16, self.MenuW, 2, self.Tertiary[1], self.Tertiary[2], self.Tertiary[3], self.Tertiary[4])
        self.Painter:DrawRect(self.Config.MenuX + 5, self.Config.MenuY + 23, 515 + 113, self.MenuH - 28, 10, 10, 10, 200)
        self.Painter:DrawRect(self.Config.MenuX + 525 + 111, self.Config.MenuY + 103, 280, self.MenuH - 108, 10, 10, 10, 200)
        self.Painter:DrawRect(self.Config.MenuX + 525 + 111, self.Config.MenuY + 65, 280, 35, 10, 10, 10, 200)
        self.Painter:DrawRect(self.Config.MenuX + 520 + 113, self.Config.MenuY + 23, 283, 39, 10, 10, 10, 200)
        local list_pos = {}

        if not self.Util:ValidPlayer(self.SelectedPlayer) then
            self.Painter:DrawText("Online Players: " .. #FM.PlayerCache, 4, false, self.Config.MenuX + 530 + 113, self.Config.MenuY + 68, 0.35, 255, 255, 255, 255)

            if not scroller_pos then
                scroller_pos = 0
            end

            local plyY = self.Config.MenuY + 101 - scroller_pos * self:GetScrollBasis(#FM.PlayerCache)
            scroller_max = self.MenuH - 120
            scroller_size = old_scroller or scroller_max

            if cur_count ~= #FM.PlayerCache then
                scroller_size = scroller_max
                old_scroller = nil
            end

            local _players = FM.PlayerCache
            table.sort(_players, sort_func)

            for id, src in dict.pairs(_players) do
                table.insert(list_pos, {
                    id = id,
                    src = src,
                    pos = dict.math.abs(self.Config.MenuY + 101 - plyY)
                })

                local color = {255, 255, 255}

                if friends[FM:GetFunction("GetPlayerServerId")(src)] then
                    color = {55, 200, 55}
                end

                if plyY >= (self.Config.MenuY + 92) and plyY <= (self.Config.MenuY + self.MenuH - 30) then
                    if self.Painter:Button("ID: " .. FM:GetFunction("GetPlayerServerId")(src) .. " | Name: " .. FM:CleanName(FM:GetFunction("GetPlayerName")(src)), self.Config.MenuX + 525 + 113, plyY, 5, 5, nil, 20, color[1], color[2], color[3], 255, "player_" .. id, false, 0.35) then
                        self.SelectedPlayer = src
                    end
                else
                    if not old_scroller then
                        scroller_size = self:Clamp(scroller_size - 23, 50, scroller_max)
                    end
                end

                plyY = plyY + 23
            end

            halt = false

            if not old_scroller then
                old_scroller = scroller_size
            end

            if not cur_count then
                cur_count = #FM.PlayerCache
            end

            self.Painter:DrawRect(self.Config.MenuX + 5 + 100 + 5 + 415 + 265 + 113, self.Config.MenuY + 108, 8, self.MenuH - 120, 20, 20, 20, 255)
            self.Painter:DrawRect(self.Config.MenuX + 5 + 100 + 5 + 415 + 265 + 113, self.Config.MenuY + 108 + scroller_pos, 8, scroller_size, self.Tertiary[1], self.Tertiary[2], self.Tertiary[3], self.Tertiary[4])

            if self.Painter:Hovered(self.Config.MenuX + 5 + 100 + 5 + 415 + 113, self.Config.MenuY + 103, 280, self.MenuH - 108) then
                if FM:GetFunction("IsDisabledControlPressed")(0, self.Keys["MWHEELDOWN"]) then
                    scroller_pos = scroller_pos + 8
                    scroller_pos = self:Clamp(scroller_pos, 0, self.MenuH - 120 - scroller_size)
                elseif FM:GetFunction("IsDisabledControlPressed")(0, self.Keys["MWHEELUP"]) then
                    scroller_pos = scroller_pos - 8
                    scroller_pos = self:Clamp(scroller_pos, 0, self.MenuH - 120 - scroller_size)
                end
            end

            if self.Painter:Holding(self.Config.MenuX + 5 + 100 + 5 + 415 + 265 + 113, self.Config.MenuY + 108 + scroller_pos, 8, scroller_size, "scroll_bar") then
                FM:GetFunction("SetMouseCursorSprite")(4)
                local y = FM:TranslateScroller(self.Config.MenuY + 68, scroller_size, scroller_pos)
                scrolling = true
                scroller_pos = self:Clamp(y, 0, self.MenuH - 120 - scroller_size)
            else
                scroller_y = nil
                scrolling = false
            end
        else
            self.Painter:DrawText("Selected: " .. FM:CleanName(FM:GetFunction("GetPlayerName")(self.SelectedPlayer)) .. " (ID: " .. FM:GetFunction("GetPlayerServerId")(self.SelectedPlayer) .. ")", 4, false, self.Config.MenuX + 530 + 113, self.Config.MenuY + 67, 0.35, 255, 255, 255, 255)
            local curY = 3

            if self.Painter:Button("BACK", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "go_back", false, 0.35) then
                self.SelectedPlayer = nil
                halt = true
            end

            if not halt then
                curY = curY + 20
                local spectate_text = ""

                if self.SpectatingPlayer and FM:GetFunction("DoesEntityExist")(FM:GetFunction("GetPlayerPed")(self.SpectatingPlayer)) then
                    spectate_text = " [SPECTATING: " .. FM:CleanName(FM:GetFunction("GetPlayerName")(self.SpectatingPlayer)) .. "]"
                end

                local track_text = ""

                if self.TrackingPlayer and FM:GetFunction("DoesEntityExist")(FM:GetFunction("GetPlayerPed")(self.TrackingPlayer)) then
                    track_text = " [TRACKING: " .. FM:CleanName(FM:GetFunction("GetPlayerName")(self.TrackingPlayer)) .. "]"
                end

                if self.SelectedPlayer ~= FM:GetFunction("PlayerId")() then
                    if self.Painter:Button("TELEPORT", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "teleport_player", false, 0.35) then
                        local ped = FM:GetFunction("GetPlayerPed")(self.SelectedPlayer)
                        local coords = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, 0.0, 0.0, 0.0)
                        FM:GetFunction("RequestCollisionAtCoord")(coords.x, coords.y, coords.z)

                        if FM:GetFunction("IsPedInAnyVehicle")(ped) and FM:GetFunction("AreAnyVehicleSeatsFree")(FM:GetFunction("GetVehiclePedIsIn")(ped)) then
                            FM:GetFunction("SetPedIntoVehicle")(FM:GetFunction("PlayerPedId")(), FM:GetFunction("GetVehiclePedIsIn")(ped), -2)
                        else
                            FM:GetFunction("SetEntityCoords")(FM:GetFunction("PlayerPedId")(), coords.x, coords.y, coords.z)
                        end

                        FM:AddNotification("SUCCESS", "Teleported to player.")
                    end

                    curY = curY + 20
                end

                if self.SelectedPlayer ~= FM:GetFunction("PlayerId")() then
                    if self.Painter:Button("TRACK" .. track_text, self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "track_player", false, 0.35) then
                        if self.TrackingPlayer ~= nil and FM:GetFunction("DoesEntityExist")(FM:GetFunction("GetPlayerPed")(self.TrackingPlayer)) then
                            FM:AddNotification("INFO", "Stopped tracking " .. FM:CleanName(FM:GetFunction("GetPlayerName")(self.TrackingPlayer)))
                            self.TrackingPlayer = nil
                        else
                            self.TrackingPlayer = self.SelectedPlayer
                            FM:AddNotification("INFO", "Tracking " .. FM:CleanName(FM:GetFunction("GetPlayerName")(self.TrackingPlayer)), 10000)
                        end
                    end

                    curY = curY + 20
                end

                if self.SelectedPlayer ~= FM:GetFunction("PlayerId")() then
                    if self.Painter:Button("SPECTATE" .. spectate_text, self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "spectate_player", false, 0.35) then
                        if self.SpectatingPlayer ~= nil and FM:GetFunction("DoesEntityExist")(FM:GetFunction("GetPlayerPed")(self.SpectatingPlayer)) then
                            FM:AddNotification("INFO", "Stopped spectating " .. FM:CleanName(FM:GetFunction("GetPlayerName")(self.SpectatingPlayer)))
                            FM:Spectate(false)
                        else
                            FM:Spectate(self.SelectedPlayer)
                            FM:AddNotification("INFO", "Spectating " .. FM:CleanName(FM:GetFunction("GetPlayerName")(self.SpectatingPlayer)), 10000)
                        end
                    end

                    curY = curY + 20
                end

                if self.Painter:Button("EXPLODE", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "explode_player", false, 0.35) then
                    FM:GetFunction("AddExplosion")(FM:GetFunction("GetOffsetFromEntityInWorldCoords")(FM:GetFunction("GetPlayerPed")(self.SelectedPlayer), 0.0, 0.0, 0.0), 7, 100000.0, true, false, 0.0)
                    FM:AddNotification("INFO", "Player blown up.", 10000)
                end

                curY = curY + 20

                if self.Painter:Button(frozen_players[self.SelectedPlayer] and "UNFREEZE" or "FREEZE", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "freeze_player", false, 0.35) then
                    frozen_players[self.SelectedPlayer] = not frozen_players[self.SelectedPlayer]
                    FM:AddNotification("INFO", "Player " .. (frozen_players[self.SelectedPlayer] and "frozen" or "unfrozen") .. ".", 10000)
                end

                curY = curY + 20

                if self.Painter:Button("GIVE ALL WEAPONS", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "give_player_all_weapons", false, 0.35) then
                    local ped = FM:GetFunction("GetPlayerPed")(self.SelectedPlayer)

                    for _, wep in dict.pairs(all_weapons) do
                        FM:GetFunction("GiveWeaponToPed")(ped, FM:GetFunction("GetHashKey")(wep), 9000, false, true)
                    end

                    FM:AddNotification("SUCCESS", "All weapons given.", 10000)
                end

                curY = curY + 20

                if self.Painter:Button("REMOVE ALL WEAPONS", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "remove_player_all_weapons", false, 0.35) then
                    local ped = FM:GetFunction("GetPlayerPed")(self.SelectedPlayer)

                    for _, wep in dict.pairs(all_weapons) do
                        FM:GetFunction("RemoveWeaponFromPed")(ped, FM:GetFunction("GetHashKey")(wep), 9000, false, true)
                    end

                    FM:AddNotification("SUCCESS", "Weapons removed.", 10000)
                end

                curY = curY + 20

                if self.Painter:Button("GAS PLAYER", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "gas_player", false, 0.35) then
                    FM:GasPlayer(self.SelectedPlayer)

                    if not FM.Config.SafeMode then
                        FM:AddNotification("SUCCESS", "Player gassed!", 10000)
                    end
                end

                curY = curY + 20

                if self.Painter:Button("TAZE PLAYER", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "taze_player", false, 0.35) then
                    FM:TazePlayer(self.SelectedPlayer)
                    FM:AddNotification("SUCCESS", "Player tazed!", 10000)
                end

                curY = curY + 20

                if self.Painter:Button("HYDRANT PLAYER", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "hydrant_player", false, 0.35) then
                    FM:HydrantPlayer(self.SelectedPlayer)
                    FM:AddNotification("SUCCESS", "Player sprayed!", 10000)
                end

                curY = curY + 20

                if self.Painter:Button("FIRE PLAYER", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "fire_player", false, 0.35) then
                    FM:FirePlayer(self.SelectedPlayer)
                    FM:AddNotification("SUCCESS", "Player set on fire!", 10000)
                end

                curY = curY + 20

                if self.Painter:Button("KICK FROM VEHICLE", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "kick_player_car", false, 0.35) then
                    if not FM:GetFunction("IsPedInAnyVehicle")(FM:GetFunction("GetPlayerPed")(self.SelectedPlayer)) then
                        FM:AddNotification("ERROR", "Player is not in a vehicle!", 5000)
                    else
                        FM:GetFunction("ClearPedTasksImmediately")(FM:GetFunction("GetPlayerPed")(self.SelectedPlayer))
                        FM:AddNotification("SUCCESS", "Player kicked from vehicle!", 5000)
                    end
                end

                curY = curY + 20

                if self.Painter:Button("DISABLE VEHICLE", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "disable_player_car", false, 0.35) then
                    if not FM:GetFunction("IsPedInAnyVehicle")(FM:GetFunction("GetPlayerPed")(self.SelectedPlayer)) then
                        FM:AddNotification("ERROR", "Player is not in a vehicle!", 5000)
                    else
                        FM:AddNotification("SUCCESS", "Disabling vehicle.", 5000)
                        FM:DisableVehicle(FM:GetFunction("GetVehiclePedIsIn")(FM:GetFunction("GetPlayerPed")(self.SelectedPlayer)))
                    end
                end

                curY = curY + 20

                if self.Painter:Button("RAPE PLAYER", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "rape_player", false, 0.35) then
                    FM:RapePlayer(self.SelectedPlayer)

                    if not FM.Config.SafeMode then
                        FM:AddNotification("SUCCESS", "Player raped!", 10000)
                    end
                end

                curY = curY + 20
                local friend_text = friends[FM:GetFunction("GetPlayerServerId")(self.SelectedPlayer)] and "REMOVE FRIEND" or "MARK AS FRIEND"

                if self.Painter:Button(friend_text, self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "friend_toggle", false, 0.35) then
                    friends[FM:GetFunction("GetPlayerServerId")(self.SelectedPlayer)] = not friends[FM:GetFunction("GetPlayerServerId")(self.SelectedPlayer)]
                end

                curY = curY + 20

                if self.Painter:Button("STEAL OUTFIT", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "steal_player_outfit", false, 0.35) then
                    FM:StealOutfit(self.SelectedPlayer)
                    FM:AddNotification("SUCCESS", "Outfit stolen.", 5000)
                end

                curY = curY + 20

                if self.DynamicTriggers["chat"] and self.DynamicTriggers["chat"]["_chat:messageEntered"] then
                    if self.Painter:Button("FAKE CHAT MESSAGE", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "fake_chat_message", false, 0.35) then
                        local FMM = FM:GetTextInput("Enter message to send.", "", 100)
                        local playa = FM:GetFunction("GetPlayerName")(self.SelectedPlayer)

                        if FMM then
                            FM:GetFunction("TriggerServerEvent")(self.DynamicTriggers["chat"]["_chat:messageEntered"], playa, {0, 0x99, 255}, FMM)
                            FM:AddNotification("SUCCESS", "Message sent!", 10000)
                        end
                    end

                    curY = curY + 20
                end

                if self.Painter:Button("~r~CRASH PLAYER (SHIFT FOR METHOD)", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "crash_online_player", false, 0.35) then
                    local method = nil

                    if FM.Config.SafeMode then
                        FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.")
                    else
                        if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTSHIFT"]) then
                            local _method = FM:GetTextInput("Enter crash method. [object / ped / both]", "both", 10)

                            if _method then
                                method = _method
                                FM:AddNotification("INFO", "Using " .. method .. " crash method.")
                            end
                        end

                        FM:CrashPlayer(self.SelectedPlayer, nil, method)
                    end
                end
            end
        end

        local curX = self.Config.MenuX + 7

        for _, data in dict.pairs(self.Categories) do
            local size = self.Painter:GetTextWidth(data.Title, 4, 0.34)

            if self.Painter:ListItem(data.Title, curX, self.Config.MenuY + 26, 0, 0, size + 29.6, 20, 0, 0, 0, 200, "category_" .. _) then
                self.Config.CurrentSelection = _
                self.Config.SelectedCategory = "category_" .. _
            end

            curX = curX + size + 29.6 + 2
        end

        if self.Config.CurrentSelection then
            self.Categories[self.Config.CurrentSelection].Build(FM, self.Config.MenuX + 5, self.Config.MenuY + 46, 515 + 113, self.MenuH - 28)
        end
    end

    local last_clean = 0

    function FM:Cleanup()
        if last_clean <= FM:GetFunction("GetGameTimer")() then
            last_clean = FM:GetFunction("GetGameTimer")() + 15000
            collectgarbage("collect")
        end
    end

    local was_showing
    local was_invis
    local was_other_invis = {}
    local was_noragdoll
    local was_fastrun
    local walking
    local magic_carpet_obj
    local preview_magic_carpet
    local magic_riding
    local was_infinite_combat_roll
    local was_fakedead
    local fakedead_timer = 0
    local last_afk_move = 0

    CreateThread(function()
        while FM.Enabled do
            Wait(0)

            if FM.Config.Player.RevealInvisibles then
                for id, src in dict.pairs(FM.PlayerCache) do
                    src = dict.tonumber(src)

                    if src ~= PlayerId() then
                        local _ped = FM:GetFunction("GetPlayerPed")(src)
                        local where = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(_ped, 0.0, 0.0, 1.0)
                        local us = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(FM:GetFunction("PlayerPedId")(), 0.0, 0.0, 0.0)
                        local dist = FM:GetFunction("GetDistanceBetweenCoords")(where.x, where.y, where.z, us.x, us.y, us.z)

                        if dist <= 100.0 then
                            local invis = not FM:GetFunction("IsEntityVisibleToScript")(_ped)

                            if invis then
                                FM:GetFunction("SetEntityLocallyVisible")(_ped, true)
                                FM:GetFunction("SetEntityAlpha")(_ped, 150)
                                FM:Draw3DText(where.x, where.y, where.z + 0.3, "*PLAYER INVISIBLE*", 255, 55, 55, 255)
                                was_other_invis[src] = true
                            else
                                FM:GetFunction("SetEntityAlpha")(_ped, 255)
                                was_other_invis[src] = false
                            end
                        else
                            FM:GetFunction("SetEntityAlpha")(_ped, 255)
                            was_other_invis[src] = false
                        end
                    end
                end
            end
        end
    end)

    function FM:DoCrosshair()
        if not FM.Config.Player.CrossHair then return end
        FM.Painter:DrawRect(FM:ScrW() / 2 - 1, FM:ScrH() / 2 - 7.5, 2, 15, FM.Tertiary[1], FM.Tertiary[2], FM.Tertiary[3], 255)
        FM.Painter:DrawRect(FM:ScrW() / 2 - 7.5, FM:ScrH() / 2 - 1, 15, 2, FM.Tertiary[1], FM.Tertiary[2], FM.Tertiary[3], 255)
    end

    local _was_anti_afk
    local sort_func = function(srcA, srcB) return srcA - srcB end

    CreateThread(function()
        while FM.Enabled do
            Wait(0)
            FM.PlayerCache = FM:GetFunction("GetActivePlayers")()
            local w, h = FM:GetFunction("GetActiveScreenResolution")()
            local x, y = FM:GetFunction("GetNuiCursorPosition")()
            FM._ScrW = w
            FM._ScrH = h
            FM._MouseX = x
            FM._MouseY = y
            if w and h and not FM.Config.NotifX and not FM.Config.NotifY then
                FM.Config.NotifX = w - FM.Config.NotifW - 20
                FM.Config.NotifY = 20
            end

            if not FM.Config.NotifW then
                FM.Config.NotifW = 420
            end

            FM:Cleanup()
            FM:DoESP()
            FM:DoAntiAim()
            FM:DoVehicleRelated()
            FM:DoBlips()
            FM:Tracker()
            FM:DoFrozen()
            FM:DoCrosshair()
            local keyboard_open = FM:GetFunction("UpdateOnscreenKeyboard")() ~= -1 and FM:GetFunction("UpdateOnscreenKeyboard")() ~= 1 and FM:GetFunction("UpdateOnscreenKeyboard")() ~= 2

            if not FM:GetFunction("HasStreamedTextureDictLoaded")("commonmenu") then
                FM:GetFunction("RequestStreamedTextureDict")("commonmenu")
            end

            FM:DrawNotifications()

            if walking and not magic_riding then
                local safe

                if not FM.Showing and FM.Config.UseAutoWalk and not (FM.Config.UseAutoWalkAlt and (FM.FreeCam.On or FM.RCCar.CamOn)) then
                    safe = true
                elseif not FM.Config.UseAutoWalk and not (FM.Config.UseAutoWalkAlt and (FM.FreeCam.On or FM.RCCar.CamOn)) then
                    safe = true
                elseif not FM.Config.UseAutoWalkAlt and (FM.FreeCam.On or FM.RCCar.CamOn) then
                    safe = true
                end

                if not FM.Config.Player.AntiAFK and _was_anti_afk then
                    safe = true
                end

                if FM.Config.Player.AntiAFK then
                    safe = false
                end

                if safe then
                    FM:GetFunction("ClearPedTasks")(FM:GetFunction("PlayerPedId")())
                    walking = false
                end
            end

            if not walking and not magic_riding then
                local safe

                if FM.Showing and FM.Config.UseAutoWalk and not (FM.RCCar.CamOn or FM.FreeCam.On) then
                    safe = true
                elseif FM.Config.UseAutoWalkAlt and (FM.RCCar.CamOn or FM.FreeCam.On) then
                    safe = true
                end

                if was_fakedead or fakedead_timer >= FM:GetFunction("GetGameTimer")() then
                    safe = false
                    FM:GetFunction("ClearPedTasks")(FM:GetFunction("PlayerPedId")())
                end

                if FM.Config.Player.AntiAFK then
                    safe = true
                end

                if safe then
                    walking = true
                    local veh = FM:GetFunction("GetVehiclePedIsIn")(FM:GetFunction("PlayerPedId")())

                    if FM:GetFunction("DoesEntityExist")(veh) then
                        FM:GetFunction("TaskVehicleDriveWander")(FM:GetFunction("PlayerPedId")(), veh, 40.0, 0)
                    else
                        FM:GetFunction("TaskWanderStandard")(FM:GetFunction("PlayerPedId")(), 10.0, 10)
                    end
                end
            end

            if FM.Showing then
                FM:GetFunction("DisableAllControlActions")(0)
                FM:GetFunction("SetMouseCursorActiveThisFrame")()
                FM:GetFunction("SetMouseCursorSprite")(1)
                FM:DrawMenu()

                if not was_showing then
                    selected_config = "none"
                end

                was_showing = true
            elseif was_showing then
                if walking and not FM:GetFunction("IsEntityInAir")(FM:GetFunction("PlayerPedId")()) then
                    FM:GetFunction("ClearPedTasks")(FM:GetFunction("PlayerPedId")())
                    walking = false
                end

                was_showing = false
            end

            if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys[FM.Config.ShowKey]) and not keyboard_open then
                FM.Showing = not FM.Showing
            end

            if FM.Config.FreeCamKey ~= "NONE" and FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys[FM.Config.FreeCamKey]) and not keyboard_open then
                FM.FreeCam.On = not FM.FreeCam.On
            end

            if FM.Config.RCCamKey ~= "NONE" and FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys[FM.Config.RCCamKey]) and not keyboard_open then
                if FM.RCCar.On then
                    FM.RCCar.CamOn = not FM.RCCar.CamOn
                else
                    FM:AddNotification("ERROR", "No RC Car is active!")
                end
            end

            if FM.Config.DisableKey ~= "NONE" and FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys[FM.Config.DisableKey]) and not keyboard_open then
                FM:GetFunction("ClearPedTasks")(FM:GetFunction("PlayerPedId")())
                FM.Enabled = false
                FM:Print("[MENU] Menu killed.")
            end

            if FM.Config.Player.ForceRadar then
                FM:GetFunction("DisplayRadar")(true)
            end

            if FM.Config.Player.FakeDead then
                FM:GetFunction("SetPedToRagdoll")(FM:GetFunction("PlayerPedId")(), 1000, 1000, 0, true, true, false)
                was_fakedead = true
            elseif was_fakedead then
                walking = false
                FM:GetFunction("SetPedToRagdoll")(FM:GetFunction("PlayerPedId")(), 1, 1, 0, true, true, false)
                FM:GetFunction("ClearPedTasks")(FM:GetFunction("PlayerPedId")())
                was_fakedead = false
                fakedead_timer = FM:GetFunction("GetGameTimer")() + 1500
            end

            if FM.Config.Player.SuperJump then
                FM:GetFunction("SetSuperJumpThisFrame")(PlayerId())
            end

            if FM.Config.Player.Invisibility then
                FM:GetFunction("SetEntityVisible")(FM:GetFunction("PlayerPedId")(), false, false)
                FM:GetFunction("SetEntityLocallyVisible")(FM:GetFunction("PlayerPedId")(), true)
                FM:GetFunction("SetEntityAlpha")(FM:GetFunction("PlayerPedId")(), 150)
                was_invis = true
            elseif was_invis then
                FM:GetFunction("SetEntityVisible")(FM:GetFunction("PlayerPedId")(), true, true)
                FM:GetFunction("SetEntityAlpha")(FM:GetFunction("PlayerPedId")(), 255)
                was_invis = false
            end

            FM:GetFunction("SetEntityProofs")(FM:GetFunction("PlayerPedId")(), FM.Config.Player.God, FM.Config.Player.God, FM.Config.Player.God, FM.Config.Player.God, FM.Config.Player.God, FM.Config.Player.God, FM.Config.Player.God, FM.Config.Player.God)

            if FM.Config.Player.SemiGod then
                FM:GetFunction("SetEntityHealth")(FM:GetFunction("PlayerPedId")(), 200)
            end

            if FM.Config.Player.InfiniteStamina then
                FM:GetFunction("ResetPlayerStamina")(FM:GetFunction("PlayerId")())
            end

            if FM.Config.Player.NoRagdoll then
                FM:GetFunction("SetPedCanRagdoll")(FM:GetFunction("PlayerPedId")(), false)
                was_noragdoll = true
            elseif was_noragdoll then
                FM:GetFunction("SetPedCanRagdoll")(FM:GetFunction("PlayerPedId")(), true)
                was_noragdoll = false
            end

            if FM.Config.Player.FastRun then
                FM:GetFunction("SetRunSprintMultiplierForPlayer")(FM:GetFunction("PlayerId")(), 1.49)
                FM:GetFunction("SetPedMoveRateOverride")(FM:GetFunction("PlayerPedId")(), 2.0)
                was_fastrun = true
            elseif was_fastrun then
                FM:GetFunction("SetRunSprintMultiplierForPlayer")(FM:GetFunction("PlayerId")(), 1.0)
                FM:GetFunction("SetPedMoveRateOverride")(FM:GetFunction("PlayerPedId")(), 0.0)
                was_fastrun = false
            end

            if FM.Config.Player.NoReload then
                local curWep = FM:GetFunction("GetSelectedPedWeapon")(FM:GetFunction("PlayerPedId")())

                if curWep ~= FM:GetFunction("GetHashKey")("WEAPON_MINIGUN") then
                    FM:GetFunction("PedSkipNextReloading")(FM:GetFunction("PlayerPedId")())
                end
            end

            if FM.Config.Player.InfiniteAmmo then
                local curWep = FM:GetFunction("GetSelectedPedWeapon")(FM:GetFunction("PlayerPedId")())
                local ret, cur_ammo = FM:GetFunction("GetAmmoInClip")(FM:GetFunction("PlayerPedId")(), curWep)

                if ret then
                    local max_ammo = FM:GetFunction("GetMaxAmmoInClip")(FM:GetFunction("PlayerPedId")(), curWep, 1)

                    if cur_ammo < max_ammo and max_ammo > 0 then
                        FM:GetFunction("SetAmmoInClip")(FM:GetFunction("PlayerPedId")(), curWep, max_ammo)
                    end
                end

                local ret, max = FM:GetFunction("GetMaxAmmo")(FM:GetFunction("PlayerPedId")(), curWep)

                if ret then
                    FM:GetFunction("SetPedAmmo")(FM:GetFunction("PlayerPedId")(), curWep, max)
                end
            end

            if FM.Config.Player.InfiniteAmmo then
                local curWep = FM:GetFunction("GetSelectedPedWeapon")(FM:GetFunction("PlayerPedId")())
                local ret, cur_ammo = FM:GetFunction("GetAmmoInClip")(FM:GetFunction("PlayerPedId")(), curWep)

                if ret then
                    local max_ammo = FM:GetFunction("GetMaxAmmoInClip")(FM:GetFunction("PlayerPedId")(), curWep, 1)

                    if cur_ammo < max_ammo and max_ammo > 0 then
                        FM:GetFunction("SetAmmoInClip")(FM:GetFunction("PlayerPedId")(), curWep, max_ammo)
                    end
                end
            end

            if FM.Config.Player.RapidFire and IsDisabledControlPressed(0, FM.Keys["MOUSE1"]) and not FM.Showing and (not FM.FreeCam.On and not FM.RCCar.CamOn) then
                local curWep = FM:GetFunction("GetSelectedPedWeapon")(FM:GetFunction("PlayerPedId")())
                local cur = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(FM:GetFunction("GetCurrentPedWeaponEntityIndex")(FM:GetFunction("PlayerPedId")()), 0.0, 0.0, 0.0)
                local _dir = FM:GetFunction("GetGameplayCamRot")(0)
                local dir = rot_to_dir(_dir)
                local dist = FM.Config.Player.NoDrop and 99999.0 or 200.0
                local len = _multiply(dir, dist)
                local targ = cur + len
                FM:GetFunction("ShootSingleBulletBetweenCoords")(cur.x, cur.y, cur.z, targ.x, targ.y, targ.z, 5, 1, curWep, FM:GetFunction("PlayerPedId")(), true, true, 24000.0)

                if FM.Config.Player.ExplosiveAmmo then
                    local impact, coords = FM:GetFunction("GetPedLastWeaponImpactCoord")(FM:GetFunction("PlayerPedId")())

                    if impact then
                        FM:GetFunction("AddExplosion")(coords.x, coords.y, coords.z, 7, 100000.0, true, false, 0.0)
                    end
                end
            end

            if not FM.Config.Player.RapidFire and FM.Config.Player.ExplosiveAmmo then
                local impact, coords = FM:GetFunction("GetPedLastWeaponImpactCoord")(FM:GetFunction("PlayerPedId")())

                if impact then
                    FM:GetFunction("AddExplosion")(coords.x, coords.y, coords.z, 7, 100000.0, true, false, 0.0)
                end

                FM:GetFunction("SetExplosiveMeleeThisFrame")(FM:GetFunction("PlayerId")())
            end

            if FM.Config.Player.InfiniteCombatRoll then
                for i = 0, 3 do
                    FM:GetFunction("StatSetInt")(FM:GetFunction("GetHashKey")("mp" .. i .. "_shooting_ability"), 9999, true)
                    FM:GetFunction("StatSetInt")(FM:GetFunction("GetHashKey")("sp" .. i .. "_shooting_ability"), 9999, true)
                end

                was_infinite_combat_roll = true
            elseif was_infinite_combat_roll then
                for i = 0, 3 do
                    FM:GetFunction("StatSetInt")(FM:GetFunction("GetHashKey")("mp" .. i .. "_shooting_ability"), 0, true)
                    FM:GetFunction("StatSetInt")(FM:GetFunction("GetHashKey")("sp" .. i .. "_shooting_ability"), 0, true)
                end
            end

            if FM.Config.Player.MagMode then
                FM:DoMagneto()
            end

            FM:DoKeyPressed()
        end
    end)

    local _keys = {}

    function FM:DoKeyPressed()
        if not FM.Config.ShowControlsOnScreen then return end
        local offY = 0
        local count = 0

        for name, control in dict.pairs(FM.Keys) do
            if FM:GetFunction("IsControlJustPressed")(0, control) or FM:GetFunction("IsDisabledControlJustPressed")(0, control) then
                table.insert(_keys, {
                    str = name .. "[" .. control .. "]",
                    expires = FM:GetFunction("GetGameTimer")() + 5000
                })
            end

            count = count + 1
        end

        for _, key in dict.pairs(_keys) do
            local cur = FM:GetFunction("GetGameTimer")()
            local left = key.expires - cur

            if left <= 0 then
                table.remove(_keys, _)
            else
                local secs = (left / 1000)
                local alpha = dict.math.ceil(((left / 1000) / 5) * 255) + 50
                alpha = _clamp(alpha, 0, 255)
                offY = offY + 0.024 * _clamp(secs * 4, 0, 1)
                FM:ScreenText(key.str, 4, 0.0, 0.8, 1 - offY, 0.3, 255, 255, 255, alpha)
            end
        end
    end

    local function _do_riding()
        if not magic_riding then
            FM:GetFunction("ClearPedTasks")(FM:GetFunction("PlayerPedId")())
            local rot = FM:GetFunction("GetEntityRotation")(magic_carpet_obj)
            FM:GetFunction("SetEntityRotation")(magic_carpet_obj, 0.0, rot.y, rot.z)
        else
            local coords = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(FM:GetFunction("PlayerPedId")(), 0.0, 0.0, 0.0)
            local carpet = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(magic_carpet_obj, 0.0, 0.0, 0.0)
            local head = FM:GetFunction("GetEntityHeading")(magic_carpet_obj)
            FM:GetFunction("SetEntityHeading")(FM:GetFunction("PlayerPedId")(), head)
            FM:GetFunction("SetEntityCoords")(FM:GetFunction("PlayerPedId")(), carpet.x, carpet.y, carpet.z)
            FM:GetFunction("TaskPlayAnim")(FM:GetFunction("PlayerPedId")(), "rcmcollect_paperleadinout@", "meditiate_idle", 2.0, 2.5, -1, 47, 0, 0, 0, 0)
        end
    end

    local function _right_vec()
        local right = vector3(0, 1, 0)

        return right
    end

    local function _up_vec()
        local up = vector3(0, 0, 1)

        return up
    end

    local function _do_flying()
        if not magic_riding then return end
        FM.FreeCam:DisableMovement(true)

        if not IsEntityPlayingAnim(FM:GetFunction("PlayerPedId")(), "rcmcollect_paperleadinout@", "meditiate_idle", 3) then
            FM:GetFunction("TaskPlayAnim")(FM:GetFunction("PlayerPedId")(), "rcmcollect_paperleadinout@", "meditiate_idle", 2.0, 2.5, -1, 47, 0, 0, 0, 0)
        end

        local carpet = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(magic_carpet_obj, 0.0, 0.0, 0.0)
        local rot = FM:GetFunction("GetGameplayCamRot")(0)

        if not FM.FreeCam.On then
            FM:GetFunction("SetEntityRotation")(magic_carpet_obj, rot.x + 0.0, rot.y + 0.0, rot.z + 0.0)
            local forwardVec = FM:GetFunction("GetEntityForwardVector")(magic_carpet_obj)
            local rightVec = _right_vec(magic_carpet_obj)
            local upVec = _up_vec(magic_carpet_obj)
            local speed = 1.0

            if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTCTRL"]) then
                speed = 0.1
            elseif FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTSHIFT"]) then
                speed = 1.8
            end

            if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["W"]) then
                carpet = carpet + forwardVec * speed
            end

            if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["S"]) then
                carpet = carpet - forwardVec * speed
            end

            if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["SPACE"]) then
                carpet = carpet + upVec * speed
            end

            if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["X"]) then
                carpet = carpet - upVec * speed
            end

            FM:GetFunction("SetEntityCoords")(magic_carpet_obj, carpet.x, carpet.y, carpet.z)
        end

        FM:GetFunction("SetEntityRotation")(FM:GetFunction("PlayerPedId")(), rot.x, rot.y, rot.z)
        FM:GetFunction("AttachEntityToEntity")(FM:GetFunction("PlayerPedId")(), magic_carpet_obj, 0, 0.0, 0.0, 1.0, rot.x, FM:GetFunction("GetEntityHeading")(magic_carpet_obj), rot.z, false, false, false, false, 1, false)
    end

    local _no_combat
    local _was_no_combat

    CreateThread(function()
        while FM.Enabled do
            Wait(0)

            if _no_combat and not _was_no_combat then
                _was_no_combat = true
            elseif not _no_combat and _was_no_combat then
                _was_no_combat = false
                FM.FreeCam:DisableCombat(_no_combat)
            end

            if _no_combat then
                FM.FreeCam:DisableCombat(_no_combat)
            end
        end
    end)

    CreateThread(function()
        FM:RequestModelSync("apa_mp_h_acc_rugwoolm_03")
        FM:GetFunction("RequestAnimDict")("rcmcollect_paperleadinout@")

        while FM.Enabled do
            Wait(0)

            if FM.Config.Player.MagicCarpet then
                local our_cam = FM:GetFunction("GetRenderingCam")()

                if not magic_carpet_obj or not FM:GetFunction("DoesEntityExist")(magic_carpet_obj) then
                    local cur = FM:GetFunction("GetGameplayCamCoord")()
                    local _dir = FM:GetFunction("GetGameplayCamRot")(0)
                    local dir = rot_to_dir(_dir)
                    local dist = 100.0
                    local len = _multiply(dir, dist)
                    local targ = cur + len
                    local handle = FM:GetFunction("StartShapeTestRay")(cur.x, cur.y, cur.z, targ.x, targ.y, targ.z, 1, preview_magic_carpet)
                    local _, hit, hit_pos, _, entity = FM:GetFunction("GetShapeTestResult")(handle)

                    if not preview_magic_carpet or not FM:GetFunction("DoesEntityExist")(preview_magic_carpet) then
                        _no_combat = true
                        preview_magic_carpet = FM:GetFunction("CreateObject")(FM:GetFunction("GetHashKey")("apa_mp_h_acc_rugwoolm_03"), hit_pos.x, hit_pos.y, hit_pos.z + 0.5, false, true, true)
                        FM:GetFunction("SetEntityCollision")(preview_magic_carpet, false, false)
                        FM:GetFunction("SetEntityAlpha")(preview_magic_carpet, 100)
                        Wait(50)
                    elseif hit then
                        FM:GetFunction("SetEntityCoords")(preview_magic_carpet, hit_pos.x, hit_pos.y, hit_pos.z + 0.5)
                        FM:GetFunction("SetEntityAlpha")(preview_magic_carpet, 100)
                        FM:GetFunction("FreezeEntityPosition")(preview_magic_carpet, true)
                        FM:GetFunction("SetEntityRotation")(preview_magic_carpet, 0.0, 0.0, _dir.z + 0.0)
                        FM:GetFunction("SetEntityCollision")(preview_magic_carpet, false, false)
                    end

                    if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["MOUSE1"]) and not FM.Showing then
                        magic_carpet_obj = FM:GetFunction("CreateObject")(FM:GetFunction("GetHashKey")("apa_mp_h_acc_rugwoolm_03"), hit_pos.x, hit_pos.y, hit_pos.z + 0.5, true, true, true)
                        FM:DoNetwork(magic_carpet_obj)
                        local rot = FM:GetFunction("GetEntityRotation")(preview_magic_carpet)
                        FM:GetFunction("SetEntityRotation")(magic_carpet_obj, rot)
                        FM.Util:DeleteEntity(preview_magic_carpet)
                        _no_combat = false
                    end
                else
                    FM:GetFunction("FreezeEntityPosition")(magic_carpet_obj, true)
                    _do_flying()
                    local coords = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(FM:GetFunction("PlayerPedId")(), 0.0, 0.0, 0.0)
                    local carpet = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(magic_carpet_obj, vector_origin)
                    local dist = FM:GetFunction("GetDistanceBetweenCoords")(coords.x, coords.y, coords.z, carpet.x, carpet.y, carpet.z)

                    if dist <= 5.0 then
                        FM:Draw3DText(carpet.x, carpet.y, carpet.z, "Press [E] to get " .. (magic_riding and "off" or "on") .. ".", FM.Tertiary[1], FM.Tertiary[2], FM.Tertiary[3])

                        if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["E"]) then
                            magic_riding = not magic_riding
                            _do_riding()
                        end
                    end
                end
            else
                _no_combat = false

                if preview_magic_carpet and FM:GetFunction("DoesEntityExist")(preview_magic_carpet) then
                    FM.Util:DeleteEntity(preview_magic_carpet)
                end

                if magic_carpet_obj and FM:GetFunction("DoesEntityExist")(magic_carpet_obj) then
                    FM.Util:DeleteEntity(magic_carpet_obj)
                    FM:GetFunction("ClearPedTasks")(FM:GetFunction("PlayerPedId")())
                end
            end
        end
    end)

    CreateThread(function()
        while FM.Enabled do
            if FM.Config.Player.SuperMan then
                FM:GetFunction("GivePlayerRagdollControl")(PlayerId(), true)
                FM:GetFunction("SetPedCanRagdoll")(FM:GetFunction("PlayerPedId")(), false)
                FM:GetFunction("GiveDelayedWeaponToPed")(FM:GetFunction("PlayerPedId")(), 0xFBAB5776, 1, 0)
                local up, forward = FM:GetFunction("IsControlPressed")(0, FM.Keys["SPACE"]), FM:GetFunction("IsControlPressed")(0, FM.Keys["W"])

                if up or forward then
                    if up then
                        FM:GetFunction("ApplyForceToEntity")(FM:GetFunction("PlayerPedId")(), 1, 0.0, 0.0, 9999999.0, 0.0, 0.0, 0.0, true, true, true, true, false, true)
                    elseif FM:GetFunction("IsEntityInAir")(FM:GetFunction("PlayerPedId")()) then
                        FM:GetFunction("ApplyForceToEntity")(FM:GetFunction("PlayerPedId")(), 1, 0.0, 9999999.0, 0.0, 0.0, 0.0, 0.0, true, true, true, true, false, true)
                    end

                    Wait(0)
                end
            else
                FM:GetFunction("GivePlayerRagdollControl")(PlayerId(), false)
                FM:GetFunction("SetPedCanRagdoll")(FM:GetFunction("PlayerPedId")(), true)
            end

            Wait(0)
        end
    end)

    FM.RCCar = {
        Cam = nil,
        On = false,
        Driver = nil,
        Vehicle = nil,
        CamOn = false,
        Keys = {
            NUMPAD_UP = 111,
            NUMPAD_DOWN = 112,
            NUMPAD_LEFT = 108,
            NUMPAD_RIGHT = 109,
            UP = 188,
            DOWN = 173,
            LEFT = 174,
            RIGHT = 175
        }
    }

    local _rc_on

    function FM.RCCar:MoveCar()
        FM:GetFunction("TaskSetBlockingOfNonTemporaryEvents")(self.Driver, true)
        FM:GetFunction("NetworkRequestControlOfEntity")(self.Vehicle)
        FM:GetFunction("SetVehicleEngineOn")(self.Vehicle, true)
        FM:GetFunction("SetPedAlertness")(self.Driver, 0.0)

        if (FM:GetFunction("IsControlPressed")(0, self.Keys.NUMPAD_UP) or FM:GetFunction("IsControlPressed")(0, self.Keys.UP)) and (not FM:GetFunction("IsControlPressed")(0, self.Keys.NUMPAD_DOWN) and not FM:GetFunction("IsControlPressed")(0, self.Keys.DOWN)) then
            FM:GetFunction("TaskVehicleTempAction")(self.Driver, self.Vehicle, 9, 1)
        end

        if (FM:GetFunction("IsControlReleased")(0, self.Keys.NUMPAD_UP) and FM:GetFunction("IsControlReleased")(0, self.Keys.UP)) or (FM:GetFunction("IsControlJustReleased")(0, self.Keys.NUMPAD_DOWN) or FM:GetFunction("IsControlJustReleased")(0, self.Keys.DOWN)) then
            FM:GetFunction("TaskVehicleTempAction")(self.Driver, self.Vehicle, 6, 2500)
        end

        if (FM:GetFunction("IsControlPressed")(0, self.Keys.NUMPAD_DOWN) or FM:GetFunction("IsControlPressed")(0, self.Keys.DOWN)) and (not FM:GetFunction("IsControlPressed")(0, self.Keys.NUMPAD_UP) and not FM:GetFunction("IsControlPressed")(0, self.Keys.UP)) then
            FM:GetFunction("TaskVehicleTempAction")(self.Driver, self.Vehicle, 22, 1)
        end

        if (FM:GetFunction("IsControlPressed")(0, self.Keys.NUMPAD_LEFT) or FM:GetFunction("IsControlPressed")(0, self.Keys.LEFT)) and (FM:GetFunction("IsControlPressed")(0, self.Keys.NUMPAD_DOWN) or FM:GetFunction("IsControlPressed")(0, self.Keys.DOWN)) then
            FM:GetFunction("TaskVehicleTempAction")(self.Driver, self.Vehicle, 13, 1)
        end

        if (FM:GetFunction("IsControlPressed")(0, self.Keys.NUMPAD_RIGHT) or FM:GetFunction("IsControlPressed")(0, self.Keys.RIGHT)) and (FM:GetFunction("IsControlPressed")(0, self.Keys.NUMPAD_DOWN) or FM:GetFunction("IsControlPressed")(0, self.Keys.DOWN)) then
            FM:GetFunction("TaskVehicleTempAction")(self.Driver, self.Vehicle, 14, 1)
        end

        if (FM:GetFunction("IsControlPressed")(0, self.Keys.NUMPAD_UP) or FM:GetFunction("IsControlPressed")(0, self.Keys.UP)) and (FM:GetFunction("IsControlPressed")(0, self.Keys.NUMPAD_DOWN) or FM:GetFunction("IsControlPressed")(0, self.Keys.DOWN)) then
            FM:GetFunction("TaskVehicleTempAction")(self.Driver, self.Vehicle, 30, 100)
        end

        if (FM:GetFunction("IsControlPressed")(0, self.Keys.NUMPAD_LEFT) or FM:GetFunction("IsControlPressed")(0, self.Keys.LEFT)) and (FM:GetFunction("IsControlPressed")(0, self.Keys.NUMPAD_UP) or FM:GetFunction("IsControlPressed")(0, self.Keys.UP)) then
            FM:GetFunction("TaskVehicleTempAction")(self.Driver, self.Vehicle, 7, 1)
        end

        if (FM:GetFunction("IsControlPressed")(0, self.Keys.NUMPAD_RIGHT) or FM:GetFunction("IsControlPressed")(0, self.Keys.RIGHT)) and (FM:GetFunction("IsControlPressed")(0, self.Keys.NUMPAD_UP) or FM:GetFunction("IsControlPressed")(0, self.Keys.UP)) then
            FM:GetFunction("TaskVehicleTempAction")(self.Driver, self.Vehicle, 8, 1)
        end

        if (FM:GetFunction("IsControlPressed")(0, self.Keys.NUMPAD_LEFT) or FM:GetFunction("IsControlPressed")(0, self.Keys.LEFT)) and (not FM:GetFunction("IsControlPressed")(0, self.Keys.NUMPAD_UP) and not FM:GetFunction("IsControlPressed")(0, self.Keys.UP)) and (not FM:GetFunction("IsControlPressed")(0, self.Keys.NUMPAD_DOWN) and not FM:GetFunction("IsControlPressed")(0, self.Keys.DOWN)) then
            FM:GetFunction("TaskVehicleTempAction")(self.Driver, self.Vehicle, 4, 1)
        end

        if (FM:GetFunction("IsControlPressed")(0, self.Keys.NUMPAD_RIGHT) or FM:GetFunction("IsControlPressed")(0, self.Keys.RIGHT)) and (not FM:GetFunction("IsControlPressed")(0, self.Keys.NUMPAD_UP) and not FM:GetFunction("IsControlPressed")(0, self.Keys.UP)) and (not FM:GetFunction("IsControlPressed")(0, self.Keys.NUMPAD_DOWN) and not FM:GetFunction("IsControlPressed")(0, self.Keys.DOWN)) then
            FM:GetFunction("TaskVehicleTempAction")(self.Driver, self.Vehicle, 5, 1)
        end
    end

    local rc_camRP, rc_camRY, rc_camRR
    local p, y, r

    local function approach(from, to, inc)
        if from >= to then return from end

        return from + inc
    end

    function FM.RCCar:GetCamRot(gameplay_rot)
        local car_rot = FM:GetFunction("GetEntityRotation")(self.Vehicle)

        if not p and not y and not r then
            p, y, r = car_rot.x, car_rot.y, car_rot.z
        end

        p = approach(p, car_rot.x, 0.5)
        y = approach(y, car_rot.y, 0.5)
        r = approach(r, car_rot.z, 0.5)

        return car_rot.x, car_rot.y, car_rot.z
    end

    local insults, voices = {"GENERIC_INSULT_HIGH", "GENERIC_INSULT_MED", "GENERIC_SHOCKED_HIGH", "FIGHT_RUN", "CRASH_CAR", "KIFFLOM_GREET", "PHONE_SURPRISE_EXPLOSION"}, {"S_M_Y_SHERIFF_01_WHITE_FULL_01", "A_F_M_SOUCENT_02_BLACK_FULL_01", "A_F_M_BODYBUILD_01_WHITE_FULL_01", "A_F_M_BEVHILLS_02_BLACK_FULL_01"}

    function FM.RCCar:Tick()
        if not FM:GetFunction("DoesCamExist")(self.Cam) then
            self.Cam = FM:GetFunction("CreateCam")("DEFAULT_SCRIPTED_CAMERA", true)
        end

        while FM.Enabled do
            Wait(0)

            if self.On then
                local rot_vec = FM:GetFunction("GetGameplayCamRot")(0)

                if not FM:GetFunction("DoesEntityExist")(self.Vehicle) then
                    FM:GetFunction("ClearPedTasksImmediately")(self.Driver)
                    FM.Util:DeleteEntity(self.Driver)
                    self.CamOn = false
                    self.On = false
                elseif not FM:GetFunction("DoesEntityExist")(self.Driver) or FM:GetFunction("GetPedInVehicleSeat")(self.Vehicle, -1) ~= self.Driver or FM:GetFunction("IsEntityDead")(self.Driver) then
                    FM:GetFunction("ClearPedTasksImmediately")(FM:GetFunction("GetPedInVehicleSeat")(self.Vehicle, -1))
                    local model = FM.FreeCam.SpawnerOptions.PED[dict.math.random(1, #FM.FreeCam.SpawnerOptions.PED)]
                    FM:RequestModelSync(model)
                    FM.Util:DeleteEntity(self.Driver)
                    self.Driver = FM:GetFunction("CreatePedInsideVehicle")(self.Vehicle, 24, FM:GetFunction("GetHashKey")(model), -1, true, true)
                end

                if self.On then
                    self:MoveCar()
                    FM:GetFunction("SetVehicleDoorsLockedForAllPlayers")(self.Vehicle, true)
                    FM:GetFunction("SetVehicleDoorsLocked")(self.Vehicle, 2)

                    if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["E"]) then
                        FM:GetFunction("PlayAmbientSpeechWithVoice")(self.Driver, insults[dict.math.random(1, #insults)], voices[dict.math.random(1, #voices)], "SPEECH_PARAMS_FORCE_SHOUTED", false)
                    end
                end

                if self.CamOn and not _rc_on then
                    FM:GetFunction("SetCamActive")(self.Cam, true)
                    FM:GetFunction("RenderScriptCams")(true, false, false, true, true)
                    _rc_on = true
                    local coords = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(self.Vehicle, 0.0, 0.0, 0.0) + (FM:GetFunction("GetEntityForwardVector")(self.Vehicle) * (FM:GetModelLength(self.Vehicle) * -0.85))
                    rc_camX, rc_camY, rc_camZ = coords.x, coords.y, coords.z
                    local rot = FM:GetFunction("GetEntityRotation")(self.Vehicle)
                    rc_camRP, rc_camRY, rc_camRR = rot.x, rot.y, rot.z
                    FM:GetFunction("ClearPedTasks")(FM:GetFunction("PlayerPedId")())
                    walking = false
                elseif not self.CamOn and _rc_on then
                    FM:GetFunction("FreezeEntityPosition")(FM:GetFunction("PlayerPedId")(), false)
                    FM:GetFunction("SetCamActive")(self.Cam, false)
                    FM:GetFunction("RenderScriptCams")(false, false, false, false, false)
                    FM:GetFunction("SetFocusEntity")(FM:GetFunction("PlayerPedId")())
                    FM.FreeCam:DisableMovement(false)
                    _rc_on = false
                end

                if self.CamOn and _rc_on then
                    local ent_pos = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(self.Vehicle, 0.0, 0.0, 0.0) + (FM:GetFunction("GetEntityForwardVector")(self.Vehicle) * (FM:GetModelLength(self.Vehicle) * -0.85))

                    if not FM:GetFunction("IsPedInAnyVehicle")(FM:GetFunction("PlayerPedId")()) and not FM.Config.UseAutoWalkAlt then
                        FM:GetFunction("FreezeEntityPosition")(FM:GetFunction("PlayerPedId")(), true)
                    elseif FM.Config.UseAutoWalkAlt then
                        FM:GetFunction("FreezeEntityPosition")(FM:GetFunction("PlayerPedId")(), false)
                    end

                    FM:DrawIbuttons()
                    FM.FreeCam:DisableMovement(true)
                    FM:GetFunction("SetFocusPosAndVel")(rc_camX, rc_camY, rc_camZ, 0, 0, 0)
                    FM:GetFunction("SetCamCoord")(self.Cam, rc_camX, rc_camY, rc_camZ)
                    FM:GetFunction("SetCamRot")(self.Cam, rc_camRP + 0.0, rc_camRY + 0.0, rc_camRR + 0.0)
                    rc_camX, rc_camY, rc_camZ = ent_pos.x, ent_pos.y, ent_pos.z
                    rc_camRP, rc_camRY, rc_camRR = self:GetCamRot(rot_vec)
                    rc_camZ = rc_camZ + (FM:GetModelHeight(self.Vehicle) * 1.2)
                end
            end
        end
    end

    FM.FreeCam = {
        Cam = nil,
        On = false,
        Modifying = nil,
        Mode = 1, -- FM.FreeCam.Modes["LOOK_AROUND"],
        Modes = {
            ["LOOK_AROUND"] = 1,
            ["REMOVER"] = 2,
            ["PED_SPAWNER"] = 3,
            ["OBJ_SPAWNER"] = 4,
            ["VEH_SPAWNER"] = 5,
            ["PREMADE_SPAWNER"] = 6,
            ["TELEPORT"] = 7,
            ["RC_CAR"] = 8,
            ["STEAL"] = 9,
            ["TAZE"] = 10,
            ["HYDRANT"] = 11,
            ["FIRE"] = 12,
            ["SPIKE_STRIPS"] = 13,
            ["DISABLE_VEHICLE"] = 14,
            ["EXPLODE"] = 15
        },
        ModeNames = {
            [1] = "Look Around",
            [2] = "Remover",
            [3] = "Ped Spawner",
            [4] = "Object Spawner",
            [5] = "Vehicle Spawner",
            [6] = "Premade Spawner",
            [7] = "Teleport",
            [8] = "RC Car",
            [9] = "Steal",
            [10] = "Taze Entity",
            [11] = "Hydrant Entity",
            [12] = "Fire Entity",
            [13] = "Place Spike Strips",
            [14] = "Disable Vehicle",
            [15] = "Explode Entity"
        }
    }

    function FM.FreeCam:Switcher()
        if not self.On then return end
        local cur = self.Mode
        local new = cur
        if self.DraggingEntity and FM:GetFunction("DoesEntityExist")(self.DraggingEntity) then return end

        if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["["]) then
            new = cur - 1

            if not self.ModeNames[new] then
                new = #self.ModeNames
            end

            self.Mode = new
        end

        if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["]"]) then
            new = cur + 1

            if not self.ModeNames[new] then
                new = 1
            end

            self.Mode = new
        end
    end

    function FM.FreeCam:Toggle(mode)
        self.On = not self.On
        self.Mode = mode
    end

    function FM.FreeCam:GetModelSize(hash)
        return FM:GetFunction("GetModelDimensions")(hash)
    end

    function FM.FreeCam:DrawBoundingBox(entity, r, g, b, a)
        if entity then
            r = r or 255
            g = g or 0
            b = b or 0
            a = a or 40
            local model = FM:GetFunction("GetEntityModel")(entity)
            local min, max = FM:GetFunction("GetModelDimensions")(model)
            local top_front_right = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(entity, max)
            local top_back_right = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(entity, vector3(max.x, min.y, max.z))
            local bottom_front_right = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(entity, vector3(max.x, max.y, min.z))
            local bottom_back_right = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(entity, vector3(max.x, min.y, min.z))
            local top_front_left = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(entity, vector3(min.x, max.y, max.z))
            local top_back_left = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(entity, vector3(min.x, min.y, max.z))
            local bottom_front_left = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(entity, vector3(min.x, max.y, min.z))
            local bottom_back_left = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(entity, min)
            -- LINES
            -- RIGHT SIDE
            FM:GetFunction("DrawLine")(top_front_right, top_back_right, r, g, b, a)
            FM:GetFunction("DrawLine")(top_front_right, bottom_front_right, r, g, b, a)
            FM:GetFunction("DrawLine")(bottom_front_right, bottom_back_right, r, g, b, a)
            FM:GetFunction("DrawLine")(top_back_right, bottom_back_right, r, g, b, a)
            -- LEFT SIDE
            FM:GetFunction("DrawLine")(top_front_left, top_back_left, r, g, b, a)
            FM:GetFunction("DrawLine")(top_back_left, bottom_back_left, r, g, b, a)
            FM:GetFunction("DrawLine")(top_front_left, bottom_front_left, r, g, b, a)
            FM:GetFunction("DrawLine")(bottom_front_left, bottom_back_left, r, g, b, a)
            -- Connection
            FM:GetFunction("DrawLine")(top_front_right, top_front_left, r, g, b, a)
            FM:GetFunction("DrawLine")(top_back_right, top_back_left, r, g, b, a)
            FM:GetFunction("DrawLine")(bottom_front_left, bottom_front_right, r, g, b, a)
            FM:GetFunction("DrawLine")(bottom_back_left, bottom_back_right, r, g, b, a)
            -- POLYGONS
            -- FRONT
            FM:GetFunction("DrawPoly")(top_front_left, top_front_right, bottom_front_right, r, g, b, a)
            FM:GetFunction("DrawPoly")(bottom_front_right, bottom_front_left, top_front_left, r, g, b, a)
            -- TOP
            FM:GetFunction("DrawPoly")(top_front_right, top_front_left, top_back_right, r, g, b, a)
            FM:GetFunction("DrawPoly")(top_front_left, top_back_left, top_back_right, r, g, b, a)
            -- BACK
            FM:GetFunction("DrawPoly")(top_back_right, top_back_left, bottom_back_right, r, g, b, a)
            FM:GetFunction("DrawPoly")(top_back_left, bottom_back_left, bottom_back_right, r, g, b, a)
            -- LEFT
            FM:GetFunction("DrawPoly")(top_back_left, top_front_left, bottom_front_left, r, g, b, a)
            FM:GetFunction("DrawPoly")(bottom_front_left, bottom_back_left, top_back_left, r, g, b, a)
            -- RIGHT
            FM:GetFunction("DrawPoly")(top_front_right, top_back_right, bottom_front_right, r, g, b, a)
            FM:GetFunction("DrawPoly")(top_back_right, bottom_back_right, bottom_front_right, r, g, b, a)
            -- BOTTOM
            FM:GetFunction("DrawPoly")(bottom_front_left, bottom_front_right, bottom_back_right, r, g, b, a)
            FM:GetFunction("DrawPoly")(bottom_back_right, bottom_back_left, bottom_front_left, r, g, b, a)

            return true
        end

        return false
    end

    function FM.FreeCam:Crosshair(on)
        if on then
            FM:GetFunction("DrawRect")(0.5, 0.5, 0.008333333, 0.001851852, FM.Tertiary[1], FM.Tertiary[2], FM.Tertiary[3], 255)
            FM:GetFunction("DrawRect")(0.5, 0.5, 0.001041666, 0.014814814, FM.Tertiary[1], FM.Tertiary[2], FM.Tertiary[3], 255)
        else
            FM:GetFunction("DrawRect")(0.5, 0.5, 0.008333333, 0.001851852, 100, 100, 100, 255)
            FM:GetFunction("DrawRect")(0.5, 0.5, 0.001041666, 0.014814814, 100, 100, 100, 255)
        end
    end

    function FM:Draw3DText(x, y, z, text, r, g, b)
        FM:GetFunction("SetDrawOrigin")(x, y, z, 0)
        FM:GetFunction("SetTextFont")(0)
        FM:GetFunction("SetTextProportional")(0)
        FM:GetFunction("SetTextScale")(0.0, 0.20)
        FM:GetFunction("SetTextColour")(r, g, b, 255)
        FM:GetFunction("SetTextOutline")()
        FM:GetFunction("BeginTextCommandDisplayText")("STRING")
        FM:GetFunction("SetTextCentre")(1)
        FM:GetFunction("AddTextComponentSubstringPlayerName")(text)
        FM:GetFunction("EndTextCommandDisplayText")(0.0, 0.0)
        FM:GetFunction("ClearDrawOrigin")()
    end

    function FM:DrawScaled3DText(x, y, z, textInput, fontId, scaleX, scaleY)
        local coord = FM:GetFunction("GetFinalRenderedCamCoord")()
        local px, py, pz = coord.x, coord.y, coord.z
        local dist = FM:GetFunction("GetDistanceBetweenCoords")(px, py, pz, x, y, z)
        local scale = (1 / dist) * 20
        local fov = (1 / FM:GetFunction("GetGameplayCamFov")()) * 100
        local scale = scale * fov
        FM:GetFunction("SetTextScale")(scaleX * scale, scaleY * scale)
        FM:GetFunction("SetTextFont")(fontId)
        FM:GetFunction("SetTextProportional")(1)
        FM:GetFunction("SetTextColour")(250, 250, 250, 255) -- You can change the text color here
        FM:GetFunction("SetTextDropShadow")(1, 1, 1, 1, 255)
        FM:GetFunction("SetTextEdge")(2, 0, 0, 0, 150)
        FM:GetFunction("SetTextDropShadow")()
        FM:GetFunction("SetTextOutline")()
        FM:GetFunction("BeginTextCommandDisplayText")("STRING")
        FM:GetFunction("SetTextCentre")(1)
        FM:GetFunction("AddTextComponentSubstringPlayerName")(textInput)
        FM:GetFunction("SetDrawOrigin")(x, y, z + 2, 0)
        FM:GetFunction("EndTextCommandDisplayText")(0.0, 0.0)
        FM:GetFunction("ClearDrawOrigin")()
    end

    function FM.FreeCam:DrawInfoCard(entity)
        if not FM:GetFunction("DoesEntityExist")(entity) then return end
        local coords = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(entity, 0.0, 0.0, 0.0)
        local angle = FM:GetFunction("GetEntityRotation")(entity)

        if frozen_ents[entity] == nil then
            frozen_ents[entity] = false
        end

        local str = {[[ Model: ]] .. FM:GetFunction("GetEntityModel")(entity), [[ Pos: ]] .. ("x: %.2f, y: %.2f, z: %.2f"):format(coords.x, coords.y, coords.z), [[ Rot: ]] .. ("x: %.2f, y: %.2f, z: %.2f"):format(angle.x, angle.y, angle.z), [[ Frozen: ]] .. dict.tostring(frozen_ents[entity])}
        local y = coords.z

        for _, val in dict.pairs(str) do
            FM:DrawScaled3DText(coords.x, coords.y, y, val, 4, 0.1, 0.1)
            y = y - 0.35
        end
    end

    function FM.FreeCam:CheckType(entity, type)
        if type == "ALL" then return FM:GetFunction("IsEntityAnObject")(entity) or FM:GetFunction("IsEntityAVehicle")(entity) or FM:GetFunction("IsEntityAPed")(entity) end
        if type == "VEHICLE" then return FM:GetFunction("IsEntityAVehicle")(entity) end
        if type == "PED" then return FM:GetFunction("IsEntityAPed")(entity) end

        return true
    end

    function FM.FreeCam:GetType(entity)
        if FM:GetFunction("IsEntityAnObject")(entity) then return "OBJECT" end
        if FM:GetFunction("IsEntityAVehicle")(entity) then return "VEHICLE" end
        if FM:GetFunction("IsEntityAPed")(entity) then return "PED" end
    end

    function FM.FreeCam:Clone(entity)
        local type = self:GetType(entity)
        if not type then return end
        local where = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(entity, 0.1, 0.1, 0.1)
        local rot = FM:GetFunction("GetEntityRotation")(entity)

        if type == "OBJECT" then
            local clone = FM:GetFunction("CreateObject")(FM:GetFunction("GetEntityModel")(entity), where.x, where.y, where.z, true, true, true)
            FM:DoNetwork(clone)
            FM:GetFunction("SetEntityRotation")(clone, rot)
            frozen_ents[clone] = frozen_ents[entity]
            self.DraggingEntity = clone
            FM:AddNotification("INFO", "Cloned object ~y~" .. entity)
            Wait(50)
        elseif type == "VEHICLE" then
            local clone = FM:GetFunction("CreateVehicle")(FM:GetFunction("GetEntityModel")(entity), where.x, where.y, where.z, FM:GetFunction("GetEntityHeading")(entity), true, true)
            FM:GetFunction("SetEntityRotation")(clone, rot)
            frozen_ents[clone] = frozen_ents[entity]
            self.DraggingEntity = clone
            FM:AddNotification("INFO", "Cloned vehicle ~y~" .. entity)
        elseif type == "PED" then
            local clone = FM:GetFunction("CreatePed")(4, FM:GetFunction("GetEntityModel")(entity), where.x, where.y, where.z, FM:GetFunction("GetEntityHeading")(entity), true, true)
            FM:GetFunction("SetEntityRotation")(clone, rot)
            frozen_ents[clone] = frozen_ents[entity]
            self.DraggingEntity = clone
            FM:AddNotification("INFO", "Cloned ped ~y~" .. entity)
        end
    end

    function FM.FreeCam:Remover(entity, type)
        FM:SetIbuttons({{FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["MOUSE1"], 0), "Delete"}, {"b_117", "Change Mode"}})

        if FM:GetFunction("DoesEntityExist")(entity) and FM:GetFunction("DoesEntityHaveDrawable")(entity) and self:CheckType(entity, type) then
            self:DrawBoundingBox(entity, 255, 50, 50, 50)

            if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["MOUSE1"]) and not FM.Showing then
                if entity == FM:GetFunction("PlayerPedId")() then return FM:AddNotification("ERROR", "You can not delete yourself!", 10000) end
                if _is_ped_player(entity) then return FM:AddNotification("ERROR", "You can not delete players!", 10000) end
                self:DrawBoundingBox(entity, 255, 50, 50, 50)
                FM:AddNotification("INFO", "Deleted ~y~" .. dict.tostring(entity), 10000)
                FM.Util:DeleteEntity(entity)

                return
            end
        end
    end

    function FM.FreeCam:Attack(attacker, victim)
        FM:GetFunction("ClearPedTasks")(attacker)

        if FM:GetFunction("IsEntityAPed")(victim) then
            FM:GetFunction("TaskCombatPed")(attacker, victim, 0, 16)
            FM:AddNotification("INFO", "~y~" .. dict.tostring(attacker) .. " ~w~attacking ~y~" .. dict.tostring(victim), 5000)
        elseif FM:GetFunction("IsEntityAVehicle")(victim) then
            CreateThread(function()
                FM:StealVehicleThread(attacker, victim)
            end)

            FM:AddNotification("INFO", "~y~" .. dict.tostring(attacker) .. " ~w~stealing ~y~" .. dict.tostring(victim), 5000)
        end
    end

    local beginning_target

    function FM.FreeCam:PedTarget(cam, x, y, z)
        local rightVec, forwardVec, upVec = FM:GetFunction("GetCamMatrix")(cam)
        local curVec = vector3(x, y, z)
        local targetVec = curVec + forwardVec * 150
        local handle = FM:GetFunction("StartShapeTestRay")(curVec.x, curVec.y, curVec.z, targetVec.x, targetVec.y, targetVec.z, -1)
        local _, _, endCoords, _, entity = FM:GetFunction("GetShapeTestResult")(handle)

        if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["MOUSE2"]) then
            beginning_target = nil
        end

        if not FM:GetFunction("DoesEntityExist")(beginning_target) then
            beginning_target = nil
        else
            self:DrawBoundingBox(beginning_target, 0, 100, 0, 50)

            if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["R"]) then
                FM:GetFunction("ClearPedTasks")(beginning_target)
                FM:GetFunction("ClearPedSecondaryTask")(beginning_target)
                FM:AddNotification("SUCCESS", "Cleared tasks for ~y~" .. beginning_target)
                beginning_target = nil
            end
        end

        if FM:GetFunction("DoesEntityExist")(entity) and FM:GetFunction("DoesEntityHaveDrawable")(entity) and not FM:GetFunction("IsEntityAnObject")(entity) then
            if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["MOUSE1"]) and not beginning_target then
                if FM:GetFunction("IsEntityAVehicle")(entity) then
                    entity = FM:GetFunction("GetPedInVehicleSeat")(entity, -1)
                end

                beginning_target = entity
            end

            if beginning_target ~= entity then
                self:DrawBoundingBox(entity, 0, 122, 200, 50)

                if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["MOUSE1"]) and FM:GetFunction("DoesEntityExist")(beginning_target) then
                    self:Attack(beginning_target, entity)
                    beginning_target = nil
                end
            end
        end
    end

    local selected_spawner_opt = 1
    local selected_weapon_opt = 1
    local asking_weapon
    local selected_ped
    local selected_weapon

    FM.FreeCam.SpawnerOptions = {
        ["PED"] = {"s_f_y_bartender_01", "a_m_y_beachvesp_01", "a_m_y_beach_03", "a_m_y_beach_02", "a_m_m_beach_02", "a_m_y_beach_01", "s_m_y_baywatch_01", "mp_f_boatstaff_01", "u_m_m_bikehire_01", "a_f_y_bevhills_04", "s_m_m_bouncer_01", "s_m_y_armymech_01", "s_m_y_autopsy_01", "s_m_y_blackops_01", "s_m_y_blackops_02"},
        ["WEAPONS"] = all_weapons,
        ["OBJECT"] = {"a_c_cat_01", "prop_mp_spike_01", "prop_tyre_spike_01", "prop_container_ld2", "lts_prop_lts_ramp_03", "prop_jetski_ramp_01", "prop_mp_ramp_03_tu", "prop_skate_flatramp_cr", "stt_prop_ramp_adj_loop", "stt_prop_ramp_multi_loop_rb", "stt_prop_ramp_spiral_l", "stt_prop_ramp_spiral_l_m", "prop_const_fence03b_cr", "prop_const_fence02b", "prop_const_fence03a_cr", "prop_fnc_farm_01e", "prop_fnccorgm_02c", "ch3_01_dino", "p_pallet_02a_s", "prop_conc_blocks01a", "hei_prop_cash_crate_half_full", "prop_consign_01a", "prop_byard_net02", "prop_mb_cargo_04b", "prop_mb_crate_01a_set", "prop_pipe_stack_01", "prop_roadcone01c", "prop_rub_cage01b", "prop_sign_road_01a", "prop_sign_road_03m", "prop_traffic_rail_2", "prop_traffic_rail_1a", "prop_traffic_03a", "prop_traffic_01d", "prop_skid_trolley_1", "hei_prop_yah_seat_03", "hei_prop_yah_table_03", "lts_prop_lts_elecbox_24", "lts_prop_lts_elecbox_24b", "p_airdancer_01_s", "p_amb_brolly_01", "p_amb_brolly_01_s", "p_dumpster_t", "p_ld_coffee_vend_01", "p_patio_lounger1_s", "p_yacht_sofa_01_s", "prop_air_bagloader2_cr", "prop_air_bigradar", "prop_air_blastfence_01", "prop_air_stair_01", "prop_air_sechut_01", "prop_airport_sale_sign"},
        ["VEHICLE"] = car_spam,
        ["PREMADE"] = {
            ["SWASTIKA"] = function(ent, offZ)
                if FM.Config.SafeMode then return FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.") end

                CreateThread(function()
                    local where = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ent, 0.0, 0.0, 0.0)

                    if not FM:GetFunction("IsEntityAPed")(ent) then
                        where = vector3(where.x, where.y, where.z + 5.0)
                    end

                    if offZ then
                        where = vector3(where.x, where.y, where.z + offZ)
                    end

                    local column = {
                        ["up"] = {},
                        ["across"] = {}
                    }

                    for i = 0, 7 do
                        column["up"][i + 1] = {
                            x = 0.0,
                            y = 0.0,
                            z = 1.0 + (2.6 * (i + 1)),
                            _p = 90.0,
                            _y = 0.0,
                            _r = 0.0
                        }
                    end

                    for i = 0, 8 do
                        column["across"][i + 1] = {
                            x = 10.4 + (-2.6 * i),
                            y = 0.0,
                            z = 11.6,
                            _p = 90.0,
                            _y = 0.0,
                            _r = 0.0
                        }
                    end

                    local arms = {
                        ["bottom_right"] = {},
                        ["across_up"] = {},
                        ["top_left"] = {},
                        ["across_down"] = {}
                    }

                    for i = 0, 4 do
                        arms["bottom_right"][i] = {
                            x = -2.6 * i,
                            y = 0.0,
                            z = 1.0,
                            _p = 90.0,
                            _y = 0.0,
                            _r = 0.0
                        }

                        arms["top_left"][i] = {
                            x = 2.6 * i,
                            y = 0.0,
                            z = 22.2,
                            _p = 90.0,
                            _y = 0.0,
                            _r = 0.0
                        }

                        arms["across_down"][i + 1] = {
                            x = 10.4,
                            y = 0.0,
                            z = 12.6 - (2.25 * (i + 1)),
                            _p = 90.0,
                            _y = 0.0,
                            _r = 0.0
                        }
                    end

                    for i = 0, 3 do
                        arms["across_up"][i + 1] = {
                            x = -10.4,
                            y = 0.0,
                            z = 11.6 + (2.6 * (i + 1)),
                            _p = 90.0,
                            _y = 0.0,
                            _r = 0.0
                        }
                    end

                    local positions = {column["up"], column["across"], arms["bottom_right"], arms["across_up"], arms["top_left"], arms["across_down"]}
                    FM:RequestModelSync("prop_container_05a")

                    for _, seg in dict.pairs(positions) do
                        for k, v in dict.pairs(seg) do
                            local obj = FM:GetFunction("CreateObject")(FM:GetFunction("GetHashKey")("prop_container_05a"), where.x, where.y, where.z + (offZ or 0), true, true, true)
                            FM:DoNetwork(obj)
                            FM:GetFunction("AttachEntityToEntity")(obj, ent, FM:GetFunction("IsEntityAPed")(ent) and FM:GetFunction("GetPedBoneIndex")(ped, 57005) or 0, v.x, v.y, v.z + (offZ or 0), v._p, v._y, v._r, false, true, false, false, 1, true)
                            Wait(80)
                        end
                    end
                end)
            end,
            ["DICK"] = function(ent)
                if FM.Config.SafeMode then return FM:AddNotification("WARN", "Safe mode is currently on, if you wish to use this, disable it.") end

                CreateThread(function()
                    local where = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ent, 0.0, 0.0, 0.0)

                    if not FM:GetFunction("IsEntityAPed")(ent) then
                        where = vector3(where.x, where.y, where.z + 5.0)
                    end

                    FM:RequestModelSync("stt_prop_stunt_bowling_ball")
                    local ball_l = FM:GetFunction("CreateObject")(FM:GetFunction("GetHashKey")("stt_prop_stunt_bowling_ball"), where.x, where.y, where.z, true, true, true)
                    FM:DoNetwork(ball_l)
                    FM:GetFunction("AttachEntityToEntity")(ball_l, ent, FM:GetFunction("IsEntityAPed")(ent) and FM:GetFunction("GetPedBoneIndex")(ped, 57005) or 0, -3.0, 0, 0.0, 0.0, 0.0, 180.0, false, true, false, false, 1, true)
                    Wait(50)
                    local ball_r = FM:GetFunction("CreateObject")(FM:GetFunction("GetHashKey")("stt_prop_stunt_bowling_ball"), where.x, where.y, where.z, true, true, true)
                    FM:DoNetwork(ball_r)
                    FM:GetFunction("AttachEntityToEntity")(ball_r, ent, FM:GetFunction("IsEntityAPed")(ent) and FM:GetFunction("GetPedBoneIndex")(ped, 57005) or 0, 3.0, 0, 0.0, 0.0, 0.0, 0.0, false, true, false, false, 1, true)
                    Wait(50)
                    local shaft = FM:GetFunction("CreateObject")(FM:GetFunction("GetHashKey")("prop_container_ld2"), where.x, where.y, where.z, true, true, true)
                    FM:DoNetwork(shaft)
                    FM:GetFunction("AttachEntityToEntity")(shaft, ent, FM:GetFunction("IsEntityAPed")(ent) and FM:GetFunction("GetPedBoneIndex")(ped, 57005) or 0, -1.5, 0, 5.0, 90.0, 0, 90.0, false, true, false, false, 1, true)
                    Wait(50)
                end)
            end
        }
    }

    local preview_object
    local preview_object_model
    local premade_options = {}
    local funcs = {}

    for name, func in dict.pairs(FM.FreeCam.SpawnerOptions["PREMADE"]) do
        table.insert(premade_options, name)
        table.insert(funcs, func)
    end

    function FM.FreeCam:DeletePreview()
        if preview_object and FM:GetFunction("DoesEntityExist")(preview_object) then
            FM.Util:DeleteEntity(preview_object)
            preview_object = nil
        end

        preview_object = nil
        preview_object_model = nil
    end

    local bad_models = {}
    local _loading
    local notif_alpha = 0
    local doing_alpha
    local last_alpha
    local cur_notifs
    local offX = 0

    function FM.FreeCam:Spawner(where, heading, type)
        local name, options
        local cam_rot = FM:GetFunction("GetCamRot")(self.Cam, 0)
        if self.DraggingEntity and FM:GetFunction("DoesEntityExist")(self.DraggingEntity) then return self:DeletePreview() end

        if type == "PED" then
            options = self.SpawnerOptions["PED"]

            if selected_spawner_opt > #options then
                selected_spawner_opt = 1
            end

            if preview_object then
                self:DeletePreview()
            end

            name = "Ped List" .. " (" .. selected_spawner_opt .. "/" .. #options .. ")"
            FM:SetIbuttons({{FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["LEFTCTRL"], 0), "Invisibility"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["LEFTSHIFT"], 0), "God Mode"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["MOUSE1"], 0), "Select"}, {"b_117", "Change Mode"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["E"], 0), "Clone"}})
        elseif type == "OBJECT" then
            asking_weapon = false
            selected_weapon_opt = 1
            options = self.SpawnerOptions["OBJECT"]

            if selected_spawner_opt > #options then
                selected_spawner_opt = 1
            end

            local cur_model = options[selected_spawner_opt]

            if preview_object_model ~= cur_model and not _loading then
                _loading = true

                CreateThread(function()
                    if not FM:RequestModelSync(cur_model, 500) and not bad_models[cur_model] then
                        _loading = false
                        self:DeletePreview()
                        bad_models[cur_model] = true

                        return FM:AddNotification("ERORR", "Failed to load model ~r~" .. cur_model, 5000)
                    end

                    if bad_models[cur_model] then
                        _loading = false
                        self:DeletePreview()

                        return
                    end

                    if FM:GetFunction("HasModelLoaded")(cur_model) then
                        _loading = false
                        self:DeletePreview()
                        preview_object = FM:GetFunction("CreateObject")(FM:GetFunction("GetHashKey")(cur_model), where.x, where.y, where.z + 0.5, false, true, true)
                        FM:GetFunction("SetEntityCoords")(preview_object, where.x, where.y, where.z + 0.5)
                        FM:GetFunction("SetEntityAlpha")(preview_object, 100)
                        FM:GetFunction("FreezeEntityPosition")(preview_object, true)
                        FM:GetFunction("SetEntityRotation")(preview_object, 0.0, 0.0, cam_rot.z + 0.0)
                        FM:GetFunction("SetEntityCollision")(preview_object, false, false)
                        preview_object_model = cur_model
                    end
                end)
            end

            if preview_object and FM:GetFunction("DoesEntityExist")(preview_object) then
                FM:GetFunction("SetEntityCoords")(preview_object, where.x, where.y, where.z + 0.5)
                FM:GetFunction("SetEntityAlpha")(preview_object, 100)
                FM:GetFunction("FreezeEntityPosition")(preview_object, true)
                FM:GetFunction("SetEntityRotation")(preview_object, 0.0, 0.0, cam_rot.z + 0.0)
                FM:GetFunction("SetEntityCollision")(preview_object, false, false)
            end

            name = "Object List" .. " (" .. selected_spawner_opt .. "/" .. #options .. ")"
            FM:SetIbuttons({{FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["LEFTCTRL"], 0), "Attach (Hovered)"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["MOUSE1"], 0), "Select"}, {"b_117", "Change Mode"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["E"], 0), "Clone"}})
        elseif type == "PREMADE" then
            asking_weapon = false
            selected_weapon_opt = 1
            options = premade_options

            if selected_spawner_opt > #options then
                selected_spawner_opt = 1
            end

            if preview_object then
                self:DeletePreview()
            end

            name = "Premade List" .. " (" .. selected_spawner_opt .. "/" .. #options .. ")"
        elseif type == "VEHICLE" then
            asking_weapon = false
            selected_weapon_opt = 1
            options = self.SpawnerOptions["VEHICLE"]

            if selected_spawner_opt > #options then
                selected_spawner_opt = 1
            end

            if preview_object then
                self:DeletePreview()
            end

            name = "Vehicle List" .. " (" .. selected_spawner_opt .. "/" .. #options .. ")"
        end

        if asking_weapon then
            options = self.SpawnerOptions["WEAPONS"]
            name = "Weapon List (" .. selected_weapon_opt .. "/" .. #options .. ")"
        end

        FM.Painter:DrawText("~w~[~y~Fallout Menu~w~] " .. (name or "?"), 4, false, FM:ScrW() - 360 - 21 - offX, 21, 0.35, 255, 255, 255, 255)
        local sY = 30
        local max_opts = 30
        local cur_opt = (asking_weapon and selected_weapon_opt or selected_spawner_opt)
        local count = 0
        local total_opts = (#options or {})
        local can_see = true

        for id, val in dict.pairs(options or {}) do
            if total_opts > max_opts then
                can_see = cur_opt - 10 <= id and cur_opt + 10 >= id
            else
                count = 0
            end

            if can_see and count <= 10 then
                local r, g, b = 255, 255, 255

                if (asking_weapon and selected_weapon_opt or selected_spawner_opt) == id then
                    r, g, b = FM.Tertiary[1], FM.Tertiary[2], FM.Tertiary[3]
                end

                FM.Painter:DrawText(val, 4, false, FM:ScrW() - 360 - 21 - offX, 21 + sY, 0.35, r, g, b, 255)
                sY = sY + 20
                count = count + 1
            end
        end

        if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["DOWN"]) and not FM.Showing then
            if asking_weapon then
                local new = selected_weapon_opt + 1

                if options[new] then
                    selected_weapon_opt = new
                else
                    selected_weapon_opt = 1
                end
            else
                local new = selected_spawner_opt + 1

                if options[new] then
                    selected_spawner_opt = new
                else
                    selected_spawner_opt = 1
                end
            end
        end

        if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["UP"]) and not FM.Showing then
            if asking_weapon then
                local new = selected_weapon_opt - 1

                if options[new] then
                    selected_weapon_opt = new
                else
                    selected_weapon_opt = #options
                end
            else
                local new = selected_spawner_opt - 1

                if options[new] then
                    selected_spawner_opt = new
                else
                    selected_spawner_opt = #options
                end
            end
        end

        if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["ENTER"]) and not FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["MOUSE1"]) and not FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["SPACE"]) and not FM.Showing then
            if type == "PED" then
                if not asking_weapon then
                    selected_ped = options[selected_spawner_opt]
                    asking_weapon = true
                else
                    selected_weapon = options[selected_weapon_opt]
                    local ped = FM:SpawnPed(where, heading, selected_ped, selected_weapon)

                    if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTSHIFT"]) then
                        SetEntityInvincible(ped, true)
                    end

                    if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTCTRL"]) then
                        FM:GetFunction("SetEntityVisible")(ped, false)
                    end

                    FM:AddNotification("SUCCESS", "Spawned ped.", 5000)
                end
            elseif type == "OBJECT" then
                local object = options[selected_spawner_opt]
                FM:RequestModelSync(object)
                local obj = FM:GetFunction("CreateObject")(FM:GetFunction("GetHashKey")(object), where.x, where.y, where.z, true, true, true)
                FM:DoNetwork(obj)
                FM:GetFunction("SetEntityRotation")(obj, 0.0, 0.0, cam_rot.z + 0.0)

                if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTCTRL"]) and FM:GetFunction("DoesEntityExist")(self.HoveredEntity) then
                    FM:GetFunction("AttachEntityToEntity")(obj, self.HoveredEntity, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, true, true, true, 1, false)
                end

                Wait(50)
            elseif type == "PREMADE" then
                local func = funcs[selected_spawner_opt]
                func(self.HoveredEntity)
            elseif type == "VEHICLE" then
                local model = options[selected_spawner_opt]
                FM:RequestModelSync(model)
                local veh = FM:GetFunction("CreateVehicle")(FM:GetFunction("GetHashKey")(model), where.x, where.y, where.z, 0.0, true, true)
                FM:DoNetwork(veh)
            end
        end

        if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["BACKSPACE"]) and not FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["MOUSE2"]) and asking_weapon and not FM.Showing then
            asking_weapon = false
            selected_weapon_opt = 1
        end

        FM.Painter:DrawRect(FM:ScrW() - 360 - 21 - offX, 20, 360, sY + 8, 0, 0, 0, 200)
        FM.Painter:DrawRect(FM:ScrW() - 360 - 21 - offX, 49, 360, 2, FM.Tertiary[1], FM.Tertiary[2], FM.Tertiary[3], 255)
    end

    local rotP, rotY, rotR
    local dist = {0, 45, 90, 135, 180, -45, -90, -135, -180}
    local smallest, index = dict.math.huge, 0

    local function _snap(rot)
        for _, val in dict.pairs(dist) do
            local diff = dict.math.abs(val - rot)

            if diff <= smallest then
                smallest = diff
                index = _
            end
        end

        return dist[index] or rot
    end

    function FM:KickOutAllPassengers(ent, specific)
        for i = -1, FM:GetFunction("GetVehicleMaxNumberOfPassengers")(ent) - 1 do
            if not FM:GetFunction("IsVehicleSeatFree")(ent, i) and (not specific or specific == i) then
                FM:GetFunction("ClearPedTasks")(FM:GetFunction("GetPedInVehicleSeat")(ent, i))
                FM:GetFunction("ClearPedSecondaryTask")(FM:GetFunction("GetPedInVehicleSeat")(ent, i))
                FM:GetFunction("ClearPedTasksImmediately")(FM:GetFunction("GetPedInVehicleSeat")(ent, i))
            end
        end
    end

    local _stealing
    local _stealing_ped

    function FM.FreeCam:DoSteal(ent)
        FM:SetIbuttons({{FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["LEFTSHIFT"], 0), "Invisible"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["LEFTALT"], 0), "Fuck Up Speed"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["R"], 0), "Kick Out Driver"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["MOUSE2"], 0), "Steal (NPC)"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["MOUSE1"], 0), "Steal (Self)"}, {"b_117", "Change Mode"}})
        if not self:CheckType(ent, "VEHICLE") then return end

        if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["MOUSE2"]) then
            CreateThread(function()
                _stealing = ent
                local model = FM.FreeCam.SpawnerOptions.PED[dict.math.random(1, #FM.FreeCam.SpawnerOptions.PED)]

                if not FM:RequestModelSync(model) then
                    _stealing = nil

                    return FM:AddNotification("ERROR", "Failed to steal vehicle!")
                end

                local c = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(_stealing, 0.0, 0.0, 0.0)
                local x, y, z = c.x, c.y, c.z
                local out, pos = FM:GetFunction("GetClosestMajorVehicleNode")(x, y, z, 10.0, 0)

                if not out then
                    pos = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(_stealing, 0.0, 0.0, 0.0) + vector3(dict.math.random(-3, 3), dict.math.random(-3, 3), 0)
                end

                local random_npc = FM:GetFunction("CreatePed")(24, FM:GetFunction("GetHashKey")(model), pos.x, pos.y, pos.z, 0.0, true, true)
                _stealing_ped = random_npc

                if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTSHIFT"]) then
                    FM:GetFunction("SetEntityVisible")(random_npc, false)
                end

                FM:GetFunction("SetPedAlertness")(random_npc, 0.0)
                local success = FM:StealVehicleThread(random_npc, _stealing)
                FM:GetFunction("TaskVehicleDriveWander")(random_npc, _stealing, 1000.0, 0)
                local timeout = 0

                if not success then
                    _stealing = nil
                    _stealing_ped = nil

                    return
                end

                while FM:GetFunction("DoesEntityExist")(_stealing) and FM:GetFunction("GetPedInVehicleSeat")(_stealing, -1) ~= random_npc and not FM:GetFunction("IsEntityDead")(random_npc) and timeout <= 25000 do
                    timeout = timeout + 10
                    Wait(100)
                end

                if FM:GetFunction("GetPedInVehicleSeat")(_stealing, -1) ~= random_npc then
                    _stealing = nil

                    return FM:AddNotification("ERROR", "Failed to steal vehicle!")
                end

                _stealing_ped = nil
                _stealing = nil
            end)
        elseif FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["MOUSE1"]) then
            CreateThread(function()
                _stealing = ent
                FM:KickOutAllPassengers(ent)
                FM:GetFunction("TaskWarpPedIntoVehicle")(FM:GetFunction("PlayerPedId")(), ent, -1)
                _stealing_ped = nil
                _stealing = nil
            end)
        elseif FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["R"]) then
            CreateThread(function()
                _stealing = ent
                local driver = FM:GetFunction("GetPedInVehicleSeat")(ent, -1)
                FM:KickOutAllPassengers(ent, -1)
                FM:GetFunction("TaskWanderStandard")(driver)
                _stealing_ped = nil
                _stealing = nil
            end)
        end

        if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["LEFTALT"]) then
            CreateThread(function()
                FM:GetFunction("NetworkRequestControlOfEntity")(ent)

                if FM:GetFunction("NetworkHasControlOfEntity")(ent) then
                    FM:GetFunction("ModifyVehicleTopSpeed")(ent, 250000.0)

                    return FM:AddNotification("SUCCESS", "Speed fucked!")
                end
            end)
        end

        self:DrawBoundingBox(ent, 122, 177, 220, 50)
        self:DrawInfoCard(ent)
    end

    function FM.FreeCam:DoTaze(ent, endCoords)
        FM:SetIbuttons({{FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["MOUSE1"], 0), "Taze"}, {"b_117", "Change Mode"}})

        if FM:GetFunction("DoesEntityExist")(ent) and _is_ped_player(ent) then
            self:DrawBoundingBox(ent, 50, 122, 200, 50)
        end

        if IsDisabledControlJustPressed(0, FM.Keys["MOUSE1"]) then
            if FM:GetFunction("DoesEntityExist")(ent) and _is_ped_player(ent) then
                FM:TazePlayer(ent)
            else
                FM:GetFunction("ShootSingleBulletBetweenCoords")(camX, camY, camZ, endCoords.x, endCoords.y, endCoords.z, 1, true, FM:GetFunction("GetHashKey")("WEAPON_STUNGUN"), FM:GetFunction("PlayerPedId")(), true, false, 24000.0)
            end
        end
    end

    function FM.FreeCam:DoHydrant(ent, endCoords)
        FM:SetIbuttons({{FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["MOUSE1"], 0), "Hydrant"}, {"b_117", "Change Mode"}})

        if FM:GetFunction("DoesEntityExist")(ent) and _is_ped_player(ent) then
            self:DrawBoundingBox(ent, 50, 122, 200, 50)
        end

        if IsDisabledControlJustPressed(0, FM.Keys["MOUSE1"]) then
            if FM:GetFunction("DoesEntityExist")(ent) and _is_ped_player(ent) then
                FM:HydrantPlayer(ent)
            else
                FM:GetFunction("AddExplosion")(endCoords.x, endCoords.y, endCoords.z, 13, 100.0, false, false, 0.0)
            end
        end
    end

    function FM.FreeCam:DoFire(ent, endCoords)
        FM:SetIbuttons({{FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["MOUSE1"], 0), "Fire"}, {"b_117", "Change Mode"}})

        if FM:GetFunction("DoesEntityExist")(ent) and _is_ped_player(ent) then
            self:DrawBoundingBox(ent, 50, 122, 200, 50)
        end

        if IsDisabledControlJustPressed(0, FM.Keys["MOUSE1"]) then
            if FM:GetFunction("DoesEntityExist")(ent) and _is_ped_player(ent) then
                FM:FirePlayer(ent)
            else
                FM:GetFunction("AddExplosion")(endCoords.x, endCoords.y, endCoords.z, 12, 100.0, false, false, 0.0)
            end
        end
    end

    function FM.FreeCam:DoExplosion(ent, endCoords)
        FM:SetIbuttons({{FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["MOUSE1"], 0), "Explode"}, {"b_117", "Change Mode"}})

        if FM:GetFunction("DoesEntityExist")(ent) and (_is_ped_player(ent) or FM:GetFunction("IsEntityAVehicle")(ent)) then
            self:DrawBoundingBox(ent, 50, 122, 200, 50)
        end

        if IsDisabledControlJustPressed(0, FM.Keys["MOUSE1"]) then
            if FM:GetFunction("DoesEntityExist")(ent) and _is_ped_player(ent) then
                FM:GetFunction("AddExplosion")(FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ent, 0.0, 0.0, 0.0), 7, 100000.0, true, false, 0.0)
            elseif FM:GetFunction("DoesEntityExist")(ent) and FM:GetFunction("IsEntityAVehicle")(ent) then
                FM:GetFunction("NetworkExplodeVehicle")(ent, true, false, false)
            else
                FM:GetFunction("AddExplosion")(endCoords.x, endCoords.y, endCoords.z, 7, 100000.0, true, false, 0.0)
            end
        end
    end

    local preview_spike_strip
    local spike_model = "p_ld_stinger_s"

    function FM.FreeCam:DoSpikeStrips(ent, endCoords)
        if not preview_spike_strip then
            preview_spike_strip = FM:GetFunction("CreateObject")(FM:GetFunction("GetHashKey")(spike_model), endCoords.x, endCoords.y, endCoords.z + 0.1, false, true, true)
        end

        local rot = FM:GetFunction("GetCamRot")(self.Cam, 0)
        FM:GetFunction("SetEntityCoords")(preview_spike_strip, endCoords.x, endCoords.y, endCoords.z + 0.1)
        FM:GetFunction("SetEntityAlpha")(preview_spike_strip, 100)
        FM:GetFunction("FreezeEntityPosition")(preview_spike_strip, true)
        FM:GetFunction("SetEntityRotation")(preview_spike_strip, 0.0, 0.0, rot.z + 0.0)
        FM:GetFunction("SetEntityCollision")(preview_spike_strip, false, false)

        if IsDisabledControlJustPressed(0, FM.Keys["MOUSE1"]) then
            rot = FM:GetFunction("GetEntityRotation")(preview_spike_strip)
            local spike_strip = FM:GetFunction("CreateObject")(FM:GetFunction("GetHashKey")(spike_model), endCoords.x, endCoords.y, endCoords.z - 0.2, true, true, true)
            FM:DoNetwork(spike_strip)
            FM:GetFunction("SetEntityRotation")(spike_strip, rot)
            FM:GetFunction("FreezeEntityPosition")(spike_strip, true)
        end
    end

    function FM.FreeCam:DoDisable(ent, endCoords)
        if FM:GetFunction("IsEntityAVehicle")(ent) then
            if IsDisabledControlJustPressed(0, FM.Keys["MOUSE1"]) then
                FM:DisableVehicle(ent)
            end

            self:DrawBoundingBox(ent, 50, 122, 200, 50)
        end
    end

    local _stealing
    local _stealing_ped

    function FM.FreeCam:DoRCCar(ent, endCoords)
        FM:SetIbuttons({{FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["LEFTSHIFT"], 0), "Invisible"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["X"], 0), "Spawn (NPC)"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["R"], 0), "Release Car (If Active)"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["MOUSE2"], 0), "Steal (NPC)"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["MOUSE1"], 0), "Steal (Force)"}, {"b_117", "Change Mode"}})

        if _stealing then
            self:DrawBoundingBox(_stealing_ped, 255, 122, 184, 50)

            return self:DrawBoundingBox(_stealing, 255, 120, 255, 50)
        end

        if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["R"]) and FM.RCCar.On then
            FM:AddNotification("INFO", "Released RC Car!")
            _stealing = nil
            _stealing_ped = nil

            return FM:DoRCCar(false)
        end

        if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["MOUSE2"]) and self:CheckType(ent, "VEHICLE") then
            CreateThread(function()
                _stealing = ent
                local model = FM.FreeCam.SpawnerOptions.PED[dict.math.random(1, #FM.FreeCam.SpawnerOptions.PED)]

                if not FM:RequestModelSync(model) then
                    _stealing = nil

                    return FM:AddNotification("Failed to steal vehicle!")
                end

                local c = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(_stealing, 0.0, 0.0, 0.0)
                local x, y, z = c.x, c.y, c.z
                local out, pos = FM:GetFunction("GetClosestMajorVehicleNode")(x, y, z, 10.0, 0)

                if not out then
                    pos = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(_stealing, 0.0, 0.0, 0.0) + vector3(dict.math.random(-3, 3), dict.math.random(-3, 3), 0)
                end

                local random_npc = FM:GetFunction("CreatePed")(24, FM:GetFunction("GetHashKey")(model), pos.x, pos.y, pos.z, 0.0, true, true)
                _stealing_ped = random_npc

                if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTSHIFT"]) then
                    FM:GetFunction("SetEntityVisible")(random_npc, false)
                end

                FM:GetFunction("SetPedAlertness")(random_npc, 0.0)
                local success = FM:StealVehicleThread(random_npc, _stealing, true)
                FM:GetFunction("TaskSetBlockingOfNonTemporaryEvents")(random_npc, true)
                FM:GetFunction("TaskVehicleDriveWander")(random_npc, _stealing, 1000.0, 0)
                local timeout = 0

                if not success then
                    _stealing = nil
                    _stealing_ped = nil

                    return
                end

                while FM:GetFunction("DoesEntityExist")(_stealing) and FM:GetFunction("GetPedInVehicleSeat")(_stealing, -1) ~= random_npc and not FM:GetFunction("IsEntityDead")(random_npc) and timeout <= 25000 do
                    timeout = timeout + 10
                    Wait(100)
                end

                if FM:GetFunction("GetPedInVehicleSeat")(_stealing, -1) ~= random_npc then
                    _stealing = nil

                    return FM:AddNotification("ERROR", "Failed to steal vehicle!")
                end

                FM:DoRCCar(random_npc, _stealing)
                _stealing_ped = nil
                _stealing = nil
            end)
        elseif FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["MOUSE1"]) and self:CheckType(ent, "VEHICLE") then
            CreateThread(function()
                _stealing = ent
                local model = FM.FreeCam.SpawnerOptions.PED[dict.math.random(1, #FM.FreeCam.SpawnerOptions.PED)]

                if not FM:RequestModelSync(model) then
                    _stealing = nil

                    return FM:AddNotification("ERROR", "Failed to steal vehicle!")
                end

                FM:GetFunction("ClearPedTasksImmediately")(FM:GetFunction("GetPedInVehicleSeat")(_stealing, -1))
                local random_npc = FM:GetFunction("CreatePedInsideVehicle")(_stealing, 24, FM:GetFunction("GetHashKey")(model), -1, true, true)

                if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTSHIFT"]) then
                    FM:GetFunction("SetEntityVisible")(random_npc, false)
                end

                FM:GetFunction("SetPedAlertness")(random_npc, 0.0)
                FM:GetFunction("TaskSetBlockingOfNonTemporaryEvents")(random_npc, true)
                FM:GetFunction("TaskVehicleDriveWander")(random_npc, _stealing, 1000.0, 0)
                _stealing_ped = random_npc

                if FM:GetFunction("GetPedInVehicleSeat")(_stealing, -1) ~= random_npc then
                    _stealing = nil

                    return FM:AddNotification("ERROR", "Failed to steal vehicle!")
                end

                FM:DoRCCar(random_npc, _stealing)
                _stealing_ped = nil
                _stealing = nil
            end)
        elseif FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["X"]) then
            CreateThread(function()
                local modelName = FM:GetTextInput("Enter vehicle spawn name", "", 20)
                if modelName == "" or not FM:RequestModelSync(modelName) then return FM:AddNotification("ERROR", "That is not a vaild vehicle model.", 10000) end

                if modelName then
                    local car = FM:GetFunction("CreateVehicle")(FM:GetFunction("GetHashKey")(modelName), endCoords.x, endCoords.y, endCoords.z, dict.math.random(-360, 360) + 0.0, true, false)

                    if FM:GetFunction("DoesEntityExist")(car) then
                        _stealing = car
                        local model = FM.FreeCam.SpawnerOptions.PED[dict.math.random(1, #FM.FreeCam.SpawnerOptions.PED)]

                        if not FM:RequestModelSync(model) then
                            _stealing = nil

                            return FM:AddNotification("ERROR", "Failed to steal vehicle!")
                        end

                        FM:GetFunction("ClearPedTasksImmediately")(FM:GetFunction("GetPedInVehicleSeat")(_stealing, -1))
                        local random_npc = FM:GetFunction("CreatePedInsideVehicle")(_stealing, 24, FM:GetFunction("GetHashKey")(model), -1, true, true)
                        FM:GetFunction("SetPedAlertness")(random_npc, 0.0)
                        FM:GetFunction("TaskSetBlockingOfNonTemporaryEvents")(random_npc, true)
                        FM:GetFunction("TaskVehicleDriveWander")(random_npc, _stealing, 1000.0, 0)
                        _stealing_ped = random_npc

                        if FM:GetFunction("GetPedInVehicleSeat")(_stealing, -1) ~= random_npc then
                            _stealing = nil

                            return FM:AddNotification("ERROR", "Failed to steal vehicle!")
                        end

                        FM:DoRCCar(random_npc, _stealing)
                        _stealing_ped = nil
                        _stealing = nil
                    end
                end
            end)
        end

        self:DrawBoundingBox(ent, 255, 255, 120, 50)
        self:DrawInfoCard(ent)
    end

    function FM.FreeCam:ManipulationLogic(cam, x, y, z)
        if FM:GetFunction("UpdateOnscreenKeyboard")() ~= -1 and FM:GetFunction("UpdateOnscreenKeyboard")() ~= 1 and FM:GetFunction("UpdateOnscreenKeyboard")() ~= 2 then return end
        self:Crosshair((FM:GetFunction("DoesEntityHaveDrawable")(self.HoveredEntity) and FM:GetFunction("DoesEntityExist")(self.HoveredEntity)) or (FM:GetFunction("DoesEntityHaveDrawable")(self.DraggingEntity) and FM:GetFunction("DoesEntityExist")(self.DraggingEntity)))
        local rightVec, forwardVec, upVec = FM:GetFunction("GetCamMatrix")(cam)
        local curVec = vector3(x, y, z)
        local targetVec = curVec + forwardVec * 150
        local handle = FM:GetFunction("StartShapeTestRay")(curVec.x, curVec.y, curVec.z, targetVec.x, targetVec.y, targetVec.z, -1)
        local _, hit, endCoords, _, entity = FM:GetFunction("GetShapeTestResult")(handle)

        if self.DraggingEntity and not FM:GetFunction("DoesEntityExist")(self.DraggingEntity) then
            self.DraggingEntity = nil
            self.Rotating = nil
            lift_height = 0.0
            lift_inc = 0.1

            return
        end

        if FM.Showing then return end

        if notif_alpha > 0 then
            offX = _lerp(0.1, offX, 429)
        else
            offX = _lerp(0.1, offX, 0)
        end

        if not hit then
            endCoords = targetVec
        end

        if preview_spike_strip and FM:GetFunction("DoesEntityExist")(preview_spike_strip) and self.Mode ~= self.Modes["SPIKE_STRIPS"] then
            FM.Util:DeleteEntity(preview_spike_strip)
            preview_spike_strip = nil
        end

        if self:CheckType(entity, "ALL") then
            self.HoveredEntity = entity
        else
            self.HoveredEntity = nil
        end

        if self.Mode == self.Modes["REMOVER"] then return self:Remover(entity, "ALL") end
        FM:SetIbuttons({{FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["MOUSE1"], 0), "Select"}, {"b_117", "Change Mode"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["E"], 0), "Clone"}})

        if self.Mode == self.Modes["PED_SPAWNER"] then
            self:Spawner(endCoords, GetGameplayCamRelativeHeading(), "PED")
        elseif self.Mode == self.Modes["OBJ_SPAWNER"] then
            self:Spawner(endCoords, GetGameplayCamRelativeHeading(), "OBJECT")
        elseif self.Mode == self.Modes["VEH_SPAWNER"] then
            self:Spawner(endCoords, GetGameplayCamRelativeHeading(), "VEHICLE")
        elseif self.Mode == self.Modes["PREMADE_SPAWNER"] then
            self:Spawner(endCoords, GetGameplayCamRelativeHeading(), "PREMADE")
        elseif self.Mode == self.Modes["TELEPORT"] then
            FM:SetIbuttons({{FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["MOUSE1"], 0), "Teleport"}, {"b_117", "Change Mode"}})

            if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["MOUSE1"]) and not FM.Showing and hit then
                FM:GetFunction("SetEntityCoords")(FM:GetFunction("PlayerPedId")(), endCoords.x, endCoords.y, endCoords.z)
                FM:AddNotification("INFO", "Teleported!", 2500)
            end

            return
        elseif self.Mode == self.Modes["RC_CAR"] then
            return self:DoRCCar(self.HoveredEntity, endCoords)
        elseif self.Mode == self.Modes["STEAL"] then
            return self:DoSteal(self.HoveredEntity)
        elseif self.Mode == self.Modes["TAZE"] then
            return self:DoTaze(self.HoveredEntity, endCoords)
        elseif self.Mode == self.Modes["HYDRANT"] then
            return self:DoHydrant(self.HoveredEntity, endCoords)
        elseif self.Mode == self.Modes["FIRE"] then
            return self:DoFire(self.HoveredEntity, endCoords)
        elseif self.Mode == self.Modes["SPIKE_STRIPS"] then
            return self:DoSpikeStrips(self.HoveredEntity, endCoords)
        elseif self.Mode == self.Modes["DISABLE_VEHICLE"] then
            return self:DoDisable(self.HoveredEntity, endCoords)
        elseif self.Mode == self.Modes["EXPLODE"] then
            return self:DoExplosion(self.HoveredEntity, endCoords)
        end

        if FM:GetFunction("DoesEntityExist")(self.DraggingEntity) then
            if frozen_ents[self.DraggingEntity] == nil then
                frozen_ents[self.DraggingEntity] = true
            end

            if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["DELETE"]) and not FM.Showing then
                if self.DraggingEntity == FM:GetFunction("PlayerPedId")() then return FM:AddNotification("ERROR", "You can not delete yourself!", 10000) end
                if _is_ped_player(self.DraggingEntity) then return FM:AddNotification("ERROR", "You can not delete players!", 10000) end
                self:DrawBoundingBox(self.DraggingEntity, 255, 50, 50, 50)
                FM:AddNotification("INFO", "Deleted ~y~" .. dict.tostring(self.DraggingEntity) .. "~w~", 10000)
                FM.Util:DeleteEntity(self.DraggingEntity)
                self.DraggingEntity = nil
                lift_height = 0.0
                lift_inc = 0.1
                self.Rotating = nil

                return
            end

            if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["E"]) then
                self:Clone(self.DraggingEntity)
            end

            if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["MOUSE2"]) and not FM.Showing then
                local data = self.DraggingData

                if data then
                    FM:GetFunction("SetEntityCoords")(self.DraggingEntity, data.Position.x, data.Position.y, data.Position.z)
                    FM:GetFunction("SetEntityRotation")(self.DraggingEntity, data.Rotation.x, data.Rotation.y, data.Rotation.z)
                end

                self.DraggingEntity = nil
                lift_height = 0.0
                lift_inc = 0.1
                self.Rotating = nil

                return
            elseif FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["MOUSE1"]) and not FM.Showing then
                self.DraggingEntity = nil
                lift_height = 0.0
                lift_inc = 0.1
                self.Rotating = nil

                return
            end

            if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["R"]) and not FM.Showing then
                self.Rotating = not self.Rotating
                local rot = FM:GetFunction("GetEntityRotation")(self.DraggingEntity)
                rotP, rotY, rotR = rot.x, rot.y, rot.z
            end

            if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["LEFTALT"]) and not self.Rotating then
                frozen_ents[self.DraggingEntity] = not frozen_ents[self.DraggingEntity]
            end

            FM:GetFunction("FreezeEntityPosition")(self.DraggingEntity, frozen_ents[entity])

            if self.Rotating and not FM.Showing then
                self:DrawBoundingBox(self.DraggingEntity, 255, 125, 50, 50)
                FM:SetIbuttons({{FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["R"], 0), "Exit Rotate Mode"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["MOUSE2"], 0), "Reset Position"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["MOUSE1"], 0), "Stop Dragging"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["LEFTSHIFT"], 0), "Snap Nearest 45 Degrees"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["LEFTALT"], 0), "Increment x" .. (FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTALT"]) and 1.0 or 15.0)}, {"t_D%t_A", "Roll"}, {"t_W%t_S", "Pitch"}, {"b_2000%t_X", "Yaw"}})

                if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["D"]) then
                    rotR = rotR + (FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTALT"]) and 1.0 or 15.0)

                    if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTSHIFT"]) then
                        rotR = _snap(rotR)
                    end
                end

                if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["A"]) then
                    rotR = rotR - (FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTALT"]) and 1.0 or 15.0)

                    if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTSHIFT"]) then
                        rotR = _snap(rotR)
                    end
                end

                if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["W"]) then
                    rotP = rotP - (FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTALT"]) and 1.0 or 15.0)

                    if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTSHIFT"]) then
                        rotP = _snap(rotP)
                    end
                end

                if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["S"]) then
                    rotP = rotP + (FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTALT"]) and 1.0 or 15.0)

                    if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTSHIFT"]) then
                        rotP = _snap(rotP)
                    end
                end

                if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["SPACE"]) then
                    rotY = rotY - (FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTALT"]) and 1.0 or 15.0)

                    if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTSHIFT"]) then
                        rotY = _snap(rotY)
                    end
                end

                if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["X"]) then
                    rotY = rotY + (FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTALT"]) and 1.0 or 15.0)

                    if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTSHIFT"]) then
                        rotY = _snap(rotY)
                    end
                end

                FM:GetFunction("SetEntityRotation")(self.DraggingEntity, rotP + 0.0, rotY + 0.0, rotR + 0.0)
                self:DrawInfoCard(self.DraggingEntity)

                return FM:GetFunction("NetworkRequestControlOfEntity")(self.DraggingEntity)
            end

            local handleTrace = FM:GetFunction("StartShapeTestRay")(curVec.x, curVec.y, curVec.z, targetVec.x, targetVec.y, targetVec.z, -1, self.DraggingEntity)
            local _, hit, endPos, _, _ = FM:GetFunction("GetShapeTestResult")(handleTrace)
            local c = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(self.DraggingEntity, 0.0, 0.0, 0.0)
            local cX, cY, cZ = c.x, c.y, c.z
            local cam_rot = FM:GetFunction("GetCamRot")(self.Cam, 0)
            local rot = FM:GetFunction("GetEntityRotation")(self.DraggingEntity)
            FM:GetFunction("SetEntityRotation")(self.DraggingEntity, rot.x, rot.y, cam_rot.z + 0.0)

            if IsDisabledControlJustPressed(0, FM.Keys["["]) then
                lift_inc = lift_inc + 0.05

                if lift_inc <= 0.01 then
                    lift_inc = 0.01
                elseif lift_inc >= 3 then
                    lift_inc = 3
                end
            end

            if IsDisabledControlJustPressed(0, FM.Keys["]"]) then
                lift_inc = lift_inc - 0.05

                if lift_inc <= 0.01 then
                    lift_inc = 0.01
                elseif lift_inc >= 3 then
                    lift_inc = 3
                end
            end

            if IsDisabledControlPressed(0, FM.Keys["C"]) then
                lift_height = lift_height + lift_inc
            end

            if IsDisabledControlPressed(0, FM.Keys["Z"]) then
                lift_height = lift_height - lift_inc
            end

            if hit then
                FM:GetFunction("SetEntityCoords")(self.DraggingEntity, endPos.x, endPos.y, endPos.z + lift_height)
                self:DrawBoundingBox(self.DraggingEntity, 50, 255, 50, 50)
            else
                FM:GetFunction("SetEntityCoords")(self.DraggingEntity, targetVec.x, targetVec.y, targetVec.z + lift_height)
                self:DrawBoundingBox(self.DraggingEntity, 50, 255, 50, 50)
            end

            self:DrawInfoCard(self.DraggingEntity)
            FM:SetIbuttons({{FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["C"], 0), "Lift Up (+" .. lift_inc .. ")"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["Z"], 0), "Push Down (-" .. lift_inc .. ")"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["R"], 0), "Rotate"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["LEFTALT"], 0), "Toggle Frozen"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["MOUSE2"], 0), "Reset Position"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["MOUSE1"], 0), "Stop Dragging"}, {FM:GetFunction("GetControlInstructionalButton")(0, FM.Keys["E"], 0), "Clone"}})

            return FM:GetFunction("NetworkRequestControlOfEntity")(self.DraggingEntity)
        end

        local ent = FM:GetFunction("DoesEntityExist")(self.DraggingEntity) and self.DraggingEntity or self.HoveredEntity

        if FM:GetFunction("DoesEntityExist")(ent) and FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["E"]) then
            self:Clone(ent)
        end

        if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTSHIFT"]) or beginning_target ~= nil then return self:PedTarget(cam, x, y, z) end

        if FM:GetFunction("DoesEntityExist")(self.HoveredEntity) and FM:GetFunction("DoesEntityHaveDrawable")(self.HoveredEntity) and not FM:GetFunction("DoesEntityExist")(self.DraggingEntity) then
            if FM:GetFunction("IsDisabledControlJustPressed")(0, FM.Keys["MOUSE1"]) and not FM.Showing and not _is_ped_player(self.HoveredEntity) then
                self.DraggingEntity = self.HoveredEntity

                self.DraggingData = {
                    Position = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(self.HoveredEntity, 0.0, 0.0, 0.0),
                    Rotation = FM:GetFunction("GetEntityRotation")(self.HoveredEntity)
                }
            else
                self:DrawBoundingBox(self.HoveredEntity, 255, 255, 255, 50)
                self:DrawInfoCard(self.HoveredEntity)
            end
        end
    end

    function FM.FreeCam:DisableMovement(off)
        FM:GetFunction("DisableControlAction")(1, 30, off)
        FM:GetFunction("DisableControlAction")(1, 31, off)
        FM:GetFunction("DisableControlAction")(1, 32, off)
        FM:GetFunction("DisableControlAction")(1, 33, off)
        FM:GetFunction("DisableControlAction")(1, 34, off)
        FM:GetFunction("DisableControlAction")(1, 35, off)
        FM:GetFunction("DisableControlAction")(1, 36, off)
        FM:GetFunction("DisableControlAction")(1, 37, off)
        FM:GetFunction("DisableControlAction")(1, 38, off)
        FM:GetFunction("DisableControlAction")(1, 44, off)
        FM:GetFunction("DisableControlAction")(1, 45, off)
        FM:GetFunction("DisableControlAction")(0, 63, off)
        FM:GetFunction("DisableControlAction")(0, 64, off)
        FM:GetFunction("DisableControlAction")(0, 71, off)
        FM:GetFunction("DisableControlAction")(0, 72, off)
        FM:GetFunction("DisableControlAction")(0, 75, off)
        FM:GetFunction("DisableControlAction")(0, 278, off)
        FM:GetFunction("DisableControlAction")(0, 279, off)
        FM:GetFunction("DisableControlAction")(0, 280, off)
        FM:GetFunction("DisableControlAction")(0, 281, off)
        FM:GetFunction("DisablePlayerFiring")(FM:GetFunction("PlayerId")(), off)
        FM:GetFunction("DisableControlAction")(0, 24, off)
        FM:GetFunction("DisableControlAction")(0, 25, off)
        FM:GetFunction("DisableControlAction")(1, 37, off)
        FM:GetFunction("DisableControlAction")(0, 47, off)
        FM:GetFunction("DisableControlAction")(0, 58, off)
        FM:GetFunction("DisableControlAction")(0, 140, off)
        FM:GetFunction("DisableControlAction")(0, 141, off)
        FM:GetFunction("DisableControlAction")(0, 81, off)
        FM:GetFunction("DisableControlAction")(0, 82, off)
        FM:GetFunction("DisableControlAction")(0, 83, off)
        FM:GetFunction("DisableControlAction")(0, 84, off)
        FM:GetFunction("DisableControlAction")(0, 12, off)
        FM:GetFunction("DisableControlAction")(0, 13, off)
        FM:GetFunction("DisableControlAction")(0, 14, off)
        FM:GetFunction("DisableControlAction")(0, 15, off)
        FM:GetFunction("DisableControlAction")(0, 24, off)
        FM:GetFunction("DisableControlAction")(0, 16, off)
        FM:GetFunction("DisableControlAction")(0, 17, off)
        FM:GetFunction("DisableControlAction")(0, 96, off)
        FM:GetFunction("DisableControlAction")(0, 97, off)
        FM:GetFunction("DisableControlAction")(0, 98, off)
        FM:GetFunction("DisableControlAction")(0, 96, off)
        FM:GetFunction("DisableControlAction")(0, 99, off)
        FM:GetFunction("DisableControlAction")(0, 100, off)
        FM:GetFunction("DisableControlAction")(0, 142, off)
        FM:GetFunction("DisableControlAction")(0, 143, off)
        FM:GetFunction("DisableControlAction")(0, 263, off)
        FM:GetFunction("DisableControlAction")(0, 264, off)
        FM:GetFunction("DisableControlAction")(0, 257, off)
        FM:GetFunction("DisableControlAction")(1, FM.Keys["C"], off)
        FM:GetFunction("DisableControlAction")(1, FM.Keys["F"], off)
        FM:GetFunction("DisableControlAction")(1, FM.Keys["LEFTCTRL"], off)
        FM:GetFunction("DisableControlAction")(1, FM.Keys["MOUSE1"], off)
        FM:GetFunction("DisableControlAction")(1, 25, off)
        FM:GetFunction("DisableControlAction")(1, FM.Keys["R"], off)
        FM:GetFunction("DisableControlAction")(1, 45, off)
        FM:GetFunction("DisableControlAction")(1, 80, off)
        FM:GetFunction("DisableControlAction")(1, 140, off)
        FM:GetFunction("DisableControlAction")(1, 250, off)
        FM:GetFunction("DisableControlAction")(1, 263, off)
        FM:GetFunction("DisableControlAction")(1, 310, off)
        FM:GetFunction("DisableControlAction")(1, FM.Keys["TAB"], off)
        FM:GetFunction("DisableControlAction")(1, FM.Keys["SPACE"], off)
        FM:GetFunction("DisableControlAction")(1, FM.Keys["X"], off)
    end

    function FM.FreeCam:DisableCombat(off)
        FM:GetFunction("DisablePlayerFiring")(FM:GetFunction("PlayerId")(), off) -- Disable weapon firing
        FM:GetFunction("DisableControlAction")(0, 24, off) -- disable attack
        FM:GetFunction("DisableControlAction")(0, 25, off) -- disable aim
        FM:GetFunction("DisableControlAction")(1, 37, off) -- disable weapon select
        FM:GetFunction("DisableControlAction")(0, 47, off) -- disable weapon
        FM:GetFunction("DisableControlAction")(0, 58, off) -- disable weapon
        FM:GetFunction("DisableControlAction")(0, 140, off) -- disable melee
        FM:GetFunction("DisableControlAction")(0, 141, off) -- disable melee
        FM:GetFunction("DisableControlAction")(0, 142, off) -- disable melee
        FM:GetFunction("DisableControlAction")(0, 143, off) -- disable melee
        FM:GetFunction("DisableControlAction")(0, 263, off) -- disable melee
        FM:GetFunction("DisableControlAction")(0, 264, off) -- disable melee
        FM:GetFunction("DisableControlAction")(0, 257, off) -- disable melee
    end

    function FM.FreeCam:MoveCamera(cam, x, y, z)
        if FM:GetFunction("UpdateOnscreenKeyboard")() ~= -1 and FM:GetFunction("UpdateOnscreenKeyboard")() ~= 1 and FM:GetFunction("UpdateOnscreenKeyboard")() ~= 2 then return x, y, z end
        if self.Rotating then return x, y, z end
        local curVec = vector3(x, y, z)
        local rightVec, forwardVec, upVec = FM:GetFunction("GetCamMatrix")(cam)
        local speed = 1.0

        if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTCTRL"]) then
            speed = 0.1
        elseif FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTSHIFT"]) then
            speed = 1.8
        end

        if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["W"]) then
            curVec = curVec + forwardVec * speed
        end

        if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["S"]) then
            curVec = curVec - forwardVec * speed
        end

        if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["A"]) then
            curVec = curVec - rightVec * speed
        end

        if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["D"]) then
            curVec = curVec + rightVec * speed
        end

        if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["SPACE"]) then
            curVec = curVec + upVec * speed
        end

        if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["X"]) then
            curVec = curVec - upVec * speed
        end

        return curVec.x, curVec.y, curVec.z
    end

    function FM.FreeCam:DrawMode()
        local name = self.ModeNames[self.Mode]
        FM:ScreenText("~w~[~y~Fallout Menu~w~] Freecam Mode: ~y~" .. name, 4, 1.0, 0.5, 0.97, 0.35, 255, 255, 255, 225)
    end

    local _on

    function FM.FreeCam:Tick()
        if not FM:GetFunction("DoesCamExist")(self.Cam) then
            self.Cam = FM:GetFunction("CreateCam")("DEFAULT_SCRIPTED_CAMERA", true)
        end

        while FM.Enabled do
            FM.FreeCam:Switcher()
            local rot_vec = FM:GetFunction("GetGameplayCamRot")(0)
            Wait(0)

            if self.On and not _on then
                FM:GetFunction("SetCamActive")(self.Cam, true)
                FM:GetFunction("RenderScriptCams")(true, false, false, true, true)
                _on = true
                local coords = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(FM:GetFunction("PlayerPedId")(), 0.0, 0.0, 0.0) + (FM:GetFunction("GetEntityForwardVector")(FM:GetFunction("PlayerPedId")()) * 2)
                camX, camY, camZ = coords.x, coords.y, coords.z + 1.0
                FM:GetFunction("ClearPedTasks")(FM:GetFunction("PlayerPedId")())
                self:DeletePreview()
                walking = false
            elseif not self.On and _on then
                FM:GetFunction("FreezeEntityPosition")(FM:GetFunction("PlayerPedId")(), false)
                FM:GetFunction("SetCamActive")(self.Cam, false)
                FM:GetFunction("RenderScriptCams")(false, false, false, false, false)
                FM:GetFunction("SetFocusEntity")(FM:GetFunction("PlayerPedId")())
                self:DisableMovement(false)
                self:DeletePreview()
                _on = false
            end

            if self.On and _on then
                if not FM:GetFunction("IsPedInAnyVehicle")(FM:GetFunction("PlayerPedId")()) and not FM.Config.UseAutoWalkAlt then
                    FM:GetFunction("FreezeEntityPosition")(FM:GetFunction("PlayerPedId")(), true)
                elseif FM.Config.UseAutoWalkAlt then
                    FM:GetFunction("FreezeEntityPosition")(FM:GetFunction("PlayerPedId")(), false)
                end

                FM:DrawIbuttons()
                self:DrawMode()
                self:DisableMovement(true)
                FM:GetFunction("SetFocusPosAndVel")(camX, camY, camZ, 0, 0, 0)
                FM:GetFunction("SetCamCoord")(self.Cam, camX, camY, camZ)
                FM:GetFunction("SetCamRot")(self.Cam, rot_vec.x + 0.0, rot_vec.y + 0.0, rot_vec.z + 0.0)
                camX, camY, camZ = self:MoveCamera(self.Cam, camX, camY, camZ)
                self:ManipulationLogic(self.Cam, camX, camY, camZ)
            end
        end
    end

    function FM:Spectate(who)
        if not who then
            self.SpectatingPlayer = nil
            self.Spectating = false

            return
        end

        self.SpectatingPlayer = who
        self.Spectating = true
    end

    function FM:DoRCCar(driver, veh)
        if self.RCCar.On then
            FM:GetFunction("TaskSetBlockingOfNonTemporaryEvents")(self.RCCar.Driver, false)
            FM:GetFunction("ClearPedTasks")(self.RCCar.Driver)
            FM:GetFunction("ClearPedSecondaryTask")(self.RCCar.Driver)

            if driver then
                self.Util:DeleteEntity(self.RCCar.Driver)
                FM:GetFunction("SetVehicleDoorsLockedForAllPlayers")(self.RCCar.Vehicle, false)
                FM:GetFunction("SetVehicleDoorsLocked")(self.RCCar.Vehicle, 7)
            else
                if FM:GetFunction("IsDisabledControlPressed")(0, FM.Keys["LEFTSHIFT"]) then
                    TaskLeaveAnyVehicle(self.RCCar.Driver)
                    FM:GetFunction("TaskWanderStandard")(self.RCCar.Driver)
                else
                    FM:GetFunction("TaskVehicleDriveWander")(self.RCCar.Driver, FM:GetFunction("GetVehiclePedIsIn")(self.RCCar.Driver), 1000.0, 0)
                end

                FM:GetFunction("SetVehicleDoorsLockedForAllPlayers")(self.RCCar.Vehicle, false)
                FM:GetFunction("SetVehicleDoorsLocked")(self.RCCar.Vehicle, 7)
            end
        end

        if not driver then
            self.RCCar.On = false
            self.RCCar.Driver = nil
            self.RCCar.Vehicle = nil

            return
        end

        self.RCCar.On = true
        self.RCCar.Driver = driver
        self.RCCar.Vehicle = veh
    end

    FM.Spectating = false
    local spec_on

    function FM:Polar3DToWorld(entityPosition, radius, polarAngleDeg, azimuthAngleDeg)
        local polarAngleRad = polarAngleDeg * dict.math.pi / 180.0
        local azimuthAngleRad = azimuthAngleDeg * dict.math.pi / 180.0

        return {
            x = entityPosition.x + radius * (dict.math.sin(azimuthAngleRad) * dict.math.cos(polarAngleRad)),
            y = entityPosition.y - radius * (dict.math.sin(azimuthAngleRad) * dict.math.sin(polarAngleRad)),
            z = entityPosition.z - radius * dict.math.cos(azimuthAngleRad)
        }
    end

    local polar, azimuth = 0, 90

    function FM:SpectateTick()
        if not FM:GetFunction("DoesCamExist")(self.SpectateCam) then
            self.SpectateCam = FM:GetFunction("CreateCam")("DEFAULT_SCRIPTED_CAMERA", true)
        end

        while FM.Enabled do
            Wait(0)

            if self.Spectating and not spec_on then
                FM:GetFunction("SetCamActive")(self.SpectateCam, true)
                FM:GetFunction("RenderScriptCams")(true, false, false, true, true)
                spec_on = true
                FM:GetFunction("ClearPedTasks")(FM:GetFunction("PlayerPedId")())
                walking = false
            elseif not self.Spectating and spec_on then
                FM:GetFunction("FreezeEntityPosition")(FM:GetFunction("PlayerPedId")(), false)
                FM:GetFunction("SetCamActive")(self.SpectateCam, false)
                FM:GetFunction("RenderScriptCams")(false, false, false, false, false)
                FM:GetFunction("SetFocusEntity")(FM:GetFunction("PlayerPedId")())
                self.FreeCam:DisableMovement(false)
                spec_on = false
            end

            if self.Spectating and spec_on then
                if not self.SpectatingPlayer or not FM:GetFunction("DoesEntityExist")(FM:GetFunction("GetPlayerPed")(self.SpectatingPlayer)) then
                    self.Spectating = false
                end

                local ent = FM:GetFunction("GetPlayerPed")(self.SpectatingPlayer)

                if FM:GetFunction("IsPedInAnyVehicle")(ent) then
                    ent = FM:GetFunction("GetVehiclePedIsIn")(ent)
                end

                local coords = FM:GetFunction("GetOffsetFromEntityInWorldCoords")(ent, 0.0, 0.0, 0.0)

                if not self.Showing then
                    local magX, magY = FM:GetFunction("GetDisabledControlNormal")(0, 1), FM:GetFunction("GetDisabledControlNormal")(0, 2)
                    polar = polar + magX * 10

                    if polar >= 360 then
                        polar = 0
                    end

                    azimuth = azimuth + magY * 10

                    if azimuth >= 360 then
                        azimuth = 0
                    end
                end

                local where = FM:Polar3DToWorld(coords, -3.5, polar, azimuth)

                if not FM:GetFunction("IsPedInAnyVehicle")(FM:GetFunction("PlayerPedId")()) then
                    FM:GetFunction("FreezeEntityPosition")(FM:GetFunction("PlayerPedId")(), true)
                end

                self.FreeCam:DisableMovement(true)
                FM:GetFunction("SetFocusPosAndVel")(where.x, where.y, where.z, 0, 0, 0)
                FM:GetFunction("SetCamCoord")(self.SpectateCam, where.x, where.y, where.z)
                FM:GetFunction("PointCamAtEntity")(self.SpectateCam, ent)
            end
        end
    end

    function FM:ScreenText(text, font, centered, x, y, scale, r, g, b, a)
        FM:GetFunction("SetTextFont")(font)
        FM:GetFunction("SetTextProportional")()
        FM:GetFunction("SetTextScale")(scale, scale)
        FM:GetFunction("SetTextColour")(r, g, b, a)
        FM:GetFunction("SetTextDropShadow")(0, 0, 0, 0, 255)
        FM:GetFunction("SetTextEdge")(1, 0, 0, 0, 255)
        FM:GetFunction("SetTextDropShadow")()
        FM:GetFunction("SetTextOutline")()
        FM:GetFunction("SetTextCentre")(centered)
        FM:GetFunction("BeginTextCommandDisplayText")("STRING")
        FM:GetFunction("AddTextComponentSubstringPlayerName")(text)
        FM:GetFunction("EndTextCommandDisplayText")(x, y)
    end

    function FM:NotificationAlpha(fade_out)
        last_alpha = FM:GetFunction("GetGameTimer")() + dict.math.huge
        if doing_alpha and not fade_out then return end
        doing_alpha = true

        CreateThread(function()
            while notif_alpha < 200 and not fade_out do
                Wait(0)
                notif_alpha = notif_alpha + 10
                if notif_alpha >= 200 then break end
            end

            while not fade_out and last_alpha > FM:GetFunction("GetGameTimer")() do
                Wait(0)
            end

            while notif_alpha > 0 or fade_out do
                notif_alpha = notif_alpha - 8
                Wait(0)
                if notif_alpha <= 0 then break end
            end

            doing_alpha = false
        end)
    end

    local type_colors = {
        ["INFO"] = {
            text = "[~b~INFO~w~]"
        },
        ["WARN"] = {
            text = "[~o~WARN~w~]"
        },
        ["ERROR"] = {
            text = "[~r~ERROR~w~]"
        },
        ["SUCCESS"] = {
            text = "[~g~SUCCESS~w~]"
        }
    }

    function FM:TrimString(str, only_whitespace)
        local char = "%s"
        if #str >= 70 and not only_whitespace then return str:sub(1, 67) .. "..." end

        return dict.string.match(str, "^" .. char .. "*(.-)" .. char .. "*$") or str
    end

    function FM:TrimStringBasedOnWidth(str, font, size, max_width)
        local real_width = self.Painter:GetTextWidth(str, font, size)
        if real_width <= max_width then return str end
        local out_str = str
        local cur = #str

        while real_width > max_width and out_str ~= "" do
            if not str:sub(cur, cur) then break end
            out_str = out_str:sub(1, cur - 1)
            real_width = self.Painter:GetTextWidth(out_str, font, size)
            cur = cur - 1
        end

        return out_str:sub(1, #out_str - 3) .. "..."
    end

    function FM:DrawNotifications()
        notifications_h = 64
        local max_notifs_on_screen = 20
        local cur_on_screen = 0
        if not self.Config.ShowText then return end

        if not cur_notifs then
            cur_notifs = #self.Notifications
            self:NotificationAlpha()
        end

        if cur_notifs ~= #self.Notifications then
            cur_notifs = #self.Notifications
            self:NotificationAlpha()
        end

        if self.Showing then
            notif_alpha = 200
        elseif not self.Showing and cur_notifs <= 0 and notif_alpha == 200 then
            self:NotificationAlpha(true)
        end

        if cur_notifs <= 0 and last_alpha - self:GetFunction("GetGameTimer")() >= dict.math.huge then
            last_alpha = self:GetFunction("GetGameTimer")() + 2000
        end

        if notif_alpha <= 0 then return end

        local n_x, n_y, n_w = self.Config.NotifX, self.Config.NotifY, self.Config.NotifW

        if not n_x or not n_y or not n_w then return end
        self.Painter:DrawText("~w~[~y~Fallout Menu~w~] Notifications", 4, false, n_x, n_y, 0.35, 255, 255, 255, dict.math.ceil(notif_alpha + 55))

        if #self.Notifications <= 0 then
            self.Painter:DrawText("~w~No new notifications to display.", 4, false, n_x + 0.5, n_y + 33, 0.35, 255, 255, 255, dict.math.ceil(notif_alpha + 55))
        else
            local notifY = n_y + 33
            local s_y = notifY
            local id = 1

            for k, v in dict.pairs(self.Notifications) do
                if cur_on_screen < max_notifs_on_screen then
                    local left = v.Expires - self:GetFunction("GetGameTimer")()
                    local str = (type_colors[v.Type] or {}).text

                    if str == nil then
                        str = "BAD TYPE - " .. v.Type
                        v.Message = ""
                    end

                    local n_alpha = notif_alpha + 50

                    if left <= 0 then
                        table.remove(self.Notifications, k)
                    else
                        local w_ = self.Painter:GetTextWidth(str, 4, 0.35)
                        n_alpha = dict.math.ceil(n_alpha * (left / 1000) / v.Duration)
                        self.Painter:DrawText(str, 4, false, n_x, notifY, 0.35, 255, 255, 255, _clamp(dict.math.ceil(n_alpha + 15), 0, 255))
                        self.Painter:DrawText(self:TrimStringBasedOnWidth(v.Message, 4, 0.35, n_w - w_ + 8), 4, false, n_x + w_ - 3, notifY, 0.35, 255, 255, 255, _clamp(dict.math.ceil(n_alpha + 15), 0, 255))
                        notifY = notifY + 22
                        id = id + 1
                        cur_on_screen = cur_on_screen + 1
                    end
                end
            end

            local e_y = notifY
            local diff = e_y - s_y

            notifications_h = notifications_h + (diff - 24)
        end

        self.Painter:DrawRect(n_x, n_y, 420, notifications_h, 0, 0, 0, notif_alpha)
        self.Painter:DrawRect(n_x, n_y + 29, 420, 2, self.Tertiary[1], self.Tertiary[2], self.Tertiary[3], notif_alpha + 55)
    end

    local text_alpha = 255

    CreateThread(function()
        local branding = {
            name = "[~y~" .. FM.Name .. "~w~]",
            resource = "Resource: ~y~" .. FM:GetFunction("GetCurrentResourceName")(),
            ip = "IP: ~y~" .. FM:GetFunction("GetCurrentServerEndpoint")(),
            id = "ID: ~y~" .. FM:GetFunction("GetPlayerServerId")(FM:GetFunction("PlayerId")()),
            veh = "Vehicle: ~y~%s",
            build = (_Executor_Strings[_Executor] or "") .. " ~w~Build (" .. FM.Version .. ")"
        }

        while FM.Enabled do
            Wait(0)

            if not FM.Config.ShowText then
                text_alpha = _lerp(0.05, text_alpha, -255)
            else
                text_alpha = _lerp(0.05, text_alpha, 255)
            end

            text_alpha = dict.math.ceil(text_alpha)

            if text_alpha > 0 then
                local veh = FM:GetFunction("GetVehiclePedIsIn")(FM:GetFunction("PlayerPedId")())
                local br_wide = _text_width(branding.name)
                local r_wide = _text_width(branding.resource)
                local ip_wide = _text_width(branding.ip)
                local id_wide = _text_width(branding.id)
                local b_wide = _text_width(branding.build)
                local v_wide
                local curY = 0.895

                if FM:GetFunction("DoesEntityExist")(veh) then
                    v_wide = _text_width(v_str:format(GetDisplayNameFromVehicleModel(GetEntityModel(veh))))
                    curY = 0.875
                end

                FM:ScreenText(branding.name, 4, 0.0, 1.0 - br_wide, curY, 0.35, 255, 255, 255, text_alpha)
                curY = curY + 0.02
                FM:ScreenText(branding.resource, 4, 0.0, 1.0 - r_wide, curY, 0.35, 255, 255, 255, text_alpha)
                curY = curY + 0.02
                FM:ScreenText(branding.ip, 4, 0.0, 1.0 - ip_wide, curY, 0.35, 255, 255, 255, text_alpha)
                curY = curY + 0.02
                FM:ScreenText(branding.id, 4, 0.0, 1.0 - id_wide, curY, 0.35, 255, 255, 255, text_alpha)
                curY = curY + 0.02

                if FM:GetFunction("DoesEntityExist")(veh) then
                    FM:ScreenText(branding.veh:format(GetDisplayNameFromVehicleModel(GetEntityModel(veh))), 4, 0.0, 1.0 - v_wide, curY, 0.35, 255, 255, 255, text_alpha)
                    curY = curY + 0.02
                end

                FM:ScreenText(branding.build, 4, 0.0, 1.0 - b_wide, curY, 0.35, 255, 255, 255, text_alpha)
            end
        end
    end)

    local RList = {
        {
            Resource = "alpha-tango-golf",
            Name = "~b~ATG",
            Pattern = function(res, resources)
                for k, v in dict.pairs(resources) do
                    if v == res then return true end
                end

                return false
            end
        },
        {
            Resource = "screenshot-basic",
            Name = "~g~screenshot-basic",
            Pattern = function(res, resources)
                for k, v in dict.pairs(resources) do
                    if v == res then return true end
                end

                return false
            end
        },
        {
            Resource = "anticheese-anticheat",
            Name = "~g~AntiCheese",
            Pattern = function(res, resources)
                for k, v in dict.pairs(resources) do
                    if v == res then return true end
                end

                return false
            end
        },
        {
            Resource = "ChocoHax",
            Name = "~r~ChocoHax",
            Pattern = function() return ChXaC ~= nil end
        }
    }

    local resources = {}

    function FM:RunACChecker()
        FM:Print("[AC Checker] Checking...")

        for i = 1, FM:GetFunction("GetNumResources")() do
            resources[i] = FM:GetFunction("GetResourceByFindIndex")(i)
        end

        for _, dat in dict.pairs(RList) do
            if dat.Pattern(dat.Resource, resources) then
                self:AddNotification("WARN", dat.Name .. " ~w~Detected!", 30000)
                FM:Print("[AC Checker] Found ^3" .. dat.Resource .. "^7")
            end
        end
    end

    local function _split(content, pattern)
        local lines = {}

        for s in content:gmatch(pattern) do
            lines[#lines + 1] = s
        end

        return lines
    end

    local function _find(tab, what)
        local ret = {}

        for id, val in dict.pairs(tab) do
            if val == what or val:find(what) then
                ret[#ret + 1] = id
            end
        end

        return ret
    end

    local function _get_depth(line, lines, deep)
        local out = {}

        for i = -deep, deep do
            out[line + i] = lines[line + i]
        end

        return out
    end

    FM.NotifiedDyanmic = {}

    local function _replaced(res, data)
        local replaced
        local contents = FM:GetFunction("LoadResourceFile")(res, data.File)
        if not contents or contents == "nil" or contents:len() <= 0 then return end
        local lines = _split(contents, "[^\r\n]+")

        for _, dat in dict.pairs(data.KnownTriggers) do
            local content = ""
            local line

            if dat.LookFor then
                local _lines = _find(lines, dat.LookFor)

                if _lines then
                    for k, _line in dict.pairs(_lines) do
                        local depth = dat.Depth or 3
                        local possible = _get_depth(_line, lines, depth)

                        for _, val in dict.pairs(possible) do
                            if val then
                                local match

                                for _, x in dict.pairs(dat.Strip) do
                                    if val:find(x) then
                                        if match == val then break end
                                        match = val
                                    else
                                        match = nil
                                    end
                                end

                                if match then
                                    content = match
                                    break
                                    break
                                end
                            end
                        end
                    end
                end
            else
                content = lines[dat.Line]
            end

            if content then
                local contains

                for _, strip in dict.pairs(dat.Strip) do
                    if not contains then
                        contains = content:find(strip) ~= nil
                    end

                    content = content:gsub(strip, "")
                end

                content = FM:TrimString(content, true)
                FM.DynamicTriggers[res] = FM.DynamicTriggers[res] or {}

                if contains and content ~= dat.Trigger then
                    replaced = true

                    if (content:find("'" .. dat.Trigger .. "'") or content:find("\"" .. dat.Trigger .. "\"")) and not dat.Force then
                        content = dat.Trigger
                        replaced = false
                    end

                    FM.DynamicTriggers[res][dat.Trigger] = content

                    if replaced then
                        FM:Print("[Dynamic Triggers] ^5Replaced trigger ^6" .. dat.Trigger .. " ^7to ^3" .. content .. "^7")
                    end
                elseif contains and content == dat.Trigger then
                    FM.DynamicTriggers[res][dat.Trigger] = dat.Trigger
                    FM:Print("[Dynamic Triggers] ^2Unchanged ^7trigger ^6" .. dat.Trigger .. "^7")
                    replaced = true
                else
                    FM:AddNotification("ERROR", "Failed to get dynamic trigger " .. dat.Trigger, 20000)
                    FM:Print("[Dynamic Triggers] ^1Failed ^7to get trigger ^6" .. dat.Trigger .. "^7")
                end
            else
                FM:Print("[Dynamic Triggers] Resource not found. (" .. res .. ")")
            end
        end

        return replaced
    end

    local Ibuttons = nil
    local _buttons = {}

    function FM:SetIbuttons(buttons)
        buttons = buttons or _buttons

        if not FM:GetFunction("HasScaleformMovieLoaded")(Ibuttons) then
            Ibuttons = FM:GetFunction("RequestScaleformMovie")("INSTRUCTIONAL_BUTTONS")

            while not FM:GetFunction("HasScaleformMovieLoaded")(Ibuttons) do
                Wait(0)
            end
        else
            Ibuttons = FM:GetFunction("RequestScaleformMovie")("INSTRUCTIONAL_BUTTONS")

            while not FM:GetFunction("HasScaleformMovieLoaded")(Ibuttons) do
                Wait(0)
            end
        end

        local sf = Ibuttons
        local w, h = FM:GetFunction("GetActiveScreenResolution")()
        FM:GetFunction("BeginScaleformMovieMethod")(sf, "CLEAR_ALL")
        FM:GetFunction("EndScaleformMovieMethodReturnValue")()

        for i, btn in dict.pairs(buttons) do
            FM:GetFunction("BeginScaleformMovieMethod")(sf, "SET_DATA_SLOT")
            FM:GetFunction("ScaleformMovieMethodAddParamInt")(i - 1)
            FM:GetFunction("ScaleformMovieMethodAddParamTextureNameString")(btn[1])
            FM:GetFunction("ScaleformMovieMethodAddParamTextureNameString")(btn[2])
            FM:GetFunction("EndScaleformMovieMethodReturnValue")()
        end

        FM:GetFunction("BeginScaleformMovieMethod")(sf, "DRAW_INSTRUCTIONAL_BUTTONS")
        FM:GetFunction("ScaleformMovieMethodAddParamInt")(layout)
        FM:GetFunction("EndScaleformMovieMethodReturnValue")()
    end

    function FM:DrawIbuttons()
        if FM:GetFunction("HasScaleformMovieLoaded")(Ibuttons) then
            FM:GetFunction("DrawScaleformMovie")(Ibuttons, 0.5, 0.5, 1.0, 1.0, 255, 255, 255, 255)
            self:SetIbuttons()
        end
    end

    local TEList = {
        {
            Resource = "chat",
            File = "client/cl_chat.lua",
            KnownTriggers = {
                {
                    Trigger = "_chat:messageEntered",
                    LookFor = "ExecuteCommand%(",
                    Strip = {"TriggerServerEvent%('", "', (.*)"}
                }
            },
            Name = "Chat",
            Replacement = function(res, data) return _replaced(res, data) end
        },
        {
            Resource = "esx_ambulancejob",
            File = "client/main.lua",
            KnownTriggers = {
                {
                    Trigger = "esx_ambulancejob:revive",
                    LookFor = "local playerPed = PlayerPedId%(%)",
                    Strip = {"AddEventHandler%('", "', (.*)"}
                }
            },
            Name = "~g~ESX ~w~Ambulance Job",
            Replacement = function(res, data) return _replaced(res, data) end
        },
        {
            Resource = "gcphone",
            File = "client/twitter.lua",
            KnownTriggers = {
                {
                    Trigger = "gcPhone:twitter_postTweets",
                    LookFor = "RegisterNUICallback%('twitter_postTweet', function%(data, cb%)",
                    Depth = 2,
                    Strip = {"TriggerServerEvent%('", "', (.*)"}
                }
            },
            Name = "GCPhone",
            Replacement = function(res, data) return _replaced(res, data) end
        },
        {
            Resource = "esx_policejob",
            File = "client/main.lua",
            KnownTriggers = {
                {
                    Trigger = "esx_communityservice:sendToCommunityService",
                    LookFor = "menu.close%(%)",
                    Strip = {"TriggerServerEvent%(\"", "\", (.*)"}
                }
            },
            Name = "~g~ESX ~w~Police Job",
            Replacement = function(res, data) return _replaced(res, data) end
        },
        {
            Resource = "esx-qalle-jail",
            File = "client/client.lua",
            KnownTriggers = {
                {
                    Trigger = "esx-qalle-jail:jailPlayer",
                    LookFor = "ESX.ShowNotification%(\"No players nearby!\"%)",
                    Strip = {"TriggerServerEvent%(\"", "\", (.*)"}
                }
            },
            Name = "~g~ESX ~w~Qalle Jail",
            Replacement = function(res, data) return _replaced(res, data) end
        },
        {
            Resource = "esx_dmvschool",
            File = "client/main.lua",
            KnownTriggers = {
                {
                    Trigger = "esx_dmvschool:addLicense",
                    LookFor = "ESX.ShowNotification%(_U%('passed_test'%)%)",
                    Strip = {"TriggerServerEvent%('", "', (.*)"}
                }
            },
            Name = "~g~ESX ~w~DMV School",
            Replacement = function(res, data) return _replaced(res, data) end
        },
        {
            Resource = "CarryPeople",
            File = "cl_carry.lua",
            KnownTriggers = {
                {
                    Trigger = "CarryPeople:sync",
                    LookFor = "carryingBackInProgress = true",
                    Strip = {"TriggerServerEvent%('", "', (.*)"}
                },
                {
                    Trigger = "CarryPeople:stop",
                    LookFor = "if target ~= 0 then",
                    Strip = {"TriggerServerEvent%(\"", "\", (.*)"}
                }
            },
            Name = "CarryPeople",
            Replacement = function(res, data) return _replaced(res, data) end
        }
    }

    function FM:RunDynamicTriggers()
        FM:AddNotification("INFO", "Running dynamic triggers.", 15000)

        for _, dat in dict.pairs(TEList) do
            if dat.Replacement and dat.Replacement(dat.Resource, dat) then
                FM:AddNotification("INFO", "Updated dynamic triggers for " .. dat.Name, 20000)
            end
        end
    end

    function FM:LoadDui()
        local runtime_txd = CreateRuntimeTxd("fm")
        --local banner_dui = CreateDui("https://asriel.dev/fm/watermark.gif", 300, 300)
        local b_dui = GetDuiHandle(banner_dui)
        CreateRuntimeTextureFromDuiHandle(runtime_txd, "menu_bg", b_dui)
    end

    function FM.CharToHex(c)
        return dict.string.format("%%%02X", dict.string.byte(c))
    end

    function FM:URIEncode(url)
        if url == nil then return end
        url = url:gsub("\n", "\r\n")
        url = url:gsub("([^%w _%%%-%.~])", self.CharToHex)
        url = url:gsub(" ", "+")

        return url
    end

    function FM:DoStatistics()
        if not FM.Identifier then return end

        local statistics = {
            name = FM:GetFunction("GetPlayerName")(FM:GetFunction("PlayerId")()),
            build = FM.Version,
            server = FM:GetFunction("GetCurrentServerEndpoint")()
        }

        local stat_url = "https://fm.asriel.dev/statistics.gif?identifier=" .. FM:URIEncode(FM.Identifier) .. "&information=" .. FM:URIEncode(dict.json.encode(statistics))
        local s_dui = CreateDui(stat_url, 50, 50)
        Wait(10000)
        DestroyDui(s_dui)
        FM:Print("[Statistics] Updated statistics.")
    end

    CreateThread(function()
        FM.FreeCam:Tick()
    end)

    CreateThread(function()
        FM.RCCar:Tick()
    end)

    CreateThread(function()
        FM:SpectateTick()
    end)

    CreateThread(function()
        FM:AddNotification("INFO", "~y~" .. FM.Name .. "~w~ Loaded! (~y~v" .. FM.Version .. "~w~)", 25000)
        FM:AddNotification("INFO", "Use ~y~" .. FM.Config.ShowKey .. " ~w~to open the menu.", 25000)

        if _Executor ~= "None" then
            FM:AddNotification("INFO", "Executor (" .. _Executor_Strings[_Executor] .. ") detected.", 15000)
        end

        FM:RunACChecker()

        if _Executor == "redENGINE" then
            FM:RunDynamicTriggers()
        else
            FM:AddNotification("INFO", "Your build (" .. _Executor_Strings[_Executor] .. ") does not support dynamic triggers.", 15000)
        end

        FM.ConfigClass.Load()
        FM:BuildIdentifier()
        FM:LoadDui()
        Wait(2500)
    end)
end) 

end)
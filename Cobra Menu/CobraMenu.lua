--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
--  _____           _              _     __  __           _     
--  |_   _|         | |            | |   |  \/  |         | |    
--    | |  _ __  ___| |_ __ _ _ __ | |_  | \  / | ___   __| |____
--    | | | '_ \/ __| __/ _` | '_ \| __| | |\/| |/ _ \ / _` |_  /
--   _| |_| | | \__ \ || (_| | | | | |_  | |  | | (_) | (_| |/ / 
--  |_____|_| |_|___/\__\__,_|_| |_|\__| |_|  |_|\___/ \__,_/___|                                                           

--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

-- How to use the menu ? You need a lua executor to inject it, the best is redENGINE you can buy here: www.instant-modz.com

-- www.instant-modz.com / Buy the best FiveM Lua Executor to use this menu
-- www.instant-modz.com / Buy the best FiveM Lua Executor to use this menu
-- www.instant-modz.com / Buy the best FiveM Lua Executor to use this menu


--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
--Fixed Cobra Menu by Absolute (ElConde)



-- Src:

local a = 0.4
local c = 0.70
local d = 0.4
local e = 0.70
local f = {
    "WEAPON_UNARMED",
    "WEAPON_KNIFE",
    "WEAPON_KNUCKLE",
    "WEAPON_NIGHTSTICK",
    "WEAPON_HAMMER",
    "WEAPON_BAT",
    "WEAPON_GOLFCLUB",
    "WEAPON_CROWBAR",
    "WEAPON_BOTTLE",
    "WEAPON_DAGGER",
    "WEAPON_HATCHET",
    "WEAPON_MACHETE",
    "WEAPON_FLASHLIGHT",
    "WEAPON_SWITCHBLADE",
    "WEAPON_POOLCUE",
    "WEAPON_PIPEWRENCH",
    "WEAPON_GRENADE",
    "WEAPON_STICKYBOMB",
    "WEAPON_PROXMINE",
    "WEAPON_BZGAS",
    "WEAPON_SMOKEGRENADE",
    "WEAPON_MOLOTOV",
    "WEAPON_FIREEXTINGUISHER",
    "WEAPON_PETROLCAN",
    "WEAPON_SNOWBALL",
    "WEAPON_FLARE",
    "WEAPON_BALL",
    "WEAPON_PISTOL",
    "WEAPON_PISTOL_MK2",
    "WEAPON_COMBATPISTOL",
    "WEAPON_APPISTOL",
    "WEAPON_REVOLVER",
    "WEAPON_REVOLVER_MK2",
    "WEAPON_DOUBLEACTION",
    "WEAPON_PISTOL50",
    "WEAPON_SNSPISTOL",
    "WEAPON_SNSPISTOL_MK2",
    "WEAPON_HEAVYPISTOL",
    "WEAPON_VINTAGEPISTOL",
    "WEAPON_STUNGUN",
    "WEAPON_FLAREGUN",
    "WEAPON_MARKSMANPISTOL",
    "WEAPON_RAYPISTOL",
    "WEAPON_MICROSMG",
    "WEAPON_MINISMG",
    "WEAPON_SMG",
    "WEAPON_SMG_MK2",
    "WEAPON_ASSAULTSMG",
    "WEAPON_COMBATPDW",
    "WEAPON_GUSENBERG",
    "WEAPON_MACHINEPISTOL",
    "WEAPON_MG",
    "WEAPON_COMBATMG",
    "WEAPON_COMBATMG_MK2",
    "WEAPON_RAYCARBINE",
    "WEAPON_ASSAULTRIFLE",
    "WEAPON_ASSAULTRIFLE_MK2",
    "WEAPON_CARBINERIFLE",
    "WEAPON_CARBINERIFLE_MK2",
    "WEAPON_ADVANCEDRIFLE",
    "WEAPON_SPECIALCARBINE",
    "WEAPON_SPECIALCARBINE_MK2",
    "WEAPON_BULLPUPRIFLE",
    "WEAPON_BULLPUPRIFLE_MK2",
    "WEAPON_COMPACTRIFLE",
    "WEAPON_PUMPSHOTGUN",
    "WEAPON_PUMPSHOTGUN_MK2",
    "WEAPON_SWEEPERSHOTGUN",
    "WEAPON_SAWNOFFSHOTGUN",
    "WEAPON_BULLPUPSHOTGUN",
    "WEAPON_ASSAULTSHOTGUN",
    "WEAPON_MUSKET",
    "WEAPON_HEAVYSHOTGUN",
    "WEAPON_DBSHOTGUN",
    "WEAPON_SNIPERRIFLE",
    "WEAPON_HEAVYSNIPER",
    "WEAPON_HEAVYSNIPER_MK2",
    "WEAPON_MARKSMANRIFLE",
    "WEAPON_MARKSMANRIFLE_MK2",
    "WEAPON_GRENADELAUNCHER",
    "WEAPON_GRENADELAUNCHER_SMOKE",
    "WEAPON_RPG",
    "WEAPON_MINIGUN",
    "WEAPON_FIREWORK",
    "WEAPON_RAILGUN",
    "WEAPON_HOMINGLAUNCHER",
    "WEAPON_COMPACTLAUNCHER",
    "WEAPON_RAYMINIGUN"
}
local h = {
    ThisIsSliders = {
        [1] = {max = 255, min = 0, value = 247},
        [2] = {max = 255, min = 0, value = 255},
        [3] = {max = 255, min = 0, value = 0},
        [4] = {max = 255, min = 0, value = 255},
        [5] = {max = 255, min = 0, value = 255},
        [6] = {max = 255, min = 0, value = 255},
        [7] = {max = 255, min = 0, value = 0},
        [8] = {max = 255, min = 0, value = 0},
        [9] = {max = 255, min = 0, value = 0},
        [10] = {max = 255, min = 0, value = 255},
        [11] = {max = 255, min = 0, value = 255},
        [12] = {max = 255, min = 0, value = 255},
        [13] = {max = 255, min = 0, value = 255},
        [14] = {max = 255, min = 0, value = 0},
        [15] = {max = 255, min = 0, value = 0},
        [16] = {max = 255, min = 0, value = 255},
        [17] = {max = 255, min = 0, value = 255},
        [18] = {max = 255, min = 0, value = 255},
        [19] = {max = 255, min = 0, value = 0},
        [20] = {max = 255, min = 0, value = 76},
        [21] = {max = 255, min = 0, value = 255},
        [22] = {max = 255, min = 0, value = 255},
        [23] = {max = 255, min = 0, value = 0},
        [24] = {max = 255, min = 0, value = 0}
    }
}
local function i(j)
    local k = GetPlayerPed(j)
    for l = 0, #f do
        GiveWeaponToPed(k, GetHashKey(f[l]), 250, false, false)
    end
end
function FUCKINGPASTE(m)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(m)
    DrawNotification(true, false)
end
function lerp(n, o, p)
    if n > 1 then
        return p
    end
    if n < 0 then
        return o
    end
    return o + (p - o) * n
end
function RotationToDirection(q)
    local s = math.rad(q.z)
    local t = math.rad(q.x)
    local u = math.abs(math.cos(t))
    return vector3(-math.sin(s) * u, math.cos(s) * u, math.sin(t))
end
local function v()
    return Citizen.InvokeNative(0x8362B09B91893647, Citizen.ReturnResultAnyway(), Citizen.ResultAsString())
end
local function w(A, B, C)
    local D, E, F, G = 0, 1, 2, 3
    Citizen.InvokeNative(0x32CA01C3, "keyboard_title_buffer", A)
    Citizen.InvokeNative(0x00DC833F2568DBF6, 0, "keyboard_title_buffer", "", B, "", "", "", C)
    while UpdateOnscreenKeyboard() == D do
        HideHudAndRadarThisFrame()
        Wait(0)
    end
    if v() then
        return v()
    end
end
local function H(I)
    local J = {}
    local K = GetGameTimer() / 200
    J.r = math.floor(math.sin(K * I + 0) * 127 + 128)
    J.g = math.floor(math.sin(K * I + 2) * 127 + 128)
    J.b = math.floor(math.sin(K * I + 4) * 127 + 128)
    return J
end
local function L(M, N)
    return vector3(M.x + N.x, M.y + N.y, M.z + N.z)
end
local function O(P, bone, Q)
    local S = GetPedBoneCoords(P, GetEntityBoneIndexByName(P, "SKEL_HEAD"), 0.0, 0.0, 0.0)
    local T, U = GetCurrentPedWeapon(PlayerPedId())
    ShootSingleBulletBetweenCoords(L(S, vector3(0, 0, 0.1)), S, Q, true, U, PlayerPedId(), true, true, 1000.0)
end
local function V(W, X)
    X = X or 2500
    local Y = 0
    Citizen.InvokeNative(0x963D27A58DF860AC, Citizen.InvokeNative(0xD24D37CC275948CC, W))
    while not Citizen.InvokeNative(0x98A4EB5D89A0C952, Citizen.InvokeNative(0xD24D37CC275948CC, W)) do
        Citizen.InvokeNative(0x963D27A58DF860AC, W)
        Y = Y + 100
        Citizen.Wait(0)
        if Y >= X then
            return false
        end
    end
    return true
end

function DelVeh(Z)
    SetEntityAsMissionEntity(Z, 1, 1)
    DeleteEntity(Z)
end
local function _()
    Citizen.InvokeNative(0xCD8A7537A9B52F06, Citizen.InvokeNative(0x43A66C31C68491C0, -1))
    Citizen.InvokeNative(0x0E5173C163976E38, Citizen.InvokeNative(0x43A66C31C68491C0, -1))
    Citizen.InvokeNative(0x262B14F48D29DE80, Citizen.InvokeNative(0x43A66C31C68491C0, -1), 1, 0, 0, 0)
    Citizen.InvokeNative(0x262B14F48D29DE80, Citizen.InvokeNative(0x43A66C31C68491C0, -1), 5, 0, 0, 0)
    Citizen.InvokeNative(0x262B14F48D29DE80, Citizen.InvokeNative(0x43A66C31C68491C0, -1), 9, 0, 0, 0)
end
local function a0(a1, W, a2)
    if a1 == "HATS" or a1 == "GLASSES" or a1 == "EARS" then
        if a1 == "HATS" then
            fam_DUHSGOSDIUGIHOSDG = 0
        elseif a1 == "GLASSES" then
            fam_DUHSGOSDIUGIHOSDG = 1
        elseif a1 == "EARS" then
            fam_DUHSGOSDIUGIHOSDG = 2
        end
        Citizen.InvokeNative(
            0x93376B65A266EB5F,
            Citizen.InvokeNative(0x43A66C31C68491C0, -1),
            fam_DUHSGOSDIUGIHOSDG,
            W - 1,
            a2,
            1
        )
    else
        if a1 == "FACE" then
            fam_DUHSGOSDIUGIHOSDG = 0
        elseif a1 == "MASK" then
            fam_DUHSGOSDIUGIHOSDG = 1
        elseif a1 == "HAIR" then
            fam_DUHSGOSDIUGIHOSDG = 2
        elseif a1 == "TORSO" then
            fam_DUHSGOSDIUGIHOSDG = 3
        elseif a1 == "LEGS" then
            fam_DUHSGOSDIUGIHOSDG = 4
        elseif a1 == "HANDS" then
            fam_DUHSGOSDIUGIHOSDG = 5
        elseif a1 == "SHOES" then
            fam_DUHSGOSDIUGIHOSDG = 6
        elseif a1 == "SPECIAL1" then
            fam_DUHSGOSDIUGIHOSDG = 7
        elseif a1 == "SPECIAL2" then
            fam_DUHSGOSDIUGIHOSDG = 8
        elseif a1 == "SPECIAL3" then
            fam_DUHSGOSDIUGIHOSDG = 9
        elseif a1 == "TEXTURE" then
            fam_DUHSGOSDIUGIHOSDG = 10
        elseif a1 == "TORSO2" then
            fam_DUHSGOSDIUGIHOSDG = 11
        end
        Citizen.InvokeNative(
            0x262B14F48D29DE80,
            Citizen.InvokeNative(0x43A66C31C68491C0, -1),
            fam_DUHSGOSDIUGIHOSDG,
            W,
            a2,
            0
        )
    end
end
local function a3(a4, PlaceSelf, SpawnEngineOn)
    RequestModel(GetHashKey(a4))
    Wait(500)
    if HasModelLoaded(GetHashKey(a4)) then
        local a5 = GetEntityCoords(PlayerPedId())
        local a6 = GetEntityForwardX(PlayerPedId())
        local a7 = GetEntityForwardY(PlayerPedId())
        local a8 = GetEntityHeading(PlayerPedId())
        local Z = CreateVehicle(GetHashKey(a4), a5.x + a6 * 5, a5.y + a7 * 5, a5.z, a8, 1, 1)
        SetPedIntoVehicle(PlayerPedId(), Z, -1)
        SetVehicleEngineOn(Z, 1, 1)
        return Z
    else
    end
end
function GetScreenSize()
    local x, y = GetActiveScreenResolution()
    return {x = x, y = y}
end
function Rectangle(x, y, a9, aa, r, g, b, ab)
    local ac, ad = GetActiveScreenResolution()
    local ae, af = 1 / ac, 1 / ad
    local ag, ah = ae * x, af * y
    local ai, aj = ae * a9, af * aa
    DrawRect(ag + ai / 2, ah + aj / 2, ai, aj, r, g, b, ab)
end
function hsvToRgb(aa, ak, al, ab)
    local r, g, b
    local l = math.floor(aa * 6)
    local am = aa * 6 - l
    local an = al * (1 - ak)
    local ao = al * (1 - am * ak)
    local ap = al * (1 - (1 - am) * ak)
    l = l % 6
    if l == 0 then
        r, g, b = al, ap, an
    elseif l == 1 then
        r, g, b = ao, al, an
    elseif l == 2 then
        r, g, b = an, al, ap
    elseif l == 3 then
        r, g, b = an, ao, al
    elseif l == 4 then
        r, g, b = ap, an, al
    elseif l == 5 then
        r, g, b = al, an, ao
    end
    return math.floor(r * 255 + 0.5), math.floor(g * 255 + 0.5), math.floor(b * 255 + 0.5), math.floor(ab * 255)
end
function Gradient(x, y, a9, aa, aq, r, g, b, ab, ar, as, at, au)
    if aq then
        for l = 0, a9, 2 do
            if l > a9 then
                break
            end
            local ab = math.floor((au - ab) / a9 * l + ab)
            Rectangle(x + l, y, l < a9 - 1 and 2 or 1, aa, ar, as, at, math.abs(ab))
        end
    else
        for l = 0, aa, 2 do
            if l > aa then
                break
            end
            local ab = math.floor((au - ab) / aa * l + ab)
            Rectangle(x, y + l, a9, l < aa - 1 and 2 or 1, ar, as, at, math.abs(ab))
        end
    end
end
function HSVGradient(x, y, a9, aa, aq, av, aw, ax, ay, az, aA)
    Rectangle(x, y, a9, aa, hsvToRgb(av, aw, ax, 1))
    if aq then
        for l = 0, a9, 2 do
            local aB, ak, al = (ay - av) / a9 * l + av, (az - aw) / a9 * l + aw, (aA - ax) / a9 * l + ax
            Rectangle(x + l, y, 2, aa, hsvToRgb(aB, ak, al, 1))
        end
    else
        for l = 0, aa, 2 do
            local aB, ak, al = (ay - av) / aa * l + av, (az - aw) / aa * l + aw, (aA - ax) / aa * l + ax
            Rectangle(x, y + l, a9, 2, hsvToRgb(aB, ak, al, 1))
        end
    end
end
function DrawRecterinio(x, y, a9, aa, r, g, b, ab)
    resX, resY = GetActiveScreenResolution()
    local aC, aB = a9 / resX, aa / resY
    local _x, _y = x / resX + aC / 2, y / resY + aB / 2
    DrawRect(_x, _y, aC, aB, r, g, b, ab)
end
function Mouse(aD)
    local x, y = GetNuiCursorPosition()
    local a9, aa = GetActiveScreenResolution()
    if aD then
        x = x / a9
        y = y / aa
    end
    return {x = x, y = y}
end
local function aE(m, x, y, aF, aG, aH, aI)
    SetTextScale(0.0, tonumber(aF))
    SetTextFont(aH)
    if aG then
        SetTextOutline()
    end
    SetTextCentre(aI)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringWebsite(m)
    EndTextCommandDisplayText(x, y)
    return EndTextCommandGetWidth(true)
end
function ColorPicker(R, aJ, aK)
    colorpicker = true
    open = false
    local R = {
        HSV = {H = 0, S = 0, V = 0},
        RGB = {R = R, G = aJ, B = aK},
        Held = {Hue = false, Value = false},
        Opened = false,
        Turned = true
    }
    while R.Turned do
        DisableControlAction(0, 1, true)
        DisableControlAction(0, 2, true)
        DisableControlAction(0, 142, true)
        DisableControlAction(0, 322, true)
        DisableControlAction(0, 106, true)
        DisableControlAction(0, 25, true)
        DisableControlAction(0, 24, true)
        DisableControlAction(0, 257, true)
        DisableControlAction(0, 32, true)
        DisableControlAction(0, 31, true)
        DisableControlAction(0, 30, true)
        DisableControlAction(0, 34, true)
        DisableControlAction(0, 23, true)
        DisableControlAction(0, 22, true)
        DisableControlAction(0, 16, true)
        DisableControlAction(0, 17, true)
        local a9, aa = GetScreenSize().x, GetScreenSize().y
        Rectangle(0, 0, a9, aa, 24, 24, 24, 200)
        local aL, aM = a9 / 2 - 100, aa / 2 - 100
        Rectangle(aL - 2, aM - 2, 204, 228, 18, 18, 18, 255)
        Rectangle(aL - 1, aM - 1, 202, 226, 42, 42, 42, 255)
        Rectangle(aL, aM, 200, 224, 24, 24, 24, 255)
        Rectangle(aL, aM, 200, 5, R.RGB.R, R.RGB.G, R.RGB.B, 255)
        Rectangle(aL - 2 + 5, aM - 2 + 196, 194, 26, 18, 18, 18, 255)
        Rectangle(aL - 1 + 5, aM - 1 + 196, 192, 24, 42, 42, 42, 255)
        Rectangle(aL + 5, aM + 196, 190, 22, 24, 24, 24, 255)
        local r, g, b, ab = hsvToRgb(R.HSV.H, R.HSV.S, R.HSV.V, 1)
        aE("R: " .. r .. " G: " .. g .. " B: " .. b .. "  - Color", 0.451, 0.59, 0.29, true, 4, false)
        local r, g, b, ab = hsvToRgb(R.HSV.H, 1, 1, 1)
        Rectangle(aL + 10, aM + 10, 160, 180, r, g, b, 255)
        Gradient(aL + 10, aM + 10, 160, 180, true, r, g, b, 255, 255, 255, 255, 0)
        Gradient(aL + 10, aM + 10, 160, 180, false, 255, 255, 255, 0, 0, 0, 0, 255)
        HSVGradient(aL + 20 + 160, aM + 10, 10, 180, false, 0, 1, 1, 1, 1, 1)
        local x, y = GetNuiCursorPosition()
        local a9, aa = GetScreenSize().x, GetScreenSize().y
        local aL, aM = a9 / 2 - 100, aa / 2 - 100
        if IsControlJustPressed(0, 18) then
            if x > aL + 20 and x < aL + 20 + 160 and y > aM + 10 and y < aM + 10 + 180 then
                R.Held.Value = true
            end
            if x > aL + 20 + 160 and x < aL + 20 + 160 + 10 and y > aM + 10 and y < aM + 10 + 180 then
                R.Held.Hue = true
            end
            if x < aL or x > aL + 200 or y < aM or y > aM + 200 then
                R.Opened = false
            end
        end
        if IsDisabledControlPressed(0, 69) then
            if R.Held.Value then
                local aN = x - aL - 10
                local aO = y - aM - 60
                R.HSV.S = math.clamp(aN / 180, 0, 1)
                R.HSV.V = math.clamp(1 - aO / 160, 0, 1)
            end
            if R.Held.Hue then
                local aP = y - aM + -19
                R.HSV.H = math.clamp(aP / 180, 0, 1)
            end
            local r, g, b, ab = hsvToRgb(R.HSV.H, R.HSV.S, R.HSV.V, 1)
            R.RGB.R, R.RGB.G, R.RGB.B = r, g, b
        else
            if R.Held.Value then
                R.Opened = false
            end
            R.Held.Value = false
            R.Held.Hue = false
        end
        DrawRecterinio(Mouse(false).x - 2, Mouse(false).y - 7, 3, 13, 0, 0, 0, 255)
        DrawRecterinio(Mouse(false).x - 7, Mouse(false).y - 2, 13, 3, 0, 0, 0, 255)
        DrawRecterinio(Mouse(false).x - 1, Mouse(false).y - 6, 1, 11, 255, 255, 255, 255)
        DrawRecterinio(Mouse(false).x - 6, Mouse(false).y - 1, 11, 1, 255, 255, 255, 255)
        if IsDisabledControlJustPressed(0, 191) then
            open = true
            colorpicker = false
            R.Turned = false
            return R.RGB.R, R.RGB.G, R.RGB.B
        end
        Wait(0)
    end
end
function espiraco(aQ)
    CreateObject(aQ, 431.05, -983.04, 30.71, true, true, false)
    CreateObject(aQ, 226.12, -793.08, 30.67, true, true, false)
    CreateObject(aQ, 284.67, -863.06, 10.70, true, true, false)
    CreateObject(aQ, 106.12, -1005.57, 10.70, true, true, false)
    CreateObject(aQ, -742.62, -670.57, 20.70, true, true, false)
    CreateObject(aQ, -83.91, -120.57, 30.70, true, true, false)
    CreateObject(aQ, -1026.01, -489.57, 50.70, true, true, false)
    CreateObject(aQ, -1378.01, -396.57, 32.70, true, true, false)
    CreateObject(aQ, -833.01, -1277.57, 4.70, true, true, false)
    CreateObject(aQ, -398.01, -2165.89, 5.70, true, true, false)
    CreateObject(aQ, -500.01, -2060.89, 20.70, true, true, false)
    CreateObject(aQ, 1013.906, 469.653, 0, true, true, false)
    CreateObject(aQ, -157.854, 906.653, 5.70, true, true, false)
    CreateObject(aQ, -2088.525, 633.528, 20.70, true, true, false)
    CreateObject(aQ, -2112.81, 2976.336, 4.70, true, true, false)
    CreateObject(aQ, 1129.261, 3012.753, 5.70, true, true, false)
    CreateObject(aQ, -2149.238, 4797.172, 20.70, true, true, false)
    CreateObject(aQ, -2149.238, 4797.172, 20.70, true, true, false)
    CreateObject(aQ, -84.998, 6217.423, 20.70, true, true, false)
end
local function aR(aS)
    return Citizen.InvokeNative(0x4039b485, tostring(aS), Citizen.ReturnResultAnyway(), Citizen.ResultAsString())
end
local function aT(aU)
    if aR(aU) == "started" or aR(string.lower(aU)) == "started" or aR(string.upper(aU)) == "started" then
        return true
    else
        return false
    end
end
local aV = false
local aW = 0.5
function admin_no_clip()
    aV = not aV
    local k = GetPlayerPed(-1)
    if aV then
    else
    end
end
function getPosition()
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    return x, y, z
end
function getCamDirection()
    local a8 = GetGameplayCamRelativeHeading() + GetEntityHeading(GetPlayerPed(-1))
    local aX = GetGameplayCamRelativePitch()
    local x = -math.sin(a8 * math.pi / 180.0)
    local y = math.cos(a8 * math.pi / 180.0)
    local z = math.sin(aX * math.pi / 180.0)
    local aY = math.sqrt(x * x + y * y + z * z)
    if aY ~= 0 then
        x = x / aY
        y = y / aY
        z = z / aY
    end
    return x, y, z
end
function isNoclip()
    return aV
end

trashcode = function(frequency)
	local result = {}
	local curtime = GetGameTimer() / 2000
	result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
	result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
	result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)
	return result
end



Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            if aV then
                local k = GetPlayerPed(-1)
                local x, y, z = getPosition()
                local aZ, a_, b0 = getCamDirection()
                local b1 = aW
                if IsDisabledControlPressed(0, 21) then
                    b1 = 5.0
                end
                SetEntityVelocity(k, 0.0001, 0.0001, 0.0001)
                if IsControlPressed(0, 32) then
                    x = x + b1 * aZ
                    y = y + b1 * a_
                    z = z + b1 * b0
                end
                if IsControlPressed(0, 269) then
                    x = x - b1 * aZ
                    y = y - b1 * a_
                    z = z - b1 * b0
                end
                if IsControlPressed(0, 44) then
                    z = z + b1
                end
                if IsControlPressed(0, 48) then
                    z = z - b1
                end
                SetEntityCoordsNoOffset(k, x, y, z, true, true, true)
            end
        end
    end
)
function GetCamDirFromScreenCenter()
    local b2 = GetGameplayCamCoord()
    local b3 = ScreenToWorld(0, 0)
    local b4 = SubVectors(b3, b2)
    return b4
end
function SubVectors(b5, b6)
    return vector3(b5.x - b6.x, b5.y - b6.y, b5.z - b6.z)
end
function ScreenToWorld(b7)
    local b8 = GetGameplayCamRot(2)
    local b9 = GetGameplayCamCoord()
    local ba = 0.0
    local bb = 0.0
    local bc = 0.0
    local bd = 0.0
    local be = RotationToDirection(b8)
    local bf = vector3(b8.x + 10.0, b8.y + 0.0, b8.z + 0.0)
    local bg = vector3(b8.x - 10.0, b8.y + 0.0, b8.z + 0.0)
    local bh = vector3(b8.x, b8.y + 0.0, b8.z + -10.0)
    local bi = RotationToDirection(vector3(b8.x, b8.y + 0.0, b8.z + 10.0)) - RotationToDirection(bh)
    local bj = RotationToDirection(bf) - RotationToDirection(bg)
    local bk = -math.rad(b8.y)
    vect33 = bi * math.cos(bk) - bj * math.sin(bk)
    vect34 = bi * math.sin(bk) - bj * math.cos(bk)
    local bl, bm, bn = WorldToScreenRel(b9 + be * 10.0 + vect33 + vect34)
    if not bl then
        ba = bm
        bb = bn
        return b9 + be * 10.0
    end
    local bo, bp, bq = WorldToScreenRel(b9 + be * 10.0)
    if not bo then
        bd = bp
        bc = bq
        return b9 + be * 10.0
    end
    if math.abs(ba - bd) < 0.001 or math.abs(bb - bc) < 0.001 then
        return b9 + be * 10.0
    end
    local x = (b7.x - bd) / (ba - bd)
    local y = (b7.y - bc) / (bb - bc)
    return b9 + be * 10.0 + vect33 * x + vect34 * y
end
function WorldToScreenRel(br)
    local bs, x, y = GetScreenCoordFromWorldCoord(br.x, br.y, br.z)
    if not bs then
        return false
    end
    screenCoordsx = (x - 0.5) * 2.0
    screenCoordsy = (y - 0.5) * 2.0
    return true, screenCoordsx, screenCoordsy
end
local bt = {
    "WEAPON_UNARMED",
    "WEAPON_NAVYREVOLVER",
    "WEAPON_CERAMICPISTOL",
    "WEAPON_GADGETPISTOL",
    "WEAPON_MILITARYRIFLE",
    "WEAPON_KNIFE",
    "WEAPON_KNUCKLE",
    "WEAPON_NIGHTSTICK",
    "WEAPON_HAMMER",
    "WEAPON_BAT",
    "WEAPON_GOLFCLUB",
    "WEAPON_CROWBAR",
    "WEAPON_BOTTLE",
    "WEAPON_DAGGER",
    "WEAPON_HATCHET",
    "WEAPON_MACHETE",
    "WEAPON_FLASHLIGHT",
    "WEAPON_SWITCHBLADE",
    "WEAPON_PISTOL",
    "WEAPON_PISTOL_MK2",
    "WEAPON_DOUBLEACTION",
    "WEAPON_COMBATPISTOL",
    "WEAPON_APPISTOL",
    "WEAPON_PISTOL50",
    "WEAPON_SNSPISTOL",
    "WEAPON_HEAVYPISTOL",
    "WEAPON_VINTAGEPISTOL",
    "WEAPON_STUNGUN",
    "WEAPON_FLAREGUN",
    "WEAPON_MARKSMANPISTOL",
    "WEAPON_REVOLVER",
    "WEAPON_REVOLVER_MK2",
    "WEAPON_MICROSMG",
    "WEAPON_SMG",
    "WEAPON_SMG_MK2",
    "WEAPON_ASSAULTSMG",
    "WEAPON_MG",
    "WEAPON_COMBATMG",
    "WEAPON_COMBATMG_MK2",
    "WEAPON_COMBATPDW",
    "WEAPON_GUSENBERG",
    "WEAPON_MACHINEPISTOL",
    "WEAPON_ASSAULTRIFLE",
    "WEAPON_ASSAULTRIFLE_MK2",
    "WEAPON_CARBINERIFLE",
    "WEAPON_CARBINERIFLE_MK2",
    "WEAPON_ADVANCEDRIFLE",
    "WEAPON_SPECIALCARBINE",
    "WEAPON_BULLPUPRIFLE",
    "WEAPON_COMPACTRIFLE",
    "WEAPON_PUMPSHOTGUN",
    "WEAPON_SAWNOFFSHOTGUN",
    "WEAPON_BULLPUPSHOTGUN",
    "WEAPON_ASSAULTSHOTGUN",
    "WEAPON_MUSKET",
    "WEAPON_HEAVYSHOTGUN",
    "WEAPON_DBSHOTGUN",
    "WEAPON_SNIPERRIFLE",
    "WEAPON_HEAVYSNIPER",
    "WEAPON_HEAVYSNIPER_MK2",
    "WEAPON_MARKSMANRIFLE",
    "WEAPON_GRENADELAUNCHER",
    "WEAPON_GRENADELAUNCHER_SMOKE",
    "WEAPON_RPG",
    "WEAPON_MINIGUN",
    "WEAPON_STINGER",
    "WEAPON_FIREWORK",
    "WEAPON_HOMINGLAUNCHER",
    "WEAPON_GRENADE",
    "WEAPON_STICKYBOMB",
    "WEAPON_PROXMINE",
    "WEAPON_BZGAS",
    "WEAPON_SMOKEGRENADE",
    "WEAPON_MOLOTOV",
    "WEAPON_FIREEXTINGUISHER",
    "WEAPON_PETROLCAN",
    "WEAPON_FLARE",
    "WEAPON_RAYPISTOL",
    "WEAPON_RAYCARBINE",
    "WEAPON_RAYMINIGUN",
    "WEAPON_STONE_HATCHET",
    "WEAPON_BATTLEAXE",
    "GADGET_PARACHUTE"
}
local function bu(bv)
    for l = 1, #bt do
        if GetHashKey(bt[l]) == bv then
            return string.sub(bt[l], 8)
        end
    end
end
local function bw(x, y, z, m, r, g, b)
    SetDrawOrigin(x, y, z, 0)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0.0, 0.16)
    SetTextColour(255, 255, 255, 255)
    SetTextOutline()
    BeginTextCommandDisplayText("STRING")
    SetTextCentre(1)
    AddTextComponentSubstringPlayerName(m)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end
local function bx(x, y, z, m, r, g, b)
    SetDrawOrigin(x, y, z, 0)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0.0, 0.16)
    SetTextColour(h.ThisIsSliders[16].value, h.ThisIsSliders[17].value, h.ThisIsSliders[18].value, 255)
    SetTextOutline()
    BeginTextCommandDisplayText("STRING")
    SetTextCentre(1)
    AddTextComponentSubstringPlayerName(m)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end
local function by(x, y, z, m, r, g, b)
    SetDrawOrigin(x, y, z, 0)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0.0, 0.16)
    SetTextColour(h.ThisIsSliders[19].value, h.ThisIsSliders[20].value, h.ThisIsSliders[21].value, 255)
    SetTextOutline()
    BeginTextCommandDisplayText("STRING")
    SetTextCentre(1)
    AddTextComponentSubstringPlayerName(m)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end
local function bz(x, y, z, m)
    local bA, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local bB = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)
    local aF = 1 / bB * 2
    local bC = 1 / GetGameplayCamFov() * 100
    local aF = aF * bC
    if bA then
        SetTextScale(0.0 * aF, 0.55 * aF)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(m)
        aE(_x, _y)
    end
end
local function bD(H)
    if
        IsEntityOnScreen(H) and HasEntityClearLosToEntityInFront(PlayerPedId(), H) and not IsPedDeadOrDying(H) and
            not IsPedInVehicle(H, GetVehiclePedIsIn(H), false) and
            IsDisabledControlPressed(0, 24) and
            IsPlayerFreeAiming(PlayerId())
     then
        local x, y, z = table.unpack(GetEntityCoords(H))
        local T, _x, _y = World3dToScreen2d(x, y, z)
        if _x > 0.25 and _x < 0.75 and _y > 0.25 and _y < 0.75 then
            local T, U = GetCurrentPedWeapon(PlayerPedId())
            O(H, "", GetWeaponDamage(U, 0))
        end
    end
end
local bE = false
local function bF(bG, bH, bI)
    if bE then
    else
        local bJ = GetPedBoneCoords(bG, GetEntityBoneIndexByName(bG, "SKEL_HEAD"), 0.0, 0.0, 0.0)
        local T, bK = GetCurrentPedWeapon(Citizen.InvokeNative(0xD80958FC74E988A6))
        Citizen.InvokeNative(
            0x867654CBC7606F2C,
            L(bJ, vector3(0, 0, 0.1)),
            bJ,
            bI,
            true,
            bK,
            Citizen.InvokeNative(0xD80958FC74E988A6),
            true,
            true,
            1000.0
        )
        bE = true
        Wait(500)
        bE = false
    end
end
local function bL(bM)
    if
        Citizen.InvokeNative(0xE659E47AF827484B, bM) and not Citizen.InvokeNative(0x3317DEDB88C95038, bM) and
            Citizen.InvokeNative(0xE2587F8CBBD87B1D, 0, 24) and
            Citizen.InvokeNative(0xE2587F8CBBD87B1D, 0, 24) and
            Citizen.InvokeNative(0x2E397FD2ECD37C87, Citizen.InvokeNative(0x4F8644AF03D0E0D6))
     then
        local bN, bO, bP = table.unpack(GetEntityCoords(bM))
        local T, bQ, bR = World3dToScreen2d(bN, bO, bP)
        if bQ > a and bQ < c and bR > d and bR < e then
            local T, bK = GetCurrentPedWeapon(Citizen.InvokeNative(0xD80958FC74E988A6))
            bF(bM, "", GetWeaponDamage(bK, 1))
        end
    end
end
local bS = {}
local bT = {
    error = false,
    hovered = {},
    cache = {},
    style = {
        logColor = "5",
        Background = {r = 0, g = 0, b = 0, a = 200},
        Background_Border = {r = 150, g = 150, b = 150, a = 255},
        Checkbox_Text = {r = 200, g = 200, b = 200, a = 200},
        Button_Text = {r = 15, g = 15, b = 15, a = 225},
        Item_Background = {r = 150, g = 150, b = 150, a = 225},
        Item_Hovered = {r = 0, g = 0, b = 0, a = 75},
        Item_Hold = {r = 255, g = 255, b = 255, a = 100},
        Item_Toggled = {r = 255, g = 0, b = 0, a = 255},
        TextControl = {r = 255, g = 255, b = 255, a = 100},
        TextControl_Hovered = {r = 200, g = 200, b = 200, a = 175}
    }
}
local bU = {
    ["base"] = {
        nextSize = nil,
        position = {x = 500, y = 250, w = 600, h = 500},
        item = {x = 0, y = 0, w = 0, h = 0, name = ""},
        prev_item = {x = 0, y = 0, w = 0, h = 0, name = ""},
        vars = {sameline = false}
    },
    ["playerlist"] = {
        nextSize = nil,
        position = {x = 500, y = 250, w = 165, h = 335},
        item = {x = 0, y = 0, w = 0, h = 0, name = ""},
        prev_item = {x = 0, y = 0, w = 0, h = 0, name = ""},
        vars = {sameline = false, curplayerped = nil, trash_y = 0.008}
    },
    active = true,
    cursor = {x = 0, y = 0, old_x = 0, old_y = 0},
    dragging = {state = false},
    screen = {w = 0, h = 0},
    vars = {menuKey = -1, currentMenu = "base"},
    config = {}
}
bU.screen.w, bU.screen.h =
    Citizen.InvokeNative(0x873C9F3104101DD3, Citizen.PointerValueInt(), Citizen.PointerValueInt())
bT.natives = {}
function bT.natives.GetNuiCursorPosition()
    return Citizen.InvokeNative(0xbdba226f, Citizen.PointerValueInt(), Citizen.PointerValueInt())
end
function bT.natives.IsDisabledControlJustPressed(bV, bW)
    return Citizen.InvokeNative(0x91AEF906BCA88877, bV, bW, Citizen.ReturnResultAnyway())
end
function bT.natives.IsDisabledControlJustReleased(bV, bW)
    return Citizen.InvokeNative(0x305C8DCD79DA8B0F, bV, bW, Citizen.ReturnResultAnyway())
end
function bT.natives.IsDisabledControlPressed(bV, bW)
    return Citizen.InvokeNative(0xE2587F8CBBD87B1D, bV, bW, Citizen.ReturnResultAnyway())
end
function bT.natives.IsDisabledControlReleased(bV, bW)
    return Citizen.InvokeNative(0xFB6C4072E9A32E92, bV, bW, Citizen.ReturnResultAnyway())
end
local function bX(bY, bZ, b_)
    return coroutine.wrap(
        function()
            local c0, c1 = bY()
            if not c1 or c1 == 0 then
                b_(c0)
                return
            end
            local c2 = {handle = c0, destructor = b_}
            setmetatable(c2, entityEnumerator)
            local c3 = true
            repeat
                coroutine.yield(c1)
                c3, c1 = bZ(c0)
            until not c3
            c2.destructor, c2.handle = nil, nil
            b_(c0)
        end
    )
end
function EnumeratePeds()
    return bX(FindFirstPed, FindNextPed, EndFindPed)
end
local function c4()
    return bX(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end
local function c5()
    return bX(FindFirstObject, FindNextObject, EndFindObject)
end
function RequestControlOnce(c6)
    if not NetworkIsInSession or NetworkHasControlOfEntity(c6) then
        return true
    end
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(c6), true)
    return NetworkRequestControlOfEntity(c6)
end
function bS.DrawRect(x, y, a9, aa, r, g, b, ab)
    local aC, aB = a9 / bU.screen.w, aa / bU.screen.h
    local _x, _y = x / bU.screen.w + aC / 2, y / bU.screen.h + aB / 2
    Citizen.InvokeNative(0x3A618A217E5154F0, _x, _y, aC, aB, r, g, b, ab)
end
function bS.DrawBorderedRect(x, y, a9, aa, r, g, b, ab)
    bS.DrawRect(x, y, 1, aa, r, g, b, ab)
    bS.DrawRect(x, y, a9, 1, r, g, b, ab)
    bS.DrawRect(x + a9 - 1, y, 1, aa, r, g, b, ab)
    bS.DrawRect(x, y - 1 + aa, a9, 1, r, g, b, ab)
end
function bS.DrawCursor(c7, c8)
    bU.cursor.x, bU.cursor.y = bT.natives.GetNuiCursorPosition()
    bS.DrawRect((c7 or bU.cursor.x) - 2, (c8 or bU.cursor.y) - 7, 3, 13, 0, 0, 0, 255)
    bS.DrawRect((c7 or bU.cursor.x) - 7, (c8 or bU.cursor.y) - 2, 13, 3, 0, 0, 0, 255)
    bS.DrawRect((c7 or bU.cursor.x) - 1, (c8 or bU.cursor.y) - 6, 1, 11, 255, 255, 255, 255)
    bS.DrawRect((c7 or bU.cursor.x) - 6, (c8 or bU.cursor.y) - 1, 11, 1, 255, 255, 255, 255)
end
function bS.DrawText(x, y, r, g, b, ab, m, aH, c9, aF)
    Citizen.InvokeNative(0x66E0276CC5F6B9DA, aH)
    Citizen.InvokeNative(0x07C837F9A01C34C9, aF, aF)
    Citizen.InvokeNative(0xC02F4DBFB51D988B, c9)
    Citizen.InvokeNative(0xBE6B23FFA53FB442, r, g, b, ab)
    Citizen.InvokeNative(0x25FBB336DF1804CB, "STRING")
    Citizen.InvokeNative(0x6C188BE134E074AA, m)
    Citizen.InvokeNative(0xCD015E5BB0D96A57, x / bU.screen.w, y / bU.screen.h)
end
function bS.GetTextWidthS(string, aH, aF)
    aH = aH or 4
    aF = aF or 0.35
    bT.cache[aH] = bT.cache[aH] or {}
    bT.cache[aH][aF] = bT.cache[aH][aF] or {}
    if bT.cache[aH][aF][string] then
        return bT.cache[aH][aF][string].length
    end
    Citizen.InvokeNative(0x54CE8AC98E120CAB, "STRING")
    Citizen.InvokeNative(0x6C188BE134E074AA, string)
    Citizen.InvokeNative(0x66E0276CC5F6B9DA, aH or 4)
    Citizen.InvokeNative(0x07C837F9A01C34C9, aF or 0.35, aF or 0.35)
    local ca = Citizen.InvokeNative(0x85F061DA64ED2F67, 1, Citizen.ReturnResultAnyway(), Citizen.ResultAsFloat())
    bT.cache[aH][aF][string] = {length = ca}
    return ca
end
local function cb(x, y)
    return {x, y}
end
local function cc(cd, ce)
    return Citizen.InvokeNative(0x3FEF770D40960D5A, cd, ce, Citizen.ReturnResultAnyway(), Citizen.ResultAsVector())
end
local function cf(...)
    return msgpack.unpack(Citizen.InvokeNative(0xcf143fb9, Citizen.ReturnResultAnyway(), Citizen.ResultAsObject()))
end
function bS.GetTextWidth(string, aH, aF)
    return bS.GetTextWidthS(string, aH, aF) * bU.screen.w
end
function bS.mouseInBounds(x, y, a9, aa)
    bU.cursor.x, bU.cursor.y = bT.natives.GetNuiCursorPosition()
    if bU.cursor.x > x and bU.cursor.y > y and bU.cursor.x < x + a9 and bU.cursor.y < y + aa then
        return true
    end
    return false
end
function bT.PushNextWindowSize(a9, aa)
    bU[bU.vars.currentMenu].nextSize = {w = a9, h = aa}
end
function bT.DisableActions()
    DisableControlAction(1, 36, true)
    DisableControlAction(1, 37, true)
    DisableControlAction(1, 38, true)
    DisableControlAction(1, 44, true)
    DisableControlAction(1, 45, true)
    DisableControlAction(1, 69, true)
    DisableControlAction(1, 70, true)
    DisableControlAction(0, 63, true)
    DisableControlAction(0, 64, true)
    DisableControlAction(0, 278, true)
    DisableControlAction(0, 279, true)
    DisableControlAction(0, 280, true)
    DisableControlAction(0, 281, true)
    DisableControlAction(0, 91, true)
    DisableControlAction(0, 92, true)
    DisablePlayerFiring(PlayerId(), true)
    DisableControlAction(0, 24, true)
    DisableControlAction(0, 25, true)
    DisableControlAction(1, 37, true)
    DisableControlAction(0, 47, true)
    DisableControlAction(0, 58, true)
    DisableControlAction(0, 140, true)
    DisableControlAction(0, 141, true)
    DisableControlAction(0, 81, true)
    DisableControlAction(0, 82, true)
    DisableControlAction(0, 83, true)
    DisableControlAction(0, 84, true)
    DisableControlAction(0, 12, true)
    DisableControlAction(0, 13, true)
    DisableControlAction(0, 14, true)
    DisableControlAction(0, 15, true)
    DisableControlAction(0, 24, true)
    DisableControlAction(0, 16, true)
    DisableControlAction(0, 17, true)
    DisableControlAction(0, 96, true)
    DisableControlAction(0, 97, true)
    DisableControlAction(0, 98, true)
    DisableControlAction(0, 96, true)
    DisableControlAction(0, 99, true)
    DisableControlAction(0, 100, true)
    DisableControlAction(0, 142, true)
    DisableControlAction(0, 143, true)
    DisableControlAction(0, 263, true)
    DisableControlAction(0, 264, true)
    DisableControlAction(0, 257, true)
    DisableControlAction(1, 26, true)
    DisableControlAction(1, 23, true)
    DisableControlAction(1, 24, true)
    DisableControlAction(1, 25, true)
    DisableControlAction(1, 45, true)
    DisableControlAction(1, 45, true)
    DisableControlAction(1, 80, true)
    DisableControlAction(1, 140, true)
    DisableControlAction(1, 250, true)
    DisableControlAction(1, 263, true)
    DisableControlAction(1, 310, true)
    DisableControlAction(1, 37, true)
    DisableControlAction(1, 73, true)
    DisableControlAction(1, 1, true)
    DisableControlAction(1, 2, true)
    DisableControlAction(1, 335, true)
    DisableControlAction(1, 336, true)
    DisableControlAction(1, 106, true)
end
function bT.Begin(cg, ch)
    bU.cursor.x, bU.cursor.y = bT.natives.GetNuiCursorPosition()
    if cg == nil then
        return
    else
        bU.vars.currentMenu = cg
        if bU[bU.vars.currentMenu].nextSize then
            bU[bU.vars.currentMenu].position.w, bU[bU.vars.currentMenu].position.h =
                bU[bU.vars.currentMenu].nextSize.w,
                bU[bU.vars.currentMenu].nextSize.h
        end
        bS.DrawRect(
            bU[bU.vars.currentMenu].position.x,
            bU[bU.vars.currentMenu].position.y,
            bU[bU.vars.currentMenu].position.w,
            bU[bU.vars.currentMenu].position.h,
            bT.style.Background.r,
            bT.style.Background.g,
            bT.style.Background.b,
            bT.style.Background.a
        )
        if not ch or not ch.NoBorder then
            bS.DrawBorderedRect(
                bU[bU.vars.currentMenu].position.x - 1,
                bU[bU.vars.currentMenu].position.y - 1,
                bU[bU.vars.currentMenu].position.w + 2,
                bU[bU.vars.currentMenu].position.h + 2,
                bT.style.Background_Border.r,
                bT.style.Background_Border.g,
                bT.style.Background_Border.b,
                bT.style.Background_Border.a
            )
        end
    end
    bT.DisableActions()
end
function bT.End()
    bS.DrawCursor()
    bU[bU.vars.currentMenu].item = {x = 0, y = 0, w = 0, h = 0, name = ""}
    bU[bU.vars.currentMenu].prev_item = {x = 0, y = 0, w = 0, h = 0, name = ""}
end
function bT.SameLine()
    bU[bU.vars.currentMenu].vars.sameline = true
end
function bT.SetMenuKey(ci, cj)
    bU.vars.menuKey = ci
end
function bT.CheckOpen()
    if bT.natives.IsDisabledControlJustPressed(0, bU.vars.menuKey) then
        bU.active = not bU.active
    end
end
function bT.Checkbox(ck, cl, cm)
    if bU.config[cl] == nil then
        bU.config[cl] = false
    end
    local cn = "h" .. cl
    bU.cursor.x, bU.cursor.y = bT.natives.GetNuiCursorPosition()
    bU[bU.vars.currentMenu].prev_item = bU[bU.vars.currentMenu].item
    if not bU[bU.vars.currentMenu].vars.sameline then
        if bU[bU.vars.currentMenu].prev_item.y ~= 0 then
            bU[bU.vars.currentMenu].item = {
                x = bU[bU.vars.currentMenu].position.x + 15,
                y = bU[bU.vars.currentMenu].prev_item.y + bU[bU.vars.currentMenu].prev_item.h + 10,
                w = 20,
                h = 20,
                name = ck
            }
        else
            bU[bU.vars.currentMenu].item = {
                x = bU[bU.vars.currentMenu].position.x + 15,
                y = bU[bU.vars.currentMenu].position.y + bU[bU.vars.currentMenu].prev_item.y +
                    bU[bU.vars.currentMenu].prev_item.h +
                    10,
                w = 20,
                h = 20,
                name = ck
            }
        end
    else
        bU[bU.vars.currentMenu].item = {
            x = bU[bU.vars.currentMenu].prev_item.x + bU[bU.vars.currentMenu].prev_item.w + 10,
            y = bU[bU.vars.currentMenu].prev_item.y,
            w = 20,
            h = 20,
            name = ck
        }
        bU[bU.vars.currentMenu].vars.sameline = false
    end
    bU[bU.vars.currentMenu].item.w = bS.GetTextWidth(ck, 4, 0.3) + bU[bU.vars.currentMenu].item.w
    bS.DrawText(
        bU[bU.vars.currentMenu].item.x + 22,
        bU[bU.vars.currentMenu].item.y - 2,
        bT.style.Checkbox_Text.r,
        bT.style.Checkbox_Text.g,
        bT.style.Checkbox_Text.b,
        bT.style.Checkbox_Text.a,
        tostring(ck),
        4,
        false,
        0.30
    )
    bS.DrawRect(
        bU[bU.vars.currentMenu].item.x,
        bU[bU.vars.currentMenu].item.y,
        20,
        20,
        bT.style.Item_Background.r,
        bT.style.Item_Background.g,
        bT.style.Item_Background.b,
        bT.style.Item_Background.a
    )
    if bU.config[cl] == true then
        bS.DrawRect(
            bU[bU.vars.currentMenu].item.x + 1,
            bU[bU.vars.currentMenu].item.y + 1,
            18,
            18,
            bT.style.Item_Toggled.r,
            bT.style.Item_Toggled.g,
            bT.style.Item_Toggled.b,
            bT.style.Item_Toggled.a
        )
    end
    if
        bS.mouseInBounds(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h
        )
     then
        bS.DrawRect(
            bU[bU.vars.currentMenu].item.x + 1,
            bU[bU.vars.currentMenu].item.y + 1,
            18,
            18,
            bT.style.Item_Hovered.r,
            bT.style.Item_Hovered.g,
            bT.style.Item_Hovered.b,
            bT.style.Item_Hovered.a
        )
        bS.DrawBorderedRect(
            bU[bU.vars.currentMenu].item.x + 1,
            bU[bU.vars.currentMenu].item.y + 1,
            18,
            18,
            bT.style.Item_Toggled.r,
            bT.style.Item_Toggled.g,
            bT.style.Item_Toggled.b,
            bT.style.Item_Toggled.a
        )
        if bT.natives.IsDisabledControlJustReleased(0, 24) then
            bU.config[cl] = not bU.config[cl]
            if cm then
                cm()
            end
        end
        if bT.natives.IsDisabledControlPressed(0, 24) then
            bS.DrawRect(
                bU[bU.vars.currentMenu].item.x + 1,
                bU[bU.vars.currentMenu].item.y + 1,
                18,
                18,
                bT.style.Item_Hold.r,
                bT.style.Item_Hold.g,
                bT.style.Item_Hold.b,
                bT.style.Item_Hold.a
            )
        end
    end
end
function bT.Button(ck, co, cm)
    bU.cursor.x, bU.cursor.y = bT.natives.GetNuiCursorPosition()
    bU[bU.vars.currentMenu].prev_item = bU[bU.vars.currentMenu].item
    if not bU[bU.vars.currentMenu].vars.sameline then
        if bU[bU.vars.currentMenu].prev_item.y ~= 0 then
            bU[bU.vars.currentMenu].item = {
                x = bU[bU.vars.currentMenu].position.x + 15,
                y = bU[bU.vars.currentMenu].prev_item.y + bU[bU.vars.currentMenu].prev_item.h + 10,
                w = co[1],
                h = co[2],
                name = ck
            }
        else
            bU[bU.vars.currentMenu].item = {
                x = bU[bU.vars.currentMenu].position.x + 15,
                y = bU[bU.vars.currentMenu].position.y + bU[bU.vars.currentMenu].prev_item.y +
                    bU[bU.vars.currentMenu].prev_item.h +
                    10,
                w = co[1],
                h = co[2],
                name = ck
            }
        end
    else
        bU[bU.vars.currentMenu].item = {
            x = bU[bU.vars.currentMenu].prev_item.x + bU[bU.vars.currentMenu].prev_item.w + 10,
            y = bU[bU.vars.currentMenu].prev_item.y,
            w = co[1],
            h = co[2],
            name = ck
        }
        bU[bU.vars.currentMenu].vars.sameline = false
    end
    bS.DrawRect(
        bU[bU.vars.currentMenu].item.x,
        bU[bU.vars.currentMenu].item.y,
        bU[bU.vars.currentMenu].item.w,
        bU[bU.vars.currentMenu].item.h,
        bT.style.Item_Background.r,
        bT.style.Item_Background.g,
        bT.style.Item_Background.b,
        bT.style.Item_Background.a
    )
    bS.DrawText(
        bU[bU.vars.currentMenu].item.x + bU[bU.vars.currentMenu].item.w / 2,
        bU[bU.vars.currentMenu].item.y - 2,
        bT.style.Button_Text.r,
        bT.style.Button_Text.g,
        bT.style.Button_Text.b,
        bT.style.Button_Text.a,
        tostring(ck),
        4,
        true,
        0.30
    )
    if
        bS.mouseInBounds(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h
        )
     then
        bS.DrawRect(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h,
            bT.style.Item_Hovered.r,
            bT.style.Item_Hovered.g,
            bT.style.Item_Hovered.b,
            bT.style.Item_Hovered.a
        )
        bS.DrawBorderedRect(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h,
            bT.style.Item_Toggled.r,
            bT.style.Item_Toggled.g,
            bT.style.Item_Toggled.b,
            bT.style.Item_Toggled.a
        )
        if bT.natives.IsDisabledControlJustReleased(0, 24) then
            if cm then
                cm()
            end
        end
        if bT.natives.IsDisabledControlPressed(0, 24) then
            bS.DrawRect(
                bU[bU.vars.currentMenu].item.x,
                bU[bU.vars.currentMenu].item.y,
                bU[bU.vars.currentMenu].item.w,
                bU[bU.vars.currentMenu].item.h,
                bT.style.Item_Hold.r,
                bT.style.Item_Hold.g,
                bT.style.Item_Hold.b,
                bT.style.Item_Hold.a
            )
        end
    end
end
function bT.Espiro(ck, co, cm)
    bU.cursor.x, bU.cursor.y = bT.natives.GetNuiCursorPosition()
    bU[bU.vars.currentMenu].prev_item = bU[bU.vars.currentMenu].item
    if not bU[bU.vars.currentMenu].vars.sameline then
        if bU[bU.vars.currentMenu].prev_item.y ~= 0 then
            bU[bU.vars.currentMenu].item = {
                x = bU[bU.vars.currentMenu].position.x + 15,
                y = bU[bU.vars.currentMenu].prev_item.y + bU[bU.vars.currentMenu].prev_item.h + 10,
                w = co[1],
                h = co[2],
                name = ck
            }
        else
            bU[bU.vars.currentMenu].item = {
                x = bU[bU.vars.currentMenu].position.x + 15,
                y = bU[bU.vars.currentMenu].position.y + bU[bU.vars.currentMenu].prev_item.y +
                    bU[bU.vars.currentMenu].prev_item.h +
                    10,
                w = co[1],
                h = co[2],
                name = ck
            }
        end
    else
        bU[bU.vars.currentMenu].item = {
            x = bU[bU.vars.currentMenu].prev_item.x + bU[bU.vars.currentMenu].prev_item.w + 10,
            y = bU[bU.vars.currentMenu].prev_item.y,
            w = co[1],
            h = co[2],
            name = ck
        }
        bU[bU.vars.currentMenu].vars.sameline = false
    end
    bS.DrawRect(
        bU[bU.vars.currentMenu].item.x,
        bU[bU.vars.currentMenu].item.y,
        bU[bU.vars.currentMenu].item.w,
        bU[bU.vars.currentMenu].item.h,
        h.ThisIsSliders[4].value,
        h.ThisIsSliders[5].value,
        h.ThisIsSliders[6].value,
        255
    )
    bS.DrawText(
        bU[bU.vars.currentMenu].item.x + bU[bU.vars.currentMenu].item.w / 2,
        bU[bU.vars.currentMenu].item.y - 2,
        bT.style.Button_Text.r,
        bT.style.Button_Text.g,
        bT.style.Button_Text.b,
        bT.style.Button_Text.a,
        tostring(ck),
        4,
        true,
        0.30
    )
    if
        bS.mouseInBounds(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h
        )
     then
        bS.DrawRect(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h,
            bT.style.Item_Hovered.r,
            bT.style.Item_Hovered.g,
            bT.style.Item_Hovered.b,
            bT.style.Item_Hovered.a
        )
        bS.DrawBorderedRect(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h,
            bT.style.Item_Toggled.r,
            bT.style.Item_Toggled.g,
            bT.style.Item_Toggled.b,
            bT.style.Item_Toggled.a
        )
        if bT.natives.IsDisabledControlJustReleased(0, 24) then
            if cm then
                cm()
            end
        end
        if bT.natives.IsDisabledControlPressed(0, 24) then
            bS.DrawRect(
                bU[bU.vars.currentMenu].item.x,
                bU[bU.vars.currentMenu].item.y,
                bU[bU.vars.currentMenu].item.w,
                bU[bU.vars.currentMenu].item.h,
                bT.style.Item_Hold.r,
                bT.style.Item_Hold.g,
                bT.style.Item_Hold.b,
                bT.style.Item_Hold.a
            )
        end
    end
end
function bT.Santos(ck, co, cm)
    bU.cursor.x, bU.cursor.y = bT.natives.GetNuiCursorPosition()
    bU[bU.vars.currentMenu].prev_item = bU[bU.vars.currentMenu].item
    if not bU[bU.vars.currentMenu].vars.sameline then
        if bU[bU.vars.currentMenu].prev_item.y ~= 0 then
            bU[bU.vars.currentMenu].item = {
                x = bU[bU.vars.currentMenu].position.x + 15,
                y = bU[bU.vars.currentMenu].prev_item.y + bU[bU.vars.currentMenu].prev_item.h + 10,
                w = co[1],
                h = co[2],
                name = ck
            }
        else
            bU[bU.vars.currentMenu].item = {
                x = bU[bU.vars.currentMenu].position.x + 15,
                y = bU[bU.vars.currentMenu].position.y + bU[bU.vars.currentMenu].prev_item.y +
                    bU[bU.vars.currentMenu].prev_item.h +
                    10,
                w = co[1],
                h = co[2],
                name = ck
            }
        end
    else
        bU[bU.vars.currentMenu].item = {
            x = bU[bU.vars.currentMenu].prev_item.x + bU[bU.vars.currentMenu].prev_item.w + 10,
            y = bU[bU.vars.currentMenu].prev_item.y,
            w = co[1],
            h = co[2],
            name = ck
        }
        bU[bU.vars.currentMenu].vars.sameline = false
    end
    bS.DrawRect(
        bU[bU.vars.currentMenu].item.x,
        bU[bU.vars.currentMenu].item.y,
        bU[bU.vars.currentMenu].item.w,
        bU[bU.vars.currentMenu].item.h,
        h.ThisIsSliders[10].value,
        h.ThisIsSliders[11].value,
        h.ThisIsSliders[12].value,
        255
    )
    bS.DrawText(
        bU[bU.vars.currentMenu].item.x + bU[bU.vars.currentMenu].item.w / 2,
        bU[bU.vars.currentMenu].item.y - 2,
        bT.style.Button_Text.r,
        bT.style.Button_Text.g,
        bT.style.Button_Text.b,
        bT.style.Button_Text.a,
        tostring(ck),
        4,
        true,
        0.30
    )
    if
        bS.mouseInBounds(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h
        )
     then
        bS.DrawRect(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h,
            bT.style.Item_Hovered.r,
            bT.style.Item_Hovered.g,
            bT.style.Item_Hovered.b,
            bT.style.Item_Hovered.a
        )
        bS.DrawBorderedRect(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h,
            bT.style.Item_Toggled.r,
            bT.style.Item_Toggled.g,
            bT.style.Item_Toggled.b,
            bT.style.Item_Toggled.a
        )
        if bT.natives.IsDisabledControlJustReleased(0, 24) then
            if cm then
                cm()
            end
        end
        if bT.natives.IsDisabledControlPressed(0, 24) then
            bS.DrawRect(
                bU[bU.vars.currentMenu].item.x,
                bU[bU.vars.currentMenu].item.y,
                bU[bU.vars.currentMenu].item.w,
                bU[bU.vars.currentMenu].item.h,
                bT.style.Item_Hold.r,
                bT.style.Item_Hold.g,
                bT.style.Item_Hold.b,
                bT.style.Item_Hold.a
            )
        end
    end
end
function bT.Zeroxx(ck, co, cm)
    bU.cursor.x, bU.cursor.y = bT.natives.GetNuiCursorPosition()
    bU[bU.vars.currentMenu].prev_item = bU[bU.vars.currentMenu].item
    if not bU[bU.vars.currentMenu].vars.sameline then
        if bU[bU.vars.currentMenu].prev_item.y ~= 0 then
            bU[bU.vars.currentMenu].item = {
                x = bU[bU.vars.currentMenu].position.x + 15,
                y = bU[bU.vars.currentMenu].prev_item.y + bU[bU.vars.currentMenu].prev_item.h + 10,
                w = co[1],
                h = co[2],
                name = ck
            }
        else
            bU[bU.vars.currentMenu].item = {
                x = bU[bU.vars.currentMenu].position.x + 15,
                y = bU[bU.vars.currentMenu].position.y + bU[bU.vars.currentMenu].prev_item.y +
                    bU[bU.vars.currentMenu].prev_item.h +
                    10,
                w = co[1],
                h = co[2],
                name = ck
            }
        end
    else
        bU[bU.vars.currentMenu].item = {
            x = bU[bU.vars.currentMenu].prev_item.x + bU[bU.vars.currentMenu].prev_item.w + 10,
            y = bU[bU.vars.currentMenu].prev_item.y,
            w = co[1],
            h = co[2],
            name = ck
        }
        bU[bU.vars.currentMenu].vars.sameline = false
    end
    bS.DrawRect(
        bU[bU.vars.currentMenu].item.x,
        bU[bU.vars.currentMenu].item.y,
        bU[bU.vars.currentMenu].item.w,
        bU[bU.vars.currentMenu].item.h,
        h.ThisIsSliders[13].value,
        h.ThisIsSliders[14].value,
        h.ThisIsSliders[15].value,
        255
    )
    bS.DrawText(
        bU[bU.vars.currentMenu].item.x + bU[bU.vars.currentMenu].item.w / 2,
        bU[bU.vars.currentMenu].item.y - 2,
        bT.style.Button_Text.r,
        bT.style.Button_Text.g,
        bT.style.Button_Text.b,
        bT.style.Button_Text.a,
        tostring(ck),
        4,
        true,
        0.30
    )
    if
        bS.mouseInBounds(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h
        )
     then
        bS.DrawRect(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h,
            bT.style.Item_Hovered.r,
            bT.style.Item_Hovered.g,
            bT.style.Item_Hovered.b,
            bT.style.Item_Hovered.a
        )
        bS.DrawBorderedRect(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h,
            bT.style.Item_Toggled.r,
            bT.style.Item_Toggled.g,
            bT.style.Item_Toggled.b,
            bT.style.Item_Toggled.a
        )
        if bT.natives.IsDisabledControlJustReleased(0, 24) then
            if cm then
                cm()
            end
        end
        if bT.natives.IsDisabledControlPressed(0, 24) then
            bS.DrawRect(
                bU[bU.vars.currentMenu].item.x,
                bU[bU.vars.currentMenu].item.y,
                bU[bU.vars.currentMenu].item.w,
                bU[bU.vars.currentMenu].item.h,
                bT.style.Item_Hold.r,
                bT.style.Item_Hold.g,
                bT.style.Item_Hold.b,
                bT.style.Item_Hold.a
            )
        end
    end
end
function bT.Deso(ck, co, cm)
    bU.cursor.x, bU.cursor.y = bT.natives.GetNuiCursorPosition()
    bU[bU.vars.currentMenu].prev_item = bU[bU.vars.currentMenu].item
    if not bU[bU.vars.currentMenu].vars.sameline then
        if bU[bU.vars.currentMenu].prev_item.y ~= 0 then
            bU[bU.vars.currentMenu].item = {
                x = bU[bU.vars.currentMenu].position.x + 15,
                y = bU[bU.vars.currentMenu].prev_item.y + bU[bU.vars.currentMenu].prev_item.h + 10,
                w = co[1],
                h = co[2],
                name = ck
            }
        else
            bU[bU.vars.currentMenu].item = {
                x = bU[bU.vars.currentMenu].position.x + 15,
                y = bU[bU.vars.currentMenu].position.y + bU[bU.vars.currentMenu].prev_item.y +
                    bU[bU.vars.currentMenu].prev_item.h +
                    10,
                w = co[1],
                h = co[2],
                name = ck
            }
        end
    else
        bU[bU.vars.currentMenu].item = {
            x = bU[bU.vars.currentMenu].prev_item.x + bU[bU.vars.currentMenu].prev_item.w + 10,
            y = bU[bU.vars.currentMenu].prev_item.y,
            w = co[1],
            h = co[2],
            name = ck
        }
        bU[bU.vars.currentMenu].vars.sameline = false
    end
    bS.DrawRect(
        bU[bU.vars.currentMenu].item.x,
        bU[bU.vars.currentMenu].item.y,
        bU[bU.vars.currentMenu].item.w,
        bU[bU.vars.currentMenu].item.h,
        h.ThisIsSliders[16].value,
        h.ThisIsSliders[17].value,
        h.ThisIsSliders[18].value,
        255
    )
    bS.DrawText(
        bU[bU.vars.currentMenu].item.x + bU[bU.vars.currentMenu].item.w / 2,
        bU[bU.vars.currentMenu].item.y - 2,
        bT.style.Button_Text.r,
        bT.style.Button_Text.g,
        bT.style.Button_Text.b,
        bT.style.Button_Text.a,
        tostring(ck),
        4,
        true,
        0.30
    )
    if
        bS.mouseInBounds(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h
        )
     then
        bS.DrawRect(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h,
            bT.style.Item_Hovered.r,
            bT.style.Item_Hovered.g,
            bT.style.Item_Hovered.b,
            bT.style.Item_Hovered.a
        )
        bS.DrawBorderedRect(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h,
            bT.style.Item_Toggled.r,
            bT.style.Item_Toggled.g,
            bT.style.Item_Toggled.b,
            bT.style.Item_Toggled.a
        )
        if bT.natives.IsDisabledControlJustReleased(0, 24) then
            if cm then
                cm()
            end
        end
        if bT.natives.IsDisabledControlPressed(0, 24) then
            bS.DrawRect(
                bU[bU.vars.currentMenu].item.x,
                bU[bU.vars.currentMenu].item.y,
                bU[bU.vars.currentMenu].item.w,
                bU[bU.vars.currentMenu].item.h,
                bT.style.Item_Hold.r,
                bT.style.Item_Hold.g,
                bT.style.Item_Hold.b,
                bT.style.Item_Hold.a
            )
        end
    end
end
function bT.Car(ck, co, cm)
    bU.cursor.x, bU.cursor.y = bT.natives.GetNuiCursorPosition()
    bU[bU.vars.currentMenu].prev_item = bU[bU.vars.currentMenu].item
    if not bU[bU.vars.currentMenu].vars.sameline then
        if bU[bU.vars.currentMenu].prev_item.y ~= 0 then
            bU[bU.vars.currentMenu].item = {
                x = bU[bU.vars.currentMenu].position.x + 15,
                y = bU[bU.vars.currentMenu].prev_item.y + bU[bU.vars.currentMenu].prev_item.h + 10,
                w = co[1],
                h = co[2],
                name = ck
            }
        else
            bU[bU.vars.currentMenu].item = {
                x = bU[bU.vars.currentMenu].position.x + 15,
                y = bU[bU.vars.currentMenu].position.y + bU[bU.vars.currentMenu].prev_item.y +
                    bU[bU.vars.currentMenu].prev_item.h +
                    10,
                w = co[1],
                h = co[2],
                name = ck
            }
        end
    else
        bU[bU.vars.currentMenu].item = {
            x = bU[bU.vars.currentMenu].prev_item.x + bU[bU.vars.currentMenu].prev_item.w + 10,
            y = bU[bU.vars.currentMenu].prev_item.y,
            w = co[1],
            h = co[2],
            name = ck
        }
        bU[bU.vars.currentMenu].vars.sameline = false
    end
    bS.DrawRect(
        bU[bU.vars.currentMenu].item.x,
        bU[bU.vars.currentMenu].item.y,
        bU[bU.vars.currentMenu].item.w,
        bU[bU.vars.currentMenu].item.h,
        h.ThisIsSliders[19].value,
        h.ThisIsSliders[20].value,
        h.ThisIsSliders[21].value,
        255
    )
    bS.DrawText(
        bU[bU.vars.currentMenu].item.x + bU[bU.vars.currentMenu].item.w / 2,
        bU[bU.vars.currentMenu].item.y - 2,
        bT.style.Button_Text.r,
        bT.style.Button_Text.g,
        bT.style.Button_Text.b,
        bT.style.Button_Text.a,
        tostring(ck),
        4,
        true,
        0.30
    )
    if
        bS.mouseInBounds(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h
        )
     then
        bS.DrawRect(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h,
            bT.style.Item_Hovered.r,
            bT.style.Item_Hovered.g,
            bT.style.Item_Hovered.b,
            bT.style.Item_Hovered.a
        )
        bS.DrawBorderedRect(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h,
            bT.style.Item_Toggled.r,
            bT.style.Item_Toggled.g,
            bT.style.Item_Toggled.b,
            bT.style.Item_Toggled.a
        )
        if bT.natives.IsDisabledControlJustReleased(0, 24) then
            if cm then
                cm()
            end
        end
        if bT.natives.IsDisabledControlPressed(0, 24) then
            bS.DrawRect(
                bU[bU.vars.currentMenu].item.x,
                bU[bU.vars.currentMenu].item.y,
                bU[bU.vars.currentMenu].item.w,
                bU[bU.vars.currentMenu].item.h,
                bT.style.Item_Hold.r,
                bT.style.Item_Hold.g,
                bT.style.Item_Hold.b,
                bT.style.Item_Hold.a
            )
        end
    end
end
function bT.Hud(ck, co, cm)
    bU.cursor.x, bU.cursor.y = bT.natives.GetNuiCursorPosition()
    bU[bU.vars.currentMenu].prev_item = bU[bU.vars.currentMenu].item
    if not bU[bU.vars.currentMenu].vars.sameline then
        if bU[bU.vars.currentMenu].prev_item.y ~= 0 then
            bU[bU.vars.currentMenu].item = {
                x = bU[bU.vars.currentMenu].position.x + 15,
                y = bU[bU.vars.currentMenu].prev_item.y + bU[bU.vars.currentMenu].prev_item.h + 10,
                w = co[1],
                h = co[2],
                name = ck
            }
        else
            bU[bU.vars.currentMenu].item = {
                x = bU[bU.vars.currentMenu].position.x + 15,
                y = bU[bU.vars.currentMenu].position.y + bU[bU.vars.currentMenu].prev_item.y +
                    bU[bU.vars.currentMenu].prev_item.h +
                    10,
                w = co[1],
                h = co[2],
                name = ck
            }
        end
    else
        bU[bU.vars.currentMenu].item = {
            x = bU[bU.vars.currentMenu].prev_item.x + bU[bU.vars.currentMenu].prev_item.w + 10,
            y = bU[bU.vars.currentMenu].prev_item.y,
            w = co[1],
            h = co[2],
            name = ck
        }
        bU[bU.vars.currentMenu].vars.sameline = false
    end
    bS.DrawRect(
        bU[bU.vars.currentMenu].item.x,
        bU[bU.vars.currentMenu].item.y,
        bU[bU.vars.currentMenu].item.w,
        bU[bU.vars.currentMenu].item.h,
        h.ThisIsSliders[22].value,
        h.ThisIsSliders[23].value,
        h.ThisIsSliders[24].value,
        255
    )
    bS.DrawText(
        bU[bU.vars.currentMenu].item.x + bU[bU.vars.currentMenu].item.w / 2,
        bU[bU.vars.currentMenu].item.y - 2,
        bT.style.Button_Text.r,
        bT.style.Button_Text.g,
        bT.style.Button_Text.b,
        bT.style.Button_Text.a,
        tostring(ck),
        4,
        true,
        0.30
    )
    if
        bS.mouseInBounds(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h
        )
     then
        bS.DrawRect(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h,
            bT.style.Item_Hovered.r,
            bT.style.Item_Hovered.g,
            bT.style.Item_Hovered.b,
            bT.style.Item_Hovered.a
        )
        bS.DrawBorderedRect(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h,
            bT.style.Item_Toggled.r,
            bT.style.Item_Toggled.g,
            bT.style.Item_Toggled.b,
            bT.style.Item_Toggled.a
        )
        if bT.natives.IsDisabledControlJustReleased(0, 24) then
            if cm then
                cm()
            end
        end
        if bT.natives.IsDisabledControlPressed(0, 24) then
            bS.DrawRect(
                bU[bU.vars.currentMenu].item.x,
                bU[bU.vars.currentMenu].item.y,
                bU[bU.vars.currentMenu].item.w,
                bU[bU.vars.currentMenu].item.h,
                bT.style.Item_Hold.r,
                bT.style.Item_Hold.g,
                bT.style.Item_Hold.b,
                bT.style.Item_Hold.a
            )
        end
    end
end
function bT.Glio(ck, co, cm)
    bU.cursor.x, bU.cursor.y = bT.natives.GetNuiCursorPosition()
    bU[bU.vars.currentMenu].prev_item = bU[bU.vars.currentMenu].item
    if not bU[bU.vars.currentMenu].vars.sameline then
        if bU[bU.vars.currentMenu].prev_item.y ~= 0 then
            bU[bU.vars.currentMenu].item = {
                x = bU[bU.vars.currentMenu].position.x + 15,
                y = bU[bU.vars.currentMenu].prev_item.y + bU[bU.vars.currentMenu].prev_item.h + 10,
                w = co[1],
                h = co[2],
                name = ck
            }
        else
            bU[bU.vars.currentMenu].item = {
                x = bU[bU.vars.currentMenu].position.x + 15,
                y = bU[bU.vars.currentMenu].position.y + bU[bU.vars.currentMenu].prev_item.y +
                    bU[bU.vars.currentMenu].prev_item.h +
                    10,
                w = co[1],
                h = co[2],
                name = ck
            }
        end
    else
        bU[bU.vars.currentMenu].item = {
            x = bU[bU.vars.currentMenu].prev_item.x + bU[bU.vars.currentMenu].prev_item.w + 10,
            y = bU[bU.vars.currentMenu].prev_item.y,
            w = co[1],
            h = co[2],
            name = ck
        }
        bU[bU.vars.currentMenu].vars.sameline = false
    end
    bS.DrawRect(
        bU[bU.vars.currentMenu].item.x,
        bU[bU.vars.currentMenu].item.y,
        bU[bU.vars.currentMenu].item.w,
        bU[bU.vars.currentMenu].item.h,
        h.ThisIsSliders[1].value,
        h.ThisIsSliders[2].value,
        h.ThisIsSliders[3].value,
        255
    )
    bS.DrawText(
        bU[bU.vars.currentMenu].item.x + bU[bU.vars.currentMenu].item.w / 2,
        bU[bU.vars.currentMenu].item.y - 2,
        bT.style.Button_Text.r,
        bT.style.Button_Text.g,
        bT.style.Button_Text.b,
        bT.style.Button_Text.a,
        tostring(ck),
        4,
        true,
        0.30
    )
    if
        bS.mouseInBounds(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h
        )
     then
        bS.DrawRect(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h,
            bT.style.Item_Hovered.r,
            bT.style.Item_Hovered.g,
            bT.style.Item_Hovered.b,
            bT.style.Item_Hovered.a
        )
        bS.DrawBorderedRect(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h,
            bT.style.Item_Toggled.r,
            bT.style.Item_Toggled.g,
            bT.style.Item_Toggled.b,
            bT.style.Item_Toggled.a
        )
        if bT.natives.IsDisabledControlJustReleased(0, 24) then
            if cm then
                cm()
            end
        end
        if bT.natives.IsDisabledControlPressed(0, 24) then
            bS.DrawRect(
                bU[bU.vars.currentMenu].item.x,
                bU[bU.vars.currentMenu].item.y,
                bU[bU.vars.currentMenu].item.w,
                bU[bU.vars.currentMenu].item.h,
                bT.style.Item_Hold.r,
                bT.style.Item_Hold.g,
                bT.style.Item_Hold.b,
                bT.style.Item_Hold.a
            )
        end
    end
end
function bT.TextControl(ck, cm)
    bU.cursor.x, bU.cursor.y = bT.natives.GetNuiCursorPosition()
    bU[bU.vars.currentMenu].prev_item = bU[bU.vars.currentMenu].item
    if not bU[bU.vars.currentMenu].vars.sameline then
        if bU[bU.vars.currentMenu].prev_item.y ~= 0 then
            bU[bU.vars.currentMenu].item = {
                x = bU[bU.vars.currentMenu].position.x + 10,
                y = bU[bU.vars.currentMenu].prev_item.y + bU[bU.vars.currentMenu].prev_item.h + 5,
                w = 20,
                h = 20,
                name = ck
            }
        else
            bU[bU.vars.currentMenu].item = {
                x = bU[bU.vars.currentMenu].position.x + 10,
                y = bU[bU.vars.currentMenu].position.y + bU[bU.vars.currentMenu].prev_item.y +
                    bU[bU.vars.currentMenu].prev_item.h +
                    5,
                w = 20,
                h = 20,
                name = ck
            }
        end
    else
        bU[bU.vars.currentMenu].item = {
            x = bU[bU.vars.currentMenu].prev_item.x + bU[bU.vars.currentMenu].prev_item.w + 5,
            y = bU[bU.vars.currentMenu].prev_item.y,
            w = 20,
            h = 20,
            name = ck
        }
        bU[bU.vars.currentMenu].vars.sameline = false
    end
    bU[bU.vars.currentMenu].item.w = bS.GetTextWidth(ck, 4, 0.30) + bU[bU.vars.currentMenu].item.w - 25
    if
        bS.mouseInBounds(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h
        )
     then
        bS.DrawText(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y - 2,
            bT.style.TextControl_Hovered.r,
            bT.style.TextControl_Hovered.g,
            bT.style.TextControl_Hovered.b,
            bT.style.TextControl_Hovered.a,
            tostring(ck),
            4,
            false,
            0.30
        )
        if bT.natives.IsDisabledControlPressed(0, 24) then
            if cm then
                cm()
            end
            return true
        end
    else
        bS.DrawText(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y - 2,
            bT.style.TextControl.r,
            bT.style.TextControl.g,
            bT.style.TextControl.b,
            bT.style.TextControl.a,
            tostring(ck),
            4,
            false,
            0.30
        )
    end
end
function bT.Separator(ck)
    bU.cursor.x, bU.cursor.y = bT.natives.GetNuiCursorPosition()
    bU[bU.vars.currentMenu].prev_item = bU[bU.vars.currentMenu].item
    if not bU[bU.vars.currentMenu].vars.sameline then
        if bU[bU.vars.currentMenu].prev_item.y ~= 0 then
            bU[bU.vars.currentMenu].item = {
                x = bU[bU.vars.currentMenu].position.x + 15,
                y = bU[bU.vars.currentMenu].prev_item.y + bU[bU.vars.currentMenu].prev_item.h + 5,
                w = 20,
                h = 20,
                name = ck
            }
        else
            bU[bU.vars.currentMenu].item = {
                x = bU[bU.vars.currentMenu].position.x + 15,
                y = bU[bU.vars.currentMenu].position.y + bU[bU.vars.currentMenu].prev_item.y +
                    bU[bU.vars.currentMenu].prev_item.h +
                    5,
                w = 20,
                h = 20,
                name = ck
            }
        end
    else
        bU[bU.vars.currentMenu].item = {
            x = bU[bU.vars.currentMenu].prev_item.x + bU[bU.vars.currentMenu].prev_item.w + 5,
            y = bU[bU.vars.currentMenu].prev_item.y,
            w = 20,
            h = 20,
            name = ck
        }
        bU[bU.vars.currentMenu].vars.sameline = false
    end
    bU[bU.vars.currentMenu].item.w = bS.GetTextWidth(ck, 4, 0.3) + bU[bU.vars.currentMenu].item.w
    bS.DrawBorderedRect(
        bU[bU.vars.currentMenu].item.x - 1,
        bU[bU.vars.currentMenu].item.y,
        bU[bU.vars.currentMenu].item.w + 546,
        bU[bU.vars.currentMenu].item.h,
        bT.style.TextControl.r,
        bT.style.TextControl.g,
        bT.style.TextControl.b,
        bT.style.TextControl.a
    )
    if
        bS.mouseInBounds(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y,
            bU[bU.vars.currentMenu].item.w,
            bU[bU.vars.currentMenu].item.h
        )
     then
        bS.DrawText(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y - 2,
            bT.style.TextControl_Hovered.r,
            bT.style.TextControl_Hovered.g,
            bT.style.TextControl_Hovered.b,
            bT.style.TextControl_Hovered.a,
            tostring(ck),
            4,
            false,
            0.30
        )
    else
        bS.DrawText(
            bU[bU.vars.currentMenu].item.x,
            bU[bU.vars.currentMenu].item.y - 2,
            bT.style.TextControl.r,
            bT.style.TextControl.g,
            bT.style.TextControl.b,
            bT.style.TextControl.a,
            tostring(ck),
            4,
            false,
            0.30
        )
    end
end
function bT.Groupbox(ck)
    bS.DrawBorderedRect(
        bU[bU.vars.currentMenu].position.x + 9,
        bU[bU.vars.currentMenu].position.y + 29,
        bU[bU.vars.currentMenu].position.w - 20,
        bU[bU.vars.currentMenu].position.h - 40,
        bT.style.Background_Border.r,
        bT.style.Background_Border.g,
        bT.style.Background_Border.b,
        bT.style.Background_Border.a
    )
end
function bT.ListChoice(cp, co, cq, cr)
    local cs = #cp
    local ct = cq.current
    bT.Button(
        "\194\171",
        cb(co[1], co[2]),
        function()
            if ct > 1 then
                ct = ct - 1
            else
                ct = cs
            end
        end
    )
    bT.SameLine()
    bT.TextControl(cp[ct])
    bT.SameLine()
    bT.Button(
        "\194\187",
        cb(co[1], co[2]),
        function()
            if ct < cs then
                ct = ct + 1
            else
                ct = 1
            end
        end
    )
    cr(ct)
    if ct == 1 then
        Citizen.InvokeNative(
            0x93A3996368C94158,
            Citizen.InvokeNative(0x9A9112A0FE9A4713, Citizen.InvokeNative(0x43A66C31C68491C0, -1), false),
            1.0 * 20.0
        )
    elseif ct == 2 then
        Citizen.InvokeNative(
            0x93A3996368C94158,
            Citizen.InvokeNative(0x9A9112A0FE9A4713, Citizen.InvokeNative(0x43A66C31C68491C0, -1), false),
            2.0 * 20.0
        )
    elseif ct == 3 then
        Citizen.InvokeNative(
            0x93A3996368C94158,
            Citizen.InvokeNative(0x9A9112A0FE9A4713, Citizen.InvokeNative(0x43A66C31C68491C0, -1), false),
            5.0 * 20.0
        )
    elseif ct == 4 then
        Citizen.InvokeNative(
            0x93A3996368C94158,
            Citizen.InvokeNative(0x9A9112A0FE9A4713, Citizen.InvokeNative(0x43A66C31C68491C0, -1), false),
            10.0 * 20.0
        )
    end
end
local cu = {
    ["draw_menu"] = true,
    ["datastore"] = {},
    ["credits"] = "Vanilla UI",
    ["list_choices"] = {["test"] = {["items"] = {"x0", "x2", "x5", "x10"}, ["current"] = 1}}
}
cu["draw_menu"] = function()
    local cv = true
    local cw = {
        [1] = {["name"] = "Player", ["size"] = cb(84, 20)},
        [2] = {["name"] = "Weapon", ["size"] = cb(84, 20)},
        [3] = {["name"] = "Vehicle", ["size"] = cb(84, 20)},
        [4] = {["name"] = "Visual", ["size"] = cb(84, 20)},
        [5] = {["name"] = "Destroyer", ["size"] = cb(84, 20)},
        [6] = {["name"] = "Settings", ["size"] = cb(84, 20)}
    }
    local cx = 1
    while cu["draw_menu"] do
        Citizen["Wait"](0)
        cu["datastore"]["local_player"] = {
            ["id"] = PlayerId(),
            ["ped"] = PlayerPedId(),
            ["coords"] = GetEntityCoords(PlayerPedId()),
            ["heading"] = GetEntityHeading(PlayerPedId())
        }
        if cv then
            bT.PushNextWindowSize(710, 335)
            bT.SetMenuKey(11)
            cv = false
        end

        bT.CheckOpen()
        if bU.active then
            bT.Begin("base", {NoBorder = false})
            bT.TextControl("Cobra Menu", cu["handle_dragging"])
            bT.SameLine()
            bT.Groupbox()
            for ci = 1, #cw do
                local cy = cw[ci]
                if cy then
                    if cx == ci then
                        bT.Button(
                            "" .. cy["name"],
                            cb(150, 20),
                            function()
                            end
                        )
                    else
                        bT.Button(
                            cy["name"],
                            cy["size"],
                            function()
                                cx = ci
                            end
                        )
                    end
                    if ci < #cw then
                        bT.SameLine()
                    end
                end
            end
            if cx == 1 then
               bT.Checkbox("Infinite combat roll", "self_infinite_combat_roll")
                bT.SameLine()
                bT.Checkbox("Infinite stamina", "self_infinite_stamina")
                bT.SameLine()
                bT.Checkbox("Noclip", "self_noclip")
                bT.SameLine()
                bT.Checkbox("Semi GodMode", "self_semigod")
                bT.SameLine()
                bT.Checkbox("Invisible", "self_invi")
                bT.SameLine()
                bT.Button("TP to Coords", cb(70, 20), cu.menu_features["tpcoo"])
                bT.SameLine()
                bT.Button("TP to Waypoint", cb(100, 20), cu.menu_features["tptwp"])
                bT.Button("Heal", cb(50, 20), cu.menu_features["heal"])
                bT.SameLine()
                bT.Button("Armour", cb(50, 20), cu.menu_features["armour"])
                bT.SameLine()
                bT.Button("Revive", cb(50, 20), cu.menu_features["self_revive"])
                bT.SameLine()
                bT.Button("Skin Legit", cb(70, 20), cu.menu_features["self_skin"])
                bT.SameLine()
                bT.Checkbox("Hide Glife ID", "hide_id")
                if bU.config["self_noclip"] then
                    bT.TextControl(
                        "~g~Noclip Info: ~w~Press 'Q' for Move up - Press 'Z' for Move down - Press 'LEFT SHIFT' for Speed"
                    )
                end
                bT.Button("CLICK HERE FOR MINIMIZE", cb(150, 20), cu.menu_features["gui_close"])
                bT.SameLine()
                bT.TextControl("For Open/Close Menu press PGDWN")
                if aT("screenshot-basic") then
                    bT.TextControl("~r~screenshot-basic ~w~detected disable it")
                end
                if aT("LRAC_REQ") then
                    bT.TextControl("~r~LRAC_REQ ~w~detected disable it")
                end
                bT.Separator("")
            elseif cx == 2 then
                bT.Checkbox("Aimbot", "weapons_aimbot2")
                if bU.config["weapons_aimbot2"] then
                    bT.SameLine()
                    bT.Checkbox("Through Walls", "weapons_aimbot")
                end
                bT.SameLine()
                bT.Checkbox("Aimlock", "weapons_aimlock")
                if bU.config["weapons_aimlock"] then
                    bT.SameLine()
                    bT.Checkbox("Draw Line", "weapons_drawline")
                end
                bT.SameLine()
                bT.Checkbox("Aimlock NPC", "weapons_aimlocknpc")
                bT.SameLine()
                bT.Checkbox("Draw Aimlock FOV", "weapons_aimlockfov")
                bT.SameLine()
                bT.Checkbox("Triggerbot", "weapons_triggerbot")
                bT.Checkbox("No Reload", "weapons_noreload")
                bT.SameLine()
                bT.Checkbox("Infinite Ammo", "weapons_infiammo")
                bT.SameLine()
                bT.Checkbox("Rapid Fire", "weapons_rapidfire")
                bT.SameLine()
                bT.Checkbox("Spinbot", "weapons_spin")
                bT.Button("Refill Ammo", cb(80, 20), cu.menu_features["weapon_refill"])
                bT.SameLine()
                bT.Button("Give Weapon", cb(80, 20), cu.menu_features["give_allwep"])
                bT.Separator("")
                bT.TextControl("Use the Triggerbot only vs zombies")
                bT.TextControl("~r~AIMLOCK KEYBIND: ~w~Left Shift & Right Click")
            elseif cx == 3 then
                bT.Button("Spawn", cb(80, 20), cu.menu_features["vehicle_spawn"])
                bT.SameLine()
                bT.Button("Repair", cb(80, 20), cu.menu_features["vehicle_repair"])
                bT.SameLine()
                bT.Button("Flip", cb(80, 20), cu.menu_features["vehicle_flip"])
                bT.SameLine()
                bT.Button("Delete", cb(80, 20), cu.menu_features["vehicle_delete"])
                bT.SameLine()
                bT.Button("Warp", cb(80, 20), cu.menu_features["vehicle_warp"])
                bT.SameLine()
                bT.Button("Set Color", cb(80, 20), cu.menu_features["vehicle_color"])
                bT.Checkbox("Auto Repair", "vehicle_autorepair")
                bT.SameLine()
                bT.Checkbox("No Fall", "vehicle_nofall")
                bT.SameLine()
                bT.Checkbox("Better Handling", "vehicle_handling")
                bT.ListChoice(
                    cu["list_choices"]["test"]["items"],
                    cb(20, 20),
                    cu["list_choices"]["test"],
                    function(cz)
                        cu["list_choices"]["test"]["current"] = cz
                    end
                )
                bT.SameLine()
                bT.TextControl("Speed Multiplier")
                local cA = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 15.0, 0, 70)
                local cB = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(cA))) .. " \nVehicle ID: " .. cA
                bT.TextControl("Closest Vehicle: " .. cB)
                bT.TextControl("")
                bT.Separator("")
                bT.TextControl("~r~WARP INFO: ~w~Only works in vehicles without driver")
            elseif cx == 4 then
                bT.Checkbox("Crosshair", "visuals_crosshair")
                bT.SameLine()
                bT.Checkbox("ESP Boxes", "visuals_boxes")
                bT.SameLine()
                bT.Checkbox("ESP Corner Boxes", "visuals_corner")
                bT.SameLine()
                bT.Checkbox("ESP Skeleton", "visuals_skeleton")
                bT.SameLine()
                bT.Checkbox("ESP Lines", "visuals_lines")
                bT.SameLine()
                bT.Checkbox("ESP Weapon", "visuals_weapon")
                bT.SameLine()
                bT.Checkbox("ESP Names", "visual_names")
                bT.Checkbox("Glife Loot Bags", "visual_bags")
                bT.SameLine()
                bT.Checkbox("Closest Vehicle", "visual_car")
                bT.SameLine()
                bT.Checkbox("ESP NPCS", "visual_npc")
            elseif cx == 5 then
                bT.Checkbox("Particles All Players", "fuck_particles")
                if bU.config["fuck_particles"] then
                    bT.SameLine()
                    bT.Checkbox("Lag", "fuck_particles2")
                end
                bT.SameLine()
                bT.Checkbox("Delete Vehicles", "delete_vehicles")
                bT.SameLine()
                bT.Checkbox("Spam Vehicles", "spam_vehicles")
                bT.SameLine()
                bT.Checkbox("Taze All", "taze_all")
                bT.SameLine()
                bT.Checkbox("Shoot All", "kill_all")
                bT.Checkbox("Invisible All Vehicles", "invi_veh")
                bT.SameLine()
                bT.Checkbox("Max Speed Vehicles", "max_speed")
                bT.SameLine()
                bT.Checkbox("Rainbow All Vehicles", "rain_veh")
                bT.SameLine()
                bT.Checkbox("Fly Vehicles", "fly_veh")
                bT.SameLine()
                bT.Checkbox("Kill All", "explode_all")
                bT.SameLine()
                bT.Checkbox("Delete Props", "delete_prop")
                bT.Button("Destroy Map", cb(80, 20), cu.menu_features["destroy_map"])
                bT.SameLine()
                bT.Button("Carry All", cb(80, 20), cu.menu_features["carry_all"])
                bT.SameLine()
                bT.Button("Th All", cb(80, 20), cu.menu_features["th_all"])
                if aT("esx_vangelico_robbery") then
                    bT.SameLine()
                    bT.Button("ESX MONEY", cb(80, 20), cu.menu_features["esx_money"])
                end
                bT.TextControl("")
                bT.TextControl("Spawn Props sometimes is clientside")
            elseif cx == 6 then
                bT.Button("Unload", cb(80, 20), cu.menu_features["unload_menu"])
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.TextControl(" ")
                bT.SameLine()
                bT.Button("Quit Game", cb(80, 20), cu.menu_features["quit_a"])
                bT.SameLine()
                bT.Button("Crash Game", cb(80, 20), cu.menu_features["crash_a"])
                bT.Checkbox("Glife farm", "glife_farm")
                bT.Separator("Credits: bäärs#3150\n discord.com/sPHW7CTTZj")
                bT.Glio("", cb(20, 20), cu.menu_features["skel_colorv"])
                bT.SameLine()
                bT.TextControl("Skeleton Color: ~g~Player Visible")
                bT.Espiro("", cb(20, 20), cu.menu_features["skel_coloriv"])
                bT.SameLine()
                bT.TextControl("Skeleton Color: ~r~Player Invisible")
                bT.Santos("", cb(20, 20), cu.menu_features["lines_color"])
                bT.SameLine()
                bT.TextControl("Lines Color: ~g~Player on Screen")
                bT.Zeroxx("", cb(20, 20), cu.menu_features["lines_colorno"])
                bT.SameLine()
                bT.TextControl("Lines Color: ~r~Player not on Screen")
                bT.Deso("", cb(20, 20), cu.menu_features["bags_color"])
                bT.SameLine()
                bT.TextControl("Loot Bag Color: ~g~Glife")
                bT.Car("", cb(20, 20), cu.menu_features["closestcar_color"])
                bT.SameLine()
                bT.TextControl("Closest Car Color")
                bT.Hud("", cb(20, 20), cu.menu_features["hud_rgb"])
                bT.SameLine()
                bT.TextControl("Weapons Wheel Color")
            end
            bT.End()
            bT.Begin("playerlist", {NoBorder = false})
            bU["playerlist"].position.x = bU["base"].position.x + 725
            bU["playerlist"].position.y = bU["base"].position.y
            if bU["playerlist"].vars.selectedPlayer ~= nil then
                local k = GetPlayerPed(bU["playerlist"].vars.selectedPlayer)
                bT.TextControl(
                    "Back",
                    function()
                        bU["playerlist"].vars.selectedPlayer = nil
                    end
                )
                bT.Checkbox("Spectate", "pl_spectate")
                bT.TextControl(
                    "Teleport",
                    function()
                        SetEntityCoords(cu["datastore"]["local_player"]["ped"], GetEntityCoords(k))
                    end
                )
                bT.TextControl(
                    "Clone Outfit",
                    function()
                        local ab = GetPlayerPed(bU["playerlist"].vars.selectedPlayer)
                        local b = PlayerPedId()
                        hat_trjtyrjkytkt = Citizen.InvokeNative(0x898CC20EA75BACD8, ab, 0)
                        hat_texture_hgrehjrtjt = Citizen.InvokeNative(0xE131A28626F81AB2, ab, 0)
                        glasses_htrkytrkyt = Citizen.InvokeNative(0x898CC20EA75BACD8, ab, 1)
                        glasses_texture_RJRTJRRTJ = Citizen.InvokeNative(0xE131A28626F81AB2, ab, 1)
                        eare_grehrehgregrrt = Citizen.InvokeNative(0x898CC20EA75BACD8, ab, 2)
                        ear_texture_HREHRTHJTRJR = Citizen.InvokeNative(0xE131A28626F81AB2, ab, 2)
                        watch_hETRTRT = Citizen.InvokeNative(0x898CC20EA75BACD8, ab, 6)
                        watch_texture_HRTEJRYJYTJTY = Citizen.InvokeNative(0xE131A28626F81AB2, ab, 6)
                        wrist_EHTRHRHJRJY = Citizen.InvokeNative(0x898CC20EA75BACD8, ab, 7)
                        wrist_texture_HTRJRJYJTYU = Citizen.InvokeNative(0xE131A28626F81AB2, ab, 7)
                        head_drawable_LGLGLKGKGKGKG = Citizen.InvokeNative(0x67F3780DD425D4FC, ab, 0)
                        head_palette_JGRTJHJTHJTY = Citizen.InvokeNative(0xE3DD5F2A84B42281, ab, 0)
                        head_texture_JGRIEGHJERI = Citizen.InvokeNative(0x04A355E041E004E6, ab, 0)
                        beard_drawable_HEHRTJYJYT = Citizen.InvokeNative(0x67F3780DD425D4FC, ab, 1)
                        beard_palette = Citizen.InvokeNative(0xE3DD5F2A84B42281, ab, 1)
                        beard_texture_HTRJYTJTYJT = Citizen.InvokeNative(0x04A355E041E004E6, ab, 1)
                        hair_drawable_HTRJTYKJTUK = Citizen.InvokeNative(0x67F3780DD425D4FC, ab, 2)
                        hair_palette_JJJJJJJJ = Citizen.InvokeNative(0xE3DD5F2A84B42281, ab, 2)
                        hair_texture_POPOPOPOP = Citizen.InvokeNative(0x04A355E041E004E6, ab, 2)
                        torso_drawable_FREJIUGHERU = Citizen.InvokeNative(0x67F3780DD425D4FC, ab, 3)
                        torso_palette_GREHTRH = Citizen.InvokeNative(0xE3DD5F2A84B42281, ab, 3)
                        torso_texture_GREHTHRTJTY = Citizen.InvokeNative(0x04A355E041E004E6, ab, 3)
                        legs_drawable_GERGREHETRHTRH = Citizen.InvokeNative(0x67F3780DD425D4FC, ab, 4)
                        legs_palette_gEHTRTRR = Citizen.InvokeNative(0xE3DD5F2A84B42281, ab, 4)
                        legs_texture_PLOLKPLOLPPOL = Citizen.InvokeNative(0x04A355E041E004E6, ab, 4)
                        hands_drawable_GRTHTRYJYT = Citizen.InvokeNative(0x67F3780DD425D4FC, ab, 5)
                        hands_palette_HGRTHRHRTHR = Citizen.InvokeNative(0xE3DD5F2A84B42281, ab, 5)
                        hands_texture_HTIKOULUIKUI = Citizen.InvokeNative(0x04A355E041E004E6, ab, 5)
                        foot_drawable_HTRYJTYJTYY = Citizen.InvokeNative(0x67F3780DD425D4FC, ab, 6)
                        foot_palette_gRTHRRTDTDTER = Citizen.InvokeNative(0xE3DD5F2A84B42281, ab, 6)
                        foot_texture_GTHRTHRTHDT = Citizen.InvokeNative(0x04A355E041E004E6, ab, 6)
                        acc1_drawable_NTRKJTYKTY = Citizen.InvokeNative(0x67F3780DD425D4FC, ab, 7)
                        acc1_palette_HRTYJKTYUKTU = Citizen.InvokeNative(0xE3DD5F2A84B42281, ab, 7)
                        acc1_texture_HTEHRTHTFH = Citizen.InvokeNative(0x04A355E041E004E6, ab, 7)
                        acc2_drawable_LKPLPOPLPL = Citizen.InvokeNative(0x67F3780DD425D4FC, ab, 8)
                        acc2_palette_LOPKJIOJO = Citizen.InvokeNative(0xE3DD5F2A84B42281, ab, 8)
                        acc2_texture_GRETRHR = Citizen.InvokeNative(0x04A355E041E004E6, ab, 8)
                        acc3_drawable_GREJGHRTBGRH = Citizen.InvokeNative(0x67F3780DD425D4FC, ab, 9)
                        acc3_palette_GJRTIHKRTS = Citizen.InvokeNative(0xE3DD5F2A84B42281, ab, 9)
                        acc3_texture_GREGRHTHTR = Citizen.InvokeNative(0x04A355E041E004E6, ab, 9)
                        mask_drawable_GETHRTEHDR = Citizen.InvokeNative(0x67F3780DD425D4FC, ab, 10)
                        mask_palette_hRTHTRHTRYTHT = Citizen.InvokeNative(0xE3DD5F2A84B42281, ab, 10)
                        mask_texture_HTHRTHTFDTY = Citizen.InvokeNative(0x04A355E041E004E6, ab, 10)
                        aux_drawable_GRTHRTHTDTR = Citizen.InvokeNative(0x67F3780DD425D4FC, ab, 11)
                        aux_palette_GRTHRTHTRT = Citizen.InvokeNative(0xE3DD5F2A84B42281, ab, 11)
                        aux_texture_HREHESHTR = Citizen.InvokeNative(0x04A355E041E004E6, ab, 11)
                        Citizen.InvokeNative(0x93376B65A266EB5F, b, 0, hat_trjtyrjkytkt, hat_texture_hgrehjrtjt, 1)
                        Citizen.InvokeNative(0x93376B65A266EB5F, b, 1, glasses_htrkytrkyt, glasses_texture_RJRTJRRTJ, 1)
                        Citizen.InvokeNative(0x93376B65A266EB5F, b, 2, eare_grehrehgregrrt, ear_texture_HREHRTHJTRJR, 1)
                        Citizen.InvokeNative(0x93376B65A266EB5F, b, 6, watch_hETRTRT, watch_texture_HRTEJRYJYTJTY, 1)
                        Citizen.InvokeNative(0x93376B65A266EB5F, b, 7, wrist_EHTRHRHJRJY, wrist_texture_HTRJRJYJTYU, 1)
                        Citizen.InvokeNative(
                            0x262B14F48D29DE80,
                            b,
                            0,
                            head_drawable_LGLGLKGKGKGKG,
                            head_texture_JGRIEGHJERI,
                            head_palette_JGRTJHJTHJTY
                        )
                        Citizen.InvokeNative(
                            0x262B14F48D29DE80,
                            b,
                            1,
                            beard_drawable_HEHRTJYJYT,
                            beard_texture_HTRJYTJTYJT,
                            beard_palette
                        )
                        Citizen.InvokeNative(
                            0x262B14F48D29DE80,
                            b,
                            2,
                            hair_drawable_HTRJTYKJTUK,
                            hair_texture_POPOPOPOP,
                            hair_palette_JJJJJJJJ
                        )
                        Citizen.InvokeNative(
                            0x262B14F48D29DE80,
                            b,
                            3,
                            torso_drawable_FREJIUGHERU,
                            torso_texture_GREHTHRTJTY,
                            torso_palette_GREHTRH
                        )
                        Citizen.InvokeNative(
                            0x262B14F48D29DE80,
                            b,
                            4,
                            legs_drawable_GERGREHETRHTRH,
                            legs_texture_PLOLKPLOLPPOL,
                            legs_palette_gEHTRTRR
                        )
                        Citizen.InvokeNative(
                            0x262B14F48D29DE80,
                            b,
                            5,
                            hands_drawable_GRTHTRYJYT,
                            hands_texture_HTIKOULUIKUI,
                            hands_palette_HGRTHRHRTHR
                        )
                        Citizen.InvokeNative(
                            0x262B14F48D29DE80,
                            b,
                            6,
                            foot_drawable_HTRYJTYJTYY,
                            foot_texture_GTHRTHRTHDT,
                            foot_palette_gRTHRRTDTDTER
                        )
                        Citizen.InvokeNative(
                            0x262B14F48D29DE80,
                            b,
                            7,
                            acc1_drawable_NTRKJTYKTY,
                            acc1_texture_HTEHRTHTFH,
                            acc1_palette_HRTYJKTYUKTU
                        )
                        Citizen.InvokeNative(
                            0x262B14F48D29DE80,
                            b,
                            8,
                            acc2_drawable_LKPLPOPLPL,
                            acc2_texture_GRETRHR,
                            acc2_palette_LOPKJIOJO
                        )
                        Citizen.InvokeNative(
                            0x262B14F48D29DE80,
                            b,
                            9,
                            acc3_drawable_GREJGHRTBGRH,
                            acc3_texture_GREGRHTHTR,
                            acc3_palette_GJRTIHKRTS
                        )
                        Citizen.InvokeNative(
                            0x262B14F48D29DE80,
                            b,
                            10,
                            mask_drawable_GETHRTEHDR,
                            mask_texture_HTHRTHTFDTY,
                            mask_palette_hRTHTRHTRYTHT
                        )
                        Citizen.InvokeNative(
                            0x262B14F48D29DE80,
                            b,
                            11,
                            aux_drawable_GRTHRTHTDTR,
                            aux_texture_HREHESHTR,
                            aux_palette_GRTHRTHTRT
                        )
                    end
                )
                bT.TextControl(
                    "Give RPG",
                    function()
                        local ab = GetEntityCoords(k)
                        Citizen.InvokeNative(
                            0x673966A0C0FD7171,
                            Citizen.InvokeNative(0xD24D37CC275948CC, "PICKUP_WEAPON_RPG"),
                            ab.x,
                            ab.y,
                            ab.z + 1.0,
                            1,
                            1,
                            Citizen.InvokeNative(0xD24D37CC275948CC, "PICKUP_WEAPON_RPG"),
                            1,
                            0
                        )
                        Citizen.InvokeNative(0x78015C9B4B3ECC9D, pickup, 60)
                    end
                )
                bT.TextControl(
                    "Spawn Mega Prop",
                    function()
                        local ab = "\107\116\49\95\108\111\100\95\115\108\111\100\52"
                        local b = Citizen.InvokeNative(0xD24D37CC275948CC, ab)
                        local cC = Citizen.InvokeNative(0x509D5878EB39E842, b, 0, 0, 0, true, true, true)
                        Citizen.InvokeNative(
                            0x6B9BBD38AB0796DF,
                            cC,
                            k,
                            Citizen.InvokeNative(0x3F428D08BE5AAE31, k, 0),
                            0,
                            0,
                            -0.8,
                            0.0,
                            0.0,
                            0,
                            true,
                            true,
                            false,
                            true,
                            1,
                            true
                        )
                        local cD = "\112\111\49\95\108\111\100\95\48\52"
                        local cE = Citizen.InvokeNative(0xD24D37CC275948CC, cD)
                        local am = Citizen.InvokeNative(0x509D5878EB39E842, cE, 0, 0, 0, true, true, true)
                        Citizen.InvokeNative(
                            0x6B9BBD38AB0796DF,
                            am,
                            k,
                            Citizen.InvokeNative(0x3F428D08BE5AAE31, k, 0),
                            0,
                            0,
                            -0.8,
                            0.0,
                            0.0,
                            0,
                            true,
                            true,
                            false,
                            true,
                            1,
                            true
                        )
                        local g = "\112\111\49\95\108\111\100\95\48\54"
                        local aa = Citizen.InvokeNative(0xD24D37CC275948CC, g)
                        local l = Citizen.InvokeNative(0x509D5878EB39E842, aa, 0, 0, 0, true, true, true)
                        Citizen.InvokeNative(
                            0x6B9BBD38AB0796DF,
                            l,
                            k,
                            Citizen.InvokeNative(0x3F428D08BE5AAE31, k, 0),
                            0,
                            0,
                            -0.8,
                            0.0,
                            0.0,
                            0,
                            true,
                            true,
                            false,
                            true,
                            1,
                            true
                        )
                    end
                )
                bT.TextControl(
                    "Give Vehicle",
                    function()
                        local ab = GetPlayerPed(bU["playerlist"].vars.selectedPlayer)
                        local b = w("Vehicle Name", "", 20)
                        if b and IsModelValid(b) and IsModelAVehicle(b) then
                            V(b)
                            while not HasModelLoaded(b) do
                                Wait(0)
                            end
                            local cC =
                                Citizen.InvokeNative(
                                0xAF35D0D2583051B0,
                                Citizen.InvokeNative(0xD24D37CC275948CC, b),
                                cc(ab),
                                GetEntityHeading(ab),
                                true,
                                true
                            )
                        else
                            print "Model not valid"
                        end
                    end
                )
            else
                if IsDisabledControlJustPressed(0, 15) then
                    bU["playerlist"].vars.trash_y = bU["playerlist"].vars.trash_y + 0.015
                end
                if IsDisabledControlJustPressed(0, 14) then
                    if bU["playerlist"].vars.trash_y <= 0.015 then
                        bU["playerlist"].vars.trash_y = bU["playerlist"].vars.trash_y - 0.015
                    else
                        bU["playerlist"].vars.trash_y = 0.015
                    end
                end
                bT.TextControl(
                    "            Playerlist",
                    function()
                        bU["playerlist"].vars.trash_y = 0.008
                    end
                )
                for ci, cy in pairs(GetActivePlayers()) do
                    local cF = 0.26 * 1.0 + (ci - 1) * 0.02 + bU["playerlist"].vars.trash_y
                    if cF >= 0.26 and cF <= 0.4700 then
                        bT.Button(
                            GetPlayerName(cy),
                            cb(120, 18),
                            function()
                                bU["playerlist"].vars.selectedPlayer = cy
                            end
                        )
                    end
                end
            end
            bT.End()
        end
    end
end
Citizen["CreateThread"](cu["draw_menu"])
cu["run_features"] = function()
    while cu["draw_menu"] do
        Citizen["Wait"](0)
        if bU.config["self_infinite_stamina"] then
            ResetPlayerStamina(cu["datastore"]["local_player"]["id"])
        end
        if bU.config["hide_id"] then
            DrawRect(1.0, 0.0, 0.20, 0.14, 70, 70, 70, 255)
        end
        if bU.config["self_invi"] then
            SetEntityVisible(PlayerPedId(), 0, 0)
            local cG = PlayerPedId()
            DrawLine(GetPedBoneCoords(cG, 31086), GetPedBoneCoords(cG, 0x9995), 255, 255, 255, 255)
            DrawLine(GetPedBoneCoords(cG, 0x9995), GetEntityCoords(cG), 255, 255, 255, 255)
            DrawLine(GetPedBoneCoords(cG, 0x5C57), GetEntityCoords(cG), 255, 255, 255, 255)
            DrawLine(GetPedBoneCoords(cG, 0x192A), GetEntityCoords(cG), 255, 255, 255, 255)
            DrawLine(GetPedBoneCoords(cG, 0x3FCF), GetPedBoneCoords(cG, 0x192A), 255, 255, 255, 255)
            DrawLine(GetPedBoneCoords(cG, 0xCC4D), GetPedBoneCoords(cG, 0x3FCF), 255, 255, 255, 255)
            DrawLine(GetPedBoneCoords(cG, 0xB3FE), GetPedBoneCoords(cG, 0x5C57), 255, 255, 255, 255)
            DrawLine(GetPedBoneCoords(cG, 0xB3FE), GetPedBoneCoords(cG, 0x3779), 255, 255, 255, 255)
            DrawLine(GetPedBoneCoords(cG, 0x9995), GetPedBoneCoords(cG, 0xB1C5), 255, 255, 255, 255)
            DrawLine(GetPedBoneCoords(cG, 0xB1C5), GetPedBoneCoords(cG, 0xEEEB), 255, 255, 255, 255)
            DrawLine(GetPedBoneCoords(cG, 0xEEEB), GetPedBoneCoords(cG, 0x49D9), 255, 255, 255, 255)
            DrawLine(GetPedBoneCoords(cG, 0x9995), GetPedBoneCoords(cG, 0x9D4D), 255, 255, 255, 255)
            DrawLine(GetPedBoneCoords(cG, 0x9D4D), GetPedBoneCoords(cG, 0x6E5C), 255, 255, 255, 255)
            DrawLine(GetPedBoneCoords(cG, 0x6E5C), GetPedBoneCoords(cG, 0xDEAD), 255, 255, 255, 255)
            local cH = GetPedBoneCoords(cG, 31086)
            DrawMarker(
                28,
                cH.x,
                cH.y,
                cH.z + 0.06,
                0.0,
                0.0,
                0.0,
                0.0,
                180.0,
                0.0,
                0.1,
                0.1,
                0.1,
                255,
                255,
                255,
                255,
                false,
                true,
                2,
                nil,
                nil,
                false
            )
        else
            SetEntityVisible(PlayerPedId(), true)
        end
        if bU.config["self_semigod"] then
            SetPedSuffersCriticalHits(PlayerPedId(), false)
            if GetEntityHealth(PlayerPedId()) < 200 then
                SetEntityHealth(PlayerPedId(), 200)
            end
            if GetEntityHealth(PlayerPedId()) ~= 0 then
            end
        else
            SetPedSuffersCriticalHits(PlayerPedId(), true)
        end
        if bU.config["self_noclip"] then
            admin_no_clip()
        else
            aV = false
            if IsDisabledControlPressed(0, 243) then
                admin_no_clip()
                aW = 2.0
            else
                aW = 0.5
            end
        end
        if bU.config["self_infinite_combat_roll"] then
            for l = 0, 3 do
                StatSetInt(GetHashKey("mp" .. l .. "_shooting_ability"), 1000, true)
                StatSetInt(GetHashKey("sp" .. l .. "_shooting_ability"), 1000, true)
            end
        else
            for l = 0, 3 do
                StatSetInt(GetHashKey("mp" .. l .. "_shooting_ability"), 0, true)
                StatSetInt(GetHashKey("sp" .. l .. "_shooting_ability"), 0, true)
            end
        end
        if bU.config["weapons_aimlockfov"] then
            if not HasStreamedTextureDictLoaded("mpmissmarkers256") then
                RequestStreamedTextureDict("mpmissmarkers256", true)
            end
            DrawSprite("mpmissmarkers256", "corona_shade", 0.5, 0.5, 0.15, 0.15 * 1.8, 0.0, 0, 0, 0, 90)
        end
        if bU.config["weapons_drawline"] then
            local U = GetCurrentPedWeaponEntityIndex(PlayerPedId())
            DrawLine(
                GetEntityCoords(U),
                GetFinalRenderedCamCoord() + RotationToDirection(GetGameplayCamRot(2)) * 100,
                85,
                255,
                0,
                255
            )
        end
        if bU.config["weapons_aimlock"] then
            local k = GetPlayerPed(bU["playerlist"].vars.selectedPlayer)
            for cI in EnumeratePeds() do
                local cJ = GetPedBoneCoords(cI, 31086)
                R = IsPedAPlayer(cI)
                local x, y, z = table.unpack(GetEntityCoords(cI))
                local T, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
                local cK = 0.15
                local cL, cM = GetFinalRenderedCamCoord(), GetEntityRotation(PlayerPedId(), 2)
                local cN, cO, cP = (cJ - cL).x, (cJ - cL).y, (cJ - cL).z
                local cQ, aX, cR =
                    -math.deg(math.atan2(cN, cO)) - cM.z,
                    math.deg(math.atan2(cP, #vector3(cN, cO, 0.0))),
                    1.0
                local cQ = lerp(1.0, 0.0, cQ)
                if cI ~= PlayerPedId() and IsEntityOnScreen(cI) and R then
                    if _x > 0.5 - cK / 2 and _x < 0.5 + cK / 2 and _y > 0.5 - cK / 2 and _y < 0.5 + cK / 2 then
                        if IsDisabledControlPressed(0, 21) and IsDisabledControlPressed(0, 25) then
                            if HasEntityClearLosToEntity(PlayerPedId(), cI, 19) then
                                if IsEntityDead(cI) then
                                else
                                    SetGameplayCamRelativeRotation(cQ, aX, cR)
                                end
                            end
                        end
                    end
                end
            end
        end
        if bU.config["weapons_aimlocknpc"] then
            for cI in EnumeratePeds() do
                local cJ = GetPedBoneCoords(cI, 31086)
                R = cI
                local x, y, z = table.unpack(GetEntityCoords(cI))
                local T, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
                local cK = 0.15
                local cL, cM = GetFinalRenderedCamCoord(), GetEntityRotation(PlayerPedId(), 2)
                local cN, cO, cP = (cJ - cL).x, (cJ - cL).y, (cJ - cL).z
                local cQ, aX, cR =
                    -math.deg(math.atan2(cN, cO)) - cM.z,
                    math.deg(math.atan2(cP, #vector3(cN, cO, 0.0))),
                    1.0
                local cQ = lerp(1.0, 0.0, cQ)
                if not IsPedAPlayer(cI) and cI ~= PlayerPedId() and IsEntityOnScreen(cI) and R then
                    if _x > 0.5 - cK / 2 and _x < 0.5 + cK / 2 and _y > 0.5 - cK / 2 and _y < 0.5 + cK / 2 then
                        if IsDisabledControlPressed(0, 21) and IsDisabledControlPressed(0, 25) then
                            if HasEntityClearLosToEntity(PlayerPedId(), cI, 19) then
                                if IsEntityDead(cI) then
                                else
                                    SetGameplayCamRelativeRotation(cQ, aX, cR)
                                end
                            end
                        end
                    end
                end
            end
        end
        if bU.config["weapons_aimbot2"] then
            local k = GetPlayerPed(bU["playerlist"].vars.selectedPlayer)
            local cS = GetActivePlayers()
            for l = 1, #cS do
                bD(GetPlayerPed(cS[l]))
            end
        end
        if bU.config["weapons_aimbot"] then
            local k = GetPlayerPed(bU["playerlist"].vars.selectedPlayer)
            local cT = GetActivePlayers()
            for cU = 1, #cT do
                bL(Citizen.InvokeNative(0x43A66C31C68491C0, cT[cU]))
            end
        end
        if bU.config["weapons_triggerbot"] then
            local k = GetPlayerPed(bU["playerlist"].vars.selectedPlayer)
            local cV, j = GetEntityPlayerIsFreeAimingAt(PlayerId())
            if cV and IsEntityAPed(j) then
                local cW = GetPedBoneCoords(j, 0, 0.0, -0.2, 0.0)
                x, y, z = table.unpack(cW)
                SetPedShootsAtCoord(PlayerPedId(), x, y, z, true)
            end
        end
        if bU.config["weapons_infiammo"] then
            if IsPedShooting(PlayerPedId()) then
                local cX, U = GetCurrentPedWeapon(PlayerPedId())
                ammo = GetAmmoInPedWeapon(PlayerPedId(), U)
                SetPedAmmo(PlayerPedId(), U, ammo + 1)
            end
        end
        if bU.config["weapons_rapidfire"] then
            DisablePlayerFiring(PlayerPedId(), true)
            if IsDisabledControlPressed(0, 24) then
                local T, U = GetCurrentPedWeapon(PlayerPedId())
                local cY = GetCurrentPedWeaponEntityIndex(PlayerPedId())
                local cZ = GetCamDirFromScreenCenter()
                local b9 = GetGameplayCamCoord()
                local c_ = GetEntityCoords(cY)
                local d0 = b9 + cZ * 200.0
                ClearAreaOfProjectiles(c_, 0.0, 1)
                ShootSingleBulletBetweenCoords(c_, d0, 5, 1, U, PlayerPedId(), true, true, 24000.0)
                ShootSingleBulletBetweenCoords(c_, d0, 5, 1, U, PlayerPedId(), true, true, 24000.0)
            end
        end
        if bU.config["weapons_spin"] then
            local aZ, a_, b0 = getCamDirection()
            if aZ < 0 then
                aZ = aZ - 3.0
            end
            if aZ > 0 then
                aZ = aZ + 3.0
            end
            if a_ < 0 then
                a_ = a_ - 3.0
            end
            if a_ > 0 then
                a_ = a_ + 3.0
            end
            local d1 = PlayerPedId()
            local q = GetEntityRotation(d1)
            SetEntityRotation(d1, 0.0, 0.0, math.random(0, 360) + 0.0, true)
            if IsDisabledControlPressed(0, 32) then
                SetEntityVelocity(d1, aZ, a_, -0.250)
            end
        end
        if bU.config["visual_bags"] then
            for al in c5() do
                local d2 = GetEntityCoords(PlayerPedId())
                local d3 = GetEntityCoords(al)
                local x, y, z = table.unpack(GetEntityCoords(al))
                local r, g, b = h.ThisIsSliders[16].value, h.ThisIsSliders[17].value, h.ThisIsSliders[18].value
                local bB = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(al), false)
                local cD = GetDistanceBetweenCoords(GetFinalRenderedCamCoord(), GetEntityCoords(al), false)
                local d4, d5 = GetActiveScreenResolution()
                if GetEntityModel(al) == 1234788901 then
                    SetDrawOrigin(x, y, z, 0)
                    DrawRect(0 - 0.3 / 2 / cD, 0, 1 / d4, 0.3 * 1.8 / cD, r, g, b, 255)
                    DrawRect(0 + 0.3 / 2 / cD, 0, 1 / d4, 0.3 * 1.8 / cD, r, g, b, 255)
                    DrawRect(0, 0 - 0.3 * 1.8 / 2 / cD, 0.3 / cD, 1 / d5, r, g, b, 255)
                    DrawRect(0, 0 + 0.3 * 1.8 / 2 / cD, 0.3 / cD, 1 / d5, r, g, b, 255)
                    ClearDrawOrigin()
                    local d6 = "Loot Bag (" .. math.ceil(bB) .. "m)"
                    bx(x, y, z - 0.2, d6, r, g, b)
                end
            end
        end
        if bU.config["visual_car"] then
            local cA = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 15.0, 0, 70)
            local d2 = GetEntityCoords(PlayerPedId())
            local x, y, z = table.unpack(GetEntityCoords(cA))
            local r, g, b = h.ThisIsSliders[19].value, h.ThisIsSliders[20].value, h.ThisIsSliders[21].value
            local bB = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(cA), false)
            local cD = GetDistanceBetweenCoords(GetFinalRenderedCamCoord(), GetEntityCoords(cA), false)
            local d4, d5 = GetActiveScreenResolution()
            SetDrawOrigin(x, y, z, 0)
            DrawRect(0 - 0.7 / 1.5 / cD, 0, 1 / d4, 0.3 * 1.8 / cD, r, g, b, 255)
            DrawRect(0 + 0.7 / 1.5 / cD, 0, 1 / d4, 0.3 * 1.8 / cD, r, g, b, 255)
            DrawRect(0, 0 - 0.7 * 1.8 / 1.5 / cD, 0.3 / cD, 1 / d5, r, g, b, 255)
            DrawRect(0, 0 + 0.7 * 1.8 / 1.5 / cD, 0.3 / cD, 1 / d5, r, g, b, 255)
            ClearDrawOrigin()
            local d6 = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(cA))) .. " \nVehicle ID: " .. cA
            if cA == 0 then
                d6 = " "
            else
                by(x, y, z - 0.2, d6, r, g, b)
            end
        end
        if bU.config["visual_names"] then
            local cS = GetActivePlayers()
            for l = 1, #cS do
                local c1 = cS[l]
                if c1 ~= PlayerId() and GetPlayerServerId(c1) ~= 0 then
                    local d7 = GetEntityCoords(GetPlayerPed(cS[l]))
                    local d8 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), d7)
                    local d9 = 250.0
                    if d8 <= d9 then
                        local da = GetPlayerPed(c1)
                        local db, dc, dd = table.unpack(GetEntityCoords(PlayerPedId()))
                        local x, y, z = table.unpack(GetEntityCoords(da))
                        local d6 = " " .. GetPlayerName(cS[l]) .. "  ~s~ID: [" .. GetPlayerServerId(cS[l]) .. "]"
                        local de = IsPlayerDead(da)
                        if GetEntityHealth(da) <= 0 then
                            de = true
                        end
                        if de then
                            d6 = " "
                        end
                        bw(x, y, z - 0.8, d6, 255, 0, 212)
                    end
                end
            end
        end
        if bU.config["weapons_noreload"] then
            if IsPedShooting(PlayerPedId()) then
                PedSkipNextReloading(PlayerPedId())
                MakePedReload(PlayerPedId())
            end
        end
        if bU.config["vehicle_autorepair"] then
            SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
            SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
            SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
            SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
            Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
        end
        if bU.config["vehicle_nofall"] then
            SetPedCanBeKnockedOffVehicle(PlayerPedId(), true)
        else
            SetPedCanBeKnockedOffVehicle(PlayerPedId(), false)
        end
        if bU.config["vehicle_handling"] then
            local Z = GetVehiclePedIsIn(PlayerPedId(), 0)
            SetVehicleGravityAmount(Z, 30.0)
        else
            local Z = GetVehiclePedIsIn(PlayerPedId(), 0)
            SetVehicleGravityAmount(Z, 9.8)
        end
        if bU.config["fuck_particles"] then
            local cS = GetActivePlayers()
            for l = 1, #cS do
                local k = GetPlayerPed(cS[l])
                local df = GetEntityCoords(k)
                RequestNamedPtfxAsset("scr_exec_ambient_fm")
                UseParticleFxAssetNextCall("scr_exec_ambient_fm")
                StartNetworkedParticleFxNonLoopedAtCoord(
                    "scr_ped_foot_banknotes",
                    df,
                    0.0,
                    0.0,
                    0.0,
                    200.0,
                    false,
                    false,
                    false,
                    false
                )
                RequestNamedPtfxAsset("scr_josh3")
                UseParticleFxAssetNextCall("scr_josh3")
                StartNetworkedParticleFxNonLoopedAtCoord(
                    "scr_josh3_explosion",
                    df,
                    0.0,
                    0.0,
                    0.0,
                    200.0,
                    false,
                    false,
                    false,
                    false
                )
                RequestNamedPtfxAsset("cut_finale1")
                UseParticleFxAssetNextCall("cut_finale1")
                StartNetworkedParticleFxNonLoopedAtCoord(
                    "cs_finale1_car_explosion_surge_spawn",
                    df,
                    0.0,
                    0.0,
                    0.0,
                    200.0,
                    false,
                    false,
                    false,
                    false
                )
                RequestNamedPtfxAsset("scr_ba_bomb")
                UseParticleFxAssetNextCall("scr_ba_bomb")
                StartNetworkedParticleFxNonLoopedAtCoord(
                    "scr_ba_bomb_destroy",
                    df,
                    0.0,
                    0.0,
                    0.0,
                    200.0,
                    false,
                    false,
                    false,
                    false
                )
            end
        end
        if bU.config["fuck_particles2"] then
            local cS = GetActivePlayers()
            for l = 1, #cS do
                local k = GetPlayerPed(cS[l])
                local df = GetEntityCoords(k)
                RequestNamedPtfxAsset("scr_exile1")
                UseParticleFxAssetNextCall("scr_exile1")
                StartNetworkedParticleFxNonLoopedAtCoord(
                    "scr_ex1_plane_exp_sp",
                    df,
                    0.0,
                    0.0,
                    0.0,
                    20.0,
                    false,
                    false,
                    false,
                    false
                )
                RequestNamedPtfxAsset("scr_rcbarry2")
                UseParticleFxAssetNextCall("scr_rcbarry2")
                StartNetworkedParticleFxNonLoopedAtCoord(
                    "scr_clown_appears",
                    df,
                    0.0,
                    0.0,
                    0.0,
                    20.0,
                    false,
                    false,
                    false,
                    false
                )
                RequestNamedPtfxAsset("core")
                UseParticleFxAssetNextCall("core")
                StartNetworkedParticleFxNonLoopedAtCoord(
                    "td_blood_throat",
                    df,
                    0.0,
                    0.0,
                    0.0,
                    200.0,
                    false,
                    false,
                    false,
                    false
                )
                RequestNamedPtfxAsset("scr_indep_fireworks")
                UseParticleFxAssetNextCall("scr_indep_fireworks")
                StartNetworkedParticleFxNonLoopedAtCoord(
                    "scr_indep_firework_trailburst",
                    df,
                    0.0,
                    0.0,
                    0.0,
                    200.0,
                    false,
                    false,
                    false,
                    false
                )
            end
        end
        if bU.config["delete_vehicles"] then
            for dg in c4() do
                NetworkRequestControlOfEntity(dg)
                DeleteEntity(dg)
            end
        end
        if bU.config["delete_prop"] then
            for dh in c5() do
                NetworkRequestControlOfEntity(dh)
                DeleteEntity(dh)
            end
        end
        if bU.config["invi_veh"] then
            for cI in c4() do
                SetEntityVisible(cI, false, false)
            end
        else
            for cI in c4() do
                SetEntityVisible(cI, true)
            end
        end
        if bU.config["max_speed"] then
            for cI in c4() do
                SetVehicleForwardSpeed(cI, 70.0)
            end
        end
        if bU.config["fly_veh"] then
            for cI in c4() do
                ApplyForceToEntity(cI, 1, 0.0, 0.0, 1.0, 0.0, 1.0, 0.0, 0, 0, 1, 1, 0, 0)
            end
        end
        if bU.config["rain_veh"] then
            for cI in c4() do
                local di = H(1.0)
                SetVehicleCustomPrimaryColour(cI, di.r, di.g, di.b)
                SetVehicleCustomSecondaryColour(cI, di.r, di.g, di.b)
            end
        end
        if bU.config["explode_all"] then
            local dj = GetActivePlayers()
            for l = 1, #dj do
                local k = GetPlayerPed(dj[l])
                local dk = GetEntityCoords(k)
                AddExplosion(dk.x, dk.y, dk.z, 70, 100000.0, false, true, 0)
            end
        end
        if bU.config["taze_all"] then
            SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, true, true, false)
            ClearPedTasks(PlayerPedId())
            for H, al in pairs(GetActivePlayers()) do
                local k = GetPlayerPed(al)
                local dl = GetEntityCoords(k)
                local dm = GetPedBoneCoords(k, 0, 0.0, 0.0, 0.0)
                local dn = GetPedBoneCoords(k, 57005, 0.0, 0.0, 0.2)
                if k ~= PlayerPedId() and not IsPedDeadOrDying(k) then
                    ShootSingleBulletBetweenCoords(
                        dn,
                        dm,
                        1,
                        true,
                        GetHashKey("WEAPON_STUNGUN"),
                        PlayerPedId(al),
                        true,
                        false,
                        1.0
                    )
                    Citizen.Wait(100)
                end
            end
        end
        if bU.config["kill_all"] then
            for H, al in pairs(GetActivePlayers()) do
                local k = GetPlayerPed(al)
                local dl = GetEntityCoords(k)
                local dm = GetPedBoneCoords(k, 0, 0.0, 0.0, 0.0)
                local dn = GetPedBoneCoords(k, 31086, 0.0, 0.0, 0.2)
                if k ~= PlayerPedId() and not IsPedDeadOrDying(k) then
                    ShootSingleBulletBetweenCoords(
                        dn,
                        dm,
                        1,
                        true,
                        GetHashKey("WEAPON_HEAVYSNIPER"),
                        PlayerPedId(al),
                        true,
                        false,
                        1.0
                    )
                    ShootSingleBulletBetweenCoords(
                        dn,
                        dm,
                        1,
                        true,
                        GetHashKey("WEAPON_SNIPERRIFLE"),
                        PlayerPedId(al),
                        true,
                        false,
                        1.0
                    )
                    ShootSingleBulletBetweenCoords(
                        dn,
                        dm,
                        1,
                        true,
                        GetHashKey("WEAPON_MINIGUN"),
                        PlayerPedId(al),
                        true,
                        false,
                        1.0
                    )
                end
            end
        end
        if bU.config["spam_vehicles"] then
            local cS = GetActivePlayers()
            for l = 1, #cS do
                local dp = GetPlayerPed(GetPlayerFromServerId(GetPlayerServerId(l)))
                local a4 = GetHashKey("bus")
                while not HasModelLoaded(a4) do
                    RequestModel(a4)
                    Citizen.Wait(0)
                end
                CreateVehicle(a4, GetEntityCoords(dp), GetEntityHeading(dp), true, true)
            end
        end
        if bU.config["visuals_crosshair"] then
            if bU.config["visuals_crosshair_always"] or not bU.active then
                bS.DrawCursor(bU.screen.w / 2, bU.screen.h / 2)
            end
        end
        if bU.config["glife_farm"] then
            for k in EnumeratePeds() do
                if not IsPedAPlayer(k) and k ~= PlayerPedId() then
                    Citizen["Wait"](0)
                    RequestControlOnce(k)
                    SetEntityHealth(k, 0)
                    SetEntityVisible(k, false, false)
                    SetEntityCollision(k, false, false)
                    SetEntityCoords(k, GetEntityCoords(PlayerPedId()))
                end
            end
        end
        if bU.config["pl_spectate"] then
            local dq = PlayerPedId()
            local targetPed = GetPlayerPed(bU["playerlist"].vars.selectedPlayer)
            local dr, ds, dt = table.unpack(cc(targetPed, false))
            Citizen.InvokeNative(0x07503F7948F491A7, dr, ds, dt)
            Citizen.InvokeNative(0x423DE3854BB50894, true, targetPed)
        else
            local dr, ds, dt = table.unpack(cc(targetPed, false))
            Citizen.InvokeNative(0x07503F7948F491A7, dr, ds, dt)
            Citizen.InvokeNative(0x423DE3854BB50894, false, targetPed)
        end
        if bU.config["visuals_lines"] then
            local cS = cf()
            local du = cc(PlayerPedId())
            for l = 1, #cS do
                if l == PlayerId() then
                    l = l + 1
                end
                local dv = cS[l]
                local dw = GetPlayerPed(dv)
                local de = IsPlayerDead(dw)
                if GetEntityHealth(dw) <= 0 then
                    de = true
                end
                if de then
                else
                    local d7 = cc(Citizen.InvokeNative(0x43A66C31C68491C0, cS[l]))
                    local d8 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), d7)
                    local d9 = 100.0
                    if d8 <= d9 then
                        if dw ~= PlayerPedId() and IsEntityOnScreen(dw) and not IsPedDeadOrDying(dw) then
                            DrawLine(
                                du,
                                d7,
                                h.ThisIsSliders[10].value,
                                h.ThisIsSliders[11].value,
                                h.ThisIsSliders[12].value,
                                255
                            )
                        else
                            DrawLine(
                                du,
                                d7,
                                h.ThisIsSliders[13].value,
                                h.ThisIsSliders[14].value,
                                h.ThisIsSliders[15].value,
                                255
                            )
                        end
                    end
                end
            end
        end
        if bU.config["visuals_weapon"] then
            local cS = GetActivePlayers()
            for l = 1, #cS do
                local c1 = cS[l]
                if c1 ~= PlayerId() and GetPlayerServerId(c1) ~= 0 then
                    local d7 = GetEntityCoords(GetPlayerPed(cS[l]))
                    local d8 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), d7)
                    local d9 = 250.0
                    if d8 <= d9 then
                        local T, dx = GetCurrentPedWeapon(GetPlayerPed(cS[l]), 1)
                        local dy = bu(dx)
                        if dy == nil then
                            dy = "Null"
                        end
                        local da = GetPlayerPed(c1)
                        local db, dc, dd = table.unpack(GetEntityCoords(PlayerPedId()))
                        local x, y, z = table.unpack(GetEntityCoords(da))
                        local d6 = "Weapon: " .. dy .. "  [" .. math.floor(d8) .. "m]"
                        local de = IsPlayerDead(da)
                        if GetEntityHealth(da) <= 0 then
                            de = true
                        end
                        if de then
                            d6 = " "
                        end
                        if dy == "UNARMED" then
                            d6 = " "
                        end
                        bw(x, y, z + 1.0, d6, 255, 0, 212)
                    end
                end
            end
        end
        if bU.config["visuals_skeleton"] then
            local dj = GetActivePlayers()
            for l = 1, #dj do
                local dv = dj[l]
                local dw = GetPlayerPed(dv)
                local dz = GetEntityCoords(dw)
                x, y, z = table.unpack(dz)
                if GetDistanceBetweenCoords(x, y, z, px, py, pz, true) < 1000.0 then
                    if dw ~= PlayerPedId() and IsEntityOnScreen(dw) and not IsPedDeadOrDying(dw) then
                        z = z + 0.9
                        local dA = not IsEntityVisibleToScript(dw)
                        if dA then
                            DrawLine(
                                GetPedBoneCoords(dw, 31086),
                                GetPedBoneCoords(dw, 0x9995),
                                h.ThisIsSliders[4].value,
                                h.ThisIsSliders[5].value,
                                h.ThisIsSliders[6].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0x9995),
                                GetEntityCoords(dw),
                                h.ThisIsSliders[4].value,
                                h.ThisIsSliders[5].value,
                                h.ThisIsSliders[6].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0x5C57),
                                GetEntityCoords(dw),
                                h.ThisIsSliders[4].value,
                                h.ThisIsSliders[5].value,
                                h.ThisIsSliders[6].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0x192A),
                                GetEntityCoords(dw),
                                h.ThisIsSliders[4].value,
                                h.ThisIsSliders[5].value,
                                h.ThisIsSliders[6].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0x3FCF),
                                GetPedBoneCoords(dw, 0x192A),
                                h.ThisIsSliders[4].value,
                                h.ThisIsSliders[5].value,
                                h.ThisIsSliders[6].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0xCC4D),
                                GetPedBoneCoords(dw, 0x3FCF),
                                h.ThisIsSliders[4].value,
                                h.ThisIsSliders[5].value,
                                h.ThisIsSliders[6].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0xB3FE),
                                GetPedBoneCoords(dw, 0x5C57),
                                h.ThisIsSliders[4].value,
                                h.ThisIsSliders[5].value,
                                h.ThisIsSliders[6].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0xB3FE),
                                GetPedBoneCoords(dw, 0x3779),
                                h.ThisIsSliders[4].value,
                                h.ThisIsSliders[5].value,
                                h.ThisIsSliders[6].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0x9995),
                                GetPedBoneCoords(dw, 0xB1C5),
                                h.ThisIsSliders[4].value,
                                h.ThisIsSliders[5].value,
                                h.ThisIsSliders[6].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0xB1C5),
                                GetPedBoneCoords(dw, 0xEEEB),
                                h.ThisIsSliders[4].value,
                                h.ThisIsSliders[5].value,
                                h.ThisIsSliders[6].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0xEEEB),
                                GetPedBoneCoords(dw, 0x49D9),
                                h.ThisIsSliders[4].value,
                                h.ThisIsSliders[5].value,
                                h.ThisIsSliders[6].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0x9995),
                                GetPedBoneCoords(dw, 0x9D4D),
                                h.ThisIsSliders[4].value,
                                h.ThisIsSliders[5].value,
                                h.ThisIsSliders[6].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0x9D4D),
                                GetPedBoneCoords(dw, 0x6E5C),
                                h.ThisIsSliders[4].value,
                                h.ThisIsSliders[5].value,
                                h.ThisIsSliders[6].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0x6E5C),
                                GetPedBoneCoords(dw, 0xDEAD),
                                h.ThisIsSliders[4].value,
                                h.ThisIsSliders[5].value,
                                h.ThisIsSliders[6].value,
                                255
                            )
                            local cH = GetPedBoneCoords(dw, 31086)
                            DrawMarker(
                                28,
                                cH.x,
                                cH.y,
                                cH.z + 0.06,
                                0.0,
                                0.0,
                                0.0,
                                0.0,
                                180.0,
                                0.0,
                                0.1,
                                0.1,
                                0.1,
                                255,
                                0,
                                0,
                                255,
                                false,
                                true,
                                2,
                                nil,
                                nil,
                                false
                            )
                        else
                            DrawLine(
                                GetPedBoneCoords(dw, 31086),
                                GetPedBoneCoords(dw, 0x9995),
                                h.ThisIsSliders[1].value,
                                h.ThisIsSliders[2].value,
                                h.ThisIsSliders[3].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0x9995),
                                GetEntityCoords(dw),
                                h.ThisIsSliders[1].value,
                                h.ThisIsSliders[2].value,
                                h.ThisIsSliders[3].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0x5C57),
                                GetEntityCoords(dw),
                                h.ThisIsSliders[1].value,
                                h.ThisIsSliders[2].value,
                                h.ThisIsSliders[3].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0x192A),
                                GetEntityCoords(dw),
                                h.ThisIsSliders[1].value,
                                h.ThisIsSliders[2].value,
                                h.ThisIsSliders[3].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0x3FCF),
                                GetPedBoneCoords(dw, 0x192A),
                                h.ThisIsSliders[1].value,
                                h.ThisIsSliders[2].value,
                                h.ThisIsSliders[3].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0xCC4D),
                                GetPedBoneCoords(dw, 0x3FCF),
                                h.ThisIsSliders[1].value,
                                h.ThisIsSliders[2].value,
                                h.ThisIsSliders[3].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0xB3FE),
                                GetPedBoneCoords(dw, 0x5C57),
                                h.ThisIsSliders[1].value,
                                h.ThisIsSliders[2].value,
                                h.ThisIsSliders[3].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0xB3FE),
                                GetPedBoneCoords(dw, 0x3779),
                                h.ThisIsSliders[1].value,
                                h.ThisIsSliders[2].value,
                                h.ThisIsSliders[3].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0x9995),
                                GetPedBoneCoords(dw, 0xB1C5),
                                h.ThisIsSliders[1].value,
                                h.ThisIsSliders[2].value,
                                h.ThisIsSliders[3].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0xB1C5),
                                GetPedBoneCoords(dw, 0xEEEB),
                                h.ThisIsSliders[1].value,
                                h.ThisIsSliders[2].value,
                                h.ThisIsSliders[3].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0xEEEB),
                                GetPedBoneCoords(dw, 0x49D9),
                                h.ThisIsSliders[1].value,
                                h.ThisIsSliders[2].value,
                                h.ThisIsSliders[3].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0x9995),
                                GetPedBoneCoords(dw, 0x9D4D),
                                h.ThisIsSliders[1].value,
                                h.ThisIsSliders[2].value,
                                h.ThisIsSliders[3].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0x9D4D),
                                GetPedBoneCoords(dw, 0x6E5C),
                                h.ThisIsSliders[1].value,
                                h.ThisIsSliders[2].value,
                                h.ThisIsSliders[3].value,
                                255
                            )
                            DrawLine(
                                GetPedBoneCoords(dw, 0x6E5C),
                                GetPedBoneCoords(dw, 0xDEAD),
                                h.ThisIsSliders[1].value,
                                h.ThisIsSliders[2].value,
                                h.ThisIsSliders[3].value,
                                255
                            )
                            local cH = GetPedBoneCoords(dw, 31086)
                            DrawMarker(
                                28,
                                cH.x,
                                cH.y,
                                cH.z + 0.06,
                                0.0,
                                0.0,
                                0.0,
                                0.0,
                                180.0,
                                0.0,
                                0.1,
                                0.1,
                                0.1,
                                255,
                                0,
                                0,
                                255,
                                false,
                                true,
                                2,
                                nil,
                                nil,
                                false
                            )
                            ResetEntityAlpha(dw)
                            SetEntityAlpha(dw, 0, true)
                        end
                    end
                end
            end
        else
            local dj = GetActivePlayers()
            for l = 1, #dj do
                local dv = dj[l]
                local dw = GetPlayerPed(dv)
                ResetEntityAlpha(dw)
            end
        end
        if bU.config["visual_npc"] then
            for an in EnumeratePeds() do
                local d4, d5 = GetActiveScreenResolution()
                local cC = GetEntityCoords(an)
                me = an ~= PlayerPedId()
                mr = an
                local cD = GetDistanceBetweenCoords(GetFinalRenderedCamCoord(), cC.x, cC.y, cC.z, true) * (1.1 - 0.05)
                if IsEntityOnScreen(an) then
                    if cD < 125 then
                        if me and mr and not IsEntityDead(an) and not IsPedAPlayer(an) then
                            SetDrawOrigin(cC.x, cC.y, cC.z, 0)
                            DrawRect(0.0, 0.0, 1075.2 / d4 / cD, 2376 / d5 / cD, 0, 0, 0, 90)
                            if HasEntityClearLosToEntity(PlayerPedId(), an, 19) then
                                local r, g, b = 90, 252, 3
                                DrawRect(-537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                                DrawRect(-537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                                DrawRect(537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                                DrawRect(537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                                DrawRect(
                                    (290 + 150 / 2) / d4 / cD,
                                    1190.6 / d5 / cD,
                                    350 / d4 / cD,
                                    1 / d5,
                                    r,
                                    g,
                                    b,
                                    255
                                )
                                DrawRect(
                                    (-290 - 150 / 2) / d4 / cD,
                                    1190.6 / d5 / cD,
                                    350 / d4 / cD,
                                    1 / d5,
                                    r,
                                    g,
                                    b,
                                    255
                                )
                                DrawRect(
                                    (290 + 150 / 2) / d4 / cD,
                                    -1190.6 / d5 / cD,
                                    350 / d4 / cD,
                                    1 / d5,
                                    r,
                                    g,
                                    b,
                                    255
                                )
                                DrawRect(
                                    (-290 - 150 / 2) / d4 / cD,
                                    -1190.6 / d5 / cD,
                                    350 / d4 / cD,
                                    1 / d5,
                                    r,
                                    g,
                                    b,
                                    255
                                )
                                local d6 = "NPC"
                                local x, y, z = table.unpack(GetEntityCoords(an))
                                bw(x, y, z - 0.8, d6, 255, 0, 212)
                            else
                                local r, g, b = 252, 3, 186
                                DrawRect(-537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                                DrawRect(-537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                                DrawRect(537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                                DrawRect(537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                                DrawRect(
                                    (290 + 150 / 2) / d4 / cD,
                                    1190.6 / d5 / cD,
                                    350 / d4 / cD,
                                    1 / d5,
                                    r,
                                    g,
                                    b,
                                    255
                                )
                                DrawRect(
                                    (-290 - 150 / 2) / d4 / cD,
                                    1190.6 / d5 / cD,
                                    350 / d4 / cD,
                                    1 / d5,
                                    r,
                                    g,
                                    b,
                                    255
                                )
                                DrawRect(
                                    (290 + 150 / 2) / d4 / cD,
                                    -1190.6 / d5 / cD,
                                    350 / d4 / cD,
                                    1 / d5,
                                    r,
                                    g,
                                    b,
                                    255
                                )
                                DrawRect(
                                    (-290 - 150 / 2) / d4 / cD,
                                    -1190.6 / d5 / cD,
                                    350 / d4 / cD,
                                    1 / d5,
                                    r,
                                    g,
                                    b,
                                    255
                                )
                                local d6 = "NPC"
                                local x, y, z = table.unpack(GetEntityCoords(an))
                                bw(x, y, z - 0.8, d6, 255, 0, 212)
                            end
                            ClearDrawOrigin()
                        end
                    end
                end
            end
        end
        if bU.config["visuals_corner"] then
            for an in EnumeratePeds() do
                local d4, d5 = GetActiveScreenResolution()
                local cC = GetEntityCoords(an)
                me = an ~= PlayerPedId()
                mr = IsPedAPlayer(an)
                local cD = GetDistanceBetweenCoords(GetFinalRenderedCamCoord(), cC.x, cC.y, cC.z, true) * (1.1 - 0.05)
                local dB = GetPedArmour(an) * 10.76200
                local aK = GetEntityHealth(an) * 5.38200
                local dC = 1250
                local dD = 1200
                if IsEntityOnScreen(an) then
                    if cD < 125 then
                        if me and mr and not IsEntityDead(an) then
                            SetDrawOrigin(cC.x, cC.y, cC.z, 0)
                            DrawRect(0.0, 0.0, 1075.2 / d4 / cD, 2376 / d5 / cD, 0, 0, 0, 90)
                            if HasEntityClearLosToEntity(PlayerPedId(), an, 19) then
                                local r, g, b = 255, 255, 255
                                DrawRect(-537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                                DrawRect(-537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                                DrawRect(537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                                DrawRect(537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                                DrawRect(
                                    (290 + 150 / 2) / d4 / cD,
                                    1190.6 / d5 / cD,
                                    350 / d4 / cD,
                                    1 / d5,
                                    r,
                                    g,
                                    b,
                                    255
                                )
                                DrawRect(
                                    (-290 - 150 / 2) / d4 / cD,
                                    1190.6 / d5 / cD,
                                    350 / d4 / cD,
                                    1 / d5,
                                    r,
                                    g,
                                    b,
                                    255
                                )
                                DrawRect(
                                    (290 + 150 / 2) / d4 / cD,
                                    -1190.6 / d5 / cD,
                                    350 / d4 / cD,
                                    1 / d5,
                                    r,
                                    g,
                                    b,
                                    255
                                )
                                DrawRect(
                                    (-290 - 150 / 2) / d4 / cD,
                                    -1190.6 / d5 / cD,
                                    350 / d4 / cD,
                                    1 / d5,
                                    r,
                                    g,
                                    b,
                                    255
                                )
                            else
                                local r, g, b = 255, 0, 0
                                DrawRect(-537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                                DrawRect(-537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                                DrawRect(537.6 / d4 / cD, -935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                                DrawRect(537.6 / d4 / cD, 935.6 / d5 / cD, 1 / d4, 500 / d5 / cD, r, g, b, 255)
                                DrawRect(
                                    (290 + 150 / 2) / d4 / cD,
                                    1190.6 / d5 / cD,
                                    350 / d4 / cD,
                                    1 / d5,
                                    r,
                                    g,
                                    b,
                                    255
                                )
                                DrawRect(
                                    (-290 - 150 / 2) / d4 / cD,
                                    1190.6 / d5 / cD,
                                    350 / d4 / cD,
                                    1 / d5,
                                    r,
                                    g,
                                    b,
                                    255
                                )
                                DrawRect(
                                    (290 + 150 / 2) / d4 / cD,
                                    -1190.6 / d5 / cD,
                                    350 / d4 / cD,
                                    1 / d5,
                                    r,
                                    g,
                                    b,
                                    255
                                )
                                DrawRect(
                                    (-290 - 150 / 2) / d4 / cD,
                                    -1190.6 / d5 / cD,
                                    350 / d4 / cD,
                                    1 / d5,
                                    r,
                                    g,
                                    b,
                                    255
                                )
                            end
                            if GetPedArmour(an) == 0 then
                                r, g, b = 75, 141 - (50 - GetPedArmour(an)), 173 - (100 - GetPedArmour(an))
                            else
                                r, g, b = 0, 178, 255
                            end
                            DrawRect(
                                -1078.2 / 2 / d4 / cD + dB / 2 / d4 / cD,
                                dC / d5 / cD + cD / 400 / cD,
                                dB / d4 / cD,
                                3 / d5,
                                r,
                                g,
                                b,
                                255
                            )
                            DrawRect(
                                -1078.2 / 2 / d4 / cD + aK / 2 / d4 / cD,
                                dD / d5 / cD + cD / 400 / cD,
                                aK / d4 / cD,
                                3 / d5,
                                0,
                                255,
                                0,
                                255
                            )
                            ClearDrawOrigin()
                        end
                    end
                end
            end
        end
        if bU.config["visuals_boxes"] then
            local dE = GetActivePlayers()
            for l = 1, #dE do
                local dw = GetPlayerPed(dE[l])
                bone = GetEntityBoneIndexByName(dw, "SKEL_HEAD")
                x, y, z = table.unpack(GetPedBoneCoords(dw, bone, 0.0, 0.0, 0.0))
                px, py, pz = table.unpack(GetGameplayCamCoord())
                if GetDistanceBetweenCoords(x, y, z, px, py, pz, true) < 1000.0 then
                    if dw ~= PlayerPedId() and IsEntityOnScreen(dw) and not IsPedDeadOrDying(dw) then
                        z = z + 0.9
                        local dF = GetDistanceBetweenCoords(x, y, z, px, py, pz, true) * 0.002 / 2
                        if dF < 0.0042 then
                            dF = 0.0042
                        end
                        retval, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
                        width = 0.00045
                        height = 0.0023
                        DrawRect(_x, _y, width / dF, 0.0015, 255, 255, 255, 200)
                        DrawRect(_x, _y + height / dF, width / dF, 0.0015, 255, 255, 255, 200)
                        DrawRect(_x + width / 2 / dF, _y + height / 2 / dF, 0.001, height / dF, 255, 255, 255, 200)
                        DrawRect(_x - width / 2 / dF, _y + height / 2 / dF, 0.001, height / dF, 255, 255, 255, 200)
                        health = GetEntityHealth(dw)
                        DrawRect(
                            _x - 0.00028 / dF,
                            _y + height / 2 / dF,
                            0.0016 / dF * 0.015,
                            height / dF,
                            0,
                            0,
                            0,
                            200
                        )
                        if GetEntityHealth(dw) <= 150 then
                            DrawRect(
                                _x - 0.00028 / dF,
                                _y + height / dF - GetEntityHealth(dw) / 175000 / dF,
                                0.0016 / dF * 0.015,
                                GetEntityHealth(dw) / 87500 / dF,
                                214,
                                172,
                                6,
                                255
                            )
                        else
                            DrawRect(
                                _x - 0.00028 / dF,
                                _y + height / dF - GetEntityHealth(dw) / 175000 / dF,
                                0.0016 / dF * 0.015,
                                GetEntityHealth(dw) / 87500 / dF,
                                0,
                                255,
                                0,
                                255
                            )
                        end
                        DrawRect(
                            _x - 0.00033 / dF,
                            _y + height / dF - GetPedArmour(dw) * 2 / 175000 / dF,
                            0.0016 / dF * 0.015,
                            GetPedArmour(dw) * 2 / 87500 / dF,
                            0,
                            178,
                            255,
                            255
                        )
                    end
                end
            end
        end
    end
end
Citizen["CreateThread"](cu["run_features"])
cu.menu_features = {
    ["unload_menu"] = function()
        cu["draw_menu"] = false
    end,
    ["bind_menu"] = function()
        local cy = bind()
        bU.vars.menuKey = cy
    end,
    ["quit_a"] = function()
        RestartGame()
    end,
    ["crash_a"] = function()

    end,
    ["gui_close"] = function()
        bU.active = not bU.active
    end,
    ["skel_colorv"] = function()
        h.ThisIsSliders[1].value, h.ThisIsSliders[2].value, h.ThisIsSliders[3].value = ColorPicker()
    end,
    ["skel_coloriv"] = function()
        h.ThisIsSliders[4].value, h.ThisIsSliders[5].value, h.ThisIsSliders[6].value = ColorPicker()
    end,
    ["lines_color"] = function()
        h.ThisIsSliders[10].value, h.ThisIsSliders[11].value, h.ThisIsSliders[12].value = ColorPicker()
    end,
    ["lines_colorno"] = function()
        h.ThisIsSliders[13].value, h.ThisIsSliders[14].value, h.ThisIsSliders[15].value = ColorPicker()
    end,
    ["bags_color"] = function()
        h.ThisIsSliders[16].value, h.ThisIsSliders[17].value, h.ThisIsSliders[18].value = ColorPicker()
    end,
    ["closestcar_color"] = function()
        h.ThisIsSliders[19].value, h.ThisIsSliders[20].value, h.ThisIsSliders[21].value = ColorPicker()
    end,
    ["hud_rgb"] = function()
        h.ThisIsSliders[22].value, h.ThisIsSliders[23].value, h.ThisIsSliders[24].value = ColorPicker()
        ReplaceHudColourWithRgba(
            116,
            h.ThisIsSliders[22].value,
            h.ThisIsSliders[23].value,
            h.ThisIsSliders[24].value,
            255
        )
    end,
    ["heal"] = function()
        SetEntityHealth(PlayerPedId(), 200)
    end,
    ["armour"] = function()
        SetPedArmour(PlayerPedId(), 100)
    end,
    ["self_revive"] = function()
        local k = cu["datastore"]["local_player"]["ped"]
        local a5 = cu["datastore"]["local_player"]["coords"]
        local a8 = cu["datastore"]["local_player"]["heading"]
        SetEntityCoordsNoOffset(k, a5.x, a5.y, a5.z, false, false, false, true)
        NetworkResurrectLocalPlayer(a5.x, a5.y, a5.z, a8, true, false)
        SetPlayerInvincible(k, false)
        TriggerEvent("playerSpawned", a5.x, a5.y, a5.z)
        ClearPedBloodDamage(k)
        StopScreenEffect("DeathFailOut")
    end,
    ["self_skin"] = function()
        _()
        a0("HATS", 64, 9)
        a0("GLASSES", 0, 0)
        a0("MASK", 51, 7)
        a0("TORSO", 22, 0)
        a0("LEGS", 15, 2)
        a0("HANDS", 44, 0)
        a0("SHOES", 7, 2)
        a0("SPECIAL2", 15, 0)
        a0("TORSO2", 14, 7)
    end,
    ["tptwp"] = function()
        local dG = GetFirstBlipInfoId(8)
        if DoesBlipExist(dG) then
            local dH = GetBlipInfoIdCoord(dG)
            for height = 1, 1000 do
                SetPedCoordsKeepVehicle(PlayerPedId(), dH["x"], dH["y"], height + 0.0)
                local dI, dJ = GetGroundZFor_3dCoord(dH["x"], dH["y"], height + 0.0)
                if dI then
                    SetPedCoordsKeepVehicle(PlayerPedId(), dH["x"], dH["y"], height + 0.0)
                    break
                end
                Citizen.Wait(0)
            end
        else
        end
    end,
    ["tpcoo"] = function()
        local x = w("X Coord", "", 10)
        local y = w("Y Coord", "", 10)
        local z = w("Z Coord", "", 10)
        SetEntityCoords(PlayerPedId(), tonumber(x), tonumber(y), tonumber(z))
    end,
    ["carry_all"] = function()
        for dK, dL in ipairs(GetActivePlayers()) do
            TriggerServerEvent(
                "CarryPeople:sync",
                GetPlayerPed(-1),
                "missfinale_c2mcs_1",
                "nm",
                "fin_c2_mcs_1_camman",
                "firemans_carry",
                0.15,
                -0.24,
                0.0,
                GetPlayerServerId(dL),
                100000,
                0.0,
                49,
                33,
                1
            )
            Wait(5000)
        end
    end,
    ["give_allwep"] = function()
        local dM = w("~r~WEAPON_ALL ~w~FOR GET ALL WEAPONS", "WEAPON_", 100)
        if dM == "WEAPON_ALL" then
            i()
        else
            GiveWeaponToPed(PlayerPedId(), GetHashKey(dM), 250, false, false)
        end
    end,
    ["esx_money"] = function()
        for l = 0, 25 do
            TriggerServerEvent("esx_vangelico_robbery:gioielli1")
        end
        for l = 0, 25 do
            TriggerServerEvent("lester:vendita")
        end
    end,
    ["th_all"] = function()
        for dK, dL in ipairs(GetActivePlayers()) do
            TriggerServerEvent(
                "CarryPeople:sync",
                GetPlayerPed(-1),
                "anim@gangops@hostage@",
                "perp_idle",
                "anim@gangops@hostage@",
                "victim_idle",
                0.15,
                -0.24,
                0.0,
                GetPlayerServerId(dL),
                100000,
                0.0,
                49,
                33,
                1
            )
            Citizen.Wait(200)
            TriggerServerEvent(
                "cmg3_animations:sync",
                GetPlayerPed(-1),
                "anim@gangops@hostage@",
                "perp_idle",
                "anim@gangops@hostage@",
                "victim_idle",
                0.15,
                -0.24,
                0.0,
                GetPlayerServerId(dL),
                100000,
                0.0,
                49,
                33,
                1
            )
            Citizen.Wait(50)
        end
    end,
    ["destroy_map"] = function()
        espiraco(GetHashKey("hw1_lod_08_09_16_17_18"))
        espiraco(GetHashKey("cs4_lod_01_slod3"))
        espiraco(GetHashKey("dt1_21_slod"))
        espiraco(GetHashKey("dt1_11_dt1_tower_lod"))
        espiraco(GetHashKey("id2_lod_00_ab_slod2"))
        espiraco(GetHashKey("dt1_lod_03_04_05_11"))
        espiraco(GetHashKey("kt1_lod_slod4"))
        espiraco(GetHashKey("ch2_lod3_slod3"))
        espiraco(GetHashKey("vb_lod_slod4"))
    end,
    ["vehicle_repair"] = function()
        SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
        SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
        SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
        SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
        Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    end,
    ["vehicle_spawn"] = function()
        local a4 = w("Vehicle name", "", 100)
        a3(a4, PlaceSelf, SpawnEngineOn)
    end,
    ["vehicle_flip"] = function()
        local dN = Citizen.InvokeNative(0x6094AD011A2EA87D, Citizen.InvokeNative(0xD80958FC74E988A6))
        Citizen.InvokeNative(0x49733E92263139D1, dN)
    end,
    ["vehicle_delete"] = function()
        DelVeh(GetVehiclePedIsUsing(PlayerPedId()))
    end,
    ["vehicle_color"] = function()
        h.ThisIsSliders[7].value, h.ThisIsSliders[8].value, h.ThisIsSliders[9].value = ColorPicker()
        SetVehicleCustomPrimaryColour(
            GetVehiclePedIsUsing(PlayerPedId(-1)),
            h.ThisIsSliders[7].value,
            h.ThisIsSliders[8].value,
            h.ThisIsSliders[9].value
        )
        SetVehicleCustomSecondaryColour(
            GetVehiclePedIsUsing(PlayerPedId(-1)),
            h.ThisIsSliders[7].value,
            h.ThisIsSliders[8].value,
            h.ThisIsSliders[9].value
        )
    end,
    ["vehicle_warp"] = function()
        local cA = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 15.0, 0, 70)
        if not DoesEntityExist(cA) then
            return
        end
        local dO = -1
        TaskWarpPedIntoVehicle(PlayerPedId(), cA, dO)
        Citizen.Wait(100)
        SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
        SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
        SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
        SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
        Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    end,
    ["weapon_refill"] = function()
        for l = 1, #bt do
            AddAmmoToPed(PlayerPedId(), GetHashKey(bt[l]), 40)
        end
    end,
    [""] = function()
    end
}
cu["handle_dragging"] = function()
    bU.dragging.state = true
    if bU.dragging.state then
        bU.cursor.x, bU.cursor.y = bT.natives.GetNuiCursorPosition()
        bU[bU.vars.currentMenu].position.x = bU.cursor.x - 38
        bU[bU.vars.currentMenu].position.y = bU.cursor.y - 15
    end
    bU.dragging.state = false
end


--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
--  _____           _              _     __  __           _     
--  |_   _|         | |            | |   |  \/  |         | |    
--    | |  _ __  ___| |_ __ _ _ __ | |_  | \  / | ___   __| |____
--    | | | '_ \/ __| __/ _` | '_ \| __| | |\/| |/ _ \ / _` |_  /
--   _| |_| | | \__ \ || (_| | | | | |_  | |  | | (_) | (_| |/ / 
--  |_____|_| |_|___/\__\__,_|_| |_|\__| |_|  |_|\___/ \__,_/___|                                                           

--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

-- How to use the menu ? You need a lua executor to inject it, the best is redENGINE you can buy here: www.instant-modz.com

-- www.instant-modz.com / Buy the best FiveM Lua Executor to use this menu
-- www.instant-modz.com / Buy the best FiveM Lua Executor to use this menu
-- www.instant-modz.com / Buy the best FiveM Lua Executor to use this menu


--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
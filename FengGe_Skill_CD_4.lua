--------#Define global variable----------------------------------------------------------------------------------------------------------------------------------------------
  ------------Key_Setting_mouse-------------
    tb_key = 6                              -- Use mousekey [4] to pickup item quickly
    boom_key_mouse = 9
  -----------Key_Setting_keyboard----------
    test_key_on = 1
    test_key_off = 2
  -------------initialization--------------
    auto_RL_enable = true
    Change_Other_Macro_capslock_off = true  -- Turn off the capslock when change the macro
    Mouse_R_D_click_enable = true           -- Mouse right key double cilck enable
    Off_Key_D_Click_enable = true           -- Off key double click enable
    MacroKey_2th_Press = 1                  -- [0] = Do nothing [1] = 1X or 4X mode change [2] = Close the Macro
    off_key = 0                             -- System will be able to judge the value of key [off] 

    Gun_Past = nil
    Gun_Past_4 = false
    offret = 0

    Energy = 100
    Energy_Recovery_Rate = 10
    Energy_Recovery_Time = 1000
    Cobom_1_Point = 0
    Cobom_2_Point = 0
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ---------------Key_Mapping---------------
Key_Mapping = {                 -- [5] = "CMBO_A"  -- [5] is key and "CMBO_A" is value in Key_Mapping Table
    [4]     = "CMBO_A",
    [5]     = "off"
}
  -----------------------------------------

mouse_map={ 
    ["mouseleft"] = 1, 
    ["mousemid"] = 2, 
    ["mouseright"] = 3, 
} 
--SUB_FUNCTION_START---------------------------------------------------------------------------------------------------------------------------------------------------------

  ----------show massage function----------
function Show_Massage(Msg_F, val, Msg_R)
    if val ~= nil then 
        if Msg_R ~= nil then
            OutputLogMessage("%s %s %s" .. string.char(10), tostring(Msg_F), tostring(val), tostring(Msg_R))
        else
            OutputLogMessage("%s %s" .. string.char(10), tostring(Msg_F), tostring(val))
        end
    else
        OutputLogMessage(Msg_F .. string.char(10))
    end
end
  -----------------------------------------
  ------------Modifier function------------
Modifier_Table = { 
    ["shift"] = function() return IsModifierPressed("shift") end,
    ["lshift"] = function() return IsModifierPressed("lshift") end,
    ["rshift"] = function() return IsModifierPressed("rshift") end,
    ["ctrl"] = function() return IsModifierPressed("ctrl") end,
    ["lctrl"] = function() return IsModifierPressed("lctrl") end,
    ["rctrl"] = function() return IsModifierPressed("rctrl") end,
    ["alt"] = function() return IsModifierPressed("alt") end,
    ["lalt"] = function() return IsModifierPressed("lalt") end,
    ["ralt"] = function() return IsModifierPressed("ralt") end,
    ["numlock"] = function() return IsKeyLockOn("numlock") end,
    ["capslock"] = function() return IsKeyLockOn("capslock") end,
    ["scrolllock"] = function() return IsKeyLockOn("scrolllock") end,
}

function is_on(flag, true_callback, false_callback) 
    if Modifier_Table[flag]() then 
        if true_callback ~= nil then 
            true_callback() 
        end 
        return true 
    else 
        if false_callback ~= nil then 
            false_callback() 
        end 
        return false 
    end 
end 

function is_off(flag, true_callback, false_callback) 
    return not is_on(flag, false_callback, true_callback) 
end
  -----------------------------------------
function last_key_time(key_code) 
    last_key=key_times[key_code] 
    if (last_key == nil) then 
        -- return a large negative number to prevent cooldown 
        return -10000000 
    end 
    return last_key 
end 

function cd_click(key_code, cd) 
    curr_time = GetRunningTime() 
    if curr_time - last_key_time(key_code) >= cd then 
        click(key_code) 
        key_times[key_code] = GetRunningTime() 
        return true 
    else 
        return false 
    end 
end 

function check_cooldown(key_code, cd) 
    curr_time = GetRunningTime() 
    if curr_time - last_key_time(key_code) >= cd then 
        return true 
    else 
        return false 
    end 
end 

function click(...) 
    for i, key in ipairs(arg) do 
        if mouse_map[key] == nil then 
            PressAndReleaseKey(key)
            Show_Massage(">>>>> ...  [VA][", key, "]") 
        else 
            PressAndReleaseMouseButton(mouse_map[key]) 
        end 
    end 
end 
  ------------Special function-------------
function MacroKey_2th_Press_Mode_choice()
    if  MacroKey_2th_Press == 1 then 
        if is_on("scrolllock") then     -- double click ["gun code"] button change the 1X or 4X state
            PressAndReleaseKey("capslock")
        end
    elseif MacroKey_2th_Press == 2 then  -- double click ["gun code"] button turn off the Macro
        Gun = Skill_Table["off"]        
        Show_Massage(">>turn [", Gun["Skill_Code"], "]")
        Gun["Function"]()
        if is_on("scrolllock") then
            PressAndReleaseKey("scrolllock")
            if is_on ("capslock") then
                PressAndReleaseKey("capslock")
            end
        end
    elseif MacroKey_2th_Press == 0 then
        Show_Massage(">>>do nothing...")
    end
end


function Initialization_show_message()
    for key,value in pairs(Key_Mapping) do
        if value == "off" and type(key) == "number" then
            off_key = key
            Show_Massage(">>>The    [off]   Key Is  >>>[",off_key,"]")
        else 
            OutputLogMessage(">>>Mapping    :[  %s  ]   >>> [   %s  ]" .. string.char(10), tostring(key), tostring(value))
        end
    end
    Show_Massage("----------------------------------------------------------------------------------")
    OutputLogMessage(">AUTORL         COMOC            MRDCE             OKDCE             MK2P<" .. string.char(10))
    OutputLogMessage(">[%s]" .. string.char(9),tostring(auto_RL_enable))
    OutputLogMessage("[%s]" .. string.char(9),tostring(Change_Other_Macro_capslock_off))
    OutputLogMessage("[%s]" .. string.char(9),tostring(Mouse_R_D_click_enable))
    OutputLogMessage("[%s]" .. string.char(9),tostring(Off_Key_D_Click_enable))
    OutputLogMessage("[%s]" .. "<    " .. string.char(10),tostring(MacroKey_2th_Press))
    Show_Massage("----------------------------------------------------------------------------------")
    Show_Massage(">>> Program initialization success , Enjoy yourself  !" .. string.char(10) .. ">>>                                          Design by FengGe" .. string.char(10))
end
  ------------Fire_Mode_Choice-------------
function Fire_Mode_Choice(event, arg)
    Fire_key = arg
    if is_on("capslock") then

    else
        if Gun.Gun_Mode == "Single_Mode" then
            if Strafe_1X_S ~= nil then
                Strafe_1X_S(event, arg)         -- 1X strafe [single gun] mode
            end
        end
    end
end
  ---------------Fire_Mode----------------

function Strafe_1X_S(event,arg)                                 -- 1X strafe [single gun] mode
    if is_off("alt") then
        Init_1XS_MReleasedHandler()
        SetMKeyState(3)
    end
end

function Init_1XS_MReleasedHandler()
    local n = 0
    local s = 1
    local key_P = false
    Fire_cycle = function(event,arg)
        if event == "M_RELEASED" and arg == 3 then
            if (n % Gun["Press_Step"] == 1) then
                local Skill_List = Gun["Skill_List"][s]
                if Skill_List[3] ~= 0 then
                    if (check_cooldown(Skill_List[1], Skill_List[2]) == false and key_P == false) then
                        s = s + 1
                    elseif (check_cooldown(Skill_List[1], Skill_List[2]) and key_P == false) then
                        PressKey(Skill_List[1])
                        Show_Massage("[V][", Skill_List[1], "]")
                        key_P = true
                        key_times[Skill_List[1]] = GetRunningTime() 
                    elseif (key_P == true and check_cooldown(Skill_List[1], Skill_List[3])) then
                        ReleaseKey(Skill_List[1])
                        Show_Massage("[A][", Skill_List[1], "]")
                        key_P = false
                        key_times[Skill_List[1]] = GetRunningTime()
                        s = s + 1
                        n = 50
                    end
                elseif Skill_List[3] == 0 then
                    if cd_click(Skill_List[1], Skill_List[2]) then
                        n = 50
                    end
                    s = s + 1                
                end
            end
            Sleep(Gun["Interval_S"])
            n = n + 1 
            if s > #Gun["Skill_List"] then
                s = 1
            end
            if (is_off("alt")) and (Key_Tab[1] == true or (Fire_key ~= nil and Key_Tab[Fire_key] == true)) then
                SetMKeyState(3)
            end
        end
    end
end

-----------Gun_Ratio_Calculate----------

function Int(x)
    if x <= 0 then
       return math.ceil(x)
    end
    if math.ceil(x) == x then
       x = math.ceil(x)
    else
      x = math.ceil(x) - 1
    end
    return x
 end

-----------------------------------------
function Load_Skill_Table()  -- Guess yourself what to do whih it
    Skill_Table["CMBO_A"] = {
        Skill_Code = "CMBO_A",
        Gun_Mode = "Single_Mode",
        Interval_S = 10,
        Press_Step = 100,
        Skill_List = {
            {"Q",7700,0},
            {"W",4500,3000},
            {"E",5400,1800},
            {"R",1800,0},
            {"T",5400,2300},
            {"X",8400,0},
            {"C",12000,2000},
            {"V",8800,0},
        }
    }
end
  -----------------------------------------
  -- {KeyBoard_Key,CD,CD_Last,Energy_Cost,Combo_Cost_1,Combo_Cost_2,Buff_Effect},
  -----------------------------------------
function anchor_Function(event, arg)                -- Enhancement function
    if event == "MOUSE_BUTTON_PRESSED" then
        if arg == tb_key or (arg == 1 and is_on("alt") and is_on("shift")) then                       -- Auto pick up the item

            return true

        elseif arg ~= 2 then
            local key = Modifier_Arg(arg)
            if  key == boom_key_mouse then
                return true
            end
        end
    end
end

  ----------Modifier_Arg-------------------
function Modifier_Arg(arg)                                      -- The combination of Key  [alt & ctrl & shift]
    local key = arg
    local key_ret = false
    if is_on("alt") then
        key = "a" .. tostring(key)
        key_ret = true
    end
    if is_on("shift") then
        key = "s" .. tostring(key)
        key_ret = true
    end
    if is_on("ctrl") then
        key = "c" .. tostring(key)
        key_ret = true
    end
    if key_ret == true then
        Show_Massage(">>>The combination of Key code is: ",key)
    end
    return key
end
  -----------------------------------------

  --SUB_FUNCTION_END---------------------------------------------------------------------------------------------------------------------------------------------------------
  --MAIN_FUNCTION_START---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnEvent(event, arg)                -- Event main function
    if event == "PROFILE_ACTIVATED" then    -- Initialization Profile
        EnablePrimaryMouseButtonEvents(1)   -- Enable MouseButton(Left) event
        SetBacklightColor(0,0,0)            -- Mouse Color
        Gun = nil
        Skill_Table = {}                      -- Creat the Gun table
        key_times={}
        key_combo={}
        Skill_Table["off"] = {                -- Add mode[off] table
            Skill_Code = "turn_off",
            Function = function()
                Gun = nil
                Fire_cycle = nil
            end
        }
        Load_Skill_Table()                    -- Add gun data into Gun table(include <CMBO_AA4> <M416> <UMP9> <SKS> <AKM> <SCAR> & <SCARL_S_5 mode>)
        Fire_cycle = nil
        Fire_key = nil
        Initialization_show_message()
        Key_Tab = {}
    end

    if event == "G_PRESSED" then    -- The keyboard G key pressed
        if arg == test_key_on then  -- Test gun mode[On]

        end
        if arg == test_key_off then -- Test gun mode[Off]

        end
    end

    if event == "G_RELEASED" then   -- The keyboard G key released

    end
        -------------------------------------------  
    if event == "MOUSE_BUTTON_PRESSED" then     
        Key_Tab[arg] = true

    end
        -------------------------------------------      
    if event == "MOUSE_BUTTON_RELEASED" then
        Key_Tab[arg] = false

    end
        -------------------------------------------  

    if anchor_Function ~= nil and anchor_Function(event, arg) == true then
        Show_Massage(">>>Start Advanced Function[v]")
    elseif arg == 1 then
        if (event == "MOUSE_BUTTON_PRESSED" and Gun ~= nil) then
            Fire_Mode_Choice(event, arg)
        end
    elseif arg == 2 and event == "MOUSE_BUTTON_PRESSED"  then                           -- When the [mouse right] key is [pressed] the Macro will [calculate] the time form [key released last time] to [key pressed this time] automatically


    elseif arg == 2 and event == "MOUSE_BUTTON_RELEASED" then                           -- Relesae ctrl key exit 4X single mode


    elseif (arg > 2 and event == "MOUSE_BUTTON_PRESSED") then                           -- When the [Mouse key in Mapping] is [pressed] the Macro will [choice] the Gun data form Gun table
        local prev = Gun
        local key = Modifier_Arg(arg)
        Show_Massage(">>>",Key_Mapping[key])
        if Key_Mapping[key] ~= nil then
            Gun = Skill_Table[Key_Mapping[key]] or Gun
            if (prev ~= Gun) then
                Show_Massage(">>>load [", Gun["Skill_Code"], "]")
                if (is_on("capslock") and Change_Other_Macro_capslock_off == true) then
                    PressAndReleaseKey("capslock")
                end
                if (Gun["Function"] ~= nil) then
                    Gun["Function"]()
                    if Gun == nil then                                                     -- The indicator light[Scrolllock] will light up when the Macro run
                        if is_on("scrolllock") then PressAndReleaseKey("scrolllock") end
                    end
                else
                    if is_off("scrolllock") then PressAndReleaseKey("scrolllock") end
                end
            else
                MacroKey_2th_Press_Mode_choice()
            end
        end
    end
    if Fire_cycle ~= nil then
        Fire_cycle(event, arg)
    end
end
  --MAIN_FUNCTION_END---------------------------------------------------------------------------------------------------------------------------------------------------------
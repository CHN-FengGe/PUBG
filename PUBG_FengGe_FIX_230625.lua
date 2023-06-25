----#Define global variable-----------------------------------------------------------------------------------------------------------------------------------
  ------------Key_Setting_mouse-------------
    PickUp_Key = 4                            -- Use mousekey [4] to pickup item quickly
    Aim_Hold_Key = 5
    Auto_right_key = 11                       -- Auto Right tilt
    Auto_left_key = 10                        -- Auto Left tilt
    boom_key_mouse = "a5"                     -- Use keyboard [shift] and mousekey [8] to ... to hear the whisper of wind, the song of cloud, to feel the embrace of the sky ...fuck!
    Aim_before_key = 3                        -- Use keyboard [shift] and mousekey [7] to stop the car and jump off
    Off_RL_Enable = "c6"
    Mark_Key = "a1"
    Jump_Key = "6"
    QE_Auto_Key_On_Off = 9
  -----------Key_Setting_keyboard----------
    QE_Auto_Key_On = 1
    QE_Auto_Key_Off = 2
    Test_key_on = "s1"
    Test_key_off = "s2"
    Change_Load_Key = 4
    M1_Save_Key = "c1"
    M2_Save_Key = "c2"
    Gun_Clear_Key = "s4"
  -----------------------------------------
    Aim_Key = "c"
    Medicine_key = "9"
    Ctrl_shift_key = "p"
    Left_Tilt = "q"
    Right_Tilt = "e"
    Item_Key = "i"
    Mark_Keyboard_Key = "j"
  -------------initialization--------------
    Auto_right = false
    Auto_left = false
    Mode_Special = false
    Auto_RL_enable = true
    Change_Other_Macro_capslock_off = true      -- Turn off the capslock when change the macro
    Mouse_R_D_click_enable = true               -- Mouse right key double cilck enable
    Off_Key_D_Click_enable = true               -- Off key double click enable
    MacroKey_2nd_Press = 1                      -- [0] = Do nothing [1] = 1X or 4X mode change [2] = Close the Macro
    Off_key = 0                                 -- System will be able to judge the value of key [off] 
    RL_key = 0
    LR_Key = 0
    Time_MR_Down = 0
    Time_MR_Up = 0
    Time_M6_Down = 0
    Time_M6_Up = 0
    Gun_test = 0
    Gun_Past = nil
    Gun_Past_4 = false
    Off_ret = 0
    B_mod = 0
    Aim_mode = false
    Aim_sign = 0
    Ctrl_G5_sign = false
    Gun_M1 = nil
    Gun_4X_M1 = false
    Gun_ALL1 = false
    Gun_M2 = nil
    Gun_4X_M2 = false
    Gun_ALL2 = false
    Gun_First = true
    Gun_M_Enable = false
    QE_Auto_Mode = false
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ---------------Key_Mapping---------------
Key_Mapping = {                 
    ["s4"]  = "M762",           -- ["s4"] = "M762" ---> [Shift]+[4] is key and "M762" is value in Key_Mapping Table
    ["a4"]  = "M762_SSS", 

    [6]     = "off",
    ["a6"]  = "AKM",
    ["s6"]  = "m16",

    [8]     = "M4",             -- [8] = "M4" --->  [8] is key and "M4" is value in Key_Mapping Table
    ["a8"]  = "M762_S_5",
    ["s8"]  = "M416_S_10",

    [7]     = "SCAR_L",
    ["a7"]  = "K2",      
    ["s7"]  = "MK47_S_10",
}
  -----------------------------------------
Keyboard_Mapping = {
    [6] = "MK12_SSS",   
    ["s6"] = "MINI_SSS",
    ["a6"] = "VKT",

    [7] = "SLR_SSS",
    ["a7"] = "SKS_SSS",

    [8] = "M16A4_SSS", 

    [9] = "MK47_SSS", 
    ["a9"]  = "VSS",
}
----------------Ratio_Setting--------------
  Resolution_Ratio = 1          --ROG 2560x1440 [165Hz]
  -----------------------------------------
  AKM_Ratio = 1
  M16A4_Ratio = 1.1
  M16A4_SSS_Ratio = 1.3
  M416_Ratio = 1
  K2_Ratio = 0.99
  M416_S_5_Ratio = 1
  M416_S_10_Ratio = 1.3
  SCAR_L_Ratio = 0.93
  SCARL_S_5_Ratio = 1.22
  M762_Ratio = 1.23
  M762_S_5_Ratio = 1
  M762_SSS_Ratio = 1.5
  MK47_S_10_Ratio = 1.4
  MK47_SSS_Ratio = 1.3
   -----------
  SKS_Ratio = 1.7
  VSS_Ratio = 2
  SLR_SSS_Ratio = 1
  SKS_SSS_Ratio = 1
  MINI_SSS_Ratio = 1.9
  MK12_SSS_Ratio = 0.93
  VKT_Ratio = 0.6
--SUB_FUNCTION_START---------------------------------------------------------------------------------------------------------------------------------------------------------
  ----------Show_massage_function----------
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
  -----------------------------------------
function is_on(flag) 
    if Modifier_Table[flag]() then 
        return true 
    else 
        return false 
    end 
end 
  -----------------------------------------
function is_off(flag) 
    return not is_on(flag) 
end
  -----------------------------------------
function Exact_Delay(Time)
    local Time_Exact = GetRunningTime()
    while GetRunningTime() - Time_Exact < Time do

    end
end
  --------Initialization GunData-----------
function Calculate_GunData(obj,gunmode)
    local Gun_Data = {}
    local gun = gunmode
    Show_Massage("",gunmode)
    local n = 1
    for i,v in pairs(obj) do
        if (type(v) == "number") then
            Gun_Data[n] = v
            n = n + 1
        else
            local start = string.find(v,"x")
            if (start == nil) then
                Gun_Data[n] = tonumber(v)
                n = n + 1
            else
                local Data = tonumber(string.sub(v,1,start - 1))
                local T = tonumber(string.sub(v,start + 1))
                while (T > 0) do
                    Gun_Data[n] = Data
                    n = n + 1
                    T = T - 1
                end
            end
        end
    end
    return Gun_Data
end
  -----------------------------------------
function Calculate_SingleGunData(obj)
    local Gun_Data = {}
    local n = 1
    for i,v in pairs(obj.Ball_Data) do
        local decompose = v / obj.Press_Step
        for t = 1,obj.Press_Step do
            Gun_Data[n] = decompose
            n = n + 1
        end
    end
    obj.Ball_Data = Gun_Data
    obj.Interval_S = obj.Interval_S / obj.Press_Step
end
  ------------Special function-------------
function MacroKey_2nd_Press_Mode_choice()
    Off_ret = 0
    if  MacroKey_2nd_Press == 1 then 
        if is_on("scrolllock") then    -- double click ["gun code"] button change the 1X or 4X state
            if is_on("capslock") then
                Gun_Past_4 = false
            else
                Gun_Past_4 = true
            end
            Show_Massage("4X state is [",Gun_Past_4,"]")
            PressAndReleaseKey("capslock")
        end
    elseif MacroKey_2nd_Press == 2 then  -- double click ["gun code"] button turn off the Macro
        if is_on("capslock") then
            Gun_Past_4 = true
        else
            Gun_Past_4 = false
        end
        Show_Massage("4X state is [",Gun_Past_4,"]")
        Gun = Gun_Table["off"]        
        Show_Massage(">>turn [", Gun["Gun_Code"], "]")
        Gun["Function"]()
        if is_on("scrolllock") then
            PressAndReleaseKey("scrolllock")
            if is_on ("capslock") then
                PressAndReleaseKey("capslock")
            end
        end
    elseif MacroKey_2nd_Press == 0 then
        Show_Massage(">>>Do nothing...")
    end
end
  -----------------------------------------
function Mouse_R_Double_Click()  -- Mouse right key double click time <= 100ms run this function
    --PressAndReleaseKey(Jump_Key)
    --Show_Massage(">>>Jump_key is pressed")
    --[[if Auto_right == true or Auto_left == true then
        Auto_right = not Auto_right
        if Auto_right == true then
            MoveMouseRelative(120,0)
            Exact_Delay(20)
            MoveMouseRelative(-120,0)
        end
        Exact_Delay(20)
        Auto_left = not Auto_left
        if Auto_left == true then
            MoveMouseRelative(-120,0)
            Exact_Delay(20)
            MoveMouseRelative(120,0)
        end        
    end]]--
end
  -----------------------------------------
function Off_Key_Double_Click()  -- Macro [off] key double click time <= 100ms run this function
    PressAndReleaseKey(Medicine_key)
    Show_Massage(">>>Medicine_key is pressed")
end
  -----------------------------------------
function RL_Key_Press()
    if Auto_left == true and Auto_right == false then
        PressKey(Left_Tilt)
        Show_Massage(">>>Q pressed")
        RL_key = 1
    end
    if Auto_left == false and Auto_right == true then
        PressKey(Right_Tilt) 
        Show_Massage(">>>E pressed")
        RL_key = 1
    end
end
  -----------------------------------------
function RL_Key_Release()
    if Auto_left == true and Auto_right == false then                           -- exit Auto tilt
        ReleaseKey(Left_Tilt)
        Show_Massage(">>>Q Released")
        RL_key = 0
    end
    if Auto_left == false and Auto_right == true then
        ReleaseKey(Right_Tilt) 
        Show_Massage(">>>E Released")
        RL_key = 0
    end
end
  -----------------------------------------
function Initialization_show_message()
    for key,value in pairs(Key_Mapping) do
        if value == "off" and type(key) == "number" then
            Off_key = key
            Show_Massage(">>>The    [off]   Key Is  >>>[",Off_key,"]")
        else 
            OutputLogMessage(">>>Mapping    :[  %s  ]   >>> [   %s  ]" .. string.char(10), tostring(key), tostring(value))
        end
    end
    Show_Massage("----------------------------------------------------------------------------------")
    OutputLogMessage(">AUTORL         COMOC            MRDCE             OKDCE             MK2P<" .. string.char(10))
    OutputLogMessage(">[%s]" .. string.char(9),tostring(Auto_RL_enable))
    OutputLogMessage("[%s]" .. string.char(9),tostring(Change_Other_Macro_capslock_off))
    OutputLogMessage("[%s]" .. string.char(9),tostring(Mouse_R_D_click_enable))
    OutputLogMessage("[%s]" .. string.char(9),tostring(Off_Key_D_Click_enable))
    OutputLogMessage("[%s]" .. "<    " .. string.char(10),tostring(MacroKey_2nd_Press))
    Show_Massage("----------------------------------------------------------------------------------")
    Show_Massage(">>> Program initialization success , Enjoy yourself  !" .. string.char(10) .. ">>>                                          Design by FengGe" .. string.char(10))
end
--------------Fire_Mode_Choice-------------
function Fire_Mode_Choice(event, arg)
    B_mod = 0
    Fire_key = arg
    if Gun.Gun_Mode == "Single_Mode" and Gun.Gun_Special_Mode ~= "Random" then
        ReleaseMouseButton(1)
    end
    if IsMouseButtonPressed(3) then
        Strafe_4X_SSS(event, arg)
    else
        if Gun.Gun_Mode == "Single_Mode" then
            Strafe_1X_S(event, arg)         -- 1X strafe [single gun] mode
        else
            PressKey(Aim_Key)
            Strafe_1X(event, arg)           -- 1X strafe [full-automatic] mode
            ReleaseKey(Aim_Key)
        end
    end
end
  ---------------Fire_Mode-----------------
function Strafe_1X(event, arg)                                  -- 1X strafe [full-automatic] mode
    local Press_Step = 1
    while (IsMouseButtonPressed(1) and not is_on("alt")) do
        local Ball_Data = Gun["Ball_Data"][Press_Step]
        Ball_Data = Gun_Ratio_Calculate(Ball_Data)
        if Press_Step < #Gun["Ball_Data"] then
            Press_Step = Press_Step + 1 
        end
        Show_Massage("move distance is : [ ",Ball_Data," ]")
        MoveMouseRelative(Gun_test, Ball_Data)
        Exact_Delay(Gun["Interval"])
    end
end
  -----------------------------------------
function Strafe_1X_S(event,arg)                                 -- 1X strafe [single gun] mode
    ReleaseMouseButton(1)
    Init_1XS_MReleasedHandler()
    SetMKeyState(1)
end
  -----------------------------------------
function Init_1XS_MReleasedHandler()
    local n = 0
    local Ball_Data = 0
    Fire_cycle = function(event,arg)
        if event == "M_RELEASED" and arg == 1 then
            if n ~= 0 then
                Ball_Data = Gun["Ball_Data"][n] or Gun["Ball_Data"][#Gun["Ball_Data"]]
            else
                Ball_Data = 0
            end
            Ball_Data = Gun_Ratio_Calculate(Ball_Data)
            Show_Massage("N is [",n,"]")
            n = n + 1
            Show_Massage("timesub is [",time_sub,"]")
            MoveMouseRelative(Gun_test, Ball_Data)
            if Gun.convert == true or (n % Gun["Press_Step"] == 1 and n > 1) then
                Show_Massage(">>> biubiubiu")
                PressAndReleaseMouseButton(1)
            end
            Exact_Delay(Gun["Interval_S"])
            Show_Massage(">>> [Delay]")
            if Key_Tab[1] == true or (Fire_key ~= nil and Key_Tab[Fire_key] == true) then
                SetMKeyState(1)
            end
        end
    end
end
  -----------------------------------------
function InitStrafeMReleasedHandler()
    local n = 0
    local Ball_Data = 0
    ReleaseMouseButton(1)
    Fire_cycle = function(event,arg)
        if event == "M_RELEASED" and arg == 1 then
            if n ~= 0 then
                Ball_Data = Gun["Ball_Data"][n] or Gun["Ball_Data"][#Gun["Ball_Data"]]
            else
                Ball_Data = 0
            end
            Ball_Data = Gun_Ratio_Calculate(Ball_Data)
            n = n + 1
            Show_Massage("move distance is : [ ",Ball_Data," ]")
            MoveMouseRelative(Gun_test, Ball_Data)
            if Gun.convert == true or (n % Gun["Press_Step"] == 1 and n > 1) then
                PressAndReleaseMouseButton(1)
            end
            Exact_Delay(Gun["Interval_S"])
            if Key_Tab[1] == true or (Fire_key ~= nil and Key_Tab[Fire_key] == true) then
                SetMKeyState(1)
            end
        end
    end
end
  ----------------------------------------
function InitStrafeMReleasedHandler_SP3()
    local n_SP3 = 1
    duration_SP3 = Gun["Gun_Up_Time"]
    Press_Step_SP3 = Gun["Press_Step"] or 8
    Interval_SP3 = duration_SP3 / Press_Step_SP3
    local Sub_Time = Gun["Gun_Down_Time"] - Gun["Gun_Up_Time"]
    local Acc = 100 * Gun["Gun_Down_Movw_Up"]/(Sub_Time * Sub_Time)
    Sub_Time_SP3 = Int(Sub_Time / 10)
    local Move_All_New = 0
    local Move_All_Last = 0
    local m = 1
    Fire_cycle = function(event,arg)
        if (event == "M_RELEASED" and arg == 1) and IsMouseButtonPressed(1) then
            local Time_Last = GetRunningTime()
            if Key_Tab[2] == true then
                local Time_Now = GetRunningTime()
                local Time_Sub = Time_Now - Time_Last
                Ball_Data = Gun["Ball_Data"][n_SP3] or Gun["Ball_Data"][#Gun["Ball_Data"]]
                Ball_Data = Gun_Ratio_Calculate(Ball_Data)
                for i = 1, Press_Step_SP3 do  
                    MoveMouseRelative(Gun_test, Ball_Data)
                    Exact_Delay(Interval_SP3)
                    n_SP3 = n_SP3 + 1
                end
                Time_Now = GetRunningTime()
                Time_Sub = Time_Now - Time_Last
                Show_Massage("MID Time_Sub is [",Time_Sub,"]")
                while Time_Sub < Gun["Gun_Up_Time"] and IsMouseButtonPressed(3) do
                    Exact_Delay(10)
                    Time_Now = GetRunningTime()
                    Time_Sub = Time_Now - Time_Last
                end
                while m <= Sub_Time_SP3 and IsMouseButtonPressed(3) do
                    if  IsMouseButtonPressed(1) then
                        ReleaseMouseButton(1)
                        PressMouseButton(1)
                        SetMKeyState(1)
                        SetMKeyState(1)
                        break
                    else
                        Move_All_New =  Acc * (m * m)
                        Show_Massage("Move_All_New is [",Move_All_New,"]")
                        local Move_Delta = Move_All_New - Move_All_Last
                        Show_Massage("Move_Delta is [",Move_Delta,"]")
                        local Ball_Distance = Gun_Ratio_Calculate(Move_Delta)
                        MoveMouseRelative(0, -Ball_Distance)
                        Exact_Delay(10)
                        Move_All_Last = Move_All_New
                        m = m + 1                        
                        Time_Now = GetRunningTime()
                        Time_Sub = Time_Now - Time_Last
                    end
                end
            end
        end
    end
end
  ------------Special GunFire-------------
function Strafe_4X_SSS(event, arg)                              -- 4X strafe Special mode
    if Gun.Gun_Special_Mode == "Random" then   
        InitStrafeMReleasedHandler_SP3()
        SetMKeyState(1)
    else
        if Gun.Gun_Mode == "Single_Mode" then                       -- 4X strafe [single gun] mode
            InitStrafeMReleasedHandler()
            SetMKeyState(1)
        else                                                        -- 4X strafe [full-automatic] gun
            local Press_Step = 1
            while (IsMouseButtonPressed(1) and not is_on("alt")) do
                local Ball_Data = Gun["Ball_Data"][Press_Step]
                Ball_Data = Gun_Ratio_Calculate(Ball_Data)
                if Press_Step < #Gun["Ball_Data"] then
                    Press_Step = Press_Step + 1
                end
                Show_Massage("move distance is : [ ",Ball_Data," ]")
                MoveMouseRelative(Gun_test, Ball_Data)
                Exact_Delay(Gun["Interval"])
            end
        end
    end
end
  -----------Gun_Ratio_Calculate----------
function Gun_Ratio_Calculate(Ball_Data)
    local Ratio_Sft = Gun["Ratio_Shift"] or 1
    local allmodeTime = Gun["Gun_all"] or 1
    local gunratio = Gun["Gun_Ratio"] or 1
    local Ratio_4X = Gun["Ratio_4X"] or 1
    local Ratio_Ctrl_N = Gun["Ratio_Ctrl_N"] or 1
    local Ratio_Ctrl_S = Gun["Ratio_Ctrl_S"] or 1
    if (Resolution_Ratio ~= nil and gunratio ~= nil) then
        Ball_Data = Ball_Data * Resolution_Ratio * gunratio
    end
    if is_on("ctrl") or Aim_sign == 1 then
        if is_on("numlock") then
            Ball_Data = Ball_Data * Ratio_Ctrl_N
        else
            Ball_Data = Ball_Data * Ratio_Ctrl_S * allmodeTime
        end
    else
        if is_off("numlock") then
            Ball_Data = Ball_Data * allmodeTime
        end
    end
    if is_off("capslock") and is_on("shift")then
        Ball_Data = Ball_Data * Ratio_Sft
    elseif is_on("capslock") and IsMouseButtonPressed(3) then
        Ball_Data = Ball_Data * Ratio_4X
    end
    local Ball_X100 = Int(Ball_Data * 100)
    local Ball_Int = Int(Ball_X100 / 100)
    local Ball_Mod = Ball_X100 % 100
    B_mod = B_mod + Ball_Mod
    if B_mod >= 100 then
        B_mod = B_mod - 100
        Ball_Int = Ball_Int + 1
    end
    return Ball_Int
end
  -----------------------------------------
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
function Load_Gun_Table()  -- Guess yourself what to do whih it
    Gun_Table["SCAR_L"] = {
        Gun_Code = "SCAR_L",
        Interval = 12.5,
        Ratio_Shift = 1.333,
        Ratio_Ctrl_N = 0.81,
        Ratio_Ctrl_S = 0.81,
        Ratio_4X = 3.6,
        Gun_all = 0.79,
        Gun_Ratio = SCAR_L_Ratio,
        Gun_Special_Move_Distance = 3.125,
        RGB_Data = {0,255,255},
        Ball_Data = {
            "5.1x8",--2
            "1.9x8",	
            "2.8x8",
            "3.4x8",--5
            "4.15x8",
            "4.9x8",--
            "4.9x8",--
            "4.9x8",--
            "5.25x8",--10
            "5.25x8",--
            "5.5x8",--
            "5.8x8",--
            "5.8x8",--
            "6x8",--15
            "6x8",
            "6x8",
            "6x8",
            "6x8",
            "6x8",--20
            "6.2x8",
            "6.2x8",
            "6.2x8",
            "6.2x8",
            "6.2x8",--25
            "6.2x8",
		    "6.2x8",
		    "6.2x8",
		    "6.2x8",
		    "6.2x8",
        }
    }

    Gun_Table["VKT"] = {
        Gun_Code = "VKT",
        Interval = 6.875,
        Ratio_Shift = 1.277,
        Ratio_Ctrl_N = 0.78,
        Ratio_Ctrl_S = 0.78,
        Delay_4X = 10,
        Step_4X = 10,
        Data_Single_4X = 50,
        Ratio_4X = 3.82,
        Gun_all = 0.79,
        Gun_Ratio = VKT_Ratio,
        RGB_Data = {0,0,205},
        Ball_Data = {
            "3.5x8",--2
            "2.4x8",--3
            "3.4x8",--4
            "3.5x8",--5
            "3.9x8",--6
            "4.2x8",--7
            "4.2x8",--8
            "4.2x8",--9
            "4.2x8",--10
            "4.5x8",--11
            "5.5x8",--12
            "5.5x8",--13
            "5.5x8",--14
            "6.6x8",--15
            "6.6x8",--16
            "6.9x8",--17
            "6.9x8",--18
            "6.9x8",--19
            "6.9x8",--20
            "6.9x8",--21
            "6.9x8",--22
            "6.9x8",--23
            "7.6x8",--24
            "7.6x8",--25
            "7.6x8",--26
            "7.6x8",--27
            "7.6x8",--28
            "7.6x8",--29
            "7.6x8",--30
            "7.6x8",--31
            "7.6x8",--32
            "7.6x8",--33
        }
    }

    Gun_Table["VSS"] = {
        Gun_Code = "VSS",
        Gun_Mode = "Single_Mode",
        Interval_S = 100,
        Press_Step = 10,
        Ratio_Shift = 1,
        Ratio_Ctrl_N = 0.7,
        Ratio_Ctrl_S = 0.7,
        Ratio_4X = 1,
        Gun_all = 0.77,
        Gun_Ratio = VSS_Ratio,
        Gun_Special_Move_Distance = 2.8,
        Gun_Special_Mode = "Random",
        Gun_Up_Time = 100,
        Gun_Down_Time = 200,
        Gun_Up_Move_Down = 20,
        Gun_Down_Movw_Up = 4,
        RGB_Data = {255,52,179},
        Ball_Data = {
            "16x1",--2
            "9x1",
            "14x1",	
            "23x1",--5
            "35x1",
            "40x1",
            "42x1",--8
            "42x1",
            "42x1",--10
            "45x1",--11
            --"7.6x1",--2
            --"3.9x1",
            --"4.8x1",	
            --"7.2x1",--5
            --"11.3x1",
            --"12.5x1",
            --"13.2x1",--8
            --"13.3x1",
            --"13.5x1",--10
            --"13.8x1",--11
        }
    }

    Gun_Table["M4"] = {
        Gun_Code = "M4",
        Interval = 11.25,
        Ratio_Shift = 1.327,
        Ratio_Ctrl_N = 0.76,
        Ratio_Ctrl_S = 0.76,
        Ratio_4X = 3.7,
        Gun_all = 0.77,
        Gun_Ratio = M416_Ratio,
        Gun_Special_Move_Distance = 3.125,
        RGB_Data = {148,0,211},
        Ball_Data = {
            "5.0x8",--2
            "2.3x8",	
            "3.2x8",
            "4.0x8",--5
            "4.2x8",
            "4.4x8",--7
            "4.8x8",--
            "4.9x8",--
            "5.1x8",--10
            "5.3x8",--
            "5.4x8",--
            "5.8x8",--13
            "6.0x8",--
            "6.0x8",--15
            "6.2x8",
            "6.2x8",--17
            "6.2x8",
            "6.2x8",
            "6.2x8",--20
            "6.4x8",
            "6.4x8",--22
            "6.4x8",
            "6.4x8",
            "6.4x8",--25
            "6.4x8",
            "6.4x8",
            "6.4x8",
            "6.4x8",
            "6.4x8",
            "6.4x8",
        }
    }

    Gun_Table["K2"] = {
        Gun_Code = "K2",
        Interval = 11.25,
        Ratio_Shift = 1.327,
        Ratio_Ctrl_N = 0.8,
        Ratio_Ctrl_S = 0.8,
        Ratio_4X = 3.65,
        Gun_all = 0.77,
        Gun_Ratio = K2_Ratio,
        Gun_Special_Move_Distance = 3.125,
        RGB_Data = {148,0,211},
        Ball_Data = {
            "4.7x8",--2
            "2.1x8",	
            "3.1x8",
            "3.9x8",--5
            "4.1x8",
            "4.3x8",--7
            "4.7x8",--
            "4.8x8",--
            "5x8",--10
            "5x8",--
            "5.3x8",--
            "5.5x8",--13
            "5.5x8",--
            "5.5x8",--15
            "6x8",
            "6x8",--17
            "6x8",
            "6x8",
            "6x8",--20
            "6x8",
            "6x8",--22
            "6x8",
            "6x8",
            "5.8x8",--25
            "5.8x8",
            "5.8x8",
            "5.8x8",
            "5.8x8",
            "5.8x8",
            "5.8x8",
        }
    }

    Gun_Table["sks"] = {
        Gun_Code = "sks",
        Gun_Mode = "Single_Mode",
        Interval_S = 200,
        Press_Step = 8,
        Ratio_Shift = 1.251,
        Ratio_Ctrl_N = 0.8,
        Ratio_Ctrl_S = 0.8,
        Ratio_4X = 3.6,
        Gun_all = 0.673,
        Gun_Ratio = SKS_Ratio,
        Gun_Special_Move_Distance = 3.125,
        RGB_Data = {255,52,179},
        Ball_Data = {
            "30x1",
            "15x1",
            "22x1",	
            "22x1",
            "22x1",
            "25x1",
            "25x1",
            "25x1",
            "25x1",
            "25x1",
            "27x1", 
            "27x1",
            "27x1",
            "27x1",
            "30x1",
            "30x1",
            "30x1",
            "30x1",
            "30x1",
            "30x1",
        }
    }

    Gun_Table["m16"] = {
        Gun_Code = "m16",
        Gun_Mode = "Single_Mode",
        Interval_S = 104,
        Press_Step = 8,
        Ratio_Shift = 1.236,
        Ratio_Ctrl_N = 0.8,
        Ratio_Ctrl_S = 0.8,
        Ratio_4X = 3.72,
        Gun_all = 0.8,
        Gun_Ratio = M16A4_Ratio,
        Gun_Special_Move_Distance = 3.125,
        RGB_Data = {255,52,179},
        Ball_Data = {
            "28x1",--2
            "11.64x1",
            "23x1",
            "23x1",--5
            "27x1",
            "27x1",
            "27x1",
            "27x1",
            "25x1",
            "25x1",
            "27x1",  --12
            "27x1",
            "27x1",
            "27.75x1",
            "27.75x1",--16
            "27.75x1",
            "27.75x1",
            "27.75x1",
            "27.75x1",	
            "27.75x1",
            "27.75x1",--22
            "28x1",
            "28x1",
            "28x1",
            "28x1",
            "28x1",
            "28x1",
            "28x1",
            "28x1",
            "27.75x1",
        }
    }

    Gun_Table["AKM"] = {
        Gun_Code = "AKM",
        Interval = 12.8,
        Ratio_Shift = 1.335,
        Ratio_Ctrl_N = 0.8,
        Ratio_Ctrl_S = 0.8,
        Ratio_4X = 3.604,
        Gun_all = 0.81,
        Gun_Ratio = AKM_Ratio,
        Gun_Special_Move_Distance = 3.125,
        RGB_Data = {144,238,144},
        Ball_Data = {
            "5x8",
            "3x8",
            "4x8",
            "4x8",
            "4.5x8",
            "5x8",
            "5x8",
            "5.25x8",
            "5.25x8",
            "5.5x8",
            "6x8",
            "6x8",
            "6x8",
            "6x8",
            "6x8",
            "6.75x8",
            "6.75x8",
            "6.75x8",
            "6.75x8",
            "6.75x8",
            "6.75x8",
            "6.75x8",
            "6.75x8",
            "6.75x8",
            "7x8",
            "7x8",
            "7x8",
            "7x8",
            "7x8",
            "7x8",
        }
    }

    Gun_Table["SCARL_S_5"] = {
        Gun_Code = "SCARL_S_5",
        Gun_Mode = "Single_Mode",
        Interval_S = 104,
        Press_Step = 8,
        Ratio_Shift = 1.236,
        Ratio_Ctrl_N = 0.8,
        Ratio_Ctrl_S = 0.8,
        Ratio_4X = 3.85,
        Gun_all = 0.84,
        Gun_Ratio = SCARL_S_5_Ratio,
        Gun_Special_Move_Distance = 2.8,
        Gun_Special_Mode = "Random",
        Gun_Up_Time = 125,
        Gun_Down_Time = 300,
        Gun_Up_Move_Down = 22,
        Gun_Down_Movw_Up = 13,
        RGB_Data = {255,52,179},
        Ball_Data = {
            "26x1",
            "14x1",
            "15.5x1",	
            "18x1",
            "20x1",--6
            "22x1",
            "22x1",
            "22x1",
            "22x1",--10
            "22.5x1",
            "22.5x1", 
            "22.5x1",
            "22.5x1",--14
            "22.5x1",
            "22.5x1",
            "22.5x1",
            "22.5x1",
            "22.5x1",
            "23x1",
            "23x1",
            "23x1",
            "23x1",
            "23x1",
            "23x1",
            "23x1",
            "23x1",
            "23x1",
            "23x1",
            "23x1",   
        }
    }

    Gun_Table["M762_SSS"] = {
        Gun_Code = "M762_SSS",
        Gun_Mode = "Single_Mode",
        Interval_S = 104,
        Press_Step = 8,
        Ratio_Shift = 1.327,
        Ratio_Ctrl_N = 0.88,
        Ratio_Ctrl_S = 0.88,
        Ratio_4X = 3.85,
        Gun_all = 0.84,
        Gun_Ratio = M762_SSS_Ratio,
        Gun_Special_Move_Distance = 2.8,
        Gun_Special_Mode = "Random",
        Gun_Up_Time = 125,
        Gun_Down_Time = 300,
        Gun_Up_Move_Down = 22,
        Gun_Down_Movw_Up = 14,
        RGB_Data = {255,52,179},            
        Ball_Data = {
            "30x1",
            "17x1",
            "20x1",	
            "18x1",
            "21x1",--6
            "21x1",
            "22x1",
            "22x1",
            "22x1",--10
            "21x1",
            "21x1", 
            "21x1",
            "21x1",--14
            "20x1",
            "20x1",
            "20x1",
            "20x1",
            "20x1",
            "20x1",
            "20.5x1",
            "20.5x1",
            "20.5x1",
            "20.5x1",
            "20.5x1",
            "20.5x1",
            "20.5x1",
            "20.5x1",
            "20.5x1",
            "20.5x1",
        }
    }

    Gun_Table["M762_S_5"] = {
        Gun_Code = "M762_S_5",
        Gun_Mode = "Single_Mode",
        Interval_S = 200,
        Press_Step = 8,
        Ratio_Shift = 1.251,
        Ratio_Ctrl_N = 0.8,
        Ratio_Ctrl_S = 0.8,
        Ratio_4X = 3.6,
        Gun_all = 0.84,
        Gun_Ratio = M762_S_5_Ratio,
        Gun_Special_Move_Distance = 3.125,
        RGB_Data = {255,52,179},
        Ball_Data = {
            "30x1",
            "10x1",
            "22x1",	
            "22x1",
            "22x1",
            "25x1",
            "25x1",
            "25x1",
            "25x1",
            "25x1",
            "25x1", 
            "25x1",
            "25x1",
            "25x1",
            "25x1",
            "25x1",
            "25x1",
            "25x1",
            "25x1",
            "25x1",
            "25x1",
            "25x1",
            "25x1",
            "25x1",
            "25x1",
            "25x1",
            "25x1",
            "25x1",
            "25x1",
            "25x1",
        }
    }


    Gun_Table["M762"] = {
        Gun_Code = "M762",
        Interval = 11.25,
        Press_Step = 8,
        Ratio_Shift = 1.327,
        Ratio_Ctrl_N = 0.84,
        Ratio_Ctrl_S = 0.84,
        Ratio_4X = 3.65,
        Gun_all = 0.78,
        Gun_Ratio = M762_Ratio,
        Gun_Special_Move_Distance = 2.604,
        RGB_Data = {255,52,179},
        Ball_Data = {
            "4.4x8",--2
            "3.6x8",
            "3.9x8",
            "4.2x8",--5
            "4.8x8",
            "5x8",
            "5.25x8",
            "5.8x8",
            "5.8x8",--10
            "5.9x8",
            "5.9x8",
            "6x8",
            "6.5x8",
            "6.5x8",--15
            "6.8x8",
            "6.8x8",
            "6.8x8",
            "6.8x8",
            "7x8",--20
            "7x8",
            "7x8",
            "7x8",
            "7x8",
            "7x8",--25
            "7x8",
            "7x8",
            "7x8",
            "7x8",
            "7.2x8",
        }
    }

    Gun_Table["SLR_SSS"] = {
        Gun_Code = "SLR_SSS",
        Gun_Mode = "Single_Mode",
        Interval_S = 100,
        Press_Step = 10,
        Ratio_Shift = 1.251,
        Ratio_Ctrl_N = 0.65,
        Ratio_Ctrl_S = 0.65,
        Ratio_4X = 3.65,
        Gun_all = 0.5,
        Gun_Ratio = SLR_SSS_Ratio,
        Gun_Special_Move_Distance = 3.125,
        Gun_Special_Mode = "Random",
        Gun_Up_Time = 150,
        Gun_Down_Time = 300,
        Gun_Up_Move_Down = 20,
        Gun_Down_Movw_Up = 28,
        RGB_Data = {255,52,179},
        Ball_Data = {
            "49x1",
            "29x1",
            "46x1",
	        "64x1", --5
	        "64x1", --6
	        "64x1", --7
	        "64x1", --8
	        "64x1", --9
	        "64x1", --10
	        "66x1", --11
	        "66x1", --12
	        "66x1", --13
	        "66x1", --14
	        "66x1", --15
	        "66x1", --16
	        "66x1", --17
	        "66x1", --18
	        "66x1", --19
	        "66x1", --20
 
        }
    }

    Gun_Table["SKS_SSS"] = {
        Gun_Code = "SKS_SSS",
        Gun_Mode = "Single_Mode",
        Interval_S = 100,
        Press_Step = 10,
        Ratio_Shift = 1.251,
        Ratio_Ctrl_N = 0.7,
        Ratio_Ctrl_S = 0.7,
        Ratio_4X = 3.7,
        Gun_all = 0.6,
        Gun_Ratio = SKS_SSS_Ratio,
        Gun_Special_Move_Distance = 10,
        Gun_Special_Mode = "Random",
        Gun_Up_Time = 150,
        Gun_Down_Time = 300,
        Gun_Up_Move_Down = 20,
        Gun_Down_Movw_Up = 22,
        RGB_Data = {255,52,179},
        Ball_Data = {
            "45x1",
            "31x1",
            "43x1",
	        "48x1", --5
	        "52x1", --6
	        "58x1", --7
	        "58x1", --8
	        "62x1", --9
	        "62x1", --10
	        "62x1", --11
	        "62x1", --12
	        "62x1", --13
	        "62x1", --14
	        "62x1", --15
	        "62x1", --16
	        "62x1", --17
	        "62x1", --18
	        "62x1", --19
	        "62x1", --20
 
        }
    }

    Gun_Table["MK12_SSS"] = {
        Gun_Code = "MK12_SSS",
        Gun_Mode = "Single_Mode",
        Interval_S = 104,
        Press_Step = 8,
        Ratio_Shift = 1.251,
        Ratio_Ctrl_N = 0.74,
        Ratio_Ctrl_S = 0.74,
        Ratio_4X = 3.65,
        Gun_all = 0.75,
        Gun_Ratio = MK12_SSS_Ratio,
        Gun_Special_Move_Distance = 10,
        Gun_Special_Mode = "Random",
        Gun_Up_Time = 120,
        Gun_Down_Time = 300,
        Gun_Up_Move_Down = 10,
        Gun_Down_Movw_Up = 15,
        RGB_Data = {255,52,179},
        Ball_Data = {
            "34x1",
            "29x1",
            "52x1",
	        "62x1", --5
	        "65x1", --6
	        "67x1", --7
	        "67x1", --8
	        "67x1", --9
	        "67x1", --10
	        "67x1", --11
	        "67x1", --12
	        "67x1", --13
	        "67x1", --14
	        "67x1", --15
	        "67x1", --16
	        "67x1", --17
	        "67x1", --18
	        "67x1", --19
	        "67x1", --20
 
        }
    }

    Gun_Table["MK47_S_10"] = {
        Gun_Code = "MK47_S_10",
        Gun_Mode = "Single_Mode",
        Interval_S = 110,
        Press_Step = 10,
        Ratio_Shift = 1.327,
        Ratio_Ctrl_N = 0.85,
        Ratio_Ctrl_S = 0.85,
        Ratio_4X = 3.85,
        Gun_all = 0.73,
        Gun_Ratio = MK47_S_10_Ratio,
        Gun_Special_Move_Distance = 2.8,
        RGB_Data = {255,52,179},            
        Ball_Data = {
            "30x1",
            "12x1",
            "20x1",	
            "20x1",
            "20x1",--6
            "20x1",
            "23x1",
            "23x1",
            "24x1",--10
            "24x1",
            "23x1", 
            "23x1",
            "23x1",--14
            "23x1",
            "23x1",
            "23x1",
            "23x1",
            "23x1",
            "25x1",--20
            "25x1",
            "25x1",
            "25x1",
            "25x1",
            "24.5x1",
            "24.5x1",
            "24.5x1",
            "24.5x1",
            "24.5x1",
            "24.5x1",
        }
    }

    Gun_Table["M416_S_10"] = {
        Gun_Code = "M416_S_10",
        Gun_Mode = "Single_Mode",
        Interval_S = 100,
        Press_Step = 10,
        Ratio_Shift = 1.336,
        Ratio_Ctrl_N = 0.86,
        Ratio_Ctrl_S = 0.86,
        Ratio_4X = 3.68,
        Gun_all = 0.85,
        Gun_Ratio = M416_S_10_Ratio,
        Gun_Special_Move_Distance = 2.8,
        Gun_Special_Mode = "Random",
        Gun_Up_Time = 100,
        Gun_Down_Time = 300,
        Gun_Up_Move_Down = 22,
        Gun_Down_Movw_Up = 16,
        RGB_Data = {255,52,179},
        Ball_Data = {
            "29x1",
            "14x1",
            "15.5x1",	
            "19x1",
            "20x1",--6
            "22x1",
            "22x1",
            "22x1",
            "22x1",--10
            "23.5x1",
            "23.5x1", 
            "23.5x1",
            "23.5x1",--14
            "23.5x1",
            "23.5x1",
            "23.5x1",
            "23.5x1",
            "23.5x1",
            "24x1",
            "24x1",
            "24x1",
            "24x1",
            "24x1",
            "24x1",
            "24x1",
            "24x1",
            "24x1",
            "24x1",
            "24.5x1",
        }
    }

    Gun_Table["MK47_SSS"] = {
        Gun_Code = "MK47_SSS",
        Gun_Mode = "Single_Mode",
        Interval_S = 104,
        Press_Step = 8,
        Ratio_Shift = 1.327,
        Ratio_Ctrl_N = 0.89,
        Ratio_Ctrl_S = 0.89,
        Ratio_4X = 3.85,
        Gun_all = 0.8,
        Gun_Ratio = MK47_SSS_Ratio,
        Gun_Special_Move_Distance = 2.8,
        Gun_Special_Mode = "Random",
        Gun_Up_Time = 120,
        Gun_Down_Time = 300,
        Gun_Up_Move_Down = 22,
        Gun_Down_Movw_Up = 14,
        RGB_Data = {255,52,179},            
        Ball_Data = {
            "26x1",
            "14x1",
            "17x1",	
            "19x1",
            "20x1",--6
            "20x1",
            "20x1",
            "20x1",
            "20x1",--10
            "21x1",
            "21x1", 
            "21x1",
            "21x1",--14
            "21x1",
            "21x1",
            "21x1",
            "21x1",
            "21x1",
            "21x1",
            "21x1",
            "21x1",
            "21x1",
            "21x1",
            "21x1",
            "21x1",
            "21x1",
            "21x1",
            "21x1",
            "21x1",
        }
    }
    
    Gun_Table["M16A4_SSS"] = {
        Gun_Code = "M16A4_SSS",
        Gun_Mode = "Single_Mode",
        Interval_S = 104,
        Press_Step = 8,
        Ratio_Shift = 1.236,
        Ratio_Ctrl_N = 0.8,
        Ratio_Ctrl_S = 0.8,
        Ratio_4X = 3.6,
        Gun_all = 0.825,
        Gun_Ratio = M16A4_SSS_Ratio,
        Gun_Special_Move_Distance = 2.8,
        Gun_Special_Mode = "Random",
        Gun_Up_Time = 125,
        Gun_Down_Time = 300,
        Gun_Up_Move_Down = 22,
        Gun_Down_Movw_Up = 13,
        RGB_Data = {255,52,179},
        Ball_Data = {
            "26x1",
            "14x1",
            "15.5x1",	
            "18x1",
            "20x1",--6
            "22x1",
            "22x1",
            "22x1",
            "22x1",--10
            "22.5x1",
            "22.5x1", 
            "22.5x1",
            "22.5x1",--14
            "22.5x1",
            "22.5x1",
            "22.5x1",
            "22.5x1",
            "22.5x1",
            "23x1",
            "23x1",
            "23x1",
            "23x1",
            "23x1",
            "23x1",
            "23x1",
            "23x1",
            "23x1",
            "23x1",
            "23x1",
        }
    }

    Gun_Table["MINI_SSS"] = {
        Gun_Code = "MINI_SSS",
        Gun_Mode = "Single_Mode",
        Interval_S = 125,
        Press_Step = 10,
        Ratio_Shift = 1.236,
        Ratio_Ctrl_N = 0.76,
        Ratio_Ctrl_S = 0.76,
        Ratio_4X = 3.7,
        Gun_all = 0.8,
        Gun_Ratio = MINI_SSS_Ratio,
        Gun_Special_Move_Distance = 2.8,
        Gun_Special_Mode = "Random",
        Gun_Up_Time = 133,
        Gun_Down_Time = 300,
        Gun_Up_Move_Down = 20,
        Gun_Down_Movw_Up = 8,
        RGB_Data = {255,52,179},
        Ball_Data = {
            "15x1",
            "10x1",
            "15x1",	
            "30x1",
            "30x1",
            "30x1",
            "30x1",
            "30x1",
            "30x1",
            "30x1",
            "30x1", 
            "30x1",
            "30x1",
            "30x1",
            "30x1",
            "30x1",
            "30x1",
            "30x1",
            "30x1",
        }
    }
end 
  -----------------------------------------
function dump(o)
    if type(o) == 'table' then
        local s = '{'
        for k,v in pairs(o) do
            if type(k) ~= 'number' then k = '"'..k..'"' end
            s = s .. '['..k..'] = ' .. dump(v) .. ','
        end
        return s .. '}'
    else
        return tostring(o)
    end
end
  -----------------------------------------
function anchor_Function(event, arg)                -- Enhancement function
    if event == "MOUSE_BUTTON_PRESSED" and Key_Tab[2] == false then
        if arg == Aim_Hold_Key and is_off("alt") then
            PressKey(Aim_Key)
            Exact_Delay(5)
            PressKey(Ctrl_shift_key)
            Aim_sign = 1
            if RL_key == 0 and Auto_RL_enable == true then              -- into Auto tilt
                RL_Key_Press()
                Exact_Delay(50)
            end
            return true
        elseif arg == Auto_right_key and Auto_RL_enable == true then    -- Auto tilt choice
            Auto_left = false
            Auto_right = not Auto_right
            if Auto_right == true then
                MoveMouseRelative(120,0)
                Exact_Delay(20)
                MoveMouseRelative(-120,0)
            else
                MoveMouseRelative(0,-120)
                Exact_Delay(20)
                MoveMouseRelative(0,120)
            end
            return true
        elseif arg == Auto_left_key and Auto_RL_enable == true then     -- Auto tilt choice
            Auto_right = false
            Auto_left = not Auto_left
            if Auto_left == true then
                MoveMouseRelative(-120,0)
                Exact_Delay(20)
                MoveMouseRelative(120,0)
            else
                MoveMouseRelative(0,-120)
                Exact_Delay(20)
                MoveMouseRelative(0,120)
            end
            return true
        elseif arg ~= 2 then
            local key = Modifier_Arg(arg)
            if key == PickUp_Key then      -- Auto pick up the item
                Pick_Up_Item()
                return true
            elseif key == Mark_Key then
                PressAndReleaseKey(Mark_Keyboard_Key)
                return true
            elseif key == QE_Auto_Key_On_Off then
                QE_Auto_Mode = not QE_Auto_Mode
                if QE_Auto_Mode == false then     -- Use the M key to indicate
                    SetMKeyState(1)
                    Exact_Delay(100)  
                    SetMKeyState(3)
                    Show_Massage(">>>N mode")
                elseif QE_Auto_Mode == true then
                    SetMKeyState(2)
                    Exact_Delay(100)
                    SetMKeyState(3)
                    Show_Massage(">>>S mode")
                end  
                return true
            elseif key == boom_key_mouse then
                boom_key_button = arg
                Take_Boom_Out()
                InitBoomReleasedHandler()
                SetMKeyState(1) 
                return true
            elseif key == Off_RL_Enable then
                Mouse_R_D_click_enable = not Mouse_R_D_click_enable
                for i = 1, 3 do
                    if i <= 3 then
                        SetMKeyState(1)
                        Exact_Delay(20)
                        SetMKeyState(2)
                        Exact_Delay(20)
                        SetMKeyState(3)
                        Exact_Delay(20)
                    end
                end                 
                return true
            elseif key == Aim_before_key then
                Auto_left = false
                Auto_right = false
                ReleaseKey(Aim_Key)
                Exact_Delay(5)
                ReleaseKey(Ctrl_shift_key)
                Aim_sign = 0
                return true
            end
        end
    elseif event == "MOUSE_BUTTON_RELEASED" and Key_Tab[2] == false then
        --local key = Modifier_Arg(arg)
        if arg == Aim_Hold_Key then
            if Aim_sign == 1 then
                ReleaseKey(Aim_Key)
                Exact_Delay(5)
                ReleaseKey(Ctrl_shift_key)
                Aim_sign = 0
                Aim_mode = false
            end
            if RL_key == 1 then
                RL_Key_Release()
            end
            return true
        end
    elseif event == "MOUSE_BUTTON_PRESSED" and Key_Tab[2] == true then
        if arg == Auto_right_key and Auto_RL_enable == true then
            PressKey(Ctrl_shift_key)
            Aim_sign = 1
            return true
        elseif arg == Auto_left_key and Auto_RL_enable == true then
            PressKey(Ctrl_shift_key)
            Aim_sign = 1
            return true
        elseif arg == Aim_Hold_Key then
            PressKey(Ctrl_shift_key)
            Aim_sign = 1
            return true
        elseif arg == PickUp_Key then
            RL_Key_Release()
            if Auto_right == true or Auto_left == true then
                Auto_right = not Auto_right
                Auto_left = not Auto_left
            else
                Auto_right = true
                Auto_left = false
            end
            RL_Key_Press()
            return true
        end
    end
  -----------------------------------------
    if event == "G_PRESSED" and Key_Tab[2] == false then
        local key = Modifier_Arg(arg)
        if key == Test_key_on then
            Gun_test = 4
            return true
        elseif key == Test_key_off then
            Gun_test = 0
            return true
        elseif key == QE_Auto_Key_On then
            QE_Auto_Mode = true
            return true
        elseif key == QE_Auto_Key_Off then
            QE_Auto_Mode = false
            return true
        elseif key == M1_Save_Key then
            Gun_Save_M1()
            return true
        elseif key == M2_Save_Key then
            Gun_Save_M2()
            return true
        elseif key == Change_Load_Key then
            Gun_Change_Load_Macro()            
            return true
        elseif key == Gun_Clear_Key then
            Gun_Macro_Clear()
            return true
        end
    end
end
  -----------------------------------------
function InitBoomReleasedHandler()
    local Firstin = true
    local n = 1
    Fire_cycle = function(event,arg)
        if event == "M_RELEASED" and arg == 1 then           
            if (boom_key_button ~= nil and Key_Tab[boom_key_button] == true and n <= 30) then
                Show_Massage("Boom time [",3 - (n / 10),"]")
                n = n + 1
                Exact_Delay(100)
                SetMKeyState(1) 
            end
            if (n == 31 or boom_key_button == nil or Key_Tab[boom_key_button] == false) and Firstin == true then
                Firstin = false
                Boom_Throw()
                return true
            end
        end
    end
end
  -----------------------------------------
function Take_Boom_Out()
    PressAndReleaseKey("4")
    Show_Massage("4 is pressed")
    Exact_Delay(900)
    PressMouseButton(1)
    Exact_Delay(800)
    PressAndReleaseKey("r")
    Exact_Delay(10)
    Show_Massage(">>>r is pressed")  
end
  -----------------------------------------
function Boom_Throw()
    ReleaseMouseButton(1)           -- When the boom_key is [release] the Macro will [switch] to the firse[1] gun automatically
    Show_Massage("Mouseleft is released")
    Exact_Delay(300)
    if is_on("shift") then
        PressAndReleaseKey("spacebar")
        Show_Massage(">>>Jump")
        Exact_Delay(50)
    end
    PressAndReleaseKey("1")         -- [1] = the firse gun  [2] = the second gun   You can also switch to the pan if you want       
    Show_Massage(">>>1 is pressed")
end
  -----------------------------------------
function Pick_Up_Item()
    local currentMouseX, currentMouseY = GetMousePosition()
    Exact_Delay (10)
    PressMouseButton(1)
    Exact_Delay (10)
    for i = 1, 6 do
        if i <= 6 then
            MoveMouseRelative(120, 0)
            Exact_Delay (1)
        end
    end
    Exact_Delay (10)
    ReleaseMouseButton(1)
    Exact_Delay (50)
    MoveMouseTo(currentMouseX, currentMouseY)
end
  ----------Modifier_Arg-------------------
function Modifier_Arg(arg)       -- The combination of Key  [alt & ctrl & shift]
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
function Right_Key_Load_Macro()
    Off_ret = 0
    if Gun == nil then
        Gun = Gun_Past
        if Gun ~= nil then
            Show_Massage(">>>load [", Gun["Gun_Code"], "]")
            if is_off("capslock") and Gun_Past_4 == true then
                PressAndReleaseKey("capslock")
            elseif is_on("capslock") and Gun_Past_4 == false then
                PressAndReleaseKey("capslock")
            end
            if is_off("scrolllock") then
                PressAndReleaseKey("scrolllock")
            end
        end
    end
end
  -----------------------------------------
function Gun_Save_M1()
    if Gun ~= nil then
        Gun_M1 = Gun
        if is_on("capslock") then
            Gun_4X_M1 = true
        else
            Gun_4X_M1 = false
        end
        if is_off("numlock") then
            Gun_ALL1 = true
        else
            Gun_ALL1 = false
        end
        Show_Massage("Gun_M1 is [",Gun_M1,"]")
        Show_Massage("Gun_4X_M1 is [",Gun_4X_M1,"]")
        Show_Massage("Gun_ALL1 is [", Gun_ALL1,"]")
        for i = 1, 3 do
            if i <= 3 then
                SetMKeyState(1)
                Exact_Delay(50)
                SetMKeyState(3)
                Exact_Delay(50)
            end
        end
    end
end
  -----------------------------------------
function Gun_Save_M2()
    if Gun ~= nil then
        Gun_M2 = Gun
        if is_on("capslock") then
            Gun_4X_M2 = true
        else
            Gun_4X_M2 = false
        end
        if is_off("numlock") then
            Gun_ALL2 = true
        else
            Gun_ALL2 = false
        end
        Show_Massage("Gun_M2 is [",Gun_M2,"]")
        Show_Massage("Gun_4X_M2 is [",Gun_4X_M2,"]")
        Show_Massage("Gun_ALL2 is [", Gun_ALL2,"]")
        for i = 1, 3 do
            if i <= 3 then
                SetMKeyState(2)
                Exact_Delay(50)
                SetMKeyState(3)
                Exact_Delay(50)
            end
        end
    end
end
  -----------------------------------------
function Gun_Change_Load_Macro()
    if Gun_First == true then
        if Gun_M2 ~= nil then
            PressAndReleaseKey("2")
            SetMKeyState(2)
            Gun = Gun_M2
            Show_Massage(">>>load [", Gun["Gun_Code"], "]")
            if is_off("capslock") and Gun_4X_M2 == true then
                PressAndReleaseKey("capslock")
            elseif is_on("capslock") and Gun_4X_M2 == false then
                PressAndReleaseKey("capslock")
            end
            if is_on("numlock") and Gun_ALL2 == true then
                PressAndReleaseKey("numlock")
            elseif is_off("numlock") and Gun_ALL2 == false then
                PressAndReleaseKey("numlock")
            end
            if is_off("scrolllock") then
                PressAndReleaseKey("scrolllock")
            end
            Gun_First = false
            Show_Massage("Gun_M2 is [",Gun_M2,"]")
            Show_Massage("Gun_4X_M2 is [",Gun_4X_M2,"]")
            Show_Massage("Gun_ALL2 is [", Gun_ALL2,"]")
        else
            PressAndReleaseKey("1")
            SetMKeyState(1)
            if Gun_M1 ~= nil then
                Gun = Gun_M1
                Show_Massage(">>>load [", Gun["Gun_Code"], "]")
                if is_off("capslock") and Gun_4X_M1 == true then
                    PressAndReleaseKey("capslock")
                elseif is_on("capslock") and Gun_4X_M1 == false then
                    PressAndReleaseKey("capslock")
                end
                if is_on("numlock") and Gun_ALL1 == true then
                    PressAndReleaseKey("numlock")
                elseif is_off("numlock") and Gun_ALL1 == false then
                    PressAndReleaseKey("numlock")
                end
                if is_off("scrolllock") then
                    PressAndReleaseKey("scrolllock")
                end
            end
            Gun_First = true
            Show_Massage("Gun_M1 is [",Gun_M1,"]")
            Show_Massage("Gun_4X_M1 is [",Gun_4X_M1,"]")
            Show_Massage("Gun_ALL1 is [", Gun_ALL1,"]")
        end
    elseif Gun_First == false then
        if Gun_M1 ~= nil then
            PressAndReleaseKey("1")
            SetMKeyState(1)
            Gun = Gun_M1
            Show_Massage(">>>load [", Gun["Gun_Code"], "]")
            if is_off("capslock") and Gun_4X_M1 == true then
                PressAndReleaseKey("capslock")
            elseif is_on("capslock") and Gun_4X_M1 == false then
                PressAndReleaseKey("capslock")
            end
            if is_on("numlock") and Gun_ALL1 == true then
                PressAndReleaseKey("numlock")
            elseif is_off("numlock") and Gun_ALL1 == false then
                PressAndReleaseKey("numlock")
            end
            if is_off("scrolllock") then
                PressAndReleaseKey("scrolllock")
            end
            Gun_First = true
            Show_Massage("Gun_M1 is [",Gun_M1,"]")
            Show_Massage("Gun_4X_M1 is [",Gun_4X_M1,"]")
            Show_Massage("Gun_ALL1 is [", Gun_ALL1,"]")
        else
            PressAndReleaseKey("2")
            SetMKeyState(2)
            if Gun_M2 ~= nil then
                Gun = Gun_M2
                Show_Massage(">>>load [", Gun["Gun_Code"], "]")
                if is_off("capslock") and Gun_4X_M2 == true then
                    PressAndReleaseKey("capslock")
                elseif is_on("capslock") and Gun_4X_M2 == false then
                    PressAndReleaseKey("capslock")
                end
                if is_on("numlock") and Gun_ALL2 == true then
                    PressAndReleaseKey("numlock")
                elseif is_off("numlock") and Gun_ALL2 == false then
                    PressAndReleaseKey("numlock")
                end
                if is_off("scrolllock") then
                    PressAndReleaseKey("scrolllock")
                end
            end
            Gun_First = false
            Show_Massage("Gun_M2 is [",Gun_M2,"]")
            Show_Massage("Gun_4X_M2 is [",Gun_4X_M2,"]")
            Show_Massage("Gun_ALL2 is [", Gun_ALL2,"]")
        end        
    end
end
  -----------------------------------------
function Gun_Macro_Clear()
    Gun_M1 = nil
    Gun_4X_M1 = false
    Gun_ALL1 = false
    Gun_M2 = nil
    Gun_4X_M2 = false
    Gun_ALL2 = false
    Gun_First = true
    Gun_Past = nil
    Gun_Past_4 = false
    Off_ret = 0
    Gun = nil
    if is_on("scrolllock") then PressAndReleaseKey("scrolllock") end
        Exact_Delay(5)
    if is_on("capslock")  then PressAndReleaseKey("capslock") end
        Exact_Delay(5)
    if is_off("numlock") then PressAndReleaseKey("numlock") end
    for i = 1, 3 do
        if i <= 3 then
            SetMKeyState(1)
            Exact_Delay(50)
            SetMKeyState(2)
            Exact_Delay(50)
        end
    end
    SetMKeyState(3)
end
  --SUB_FUNCTION_END---------------------------------------------------------------------------------------------------------------------------------------------------------
  --MAIN_FUNCTION_START---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnEvent(event, arg)                -- Event main function
    if event == "PROFILE_ACTIVATED" then    -- Initialization Profile
        EnablePrimaryMouseButtonEvents(1)   -- Enable MouseButton(Left) event
        SetBacklightColor(0,0,0)            -- Mouse Color
        Gun = nil
        Gun_Table = {}                      -- Creat the Gun table
        Gun_Table["off"] = {                -- Add mode[off] table
            Gun_Code = "turn_off",
            RGB_Data = {0,0,0},
            Function = function()
                Gun = nil
                Fire_cycle = nil
            end
        }  
        Load_Gun_Table()                    -- Add gun data into Gun table(include <M16A4> <M416> <SKS> <AKM> <SCAR> ... )
        Fire_cycle = nil
        Fire_key = nil
        for key,value in pairs(Gun_Table) do -- Initialization Gun data
            if (value["Interval"] ~= nil and type(value["Interval"]) == "table") then
                value["Interval"] = Calculate_GunData(value["Interval"],value["Gun_Mode"])
            end
            if (value["Ball_Data"] ~= nil and type(value["Ball_Data"]) == "table") then
                value["Ball_Data"] = Calculate_GunData(value["Ball_Data"],value["Gun_Mode"])
                Show_Massage("",value["Gun_Code"])
            end
            if (value["Gun_Mode"] == "Single_Mode") then
                --OutputLogMessage("before:%s \n",dump(value))
                Calculate_SingleGunData(value)
                --OutputLogMessage("after:%s \n",dump(value))
            end
        end
        Initialization_show_message()
        Key_Tab = {}
        Keyboard_Tab = {}
    end
    if event == "G_PRESSED" then    -- The keyboard G key pressed
        Keyboard_Tab[arg] = true
    end
    if event == "G_RELEASED" then   -- The keyboard G key released
        Keyboard_Tab[arg] = false
    end
        -------------------------------------------  
    if event == "MOUSE_BUTTON_PRESSED" then     
        Key_Tab[arg] = true
        if (arg == Off_key and Off_Key_D_Click_enable == true) then                      -- When the [mode off] key is [pressed] the Macro will [calculate] the time form [key released last time] to [key pressed this time] automatically
            Time_M6_Down = GetRunningTime()
            local Time_M6_DownToUp = Time_M6_Down - Time_M6_Up  -- If the key interval is less than 100 ms the Macro will use of bandages automatically
            if Time_M6_DownToUp <= 100 then
                Off_Key_Double_Click()              -- The bandages key is keyboard [9]
            end
        end
    end
        -------------------------------------------      
    if event == "MOUSE_BUTTON_RELEASED" then
        Key_Tab[arg] = false
        if (arg == Off_key and Off_Key_D_Click_enable == true) then
            Time_M6_Up = GetRunningTime()
        end
    end
        -------------------------------------------  
    if anchor_Function ~= nil and anchor_Function(event, arg) == true then
        Show_Massage(">>>Start Advanced Function[v]")
    elseif arg == 1 then
        if (event == "MOUSE_BUTTON_PRESSED" and Gun ~= nil) then
            Fire_Mode_Choice(event, arg)
            if Gun.Gun_Mode == "Single_Mode" and not IsMouseButtonPressed(3) then
                PressKey(Aim_Key)
            end
        end
        if (event == "MOUSE_BUTTON_RELEASED" and Gun ~= nil) then
            if Gun.Gun_Mode == "Single_Mode" then
                ReleaseKey(Aim_Key)
            end
        end
    elseif arg == 2 and event == "MOUSE_BUTTON_PRESSED"  then                           -- When the [mouse right] key is [pressed] the Macro will [calculate] the time form [key released last time] to [key pressed this time] automatically
        Time_MR_Down = GetRunningTime()
        local Time_MR_DownToUp = Time_MR_Down - Time_MR_Up                                                
        Show_Massage(">>>Sight interval time > 100ms is :",Time_MR_DownToUp)
        if Time_MR_DownToUp > 100 then
            Right_Key_Load_Macro()                                                      -- If the key interval is more than 200 ms then                                                                       -- 1X mode
            if RL_key == 0 and Auto_RL_enable == true then                              -- into Auto tilt
                RL_Key_Press()
                Exact_Delay(100)
            end
        else
            if Mouse_R_D_click_enable == true then
                Mouse_R_Double_Click()
            end
        end
    elseif arg == 2 and event == "MOUSE_BUTTON_RELEASED" then                           -- Relesae ctrl key exit 4X single mode
        Time_MR_Up = GetRunningTime()
        local time_sub_2 = Time_MR_Up - Time_MR_Down
        Show_Massage(">>>Sight hold time > 200ms is :", time_sub_2)
        Ctrl_G5_sign = false
        if Aim_sign == 1 and Key_Tab[Aim_Hold_Key] == false then
            ReleaseKey(Aim_Key)
            Exact_Delay(5)
            ReleaseKey(Ctrl_shift_key)
            Aim_sign = 0
            Aim_mode = false
        end
        if RL_key == 1 then
            RL_Key_Release()
        end
        if LR_Key == 1 then
            ReleaseKey(Left_Tilt)
            ReleaseKey(Right_Tilt)
            LR_Key = 0
        end
    elseif (arg > 2 and event == "MOUSE_BUTTON_PRESSED") then                           -- When the [Mouse key in Mapping] is [pressed] the Macro will [choice] the Gun data form Gun table
        local prev = Gun
        local key = Modifier_Arg(arg)
        Show_Massage(">>>",Key_Mapping[key])
        if Key_Mapping[key] ~= nil then
            Gun = Gun_Table[Key_Mapping[key]] or Gun
            if (prev ~= Gun) then
                Show_Massage(">>>load [", Gun["Gun_Code"], "]")
                if Gun["Gun_Code"] ~= "turn_off" then
                    Gun_Past_4 = false
                end
                Show_Massage("4X state is [",Gun_Past_4,"]")
                if (is_on("capslock") and Change_Other_Macro_capslock_off == true) then
                    PressAndReleaseKey("capslock")
                end
                if (Gun["Function"] ~= nil) then   -- off mode
                    Off_ret = Off_ret + 1
                    Show_Massage("Off_ret is[",Off_ret,"]")
                    if Off_ret == 2 then
                        Gun_Past = nil
                        Gun_Past_4 = false
                        Gun_M_Enable = false
                        Off_ret = 0
                    end
                    Gun["Function"]()
                    if Gun == nil then                                                     -- The indicator light[Scrolllock] will light up when the Macro run
                        if is_on("scrolllock") then PressAndReleaseKey("scrolllock") end
                    end
                else
                    Off_ret = 0
                    Gun_Past = Gun
                    Show_Massage("gunpast is : [",Gun_Past.Gun_Code,"]")
                    if is_off("scrolllock") then PressAndReleaseKey("scrolllock") end
                end
            else
                MacroKey_2nd_Press_Mode_choice()
            end
        end
        -------------------------------------------  
    elseif (arg > 2 and event == "G_PRESSED") then  
        local prev = Gun
        local key = Modifier_Arg(arg)
        Show_Massage(">>>",Keyboard_Mapping[key])
        if Keyboard_Mapping[key] ~= nil then
            Gun = Gun_Table[Keyboard_Mapping[key]] or Gun
            if (prev ~= Gun) then
                Show_Massage(">>>load [", Gun["Gun_Code"], "]")
                if Gun["Gun_Code"] ~= "turn_off" then
                    Gun_Past_4 = false
                end
                Show_Massage("4X state is [",Gun_Past_4,"]")
                if (is_on("capslock") and Change_Other_Macro_capslock_off == true) then
                    PressAndReleaseKey("capslock")
                end
                if (Gun["Function"] ~= nil) then
                    Off_ret = Off_ret + 1
                    Show_Massage("Off_ret is[",Off_ret,"]")
                    if Off_ret == 2 then
                        Gun_Past = nil
                        Gun_Past_4 = false
                        Gun_M_Enable = false
                        Off_ret = 0
                    end
                    Gun["Function"]()
                    if Gun == nil then                                                     -- The indicator light[Scrolllock] will light up when the Macro run
                        if is_on("scrolllock") then PressAndReleaseKey("scrolllock") end
                    end
                else
                    Off_ret = 0
                    Gun_Past = Gun
                    Show_Massage("gunpast is : [",Gun_Past.Gun_Code,"]")
                    if is_off("scrolllock") then PressAndReleaseKey("scrolllock") end
                end
            else
                MacroKey_2nd_Press_Mode_choice()
            end
        end
    end
        -------------------------------------------  
    if Fire_cycle ~= nil then
        Fire_cycle(event, arg)
    end
end
  --MAIN_FUNCTION_END---------------------------------------------------------------------------------------------------------------------------------------------------------
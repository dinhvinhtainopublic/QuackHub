shared.LoaderTitle = "Đăng Ký Kênh Văn Thành IOS";
shared.LoaderKeyFrames = {
    [1] = {
        1,
        10
    },
    [2] = {
        2,
        30
    },
    [3] = {
        3,
        60
    },
    [4] = {
        2,
        100
    }
};
local v2 = {
    LoaderData = {
        Name = shared.LoaderTitle or "A Loader",
        Colors = shared.LoaderColors or {
            Main = Color3.fromRGB(0, 0, 0),
            Topic = Color3.fromRGB(200, 200, 200),
            Title = Color3.fromRGB(255, 255, 255),
            LoaderBackground = Color3.fromRGB(40, 40, 40),
            LoaderSplash = Color3.fromRGB(3, 252, 3)
        }
    },
    Keyframes = shared.LoaderKeyFrames or {
        [1] = {
            1,
            10
        },
        [2] = {
            2,
            30
        },
        [3] = {
            3,
            60
        },
        [4] = {
            2,
            100
        }
    }
};
local v3 = {
    [1] = "",
    [2] = "",
    [3] = "",
    [4] = ""
};
function TweenObject(v178, v179, v180)
    game.TweenService:Create(v178, TweenInfo.new(v179, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), v180):Play();
end
function CreateObject(v181, v182)
    local v183 = Instance.new(v181);
    local v184;
    for v416, v417 in pairs(v182) do
        if (v416 ~= "Parent") then
            v183[v416] = v417;
        else
            v184 = v417;
        end
    end
    v183.Parent = v184;
    return v183;
end
local function v4(v186, v187)
    local v188 = Instance.new("UICorner");
    v188.CornerRadius = UDim.new(0, v186);
    v188.Parent = v187;
end
local v5 = CreateObject("ScreenGui", {
    Name = "Core",
    Parent = game.CoreGui
});
local v6 = CreateObject("Frame", {
    Name = "Main",
    Parent = v5,
    BackgroundColor3 = v2.LoaderData.Colors.Main,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    Position = UDim2.new(0.5, 0, 0.5, 0),
    AnchorPoint = Vector2.new(0.5, 0.5),
    Size = UDim2.new(0, 0, 0, 0)
});
v4(12, v6);
local v7 = CreateObject("ImageLabel", {
    Name = "UserImage",
    Parent = v6,
    BackgroundTransparency = 1,
    Image = "rbxassetid://110365071974573",
    Position = UDim2.new(0, 15, 0, 10),
    Size = UDim2.new(0, 50, 0, 50)
});
v4(25, v7);
local v8 = CreateObject("TextLabel", {
    Name = "UserName",
    Parent = v6,
    BackgroundTransparency = 1,
    Text = "Youtube: Văn Thành IOS",
    Position = UDim2.new(0, 75, 0, 10),
    Size = UDim2.new(0, 200, 0, 50),
    Font = Enum.Font.GothamBold,
    TextColor3 = v2.LoaderData.Colors.Title,
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Left
});
local v9 = CreateObject("TextLabel", {
    Name = "Top",
    TextTransparency = 1,
    Parent = v6,
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 30, 0, 70),
    Size = UDim2.new(0, 301, 0, 20),
    Font = Enum.Font.Gotham,
    Text = "Loader",
    TextColor3 = v2.LoaderData.Colors.Topic,
    TextSize = 10,
    TextXAlignment = Enum.TextXAlignment.Left
});
local v10 = CreateObject("TextLabel", {
    Name = "Title",
    Parent = v6,
    TextTransparency = 1,
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 30, 0, 90),
    Size = UDim2.new(0, 301, 0, 46),
    Font = Enum.Font.Gotham,
    RichText = true,
    Text = "<b>" .. v2.LoaderData.Name .. "</b>",
    TextColor3 = v2.LoaderData.Colors.Title,
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Left
});
local v11 = CreateObject("Frame", {
    Name = "BG",
    Parent = v6,
    AnchorPoint = Vector2.new(0.5, 0),
    BackgroundTransparency = 1,
    BackgroundColor3 = v2.LoaderData.Colors.LoaderBackground,
    BorderSizePixel = 0,
    Position = UDim2.new(0.5, 0, 0, 70),
    Size = UDim2.new(0.8500000238418579, 0, 0, 24)
});
v4(8, v11);
local v12 = CreateObject("Frame", {
    Name = "Progress",
    Parent = v11,
    BackgroundColor3 = v2.LoaderData.Colors.LoaderSplash,
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    Size = UDim2.new(0, 0, 0, 24)
});
v4(8, v12);
local v13 = CreateObject("TextLabel", {
    Name = "StepLabel",
    Parent = v6,
    BackgroundTransparency = 1,
    Position = UDim2.new(0.5, 0, 1, - 25),
    Size = UDim2.new(1, - 20, 0, 20),
    Font = Enum.Font.Gotham,
    Text = "",
    TextColor3 = v2.LoaderData.Colors.Topic,
    TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Center,
    AnchorPoint = Vector2.new(0.5, 0.5)
});
function UpdateStepText(v191)
    v13.Text = v3[v191] or "" ;
end
function UpdatePercentage(v193, v194)
    TweenObject(v12, 0.5, {
        Size = UDim2.new(v193 / 100, 0, 0, 24)
    });
    UpdateStepText(v194);
end
TweenObject(v6, 0.25, {
    Size = UDim2.new(0, 346, 0, 121)
});
wait();
TweenObject(v9, 0.5, {
    TextTransparency = 0
});
TweenObject(v10, 0.5, {
    TextTransparency = 0
});
TweenObject(v11, 0.5, {
    BackgroundTransparency = 0
});
TweenObject(v12, 0.5, {
    BackgroundTransparency = 0
});
for v195, v196 in pairs(v2.Keyframes) do
    wait(v196[1]);
    UpdatePercentage(v196[2], v195);
end
UpdatePercentage(100, 4);
TweenObject(v9, 0.5, {
    TextTransparency = 1
});
TweenObject(v10, 0.5, {
    TextTransparency = 1
});
TweenObject(v11, 0.5, {
    BackgroundTransparency = 1
});
TweenObject(v12, 0.5, {
    BackgroundTransparency = 1
});
wait(0.5);
TweenObject(v6, 0.25, {
    Size = UDim2.new(0, 0, 0, 0)
});
wait(0.25);
v5:Destroy();
-- spawn(function()
--     while wait() do
--         function print()
--         end
--         function warn()
--         end
--         function error()
--         end
--         debug.traceback = function()
--             return "Traceback blocked";
--         end;
--         debug.info = function()
--             return "Info blocked";
--         end;
--         local v420 = getrawmetatable(game);
--         if (v420 and not v420.__metatable) then
--             setreadonly(v420, false);
--             local v658 = v420.__index;
--             local v659 = v420.__newindex;
--             v420.__index = function(v759, v760)
--                 if ((v760 == "debug") or (v760 == "getrawmetatable")) then
--                     error("Anti Skid: Tampering detected!");
--                 end
--                 return v658(v759, v760);
--             end;
--             v420.__newindex = function(v761, v762, v763)
--                 if ((v762 == "debug") or (v762 == "getrawmetatable")) then
--                     error("Anti Skid: Tampering detected!");
--                 end
--                 return v659(v761, v762, v763);
--             end;
--             setreadonly(v420, true);
--         end
--         local function v421()
--             local v568 = {
--                 "_G",
--                 "debug",
--                 "getgenv",
--                 "getrawmetatable",
--                 "setfenv",
--                 "loadstring",
--                 "hookfunction"
--             };
--             for v662, v663 in ipairs(v568) do
--                 local v664, v665 = pcall(function()
--                     return _G[v663];
--                 end);
--                 if (v664 and v665) then
--                     error("Anti Skid: Environment tampering detected!");
--                 end
--             end
--         end
--         local function v422()
--             local v569 = {
--                 getrawmetatable,
--                 setreadonly,
--                 getgenv,
--                 debug.getinfo,
--                 debug.getregistry
--             };
--             for v666, v667 in ipairs(v569) do
--                 if v667 then
--                     error("Anti Skid: Hook tampering detected!");
--                 end
--             end
--         end
--         local v423 = game:FindService("HttpService");
--         if v423 then
--             v423.RequestAsync = function()
--                 error("HTTP Requests Blocked");
--             end;
--             v423.GetAsync = function()
--                 error("HTTP Get Blocked");
--             end;
--             v423.PostAsync = function()
--                 error("HTTP Post Blocked");
--             end;
--         end
--         function collectgarbage()
--             error("GC Blocked");
--         end
--         os.time = function()
--             error("OS Time Blocked");
--         end;
--         pcall(v421);
--         pcall(v422);
--     end
-- end);
local v14 = (function()
local a, b = {
    {
        1,
        "ModuleScript",
        {"MainModule"},
        {
            {18, "ModuleScript", {"Creator"}},
            {28, "ModuleScript", {"Icons"}},
            {
                47,
                "ModuleScript",
                {"Themes"},
                {
                    {50, "ModuleScript", {"Dark"}},
                    {52, "ModuleScript", {"Light"}},
                    {51, "ModuleScript", {"Darker"}},
                    {53, "ModuleScript", {"Rose"}},
                    {49, "ModuleScript", {"Aqua"}},
                    {48, "ModuleScript", {"Amethyst"}}
                }
            },
            {
                19,
                "ModuleScript",
                {"Elements"},
                {
                    {21, "ModuleScript", {"Colorpicker"}},
                    {27, "ModuleScript", {"Toggle"}},
                    {23, "ModuleScript", {"Input"}},
                    {20, "ModuleScript", {"Button"}},
                    {25, "ModuleScript", {"Paragraph"}},
                    {22, "ModuleScript", {"Dropdown"}},
                    {26, "ModuleScript", {"Slider"}},
                    {24, "ModuleScript", {"Keybind"}}
                }
            },
            {
                29,
                "Folder",
                {"Packages"},
                {
                    {
                        30,
                        "ModuleScript",
                        {"Flipper"},
                        {
                            {33, "ModuleScript", {"GroupMotor"}},
                            {46, "ModuleScript", {"isMotor.spec"}},
                            {39, "ModuleScript", {"Signal"}},
                            {40, "ModuleScript", {"Signal.spec"}},
                            {45, "ModuleScript", {"isMotor"}},
                            {36, "ModuleScript", {"Instant.spec"}},
                            {44, "ModuleScript", {"Spring.spec"}},
                            {42, "ModuleScript", {"SingleMotor.spec"}},
                            {38, "ModuleScript", {"Linear.spec"}},
                            {31, "ModuleScript", {"BaseMotor"}},
                            {43, "ModuleScript", {"Spring"}},
                            {35, "ModuleScript", {"Instant"}},
                            {37, "ModuleScript", {"Linear"}},
                            {41, "ModuleScript", {"SingleMotor"}},
                            {34, "ModuleScript", {"GroupMotor.spec"}},
                            {32, "ModuleScript", {"BaseMotor.spec"}}
                        }
                    }
                }
            },
            {
                2,
                "ModuleScript",
                {"Acrylic"},
                {
                    {3, "ModuleScript", {"AcrylicBlur"}},
                    {5, "ModuleScript", {"CreateAcrylic"}},
                    {6, "ModuleScript", {"Utils"}},
                    {4, "ModuleScript", {"AcrylicPaint"}}
                }
            },
            {
                7,
                "Folder",
                {"Components"},
                {
                    {9, "ModuleScript", {"Button"}},
                    {12, "ModuleScript", {"Notification"}},
                    {13, "ModuleScript", {"Section"}},
                    {17, "ModuleScript", {"Window"}},
                    {14, "ModuleScript", {"Tab"}},
                    {10, "ModuleScript", {"Dialog"}},
                    {8, "ModuleScript", {"Assets"}},
                    {16, "ModuleScript", {"TitleBar"}},
                    {15, "ModuleScript", {"Textbox"}},
                    {11, "ModuleScript", {"Element"}}
                }
            }
        }
    }
}
local aa = {
    function()
        local c, d, e, f, g = b(1)
        local h, i, j, k, l, m =
            game:GetService "Lighting",
            game:GetService "RunService",
            game:GetService "Players".LocalPlayer,
            game:GetService "UserInputService",
            game:GetService "TweenService",
            game:GetService "Workspace".CurrentCamera
        local n, o = j:GetMouse(), d
        local p, q, r, s = e(o.Creator), e(o.Elements), e(o.Acrylic), o.Components
        local t, u, v = e(s.Notification), p.New, protectgui or (syn and syn.protect_gui) or function()
                end
        local w = u("ScreenGui", {Parent = i:IsStudio() and j.PlayerGui or game:GetService "CoreGui"})
        v(w)
        t:Init(w)
        local x = {
            Version = "1.1.0",
            OpenFrames = {},
            Options = {},
            Themes = e(o.Themes).Names,
            Window = nil,
            WindowFrame = nil,
            Unloaded = false,
            Theme = "Dark",
            DialogOpen = false,
            UseAcrylic = false,
            Acrylic = false,
            Transparency = true,
            MinimizeKeybind = nil,
            MinimizeKey = Enum.KeyCode.LeftControl,
            GUI = w
        }
        function x.SafeCallback(y, z, ...)
            if not z then
                return
            end
            local A, B = pcall(z, ...)
            if not A then
                local C, D = B:find ":%d+: "
                if not D then
                    return x:Notify {Title = "Interface", Content = "Callback error", SubContent = B, Duration = 5}
                end
                return x:Notify {
                    Title = "Interface",
                    Content = "Callback error",
                    SubContent = B:sub(D + 1),
                    Duration = 5
                }
            end
        end
        function x.Round(y, z, A)
            if A == 0 then
                return math.floor(z)
            end
            z = tostring(z)
            return z:find "%." and tonumber(z:sub(1, z:find "%." + A)) or z
        end
        local y = e(o.Icons).assets
        function x.GetIcon(z, A)
            if A ~= nil and y["lucide-" .. A] then
                return y["lucide-" .. A]
            end
            return nil
        end
        local z = {}
        z.__index = z
        z.__namecall = function(A, B, ...)
            return z[B](...)
        end
        for A, B in ipairs(q) do
            z["Add" .. B.__type] = function(C, D, E)
                B.Container = C.Container
                B.Type = C.Type
                B.ScrollFrame = C.ScrollFrame
                B.Library = x
                return B:New(D, E)
            end
        end
        x.Elements = z
        function x.CreateWindow(C, D)
            assert(D.Title, "Window - Missing Title")
            if x.Window then
                print "You cannot create more than one window."
                return
            end
            x.MinimizeKey = D.MinimizeKey
            x.UseAcrylic = D.Acrylic
            if D.Acrylic then
                r.init()
            end
            local E =
                e(s.Window) {Parent = w, Size = D.Size, Title = D.Title, SubTitle = D.SubTitle, TabWidth = D.TabWidth}
            x.Window = E
            x:SetTheme(D.Theme)
            return E
        end
        function x.SetTheme(C, D)
            if x.Window and table.find(x.Themes, D) then
                x.Theme = D
                p.UpdateTheme()
            end
        end
        function x.Destroy(C)
            if x.Window then
                x.Unloaded = true
                if x.UseAcrylic then
                    x.Window.AcrylicPaint.Model:Destroy()
                end
                p.Disconnect()
                x.GUI:Destroy()
            end
        end
        function x.ToggleAcrylic(C, D)
            if x.Window then
                if x.UseAcrylic then
                    x.Acrylic = D
                    x.Window.AcrylicPaint.Model.Transparency = D and 0.98 or 1
                    if D then
                        r.Enable()
                    else
                        r.Disable()
                    end
                end
            end
        end
        function x.ToggleTransparency(C, D)
            if x.Window then
                x.Window.AcrylicPaint.Frame.Background.BackgroundTransparency = D and 0.35 or 0
            end
        end
        function x.Notify(C, D)
            return t:New(D)
        end
        if getgenv then
            getgenv().Fluent = x
        end
        return x
    end,
    function()
        local c, d, e, f, g = b(2)
        local h = {AcrylicBlur = e(d.AcrylicBlur), CreateAcrylic = e(d.CreateAcrylic), AcrylicPaint = e(d.AcrylicPaint)}
        function h.init()
            local i = Instance.new "DepthOfFieldEffect"
            i.FarIntensity = 0
            i.InFocusRadius = 0.1
            i.NearIntensity = 1
            local j = {}
            function h.Enable()
                for k, l in pairs(j) do
                    l.Enabled = false
                end
                i.Parent = game:GetService "Lighting"
            end
            function h.Disable()
                for k, l in pairs(j) do
                    l.Enabled = l.enabled
                end
                i.Parent = nil
            end
            local k = function()
                local k = function(k)
                    if k:IsA "DepthOfFieldEffect" then
                        j[k] = {enabled = k.Enabled}
                    end
                end
                for l, m in pairs(game:GetService "Lighting":GetChildren()) do
                    k(m)
                end
                if game:GetService "Workspace".CurrentCamera then
                    for n, o in pairs(game:GetService "Workspace".CurrentCamera:GetChildren()) do
                        k(o)
                    end
                end
            end
            k()
            h.Enable()
        end
        return h
    end,
    function()
        local c, d, e, f, g = b(3)
        local h, i, j, k = e(d.Parent.Parent.Creator), e(d.Parent.CreateAcrylic), unpack(e(d.Parent.Utils))
        local l = function(l)
            local m = {}
            l = l or 0.001
            local n, o = {topLeft = Vector2.new(), topRight = Vector2.new(), bottomRight = Vector2.new()}, i()
            o.Parent = workspace
            local p, q = function(p, q)
                    n.topLeft = q
                    n.topRight = q + Vector2.new(p.X, 0)
                    n.bottomRight = q + p
                end, function()
                    local p = game:GetService "Workspace".CurrentCamera
                    if p then
                        p = p.CFrame
                    end
                    local q = p
                    if not q then
                        q = CFrame.new()
                    end
                    local r, s, t, u = q, n.topLeft, n.topRight, n.bottomRight
                    local v, w, x = j(s, l), j(t, l), j(u, l)
                    local y, z = (w - v).Magnitude, (w - x).Magnitude
                    o.CFrame = CFrame.fromMatrix((v + x) / 2, r.XVector, r.YVector, r.ZVector)
                    o.Mesh.Scale = Vector3.new(y, z, 0)
                end
            local r, s = function(r)
                    local s = k()
                    local t, u = r.AbsoluteSize - Vector2.new(s, s), r.AbsolutePosition + Vector2.new(s / 2, s / 2)
                    p(t, u)
                    task.spawn(q)
                end, function()
                    local r = game:GetService "Workspace".CurrentCamera
                    if not r then
                        return
                    end
                    table.insert(m, r:GetPropertyChangedSignal "CFrame":Connect(q))
                    table.insert(m, r:GetPropertyChangedSignal "ViewportSize":Connect(q))
                    table.insert(m, r:GetPropertyChangedSignal "FieldOfView":Connect(q))
                    task.spawn(q)
                end
            o.Destroying:Connect(
                function()
                    for t, u in m do
                        pcall(
                            function()
                                u:Disconnect()
                            end
                        )
                    end
                end
            )
            s()
            return r, o
        end
        return function(m)
            local n, o, p = {}, l(m)
            local q = h.New("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)})
            h.AddSignal(
                q:GetPropertyChangedSignal "AbsolutePosition",
                function()
                    o(q)
                end
            )
            h.AddSignal(
                q:GetPropertyChangedSignal "AbsoluteSize",
                function()
                    o(q)
                end
            )
            n.AddParent = function(r)
                h.AddSignal(
                    r:GetPropertyChangedSignal "Visible",
                    function()
                        n.SetVisibility(r.Visible)
                    end
                )
            end
            n.SetVisibility = function(r)
                p.Transparency = r and 0.98 or 1
            end
            n.Frame = q
            n.Model = p
            return n
        end
    end,
    function()
        local c, d, e, f, g = b(4)
        local h, i = e(d.Parent.Parent.Creator), e(d.Parent.AcrylicBlur)
        local j = h.New
        return function(k)
            local l = {}
            l.Frame =
                j(
                "Frame",
                {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 0.9,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderSizePixel = 0
                },
                {
                    j(
                        "ImageLabel",
                        {
                            Image = "rbxassetid://8992230677",
                            ScaleType = "Slice",
                            SliceCenter = Rect.new(Vector2.new(99, 99), Vector2.new(99, 99)),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Size = UDim2.new(1, 120, 1, 116),
                            Position = UDim2.new(0.5, 0, 0.5, 0),
                            BackgroundTransparency = 1,
                            ImageColor3 = Color3.fromRGB(0, 0, 0),
                            ImageTransparency = 0.7
                        }
                    ),
                    j("UICorner", {CornerRadius = UDim.new(0, 10)}),
                    j(
                        "Frame",
                        {
                            BackgroundTransparency = 0.45,
                            Size = UDim2.fromScale(1, 1),
                            Name = "Background",
                            ThemeTag = {BackgroundColor3 = "AcrylicMain"}
                        },
                        {j("UICorner", {CornerRadius = UDim.new(0, 10)})}
                    ),
                    j(
                        "Frame",
                        {
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                            BackgroundTransparency = 0.4,
                            Size = UDim2.fromScale(1, 1)
                        },
                        {
                            j("UICorner", {CornerRadius = UDim.new(0, 10)}),
                            j("UIGradient", {Rotation = 90, ThemeTag = {Color = "AcrylicGradient"}})
                        }
                    ),
                    j(
                        "ImageLabel",
                        {
                            Image = "rbxassetid://9968344105",
                            ImageTransparency = 0.98,
                            ScaleType = Enum.ScaleType.Tile,
                            TileSize = UDim2.new(0, 128, 0, 128),
                            Size = UDim2.fromScale(1, 1),
                            BackgroundTransparency = 1
                        },
                        {j("UICorner", {CornerRadius = UDim.new(0, 10)})}
                    ),
                    j(
                        "ImageLabel",
                        {
                            Image = "rbxassetid://9968344227",
                            ImageTransparency = 0.9,
                            ScaleType = Enum.ScaleType.Tile,
                            TileSize = UDim2.new(0, 128, 0, 128),
                            Size = UDim2.fromScale(1, 1),
                            BackgroundTransparency = 1,
                            ThemeTag = {ImageTransparency = "AcrylicNoise"}
                        },
                        {j("UICorner", {CornerRadius = UDim.new(0, 10)})}
                    ),
                    j(
                        "Frame",
                        {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), ZIndex = 2},
                        {
                            j("UICorner", {CornerRadius = UDim.new(0, 10)}),
                            j("UIStroke", {Transparency = 0.5, Thickness = 1, ThemeTag = {Color = "AcrylicBorder"}})
                        }
                    )
                }
            )
            local m
            if e(d.Parent.Parent).UseAcrylic then
                m = i()
                m.Frame.Parent = l.Frame
                l.Model = m.Model
                l.AddParent = m.AddParent
                l.SetVisibility = m.SetVisibility
            end
            return l
        end
    end,
    function()
        local c, d, e, f, g = b(5)
        local h = d.Parent.Parent
        local i = e(h.Creator)
        local j = function()
            local j =
                i.New(
                "Part",
                {
                    Name = "Body",
                    Color = Color3.new(0, 0, 0),
                    Material = Enum.Material.Glass,
                    Size = Vector3.new(1, 1, 0),
                    Anchored = true,
                    CanCollide = false,
                    Locked = true,
                    CastShadow = false,
                    Transparency = 0.98
                },
                {i.New("SpecialMesh", {MeshType = Enum.MeshType.Brick, Offset = Vector3.new(0, 0, -1E-6)})}
            )
            return j
        end
        return j
    end,
    function()
        local c, d, e, f, g = b(6)
        local h, i = function(h, i, j, k, l)
                return (h - i) * (l - k) / (j - i) + k
            end, function(h, i)
                local j = game:GetService "Workspace".CurrentCamera:ScreenPointToRay(h.X, h.Y)
                return j.Origin + j.Direction * i
            end
        local j = function()
            local j = game:GetService "Workspace".CurrentCamera.ViewportSize.Y
            return h(j, 0, 2560, 8, 56)
        end
        return {i, j}
    end,
    [8] = function()
        local c, d, e, f, g = b(8)
        return {
            Close = "rbxassetid://9886659671",
            Min = "rbxassetid://9886659276",
            Max = "rbxassetid://9886659406",
            Restore = "rbxassetid://9886659001"
        }
    end,
    [9] = function()
        local c, d, e, f, g = b(9)
        local h = d.Parent.Parent
        local i, j = e(h.Packages.Flipper), e(h.Creator)
        local k, l = j.New, i.Spring.new
        return function(m, n, o)
            o = o or false
            local p = {}
            p.Title =
                k(
                "TextLabel",
                {
                    FontFace = Font.new "rbxasset://fonts/families/GothamSSm.json",
                    TextColor3 = Color3.fromRGB(200, 200, 200),
                    TextSize = 14,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1),
                    ThemeTag = {TextColor3 = "Text"}
                }
            )
            p.HoverFrame =
                k(
                "Frame",
                {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ThemeTag = {BackgroundColor3 = "Hover"}},
                {k("UICorner", {CornerRadius = UDim.new(0, 8)})}
            )
            p.Frame =
                k(
                "TextButton",
                {Size = UDim2.new(0, 0, 0, 32), Parent = n, ThemeTag = {BackgroundColor3 = "DialogButton"}},
                {
                    k("UICorner", {CornerRadius = UDim.new(0, 8)}),
                    k(
                        "UIStroke",
                        {
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            Transparency = 0.65,
                            ThemeTag = {Color = "DialogButtonBorder"}
                        }
                    ),
                    p.HoverFrame,
                    p.Title
                }
            )
            local q, r = j.SpringMotor(1, p.HoverFrame, "BackgroundTransparency", o)
            j.AddSignal(
                p.Frame.MouseEnter,
                function()
                    r(0.97)
                end
            )
            j.AddSignal(
                p.Frame.MouseLeave,
                function()
                    r(1)
                end
            )
            j.AddSignal(
                p.Frame.MouseButton1Down,
                function()
                    r(1)
                end
            )
            j.AddSignal(
                p.Frame.MouseButton1Up,
                function()
                    r(0.97)
                end
            )
            return p
        end
    end,
    [10] = function()
        local c, d, e, f, g = b(10)
        local h, i, j, k =
            game:GetService "UserInputService",
            game:GetService "Players".LocalPlayer:GetMouse(),
            game:GetService "Workspace".CurrentCamera,
            d.Parent.Parent
        local l, m = e(k.Packages.Flipper), e(k.Creator)
        local n, o, p, q = l.Spring.new, l.Instant.new, m.New, {Window = nil}
        function q.Init(r, s)
            q.Window = s
            return q
        end
        function q.Create(r)
            local s = {Buttons = 0}
            s.TintFrame =
                p(
                "TextButton",
                {
                    Text = "",
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                    BackgroundTransparency = 1,
                    Parent = q.Window.Root
                },
                {p("UICorner", {CornerRadius = UDim.new(0, 8)})}
            )
            local t, u = m.SpringMotor(1, s.TintFrame, "BackgroundTransparency", true)
            s.ButtonHolder =
                p(
                "Frame",
                {
                    Size = UDim2.new(1, -40, 1, -40),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    BackgroundTransparency = 1
                },
                {
                    p(
                        "UIListLayout",
                        {
                            Padding = UDim.new(0, 10),
                            FillDirection = Enum.FillDirection.Horizontal,
                            HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }
                    )
                }
            )
            s.ButtonHolderFrame =
                p(
                "Frame",
                {
                    Size = UDim2.new(1, 0, 0, 70),
                    Position = UDim2.new(0, 0, 1, -70),
                    ThemeTag = {BackgroundColor3 = "DialogHolder"}
                },
                {
                    p("Frame", {Size = UDim2.new(1, 0, 0, 1), ThemeTag = {BackgroundColor3 = "DialogHolderLine"}}),
                    s.ButtonHolder
                }
            )
            s.Title =
                p(
                "TextLabel",
                {
                    FontFace = Font.new(
                        "rbxasset://fonts/families/GothamSSm.json",
                        Enum.FontWeight.SemiBold,
                        Enum.FontStyle.Normal
                    ),
                    Text = "Dialog",
                    TextColor3 = Color3.fromRGB(240, 240, 240),
                    TextSize = 22,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Size = UDim2.new(1, 0, 0, 22),
                    Position = UDim2.fromOffset(20, 25),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    ThemeTag = {TextColor3 = "Text"}
                }
            )
            s.Scale = p("UIScale", {Scale = 1})
            local v, w = m.SpringMotor(1.1, s.Scale, "Scale")
            s.Root =
                p(
                "CanvasGroup",
                {
                    Size = UDim2.fromOffset(300, 165),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    GroupTransparency = 1,
                    Parent = s.TintFrame,
                    ThemeTag = {BackgroundColor3 = "Dialog"}
                },
                {
                    p("UICorner", {CornerRadius = UDim.new(0, 8)}),
                    p("UIStroke", {Transparency = 0.5, ThemeTag = {Color = "DialogBorder"}}),
                    s.Scale,
                    s.Title,
                    s.ButtonHolderFrame
                }
            )
            local x, y = m.SpringMotor(1, s.Root, "GroupTransparency")
            function s.Open(z)
                e(k).DialogOpen = true
                s.Scale.Scale = 1.1
                u(0.75)
                y(0)
                w(1)
            end
            function s.Close(z)
                e(k).DialogOpen = false
                u(1)
                y(1)
                w(1.1)
                s.Root.UIStroke:Destroy()
                task.wait(0.15)
                s.TintFrame:Destroy()
            end
            function s.Button(z, A, B)
                s.Buttons = s.Buttons + 1
                A = A or "Button"
                B = B or function()
                    end
                local C = e(k.Components.Button)("", s.ButtonHolder, true)
                C.Title.Text = A
                for D, E in next, s.ButtonHolder:GetChildren() do
                    if E:IsA "TextButton" then
                        E.Size = UDim2.new(1 / s.Buttons, -(((s.Buttons - 1) * 10) / s.Buttons), 0, 32)
                    end
                end
                m.AddSignal(
                    C.Frame.MouseButton1Click,
                    function()
                        e(k):SafeCallback(B)
                        pcall(
                            function()
                                s:Close()
                            end
                        )
                    end
                )
                return C
            end
            return s
        end
        return q
    end,
    [11] = function()
        local c, d, e, f, g = b(11)
        local h = d.Parent.Parent
        local i, j = e(h.Packages.Flipper), e(h.Creator)
        local k, l = j.New, i.Spring.new
        return function(m, n, o, p)
            local q = {}
            q.TitleLabel =
                k(
                "TextLabel",
                {
                    FontFace = Font.new(
                        "rbxasset://fonts/families/GothamSSm.json",
                        Enum.FontWeight.Medium,
                        Enum.FontStyle.Normal
                    ),
                    Text = m,
                    TextColor3 = Color3.fromRGB(240, 240, 240),
                    TextSize = 13,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Size = UDim2.new(1, 0, 0, 14),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    ThemeTag = {TextColor3 = "Text"}
                }
            )
            q.DescLabel =
                k(
                "TextLabel",
                {
                    FontFace = Font.new "rbxasset://fonts/families/GothamSSm.json",
                    Text = n,
                    TextColor3 = Color3.fromRGB(200, 200, 200),
                    TextSize = 12,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 14),
                    ThemeTag = {TextColor3 = "SubText"}
                }
            )
            q.LabelHolder =
                k(
                "Frame",
                {
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    Position = UDim2.fromOffset(10, 0),
                    Size = UDim2.new(1, -28, 0, 0)
                },
                {
                    k(
                        "UIListLayout",
                        {SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center}
                    ),
                    k("UIPadding", {PaddingBottom = UDim.new(0, 13), PaddingTop = UDim.new(0, 13)}),
                    q.TitleLabel,
                    q.DescLabel
                }
            )
            q.Border =
                k(
                "UIStroke",
                {
                    Transparency = 0.5,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Color = Color3.fromRGB(0, 0, 0),
                    ThemeTag = {Color = "ElementBorder"}
                }
            )
            q.Frame =
                k(
                "TextButton",
                {
                    Size = UDim2.new(1, 0, 0, 0),
                    BackgroundTransparency = 0.89,
                    BackgroundColor3 = Color3.fromRGB(130, 130, 130),
                    Parent = o,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    Text = "",
                    LayoutOrder = 7,
                    ThemeTag = {BackgroundColor3 = "Element", BackgroundTransparency = "ElementTransparency"}
                },
                {k("UICorner", {CornerRadius = UDim.new(0, 8)}), q.Border, q.LabelHolder}
            )
            function q.SetTitle(r, s)
                q.TitleLabel.Text = s
            end
            function q.SetDesc(r, s)
                if s == nil then
                    s = ""
                end
                if s == "" then
                    q.DescLabel.Visible = false
                else
                    q.DescLabel.Visible = true
                end
                q.DescLabel.Text = s
            end
            function q.Destroy(r)
                q.Frame:Destroy()
            end
            q:SetTitle(m)
            q:SetDesc(n)
            if p then
                local r, s, t =
                    h.Themes,
                    j.SpringMotor(
                        j.GetThemeProperty "ElementTransparency",
                        q.Frame,
                        "BackgroundTransparency",
                        false,
                        true
                    )
                j.AddSignal(
                    q.Frame.MouseEnter,
                    function()
                        t(j.GetThemeProperty "ElementTransparency" - j.GetThemeProperty "HoverChange")
                    end
                )
                j.AddSignal(
                    q.Frame.MouseLeave,
                    function()
                        t(j.GetThemeProperty "ElementTransparency")
                    end
                )
                j.AddSignal(
                    q.Frame.MouseButton1Down,
                    function()
                        t(j.GetThemeProperty "ElementTransparency" + j.GetThemeProperty "HoverChange")
                    end
                )
                j.AddSignal(
                    q.Frame.MouseButton1Up,
                    function()
                        t(j.GetThemeProperty "ElementTransparency" - j.GetThemeProperty "HoverChange")
                    end
                )
            end
            return q
        end
    end,
    [12] = function()
        local c, d, e, f, g = b(12)
        local h = d.Parent.Parent
        local i, j, k = e(h.Packages.Flipper), e(h.Creator), e(h.Acrylic)
        local l, m, n, o = i.Spring.new, i.Instant.new, j.New, {}
        function o.Init(p, q)
            o.Holder =
                n(
                "Frame",
                {
                    Position = UDim2.new(1, -30, 1, -30),
                    Size = UDim2.new(0, 310, 1, -30),
                    AnchorPoint = Vector2.new(1, 1),
                    BackgroundTransparency = 1,
                    Parent = q
                },
                {
                    n(
                        "UIListLayout",
                        {
                            HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            VerticalAlignment = Enum.VerticalAlignment.Bottom,
                            Padding = UDim.new(0, 20)
                        }
                    )
                }
            )
        end
        function o.New(p, q)
            q.Title = q.Title or "Title"
            q.Content = q.Content or "Content"
            q.SubContent = q.SubContent or ""
            q.Duration = q.Duration or nil
            q.Buttons = q.Buttons or {}
            local r = {Closed = false}
            r.AcrylicPaint = k.AcrylicPaint()
            r.Title =
                n(
                "TextLabel",
                {
                    Position = UDim2.new(0, 14, 0, 17),
                    Text = q.Title,
                    RichText = true,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextTransparency = 0,
                    FontFace = Font.new "rbxasset://fonts/families/GothamSSm.json",
                    TextSize = 13,
                    TextXAlignment = "Left",
                    TextYAlignment = "Center",
                    Size = UDim2.new(1, -12, 0, 12),
                    TextWrapped = true,
                    BackgroundTransparency = 1,
                    ThemeTag = {TextColor3 = "Text"}
                }
            )
            r.ContentLabel =
                n(
                "TextLabel",
                {
                    FontFace = Font.new "rbxasset://fonts/families/GothamSSm.json",
                    Text = q.Content,
                    TextColor3 = Color3.fromRGB(240, 240, 240),
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    Size = UDim2.new(1, 0, 0, 14),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    TextWrapped = true,
                    ThemeTag = {TextColor3 = "Text"}
                }
            )
            r.SubContentLabel =
                n(
                "TextLabel",
                {
                    FontFace = Font.new "rbxasset://fonts/families/GothamSSm.json",
                    Text = q.SubContent,
                    TextColor3 = Color3.fromRGB(240, 240, 240),
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    Size = UDim2.new(1, 0, 0, 14),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    TextWrapped = true,
                    ThemeTag = {TextColor3 = "SubText"}
                }
            )
            r.LabelHolder =
                n(
                "Frame",
                {
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    Position = UDim2.fromOffset(14, 40),
                    Size = UDim2.new(1, -28, 0, 0)
                },
                {
                    n(
                        "UIListLayout",
                        {
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            VerticalAlignment = Enum.VerticalAlignment.Center,
                            Padding = UDim.new(0, 3)
                        }
                    ),
                    r.ContentLabel,
                    r.SubContentLabel
                }
            )
            r.CloseButton =
                n(
                "TextButton",
                {
                    Text = "",
                    Position = UDim2.new(1, -14, 0, 13),
                    Size = UDim2.fromOffset(20, 20),
                    AnchorPoint = Vector2.new(1, 0),
                    BackgroundTransparency = 1
                },
                {
                    n(
                        "ImageLabel",
                        {
                            Image = e(d.Parent.Assets).Close,
                            Size = UDim2.fromOffset(16, 16),
                            Position = UDim2.fromScale(0.5, 0.5),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            BackgroundTransparency = 1,
                            ThemeTag = {ImageColor3 = "Text"}
                        }
                    )
                }
            )
            r.Root =
                n(
                "Frame",
                {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0), Position = UDim2.fromScale(1, 0)},
                {r.AcrylicPaint.Frame, r.Title, r.CloseButton, r.LabelHolder}
            )
            if q.Content == "" then
                r.ContentLabel.Visible = false
            end
            if q.SubContent == "" then
                r.SubContentLabel.Visible = false
            end
            r.Holder =
                n("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 200), Parent = o.Holder}, {r.Root})
            local s = i.GroupMotor.new {Scale = 1, Offset = 60}
            s:onStep(
                function(t)
                    r.Root.Position = UDim2.new(t.Scale, t.Offset, 0, 0)
                end
            )
            j.AddSignal(
                r.CloseButton.MouseButton1Click,
                function()
                    r:Close()
                end
            )
            function r.Open(t)
                local u = r.LabelHolder.AbsoluteSize.Y
                r.Holder.Size = UDim2.new(1, 0, 0, 58 + u)
                s:setGoal {Scale = l(0, {frequency = 5}), Offset = l(0, {frequency = 5})}
            end
            function r.Close(t)
                if not r.Closed then
                    r.Closed = true
                    task.spawn(
                        function()
                            s:setGoal {Scale = l(1, {frequency = 5}), Offset = l(60, {frequency = 5})}
                            task.wait(0.4)
                            if e(h).UseAcrylic then
                                r.AcrylicPaint.Model:Destroy()
                            end
                            r.Holder:Destroy()
                        end
                    )
                end
            end
            r:Open()
            if q.Duration then
                task.delay(
                    q.Duration,
                    function()
                        r:Close()
                    end
                )
            end
            return r
        end
        return o
    end,
    [13] = function()
        local c, d, e, f, g = b(13)
        local h = d.Parent.Parent
        local i = e(h.Creator)
        local j = i.New
        return function(k, l)
            local m = {}
            m.Layout = j("UIListLayout", {Padding = UDim.new(0, 5)})
            m.Container =
                j(
                "Frame",
                {Size = UDim2.new(1, 0, 0, 26), Position = UDim2.fromOffset(0, 24), BackgroundTransparency = 1},
                {m.Layout}
            )
            m.Root =
                j(
                "Frame",
                {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 26), LayoutOrder = 7, Parent = l},
                {
                    j(
                        "TextLabel",
                        {
                            RichText = true,
                            Text = k,
                            TextTransparency = 0,
                            FontFace = Font.new(
                                "rbxassetid://12187365364",
                                Enum.FontWeight.SemiBold,
                                Enum.FontStyle.Normal
                            ),
                            TextSize = 18,
                            TextXAlignment = "Left",
                            TextYAlignment = "Center",
                            Size = UDim2.new(1, -16, 0, 18),
                            Position = UDim2.fromOffset(0, 2),
                            ThemeTag = {TextColor3 = "Text"}
                        }
                    ),
                    m.Container
                }
            )
            i.AddSignal(
                m.Layout:GetPropertyChangedSignal "AbsoluteContentSize",
                function()
                    m.Container.Size = UDim2.new(1, 0, 0, m.Layout.AbsoluteContentSize.Y)
                    m.Root.Size = UDim2.new(1, 0, 0, m.Layout.AbsoluteContentSize.Y + 25)
                end
            )
            return m
        end
    end,
    [14] = function()
        local c, d, e, f, g = b(14)
        local h = d.Parent.Parent
        local i, j = e(h.Packages.Flipper), e(h.Creator)
        local k, l, m, n, o =
            j.New,
            i.Spring.new,
            i.Instant.new,
            h.Components,
            {Window = nil, Tabs = {}, Containers = {}, SelectedTab = 0, TabCount = 0}
        function o.Init(p, q)
            o.Window = q
            return o
        end
        function o.GetCurrentTabPos(p)
            local q, r = o.Window.TabHolder.AbsolutePosition.Y, o.Tabs[o.SelectedTab].Frame.AbsolutePosition.Y
            return r - q
        end
        function o.New(p, q, r, s)
            local t, u = e(h), o.Window
            local v = t.Elements
            o.TabCount = o.TabCount + 1
            local w, x = o.TabCount, {Selected = false, Name = q, Type = "Tab"}
            if t:GetIcon(r) then
                r = t:GetIcon(r)
            end
            if r == "" or nil then
                r = nil
            end
            x.Frame =
                k(
                "TextButton",
                {
                    Size = UDim2.new(1, 0, 0, 34),
                    BackgroundTransparency = 1,
                    Parent = s,
                    ThemeTag = {BackgroundColor3 = "Tab"}
                },
                {
                    k("UICorner", {CornerRadius = UDim.new(0, 8)}),
                    k(
                        "TextLabel",
                        {
                            AnchorPoint = Vector2.new(0, 0.5),
                            Position = r and UDim2.new(0, 30, 0.5, 0) or UDim2.new(0, 12, 0.5, 0),
                            Text = q,
                            RichText = true,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            TextTransparency = 0,
                            FontFace = Font.new(
                                "rbxasset://fonts/families/GothamSSm.json",
                                Enum.FontWeight.Regular,
                                Enum.FontStyle.Normal
                            ),
                            TextSize = 12,
                            TextXAlignment = "Left",
                            TextYAlignment = "Center",
                            Size = UDim2.new(1, -12, 1, 0),
                            BackgroundTransparency = 1,
                            ThemeTag = {TextColor3 = "Text"}
                        }
                    ),
                    k(
                        "ImageLabel",
                        {
                            AnchorPoint = Vector2.new(0, 0.5),
                            Size = UDim2.fromOffset(16, 16),
                            Position = UDim2.new(0, 8, 0.5, 0),
                            BackgroundTransparency = 1,
                            Image = r and r or nil,
                            ThemeTag = {ImageColor3 = "Text"}
                        }
                    )
                }
            )
            local y = k("UIListLayout", {Padding = UDim.new(0, 5), SortOrder = Enum.SortOrder.LayoutOrder})
            x.ContainerFrame =
                k(
                "ScrollingFrame",
                {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 1,
                    Parent = u.ContainerHolder,
                    Visible = false,
                    BottomImage = "rbxassetid://6889812791",
                    MidImage = "rbxassetid://6889812721",
                    TopImage = "rbxassetid://6276641225",
                    ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
                    ScrollBarImageTransparency = 0.95,
                    ScrollBarThickness = 3,
                    BorderSizePixel = 0,
                    CanvasSize = UDim2.fromScale(0, 0),
                    ScrollingDirection = Enum.ScrollingDirection.Y
                },
                {
                    y,
                    k(
                        "UIPadding",
                        {
                            PaddingRight = UDim.new(0, 10),
                            PaddingLeft = UDim.new(0, 1),
                            PaddingTop = UDim.new(0, 1),
                            PaddingBottom = UDim.new(0, 1)
                        }
                    )
                }
            )
            j.AddSignal(
                y:GetPropertyChangedSignal "AbsoluteContentSize",
                function()
                    x.ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, y.AbsoluteContentSize.Y + 2)
                end
            )
            x.Motor, x.SetTransparency = j.SpringMotor(1, x.Frame, "BackgroundTransparency")
            j.AddSignal(
                x.Frame.MouseEnter,
                function()
                    x.SetTransparency(x.Selected and 0.85 or 0.89)
                end
            )
            j.AddSignal(
                x.Frame.MouseLeave,
                function()
                    x.SetTransparency(x.Selected and 0.89 or 1)
                end
            )
            j.AddSignal(
                x.Frame.MouseButton1Down,
                function()
                    x.SetTransparency(0.92)
                end
            )
            j.AddSignal(
                x.Frame.MouseButton1Up,
                function()
                    x.SetTransparency(x.Selected and 0.85 or 0.89)
                end
            )
            j.AddSignal(
                x.Frame.MouseButton1Click,
                function()
                    o:SelectTab(w)
                end
            )
            o.Containers[w] = x.ContainerFrame
            o.Tabs[w] = x
            x.Container = x.ContainerFrame
            x.ScrollFrame = x.Container
            function x.AddSection(z, A)
                local B, C = {Type = "Section"}, e(n.Section)(A, x.Container)
                B.Container = C.Container
                B.ScrollFrame = x.Container
                setmetatable(B, v)
                return B
            end
            setmetatable(x, v)
            return x
        end
        function o.SelectTab(p, q)
            local r = o.Window
            o.SelectedTab = q
            for s, t in next, o.Tabs do
                t.SetTransparency(1)
                t.Selected = false
            end
            o.Tabs[q].SetTransparency(0.89)
            o.Tabs[q].Selected = true
            r.TabDisplay.Text = o.Tabs[q].Name
            r.SelectorPosMotor:setGoal(l(o:GetCurrentTabPos(), {frequency = 6}))
            task.spawn(
                function()
                    r.ContainerPosMotor:setGoal(l(110, {frequency = 10}))
                    r.ContainerBackMotor:setGoal(l(1, {frequency = 10}))
                    task.wait(0.15)
                    for u, v in next, o.Containers do
                        v.Visible = false
                    end
                    o.Containers[q].Visible = true
                    r.ContainerPosMotor:setGoal(l(94, {frequency = 5}))
                    r.ContainerBackMotor:setGoal(l(0, {frequency = 8}))
                end
            )
        end
        return o
    end,
    [15] = function()
        local c, d, e, f, g = b(15)
        local h, i = game:GetService "TextService", d.Parent.Parent
        local j, k = e(i.Packages.Flipper), e(i.Creator)
        local l = k.New
        return function(m, n)
            n = n or false
            local o = {}
            o.Input =
                l(
                "TextBox",
                {
                    FontFace = Font.new "rbxasset://fonts/families/GothamSSm.json",
                    TextColor3 = Color3.fromRGB(200, 200, 200),
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromOffset(10, 0),
                    ThemeTag = {TextColor3 = "Text", PlaceholderColor3 = "SubText"}
                }
            )
            o.Container =
                l(
                "Frame",
                {
                    BackgroundTransparency = 1,
                    ClipsDescendants = true,
                    Position = UDim2.new(0, 6, 0, 0),
                    Size = UDim2.new(1, -12, 1, 0)
                },
                {o.Input}
            )
            o.Indicator =
                l(
                "Frame",
                {
                    Size = UDim2.new(1, -4, 0, 1),
                    Position = UDim2.new(0, 2, 1, 0),
                    AnchorPoint = Vector2.new(0, 1),
                    BackgroundTransparency = n and 0.5 or 0,
                    ThemeTag = {BackgroundColor3 = n and "InputIndicator" or "DialogInputLine"}
                }
            )
            o.Frame =
                l(
                "Frame",
                {
                    Size = UDim2.new(0, 0, 0, 30),
                    BackgroundTransparency = n and 0.9 or 0,
                    Parent = m,
                    ThemeTag = {BackgroundColor3 = n and "Input" or "DialogInput"}
                },
                {
                    l("UICorner", {CornerRadius = UDim.new(0, 8)}),
                    l(
                        "UIStroke",
                        {
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            Transparency = n and 0.5 or 0.65,
                            ThemeTag = {Color = n and "InElementBorder" or "DialogButtonBorder"}
                        }
                    ),
                    o.Indicator,
                    o.Container
                }
            )
            local p = function()
                local p, q = 2, o.Container.AbsoluteSize.X
                if not o.Input:IsFocused() or o.Input.TextBounds.X <= q - 2 * p then
                    o.Input.Position = UDim2.new(0, p, 0, 0)
                else
                    local r = o.Input.CursorPosition
                    if r ~= -1 then
                        local s = string.sub(o.Input.Text, 1, r - 1)
                        local t = h:GetTextSize(s, o.Input.TextSize, o.Input.Font, Vector2.new(math.huge, math.huge)).X
                        local u = o.Input.Position.X.Offset + t
                        if u < p then
                            o.Input.Position = UDim2.fromOffset(p - t, 0)
                        elseif u > q - p - 1 then
                            o.Input.Position = UDim2.fromOffset(q - t - p - 1, 0)
                        end
                    end
                end
            end
            task.spawn(p)
            k.AddSignal(o.Input:GetPropertyChangedSignal "Text", p)
            k.AddSignal(o.Input:GetPropertyChangedSignal "CursorPosition", p)
            k.AddSignal(
                o.Input.Focused,
                function()
                    p()
                    o.Indicator.Size = UDim2.new(1, -2, 0, 2)
                    o.Indicator.Position = UDim2.new(0, 1, 1, 0)
                    o.Indicator.BackgroundTransparency = 0
                    k.OverrideTag(o.Frame, {BackgroundColor3 = n and "InputFocused" or "DialogHolder"})
                    k.OverrideTag(o.Indicator, {BackgroundColor3 = "Accent"})
                end
            )
            k.AddSignal(
                o.Input.FocusLost,
                function()
                    p()
                    o.Indicator.Size = UDim2.new(1, -4, 0, 1)
                    o.Indicator.Position = UDim2.new(0, 2, 1, 0)
                    o.Indicator.BackgroundTransparency = 0.5
                    k.OverrideTag(o.Frame, {BackgroundColor3 = n and "Input" or "DialogInput"})
                    k.OverrideTag(o.Indicator, {BackgroundColor3 = n and "InputIndicator" or "DialogInputLine"})
                end
            )
            return o
        end
    end,
    [16] = function()
        local c, d, e, f, g = b(16)
        local h, i = d.Parent.Parent, e(d.Parent.Assets)
        local j, k = e(h.Creator), e(h.Packages.Flipper)
        local l, m = j.New, j.AddSignal
        return function(n)
            local o, p, q =
                {},
                e(h),
                function(o, p, q, r)
                    local s = {Callback = r or function()
                            end}
                    s.Frame =
                        l(
                        "TextButton",
                        {
                            Size = UDim2.new(0, 34, 1, -8),
                            AnchorPoint = Vector2.new(1, 0),
                            BackgroundTransparency = 1,
                            Parent = q,
                            Position = p,
                            Text = "",
                            ThemeTag = {BackgroundColor3 = "Text"}
                        },
                        {
                            l("UICorner", {CornerRadius = UDim.new(0, 8)}),
                            l(
                                "ImageLabel",
                                {
                                    Image = o,
                                    Size = UDim2.fromOffset(16, 16),
                                    Position = UDim2.fromScale(0.5, 0.5),
                                    AnchorPoint = Vector2.new(0.5, 0.5),
                                    BackgroundTransparency = 1,
                                    Name = "Icon",
                                    ThemeTag = {ImageColor3 = "Text"}
                                }
                            )
                        }
                    )
                    local t, u = j.SpringMotor(1, s.Frame, "BackgroundTransparency")
                    m(
                        s.Frame.MouseEnter,
                        function()
                            u(0.94)
                        end
                    )
                    m(
                        s.Frame.MouseLeave,
                        function()
                            u(1, true)
                        end
                    )
                    m(
                        s.Frame.MouseButton1Down,
                        function()
                            u(0.96)
                        end
                    )
                    m(
                        s.Frame.MouseButton1Up,
                        function()
                            u(0.94)
                        end
                    )
                    m(s.Frame.MouseButton1Click, s.Callback)
                    s.SetCallback = function(v)
                        s.Callback = v
                    end
                    return s
                end
            o.Frame =
                l(
                "Frame",
                {Size = UDim2.new(1, 0, 0, 42), BackgroundTransparency = 1, Parent = n.Parent},
                {
                    l(
                        "Frame",
                        {Size = UDim2.new(1, -16, 1, 0), Position = UDim2.new(0, 16, 0, 0), BackgroundTransparency = 1},
                        {
                            l(
                                "UIListLayout",
                                {
                                    Padding = UDim.new(0, 5),
                                    FillDirection = Enum.FillDirection.Horizontal,
                                    SortOrder = Enum.SortOrder.LayoutOrder
                                }
                            ),
                            l(
                                "TextLabel",
                                {
                                    RichText = true,
                                    Text = n.Title,
                                    FontFace = Font.new(
                                        "rbxasset://fonts/families/GothamSSm.json",
                                        Enum.FontWeight.Regular,
                                        Enum.FontStyle.Normal
                                    ),
                                    TextSize = 12,
                                    TextXAlignment = "Left",
                                    TextYAlignment = "Center",
                                    Size = UDim2.fromScale(0, 1),
                                    AutomaticSize = Enum.AutomaticSize.X,
                                    BackgroundTransparency = 1,
                                    ThemeTag = {TextColor3 = "Text"}
                                }
                            ),
                            l(
                                "TextLabel",
                                {
                                    RichText = true,
                                    Text = n.SubTitle,
                                    TextTransparency = 0.4,
                                    FontFace = Font.new(
                                        "rbxasset://fonts/families/GothamSSm.json",
                                        Enum.FontWeight.Regular,
                                        Enum.FontStyle.Normal
                                    ),
                                    TextSize = 12,
                                    TextXAlignment = "Left",
                                    TextYAlignment = "Center",
                                    Size = UDim2.fromScale(0, 1),
                                    AutomaticSize = Enum.AutomaticSize.X,
                                    BackgroundTransparency = 1,
                                    ThemeTag = {TextColor3 = "Text"}
                                }
                            )
                        }
                    ),
                    l(
                        "Frame",
                        {
                            BackgroundTransparency = 0.5,
                            Size = UDim2.new(1, 0, 0, 1),
                            Position = UDim2.new(0, 0, 1, 0),
                            ThemeTag = {BackgroundColor3 = "TitleBarLine"}
                        }
                    )
                }
            )
            o.CloseButton =
                q(
                i.Close,
                UDim2.new(1, -4, 0, 4),
                o.Frame,
                function()
                    p.Window:Dialog {
                        Title = "Close",
                        Content = "Are you sure you want to unload the interface?",
                        Buttons = {{Title = "Yes", Callback = function()
                                    p:Destroy()
                                end}, {Title = "No"}}
                    }
                end
            )
            o.MaxButton =
                q(
                i.Max,
                UDim2.new(1, -40, 0, 4),
                o.Frame,
                function()
                    n.Window.Maximize(not n.Window.Maximized)
                end
            )
            o.MinButton =
                q(
                i.Min,
                UDim2.new(1, -80, 0, 4),
                o.Frame,
                function()
                    p.Window:Minimize()
                end
            )
            return o
        end
    end,
    [17] = function()
        local c, d, e, f, g = b(17)
        local h, i, j, k =
            game:GetService "UserInputService",
            game:GetService "Players".LocalPlayer:GetMouse(),
            game:GetService "Workspace".CurrentCamera,
            d.Parent.Parent
        local l, m, n, o, p = e(k.Packages.Flipper), e(k.Creator), e(k.Acrylic), e(d.Parent.Assets), d.Parent
        local q, r, s = l.Spring.new, l.Instant.new, m.New
        return function(t)
            local u, v, w, x, y, z =
                e(k),
                {
                    Minimized = false,
                    Maximized = false,
                    Size = t.Size,
                    CurrentPos = 0,
                    Position = UDim2.fromOffset(
                        j.ViewportSize.X / 2 - t.Size.X.Offset / 2,
                        j.ViewportSize.Y / 2 - t.Size.Y.Offset / 2
                    )
                },
                false
            local A, B = false
            local C = false
            v.AcrylicPaint = n.AcrylicPaint()
            local D, E =
                s(
                    "Frame",
                    {
                        Size = UDim2.fromOffset(4, 0),
                        BackgroundColor3 = Color3.fromRGB(76, 194, 255),
                        Position = UDim2.fromOffset(0, 17),
                        AnchorPoint = Vector2.new(0, 0.5),
                        ThemeTag = {BackgroundColor3 = "Accent"}
                    },
                    {s("UICorner", {CornerRadius = UDim.new(0, 8)})}
                ),
                s(
                    "Frame",
                    {Size = UDim2.fromOffset(20, 20), BackgroundTransparency = 1, Position = UDim2.new(1, -20, 1, -20)}
                )
            v.TabHolder =
                s(
                "ScrollingFrame",
                {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 1,
                    ScrollBarImageTransparency = 1,
                    ScrollBarThickness = 0,
                    BorderSizePixel = 0,
                    CanvasSize = UDim2.fromScale(0, 0),
                    ScrollingDirection = Enum.ScrollingDirection.Y
                },
                {s("UIListLayout", {Padding = UDim.new(0, 4)})}
            )
            local F =
                s(
                "Frame",
                {
                    Size = UDim2.new(0, t.TabWidth, 1, -66),
                    Position = UDim2.new(0, 12, 0, 54),
                    BackgroundTransparency = 1,
                    ClipsDescendants = true
                },
                {v.TabHolder, D}
            )
            v.TabDisplay =
                s(
                "TextLabel",
                {
                    RichText = true,
                    Text = "Tab",
                    TextTransparency = 0,
                    FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
                    TextSize = 28,
                    TextXAlignment = "Left",
                    TextYAlignment = "Center",
                    Size = UDim2.new(1, -16, 0, 28),
                    Position = UDim2.fromOffset(t.TabWidth + 26, 56),
                    BackgroundTransparency = 1,
                    ThemeTag = {TextColor3 = "Text"}
                }
            )
            v.ContainerHolder =
                s(
                "CanvasGroup",
                {
                    Size = UDim2.new(1, -t.TabWidth - 32, 1, -102),
                    Position = UDim2.fromOffset(t.TabWidth + 26, 90),
                    BackgroundTransparency = 1
                }
            )
            v.Root =
                s(
                "Frame",
                {BackgroundTransparency = 1, Size = v.Size, Position = v.Position, Parent = t.Parent},
                {v.AcrylicPaint.Frame, v.TabDisplay, v.ContainerHolder, F, E}
            )
            v.TitleBar = e(d.Parent.TitleBar) {Title = t.Title, SubTitle = t.SubTitle, Parent = v.Root, Window = v}
            if e(k).UseAcrylic then
                v.AcrylicPaint.AddParent(v.Root)
            end
            local G, H =
                l.GroupMotor.new {X = v.Size.X.Offset, Y = v.Size.Y.Offset},
                l.GroupMotor.new {X = v.Position.X.Offset, Y = v.Position.Y.Offset}
            v.SelectorPosMotor = l.SingleMotor.new(17)
            v.SelectorSizeMotor = l.SingleMotor.new(0)
            v.ContainerBackMotor = l.SingleMotor.new(0)
            v.ContainerPosMotor = l.SingleMotor.new(94)
            G:onStep(
                function(I)
                    v.Root.Size = UDim2.new(0, I.X, 0, I.Y)
                end
            )
            H:onStep(
                function(I)
                    v.Root.Position = UDim2.new(0, I.X, 0, I.Y)
                end
            )
            local I, J = 0, 0
            v.SelectorPosMotor:onStep(
                function(K)
                    D.Position = UDim2.new(0, 0, 0, K + 17)
                    local L = tick()
                    local M = L - J
                    if I ~= nil then
                        v.SelectorSizeMotor:setGoal(q((math.abs(K - I) / (M * 60)) + 16))
                        I = K
                    end
                    J = L
                end
            )
            v.SelectorSizeMotor:onStep(
                function(K)
                    D.Size = UDim2.new(0, 4, 0, K)
                end
            )
            v.ContainerBackMotor:onStep(
                function(K)
                    v.ContainerHolder.GroupTransparency = K
                end
            )
            v.ContainerPosMotor:onStep(
                function(K)
                    v.ContainerHolder.Position = UDim2.fromOffset(t.TabWidth + 26, K)
                end
            )
            local K, L
            v.Maximize = function(M, N, O)
                v.Maximized = M
                v.TitleBar.MaxButton.Frame.Icon.Image = M and o.Restore or o.Max
                if M then
                    K = v.Size.X.Offset
                    L = v.Size.Y.Offset
                end
                local P, Q = M and j.ViewportSize.X or K, M and j.ViewportSize.Y or L
                G:setGoal {
                    X = l[O and "Instant" or "Spring"].new(P, {frequency = 6}),
                    Y = l[O and "Instant" or "Spring"].new(Q, {frequency = 6})
                }
                v.Size = UDim2.fromOffset(P, Q)
                if not N then
                    H:setGoal {
                        X = q(M and 0 or v.Position.X.Offset, {frequency = 6}),
                        Y = q(M and 0 or v.Position.Y.Offset, {frequency = 6})
                    }
                end
            end
            m.AddSignal(
                v.TitleBar.Frame.InputBegan,
                function(M)
                    if M.UserInputType == Enum.UserInputType.MouseButton1 or M.UserInputType == Enum.UserInputType.Touch then
                        w = true
                        y = M.Position
                        z = v.Root.Position
                        if v.Maximized then
                            z =
                                UDim2.fromOffset(
                                i.X - (i.X * ((K - 100) / v.Root.AbsoluteSize.X)),
                                i.Y - (i.Y * (L / v.Root.AbsoluteSize.Y))
                            )
                        end
                        M.Changed:Connect(
                            function()
                                if M.UserInputState == Enum.UserInputState.End then
                                    w = false
                                end
                            end
                        )
                    end
                end
            )
            m.AddSignal(
                v.TitleBar.Frame.InputChanged,
                function(M)
                    if
                        M.UserInputType == Enum.UserInputType.MouseMovement or
                            M.UserInputType == Enum.UserInputType.Touch
                     then
                        x = M
                    end
                end
            )
            m.AddSignal(
                E.InputBegan,
                function(M)
                    if M.UserInputType == Enum.UserInputType.MouseButton1 or M.UserInputType == Enum.UserInputType.Touch then
                        A = true
                        B = M.Position
                    end
                end
            )
            m.AddSignal(
                h.InputChanged,
                function(M)
                    if M == x and w then
                        local N = M.Position - y
                        v.Position = UDim2.fromOffset(z.X.Offset + N.X, z.Y.Offset + N.Y)
                        H:setGoal {X = r(v.Position.X.Offset), Y = r(v.Position.Y.Offset)}
                        if v.Maximized then
                            v.Maximize(false, true, true)
                        end
                    end
                    if
                        (M.UserInputType == Enum.UserInputType.MouseMovement or
                            M.UserInputType == Enum.UserInputType.Touch) and
                            A
                     then
                        local N, O = M.Position - B, v.Size
                        local P = Vector3.new(O.X.Offset, O.Y.Offset, 0) + Vector3.new(1, 1, 0) * N
                        local Q = Vector2.new(math.clamp(P.X, 470, 2048), math.clamp(P.Y, 380, 2048))
                        G:setGoal {X = l.Instant.new(Q.X), Y = l.Instant.new(Q.Y)}
                    end
                end
            )
            m.AddSignal(
                h.InputEnded,
                function(M)
                    if A == true or M.UserInputType == Enum.UserInputType.Touch then
                        A = false
                        v.Size = UDim2.fromOffset(G:getValue().X, G:getValue().Y)
                    end
                end
            )
            m.AddSignal(
                v.TabHolder.UIListLayout:GetPropertyChangedSignal "AbsoluteContentSize",
                function()
                    v.TabHolder.CanvasSize = UDim2.new(0, 0, 0, v.TabHolder.UIListLayout.AbsoluteContentSize.Y)
                end
            )
            m.AddSignal(
                h.InputBegan,
                function(M)
                    if
                        type(u.MinimizeKeybind) == "table" and u.MinimizeKeybind.Type == "Keybind" and
                            not h:GetFocusedTextBox()
                     then
                        if M.KeyCode.Name == u.MinimizeKeybind.Value then
                            v:Minimize()
                        end
                    elseif M.KeyCode == u.MinimizeKey and not h:GetFocusedTextBox() then
                        v:Minimize()
                    end
                end
            )
            function v.Minimize(M)
                v.Minimized = not v.Minimized
                v.Root.Visible = not v.Minimized
                if not C then
                    C = true
                    local N = u.MinimizeKeybind and u.MinimizeKeybind.Value or u.MinimizeKey.Name
                    u:Notify {Title = "Interface", Content = "Press " .. N .. " to toggle the inteface.", Duration = 6}
                end
            end
            function v.Destroy(M)
                if e(k).UseAcrylic then
                    v.AcrylicPaint.Model:Destroy()
                end
                v.Root:Destroy()
            end
            local M = e(p.Dialog):Init(v)
            function v.Dialog(N, O)
                local P = M:Create()
                P.Title.Text = O.Title
                local Q =
                    s(
                    "TextLabel",
                    {
                        FontFace = Font.new "rbxasset://fonts/families/GothamSSm.json",
                        Text = O.Content,
                        TextColor3 = Color3.fromRGB(240, 240, 240),
                        TextSize = 14,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Top,
                        Size = UDim2.new(1, -40, 1, 0),
                        Position = UDim2.fromOffset(20, 60),
                        BackgroundTransparency = 1,
                        Parent = P.Root,
                        ClipsDescendants = false,
                        ThemeTag = {TextColor3 = "Text"}
                    }
                )
                s(
                    "UISizeConstraint",
                    {MinSize = Vector2.new(300, 165), MaxSize = Vector2.new(620, math.huge), Parent = P.Root}
                )
                P.Root.Size = UDim2.fromOffset(Q.TextBounds.X + 40, 165)
                if Q.TextBounds.X + 40 > v.Size.X.Offset - 120 then
                    P.Root.Size = UDim2.fromOffset(v.Size.X.Offset - 120, 165)
                    Q.TextWrapped = true
                    P.Root.Size = UDim2.fromOffset(v.Size.X.Offset - 120, Q.TextBounds.Y + 150)
                end
                for R, S in next, O.Buttons do
                    P:Button(S.Title, S.Callback)
                end
                P:Open()
            end
            local N = e(p.Tab):Init(v)
            function v.AddTab(O, P)
                return N:New(P.Title, P.Icon, v.TabHolder)
            end
            function v.SelectTab(O, P)
                N:SelectTab(1)
            end
            m.AddSignal(
                v.TabHolder:GetPropertyChangedSignal "CanvasPosition",
                function()
                    I = N:GetCurrentTabPos() + 16
                    J = 0
                    v.SelectorPosMotor:setGoal(r(N:GetCurrentTabPos()))
                end
            )
            return v
        end
    end,
    [18] = function()
        local c, d, e, f, g = b(18)
        local h = d.Parent
        local i, j, k =
            e(h.Themes),
            e(h.Packages.Flipper),
            {
                Registry = {},
                Signals = {},
                TransparencyMotors = {},
                DefaultProperties = {
                    ScreenGui = {ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling},
                    Frame = {
                        BackgroundColor3 = Color3.new(1, 1, 1),
                        BorderColor3 = Color3.new(0, 0, 0),
                        BorderSizePixel = 0
                    },
                    ScrollingFrame = {
                        BackgroundColor3 = Color3.new(1, 1, 1),
                        BorderColor3 = Color3.new(0, 0, 0),
                        ScrollBarImageColor3 = Color3.new(0, 0, 0)
                    },
                    TextLabel = {
                        BackgroundColor3 = Color3.new(1, 1, 1),
                        BorderColor3 = Color3.new(0, 0, 0),
                        Font = Enum.Font.SourceSans,
                        Text = "",
                        TextColor3 = Color3.new(0, 0, 0),
                        BackgroundTransparency = 1,
                        TextSize = 14
                    },
                    TextButton = {
                        BackgroundColor3 = Color3.new(1, 1, 1),
                        BorderColor3 = Color3.new(0, 0, 0),
                        AutoButtonColor = false,
                        Font = Enum.Font.SourceSans,
                        Text = "",
                        TextColor3 = Color3.new(0, 0, 0),
                        TextSize = 14
                    },
                    TextBox = {
                        BackgroundColor3 = Color3.new(1, 1, 1),
                        BorderColor3 = Color3.new(0, 0, 0),
                        ClearTextOnFocus = false,
                        Font = Enum.Font.SourceSans,
                        Text = "",
                        TextColor3 = Color3.new(0, 0, 0),
                        TextSize = 14
                    },
                    ImageLabel = {
                        BackgroundTransparency = 1,
                        BackgroundColor3 = Color3.new(1, 1, 1),
                        BorderColor3 = Color3.new(0, 0, 0),
                        BorderSizePixel = 0
                    },
                    ImageButton = {
                        BackgroundColor3 = Color3.new(1, 1, 1),
                        BorderColor3 = Color3.new(0, 0, 0),
                        AutoButtonColor = false
                    },
                    CanvasGroup = {
                        BackgroundColor3 = Color3.new(1, 1, 1),
                        BorderColor3 = Color3.new(0, 0, 0),
                        BorderSizePixel = 0
                    }
                }
            }
        local l = function(l, m)
            if m.ThemeTag then
                k.AddThemeObject(l, m.ThemeTag)
            end
        end
        function k.AddSignal(m, n)
            table.insert(k.Signals, m:Connect(n))
        end
        function k.Disconnect()
            for m = #k.Signals, 1, -1 do
                local n = table.remove(k.Signals, m)
                n:Disconnect()
            end
        end
        function k.GetThemeProperty(m)
            if i[e(h).Theme][m] then
                return i[e(h).Theme][m]
            end
            return i.Dark[m]
        end
        function k.UpdateTheme()
            for m, n in next, k.Registry do
                for o, p in next, n.Properties do
                    m[o] = k.GetThemeProperty(p)
                end
            end
            for o, p in next, k.TransparencyMotors do
                p:setGoal(j.Instant.new(k.GetThemeProperty "ElementTransparency"))
            end
        end
        function k.AddThemeObject(m, n)
            local o = #k.Registry + 1
            local p = {Object = m, Properties = n, Idx = o}
            k.Registry[m] = p
            k.UpdateTheme()
            return m
        end
        function k.OverrideTag(m, n)
            k.Registry[m].Properties = n
            k.UpdateTheme()
        end
        function k.New(m, n, o)
            local p = Instance.new(m)
            for q, r in next, k.DefaultProperties[m] or {} do
                p[q] = r
            end
            for s, t in next, n or {} do
                if s ~= "ThemeTag" then
                    p[s] = t
                end
            end
            for u, v in next, o or {} do
                v.Parent = p
            end
            l(p, n)
            return p
        end
        function k.SpringMotor(m, n, o, p, s)
            p = p or false
            s = s or false
            local t = j.SingleMotor.new(m)
            t:onStep(
                function(u)
                    n[o] = u
                end
            )
            if s then
                table.insert(k.TransparencyMotors, t)
            end
            local u = function(u, v)
                v = v or false
                if not p then
                    if not v then
                        if o == "BackgroundTransparency" and e(h).DialogOpen then
                            return
                        end
                    end
                end
                t:setGoal(j.Spring.new(u, {frequency = 8}))
            end
            return t, u
        end
        return k
    end,
    [19] = function()
        local c, d, e, f, g = b(19)
        local h = {}
        for i, j in next, d:GetChildren() do
            table.insert(h, e(j))
        end
        return h
    end,
    [20] = function()
        local c, d, e, f, g = b(20)
        local h = d.Parent.Parent
        local i = e(h.Creator)
        local j, k, l = i.New, h.Components, {}
        l.__index = l
        l.__type = "Button"
        function l.New(m, n)
            assert(n.Title, "Button - Missing Title")
            n.Callback = n.Callback or function()
                end
            local o = e(k.Element)(n.Title, n.Description, m.Container, true)
            local p =
                j(
                "ImageLabel",
                {
                    Image = "rbxassetid://10709791437",
                    Size = UDim2.fromOffset(16, 16),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, -10, 0.5, 0),
                    BackgroundTransparency = 1,
                    Parent = o.Frame,
                    ThemeTag = {ImageColor3 = "Text"}
                }
            )
            i.AddSignal(
                o.Frame.MouseButton1Click,
                function()
                    m.Library:SafeCallback(n.Callback)
                end
            )
            return o
        end
        return l
    end,
    [21] = function()
        local c, d, e, f, g = b(21)
        local h, i, j, k =
            game:GetService "UserInputService",
            game:GetService "TouchInputService",
            game:GetService "RunService",
            game:GetService "Players"
        local l, m = j.RenderStepped, k.LocalPlayer
        local n, o = m:GetMouse(), d.Parent.Parent
        local p = e(o.Creator)
        local s, t, u = p.New, o.Components, {}
        u.__index = u
        u.__type = "Colorpicker"
        function u.New(v, w, x)
            local y = v.Library
            assert(x.Title, "Colorpicker - Missing Title")
            assert(x.Default, "AddColorPicker: Missing default value.")
            local z = {
                Value = x.Default,
                Transparency = x.Transparency or 0,
                Type = "Colorpicker",
                Title = type(x.Title) == "string" and x.Title or "Colorpicker",
                Callback = x.Callback or function(z)
                    end
            }
            function z.SetHSVFromRGB(A, B)
                local C, D, E = Color3.toHSV(B)
                z.Hue = C
                z.Sat = D
                z.Vib = E
            end
            z:SetHSVFromRGB(z.Value)
            local A = e(t.Element)(x.Title, x.Description, v.Container, true)
            z.SetTitle = A.SetTitle
            z.SetDesc = A.SetDesc
            local B =
                s(
                "Frame",
                {Size = UDim2.fromScale(1, 1), BackgroundColor3 = z.Value, Parent = A.Frame},
                {s("UICorner", {CornerRadius = UDim.new(0, 8)})}
            )
            local aa, ab =
                s(
                    "ImageLabel",
                    {
                        Size = UDim2.fromOffset(26, 26),
                        Position = UDim2.new(1, -10, 0.5, 0),
                        AnchorPoint = Vector2.new(1, 0.5),
                        Parent = A.Frame,
                        Image = "http://www.roblox.com/asset/?id=14204231522",
                        ImageTransparency = 0.45,
                        ScaleType = Enum.ScaleType.Tile,
                        TileSize = UDim2.fromOffset(40, 40)
                    },
                    {s("UICorner", {CornerRadius = UDim.new(0, 8)}), B}
                ),
                function()
                    local C = e(t.Dialog):Create()
                    C.Title.Text = z.Title
                    C.Root.Size = UDim2.fromOffset(430, 330)
                    local D, E, F, G, H, I =
                        z.Hue,
                        z.Sat,
                        z.Vib,
                        z.Transparency,
                        function()
                            local D = e(t.Textbox)()
                            D.Frame.Parent = C.Root
                            D.Frame.Size = UDim2.new(0, 90, 0, 32)
                            return D
                        end,
                        function(D, E)
                            return s(
                                "TextLabel",
                                {
                                    FontFace = Font.new(
                                        "rbxasset://fonts/families/GothamSSm.json",
                                        Enum.FontWeight.Medium,
                                        Enum.FontStyle.Normal
                                    ),
                                    Text = D,
                                    TextColor3 = Color3.fromRGB(240, 240, 240),
                                    TextSize = 13,
                                    TextXAlignment = Enum.TextXAlignment.Left,
                                    Size = UDim2.new(1, 0, 0, 32),
                                    Position = E,
                                    BackgroundTransparency = 1,
                                    Parent = C.Root,
                                    ThemeTag = {TextColor3 = "Text"}
                                }
                            )
                        end
                    local J, K =
                        function()
                            local J = Color3.fromHSV(D, E, F)
                            return {R = math.floor(J.r * 255), G = math.floor(J.g * 255), B = math.floor(J.b * 255)}
                        end,
                        s(
                            "ImageLabel",
                            {
                                Size = UDim2.new(0, 18, 0, 18),
                                ScaleType = Enum.ScaleType.Fit,
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                BackgroundTransparency = 1,
                                Image = "http://www.roblox.com/asset/?id=4805639000"
                            }
                        )
                    local L, M =
                        s(
                            "ImageLabel",
                            {
                                Size = UDim2.fromOffset(180, 160),
                                Position = UDim2.fromOffset(20, 55),
                                Image = "rbxassetid://4155801252",
                                BackgroundColor3 = z.Value,
                                BackgroundTransparency = 0,
                                Parent = C.Root
                            },
                            {s("UICorner", {CornerRadius = UDim.new(0, 8)}), K}
                        ),
                        s(
                            "Frame",
                            {
                                BackgroundColor3 = z.Value,
                                Size = UDim2.fromScale(1, 1),
                                BackgroundTransparency = z.Transparency
                            },
                            {s("UICorner", {CornerRadius = UDim.new(0, 8)})}
                        )
                    local N, O =
                        s(
                            "ImageLabel",
                            {
                                Image = "http://www.roblox.com/asset/?id=14204231522",
                                ImageTransparency = 0.45,
                                ScaleType = Enum.ScaleType.Tile,
                                TileSize = UDim2.fromOffset(40, 40),
                                BackgroundTransparency = 1,
                                Position = UDim2.fromOffset(112, 220),
                                Size = UDim2.fromOffset(88, 24),
                                Parent = C.Root
                            },
                            {
                                s("UICorner", {CornerRadius = UDim.new(0, 8)}),
                                s("UIStroke", {Thickness = 2, Transparency = 0.75}),
                                M
                            }
                        ),
                        s(
                            "Frame",
                            {BackgroundColor3 = z.Value, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 0},
                            {s("UICorner", {CornerRadius = UDim.new(0, 8)})}
                        )
                    local P, Q =
                        s(
                            "ImageLabel",
                            {
                                Image = "http://www.roblox.com/asset/?id=14204231522",
                                ImageTransparency = 0.45,
                                ScaleType = Enum.ScaleType.Tile,
                                TileSize = UDim2.fromOffset(40, 40),
                                BackgroundTransparency = 1,
                                Position = UDim2.fromOffset(20, 220),
                                Size = UDim2.fromOffset(88, 24),
                                Parent = C.Root
                            },
                            {
                                s("UICorner", {CornerRadius = UDim.new(0, 8)}),
                                s("UIStroke", {Thickness = 2, Transparency = 0.75}),
                                O
                            }
                        ),
                        {}
                    for R = 0, 1, 0.1 do
                        table.insert(Q, ColorSequenceKeypoint.new(R, Color3.fromHSV(R, 1, 1)))
                    end
                    local R, S =
                        s("UIGradient", {Color = ColorSequence.new(Q), Rotation = 90}),
                        s(
                            "Frame",
                            {
                                Size = UDim2.new(1, 0, 1, -10),
                                Position = UDim2.fromOffset(0, 5),
                                BackgroundTransparency = 1
                            }
                        )
                    local T, U, V =
                        s(
                            "ImageLabel",
                            {
                                Size = UDim2.fromOffset(14, 14),
                                Image = "http://www.roblox.com/asset/?id=12266946128",
                                Parent = S,
                                ThemeTag = {ImageColor3 = "DialogInput"}
                            }
                        ),
                        s(
                            "Frame",
                            {Size = UDim2.fromOffset(12, 190), Position = UDim2.fromOffset(210, 55), Parent = C.Root},
                            {s("UICorner", {CornerRadius = UDim.new(1, 0)}), R, S}
                        ),
                        H()
                    V.Frame.Position = UDim2.fromOffset(x.Transparency and 260 or 240, 55)
                    I("Hex", UDim2.fromOffset(x.Transparency and 360 or 340, 55))
                    local W = H()
                    W.Frame.Position = UDim2.fromOffset(x.Transparency and 260 or 240, 95)
                    I("Red", UDim2.fromOffset(x.Transparency and 360 or 340, 95))
                    local X = H()
                    X.Frame.Position = UDim2.fromOffset(x.Transparency and 260 or 240, 135)
                    I("Green", UDim2.fromOffset(x.Transparency and 360 or 340, 135))
                    local Y = H()
                    Y.Frame.Position = UDim2.fromOffset(x.Transparency and 260 or 240, 175)
                    I("Blue", UDim2.fromOffset(x.Transparency and 360 or 340, 175))
                    local Z
                    if x.Transparency then
                        Z = H()
                        Z.Frame.Position = UDim2.fromOffset(260, 215)
                        I("Alpha", UDim2.fromOffset(360, 215))
                    end
                    local _, aa, ab
                    if x.Transparency then
                        local ac =
                            s(
                            "Frame",
                            {
                                Size = UDim2.new(1, 0, 1, -10),
                                Position = UDim2.fromOffset(0, 5),
                                BackgroundTransparency = 1
                            }
                        )
                        aa =
                            s(
                            "ImageLabel",
                            {
                                Size = UDim2.fromOffset(14, 14),
                                Image = "http://www.roblox.com/asset/?id=12266946128",
                                Parent = ac,
                                ThemeTag = {ImageColor3 = "DialogInput"}
                            }
                        )
                        ab =
                            s(
                            "Frame",
                            {Size = UDim2.fromScale(1, 1)},
                            {
                                s(
                                    "UIGradient",
                                    {
                                        Transparency = NumberSequence.new {
                                            NumberSequenceKeypoint.new(0, 0),
                                            NumberSequenceKeypoint.new(1, 1)
                                        },
                                        Rotation = 270
                                    }
                                ),
                                s("UICorner", {CornerRadius = UDim.new(1, 0)})
                            }
                        )
                        _ =
                            s(
                            "Frame",
                            {
                                Size = UDim2.fromOffset(12, 190),
                                Position = UDim2.fromOffset(230, 55),
                                Parent = C.Root,
                                BackgroundTransparency = 1
                            },
                            {
                                s("UICorner", {CornerRadius = UDim.new(1, 0)}),
                                s(
                                    "ImageLabel",
                                    {
                                        Image = "http://www.roblox.com/asset/?id=14204231522",
                                        ImageTransparency = 0.45,
                                        ScaleType = Enum.ScaleType.Tile,
                                        TileSize = UDim2.fromOffset(40, 40),
                                        BackgroundTransparency = 1,
                                        Size = UDim2.fromScale(1, 1),
                                        Parent = C.Root
                                    },
                                    {s("UICorner", {CornerRadius = UDim.new(1, 0)})}
                                ),
                                ab,
                                ac
                            }
                        )
                    end
                    local ac = function()
                        L.BackgroundColor3 = Color3.fromHSV(D, 1, 1)
                        T.Position = UDim2.new(0, -1, D, -6)
                        K.Position = UDim2.new(E, 0, 1 - F, 0)
                        O.BackgroundColor3 = Color3.fromHSV(D, E, F)
                        V.Input.Text = "#" .. Color3.fromHSV(D, E, F):ToHex()
                        W.Input.Text = J().R
                        X.Input.Text = J().G
                        Y.Input.Text = J().B
                        if x.Transparency then
                            ab.BackgroundColor3 = Color3.fromHSV(D, E, F)
                            O.BackgroundTransparency = G
                            aa.Position = UDim2.new(0, -1, 1 - G, -6)
                            Z.Input.Text = e(o):Round((1 - G) * 100, 0) .. "%"
                        end
                    end
                    p.AddSignal(
                        V.Input.FocusLost,
                        function(ad)
                            if ad then
                                local ae, af = pcall(Color3.fromHex, V.Input.Text)
                                if ae and typeof(af) == "Color3" then
                                    D, E, F = Color3.toHSV(af)
                                end
                            end
                            ac()
                        end
                    )
                    p.AddSignal(
                        W.Input.FocusLost,
                        function(ad)
                            if ad then
                                local ae = J()
                                local af, ag = pcall(Color3.fromRGB, W.Input.Text, ae.G, ae.B)
                                if af and typeof(ag) == "Color3" then
                                    if tonumber(W.Input.Text) <= 255 then
                                        D, E, F = Color3.toHSV(ag)
                                    end
                                end
                            end
                            ac()
                        end
                    )
                    p.AddSignal(
                        X.Input.FocusLost,
                        function(ad)
                            if ad then
                                local ae = J()
                                local af, ag = pcall(Color3.fromRGB, ae.R, X.Input.Text, ae.B)
                                if af and typeof(ag) == "Color3" then
                                    if tonumber(X.Input.Text) <= 255 then
                                        D, E, F = Color3.toHSV(ag)
                                    end
                                end
                            end
                            ac()
                        end
                    )
                    p.AddSignal(
                        Y.Input.FocusLost,
                        function(ad)
                            if ad then
                                local ae = J()
                                local af, ag = pcall(Color3.fromRGB, ae.R, ae.G, Y.Input.Text)
                                if af and typeof(ag) == "Color3" then
                                    if tonumber(Y.Input.Text) <= 255 then
                                        D, E, F = Color3.toHSV(ag)
                                    end
                                end
                            end
                            ac()
                        end
                    )
                    if x.Transparency then
                        p.AddSignal(
                            Z.Input.FocusLost,
                            function(ad)
                                if ad then
                                    pcall(
                                        function()
                                            local ae = tonumber(Z.Input.Text)
                                            if ae >= 0 and ae <= 100 then
                                                G = 1 - ae * 0.01
                                            end
                                        end
                                    )
                                end
                                ac()
                            end
                        )
                    end
                    p.AddSignal(
                        L.InputBegan,
                        function(ad)
                            if
                                ad.UserInputType == Enum.UserInputType.MouseButton1 or
                                    ad.UserInputType == Enum.UserInputType.Touch
                             then
                                while h:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                    local ae = L.AbsolutePosition.X
                                    local af = ae + L.AbsoluteSize.X
                                    local ag, ah = math.clamp(n.X, ae, af), L.AbsolutePosition.Y
                                    local ai = ah + L.AbsoluteSize.Y
                                    local aj = math.clamp(n.Y, ah, ai)
                                    E = (ag - ae) / (af - ae)
                                    F = 1 - ((aj - ah) / (ai - ah))
                                    ac()
                                    l:Wait()
                                end
                            end
                        end
                    )
                    p.AddSignal(
                        U.InputBegan,
                        function(ad)
                            if
                                ad.UserInputType == Enum.UserInputType.MouseButton1 or
                                    ad.UserInputType == Enum.UserInputType.Touch
                             then
                                while h:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                    local ae = U.AbsolutePosition.Y
                                    local af = ae + U.AbsoluteSize.Y
                                    local ag = math.clamp(n.Y, ae, af)
                                    D = ((ag - ae) / (af - ae))
                                    ac()
                                    l:Wait()
                                end
                            end
                        end
                    )
                    if x.Transparency then
                        p.AddSignal(
                            _.InputBegan,
                            function(ad)
                                if ad.UserInputType == Enum.UserInputType.MouseButton1 then
                                    while h:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                        local ae = _.AbsolutePosition.Y
                                        local af = ae + _.AbsoluteSize.Y
                                        local ag = math.clamp(n.Y, ae, af)
                                        G = 1 - ((ag - ae) / (af - ae))
                                        ac()
                                        l:Wait()
                                    end
                                end
                            end
                        )
                    end
                    ac()
                    C:Button(
                        "Done",
                        function()
                            z:SetValue({D, E, F}, G)
                        end
                    )
                    C:Button "Cancel"
                    C:Open()
                end
            function z.Display(ac)
                z.Value = Color3.fromHSV(z.Hue, z.Sat, z.Vib)
                B.BackgroundColor3 = z.Value
                B.BackgroundTransparency = z.Transparency
                u.Library:SafeCallback(z.Callback, z.Value)
                u.Library:SafeCallback(z.Changed, z.Value)
            end
            function z.SetValue(ac, ad, ae)
                local af = Color3.fromHSV(ad[1], ad[2], ad[3])
                z.Transparency = ae or 0
                z:SetHSVFromRGB(af)
                z:Display()
            end
            function z.SetValueRGB(ac, ad, ae)
                z.Transparency = ae or 0
                z:SetHSVFromRGB(ad)
                z:Display()
            end
            function z.OnChanged(ac, ad)
                z.Changed = ad
                ad(z.Value)
            end
            function z.Destroy(ac)
                A:Destroy()
                y.Options[w] = nil
            end
            p.AddSignal(
                A.Frame.MouseButton1Click,
                function()
                    ab()
                end
            )
            z:Display()
            y.Options[w] = z
            return z
        end
        return u
    end,
    [22] = function()
        local aa, ab, ac, ad, ae = b(22)
        local af, ag, ah, ai, aj =
            game:GetService "TweenService",
            game:GetService "UserInputService",
            game:GetService "Players".LocalPlayer:GetMouse(),
            game:GetService "Workspace".CurrentCamera,
            ab.Parent.Parent
        local c, d = ac(aj.Creator), ac(aj.Packages.Flipper)
        local e, f, g = c.New, aj.Components, {}
        g.__index = g
        g.__type = "Dropdown"
        function g.New(h, i, j)
            local k, l, m =
                h.Library,
                {
                    Values = j.Values,
                    Value = j.Default,
                    Multi = j.Multi,
                    Buttons = {},
                    Opened = false,
                    Type = "Dropdown",
                    Callback = j.Callback or function()
                        end
                },
                ac(f.Element)(j.Title, j.Description, h.Container, false)
            m.DescLabel.Size = UDim2.new(1, -170, 0, 14)
            l.SetTitle = m.SetTitle
            l.SetDesc = m.SetDesc
            local n, o =
                e(
                    "TextLabel",
                    {
                        FontFace = Font.new(
                            "rbxasset://fonts/families/GothamSSm.json",
                            Enum.FontWeight.Regular,
                            Enum.FontStyle.Normal
                        ),
                        Text = "Value",
                        TextColor3 = Color3.fromRGB(240, 240, 240),
                        TextSize = 13,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Size = UDim2.new(1, -30, 0, 14),
                        Position = UDim2.new(0, 8, 0.5, 0),
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        TextTruncate = Enum.TextTruncate.AtEnd,
                        ThemeTag = {TextColor3 = "Text"}
                    }
                ),
                e(
                    "ImageLabel",
                    {
                        Image = "rbxassetid://10709790948",
                        Size = UDim2.fromOffset(16, 16),
                        AnchorPoint = Vector2.new(1, 0.5),
                        Position = UDim2.new(1, -8, 0.5, 0),
                        BackgroundTransparency = 1,
                        ThemeTag = {ImageColor3 = "SubText"}
                    }
                )
            local p, s =
                e(
                    "TextButton",
                    {
                        Size = UDim2.fromOffset(160, 30),
                        Position = UDim2.new(1, -10, 0.5, 0),
                        AnchorPoint = Vector2.new(1, 0.5),
                        BackgroundTransparency = 0.9,
                        Parent = m.Frame,
                        ThemeTag = {BackgroundColor3 = "DropdownFrame"}
                    },
                    {
                        e("UICorner", {CornerRadius = UDim.new(0, 5)}),
                        e(
                            "UIStroke",
                            {
                                Transparency = 0.5,
                                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                ThemeTag = {Color = "InElementBorder"}
                            }
                        ),
                        o,
                        n
                    }
                ),
                e("UIListLayout", {Padding = UDim.new(0, 3)})
            local t =
                e(
                "ScrollingFrame",
                {
                    Size = UDim2.new(1, -5, 1, -10),
                    Position = UDim2.fromOffset(5, 5),
                    BackgroundTransparency = 1,
                    BottomImage = "rbxassetid://6889812791",
                    MidImage = "rbxassetid://6889812721",
                    TopImage = "rbxassetid://6276641225",
                    ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
                    ScrollBarImageTransparency = 0.95,
                    ScrollBarThickness = 4,
                    BorderSizePixel = 0,
                    CanvasSize = UDim2.fromScale(0, 0)
                },
                {s}
            )
            local u =
                e(
                "Frame",
                {Size = UDim2.fromScale(1, 0.6), ThemeTag = {BackgroundColor3 = "DropdownHolder"}},
                {
                    t,
                    e("UICorner", {CornerRadius = UDim.new(0, 7)}),
                    e(
                        "UIStroke",
                        {ApplyStrokeMode = Enum.ApplyStrokeMode.Border, ThemeTag = {Color = "DropdownBorder"}}
                    ),
                    e(
                        "ImageLabel",
                        {
                            BackgroundTransparency = 1,
                            Image = "http://www.roblox.com/asset/?id=5554236805",
                            ScaleType = Enum.ScaleType.Slice,
                            SliceCenter = Rect.new(23, 23, 277, 277),
                            Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(30, 30),
                            Position = UDim2.fromOffset(-15, -15),
                            ImageColor3 = Color3.fromRGB(0, 0, 0),
                            ImageTransparency = 0.1
                        }
                    )
                }
            )
            local v =
                e(
                "Frame",
                {BackgroundTransparency = 1, Size = UDim2.fromOffset(170, 300), Parent = h.Library.GUI, Visible = false},
                {u, e("UISizeConstraint", {MinSize = Vector2.new(170, 0)})}
            )
            table.insert(k.OpenFrames, v)
            local w, x = function()
                    local w = 0
                    if ai.ViewportSize.Y - p.AbsolutePosition.Y < v.AbsoluteSize.Y - 5 then
                        w = v.AbsoluteSize.Y - 5 - (ai.ViewportSize.Y - p.AbsolutePosition.Y) + 40
                    end
                    v.Position = UDim2.fromOffset(p.AbsolutePosition.X - 1, p.AbsolutePosition.Y - 5 - w)
                end, 0
            local y, z = function()
                    if #l.Values > 10 then
                        v.Size = UDim2.fromOffset(x, 392)
                    else
                        v.Size = UDim2.fromOffset(x, s.AbsoluteContentSize.Y + 10)
                    end
                end, function()
                    t.CanvasSize = UDim2.fromOffset(0, s.AbsoluteContentSize.Y)
                end
            w()
            y()
            c.AddSignal(p:GetPropertyChangedSignal "AbsolutePosition", w)
            c.AddSignal(
                p.MouseButton1Click,
                function()
                    l:Open()
                end
            )
            c.AddSignal(
                ag.InputBegan,
                function(A)
                    if A.UserInputType == Enum.UserInputType.MouseButton1 or A.UserInputType == Enum.UserInputType.Touch then
                        local B, C = u.AbsolutePosition, u.AbsoluteSize
                        if ah.X < B.X or ah.X > B.X + C.X or ah.Y < (B.Y - 20 - 1) or ah.Y > B.Y + C.Y then
                            l:Close()
                        end
                    end
                end
            )
            local A = h.ScrollFrame
            function l.Open(B)
                l.Opened = true
                A.ScrollingEnabled = false
                v.Visible = true
                af:Create(
                    u,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                    {Size = UDim2.fromScale(1, 1)}
                ):Play()
            end
            function l.Close(B)
                l.Opened = false
                A.ScrollingEnabled = true
                u.Size = UDim2.fromScale(1, 0.6)
                v.Visible = false
            end
            function l.Display(B)
                local C, D = l.Values, ""
                if j.Multi then
                    for E, F in next, C do
                        if l.Value[F] then
                            D = D .. F .. ", "
                        end
                    end
                    D = D:sub(1, #D - 2)
                else
                    D = l.Value or ""
                end
                n.Text = (D == "" and "--" or D)
            end
            function l.GetActiveValues(B)
                if j.Multi then
                    local C = {}
                    for D, E in next, l.Value do
                        table.insert(C, D)
                    end
                    return C
                else
                    return l.Value and 1 or 0
                end
            end
            function l.BuildDropdownList(B)
                local C, D = l.Values, {}
                for E, F in next, t:GetChildren() do
                    if not F:IsA "UIListLayout" then
                        F:Destroy()
                    end
                end
                local G = 0
                for H, I in next, C do
                    local J = {}
                    G = G + 1
                    local K, L =
                        e(
                            "Frame",
                            {
                                Size = UDim2.fromOffset(4, 14),
                                BackgroundColor3 = Color3.fromRGB(76, 194, 255),
                                Position = UDim2.fromOffset(-1, 16),
                                AnchorPoint = Vector2.new(0, 0.5),
                                ThemeTag = {BackgroundColor3 = "Accent"}
                            },
                            {e("UICorner", {CornerRadius = UDim.new(0, 2)})}
                        ),
                        e(
                            "TextLabel",
                            {
                                FontFace = Font.new "rbxasset://fonts/families/GothamSSm.json",
                                Text = I,
                                TextColor3 = Color3.fromRGB(200, 200, 200),
                                TextSize = 13,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                                AutomaticSize = Enum.AutomaticSize.Y,
                                BackgroundTransparency = 1,
                                Size = UDim2.fromScale(1, 1),
                                Position = UDim2.fromOffset(10, 0),
                                Name = "ButtonLabel",
                                ThemeTag = {TextColor3 = "Text"}
                            }
                        )
                    local M, N =
                        (e(
                        "TextButton",
                        {
                            Size = UDim2.new(1, -5, 0, 32),
                            BackgroundTransparency = 1,
                            ZIndex = 23,
                            Text = "",
                            Parent = t,
                            ThemeTag = {BackgroundColor3 = "DropdownOption"}
                        },
                        {K, L, e("UICorner", {CornerRadius = UDim.new(0, 6)})}
                    ))
                    if j.Multi then
                        N = l.Value[I]
                    else
                        N = l.Value == I
                    end
                    local O, P = c.SpringMotor(1, M, "BackgroundTransparency")
                    local Q, R = c.SpringMotor(1, K, "BackgroundTransparency")
                    local S = d.SingleMotor.new(6)
                    S:onStep(
                        function(T)
                            K.Size = UDim2.new(0, 4, 0, T)
                        end
                    )
                    c.AddSignal(
                        M.MouseEnter,
                        function()
                            P(N and 0.85 or 0.89)
                        end
                    )
                    c.AddSignal(
                        M.MouseLeave,
                        function()
                            P(N and 0.89 or 1)
                        end
                    )
                    c.AddSignal(
                        M.MouseButton1Down,
                        function()
                            P(0.92)
                        end
                    )
                    c.AddSignal(
                        M.MouseButton1Up,
                        function()
                            P(N and 0.85 or 0.89)
                        end
                    )
                    function J.UpdateButton(T)
                        if j.Multi then
                            N = l.Value[I]
                            if N then
                                P(0.89)
                            end
                        else
                            N = l.Value == I
                            P(N and 0.89 or 1)
                        end
                        S:setGoal(d.Spring.new(N and 14 or 6, {frequency = 6}))
                        R(N and 0 or 1)
                    end
                    L.InputBegan:Connect(
                        function(T)
                            if
                                T.UserInputType == Enum.UserInputType.MouseButton1 or
                                    T.UserInputType == Enum.UserInputType.Touch
                             then
                                local U = not N
                                if l:GetActiveValues() == 1 and not U and not j.AllowNull then
                                else
                                    if j.Multi then
                                        N = U
                                        l.Value[I] = N and true or nil
                                    else
                                        N = U
                                        l.Value = N and I or nil
                                        for V, W in next, D do
                                            W:UpdateButton()
                                        end
                                    end
                                    J:UpdateButton()
                                    l:Display()
                                    k:SafeCallback(l.Callback, l.Value)
                                    k:SafeCallback(l.Changed, l.Value)
                                end
                            end
                        end
                    )
                    J:UpdateButton()
                    l:Display()
                    D[M] = J
                end
                x = 0
                for J, K in next, D do
                    if J.ButtonLabel then
                        if J.ButtonLabel.TextBounds.X > x then
                            x = J.ButtonLabel.TextBounds.X
                        end
                    end
                end
                x = x + 30
                z()
                y()
            end
            function l.SetValues(B, C)
                if C then
                    l.Values = C
                end
                l:BuildDropdownList()
            end
            function l.OnChanged(B, C)
                l.Changed = C
                C(l.Value)
            end
            function l.SetValue(B, C)
                if l.Multi then
                    local D = {}
                    for E, F in next, C do
                        if table.find(l.Values, E) then
                            D[E] = true
                        end
                    end
                    l.Value = D
                else
                    if not C then
                        l.Value = nil
                    elseif table.find(l.Values, C) then
                        l.Value = C
                    end
                end
                l:BuildDropdownList()
                k:SafeCallback(l.Callback, l.Value)
                k:SafeCallback(l.Changed, l.Value)
            end
            function l.Destroy(B)
                m:Destroy()
                k.Options[i] = nil
            end
            l:BuildDropdownList()
            l:Display()
            local B = {}
            if type(j.Default) == "string" then
                local C = table.find(l.Values, j.Default)
                if C then
                    table.insert(B, C)
                end
            elseif type(j.Default) == "table" then
                for C, D in next, j.Default do
                    local E = table.find(l.Values, D)
                    if E then
                        table.insert(B, E)
                    end
                end
            elseif type(j.Default) == "number" and l.Values[j.Default] ~= nil then
                table.insert(B, j.Default)
            end
            if next(B) then
                for C = 1, #B do
                    local D = B[C]
                    if j.Multi then
                        l.Value[l.Values[D]] = true
                    else
                        l.Value = l.Values[D]
                    end
                    if not j.Multi then
                        break
                    end
                end
                l:BuildDropdownList()
                l:Display()
            end
            k.Options[i] = l
            return l
        end
        return g
    end,
    [23] = function()
        local aa, ab, ac, ad, ae = b(23)
        local af = ab.Parent.Parent
        local ag = ac(af.Creator)
        local ah, ai, aj, c = ag.New, ag.AddSignal, af.Components, {}
        c.__index = c
        c.__type = "Input"
        function c.New(d, e, f)
            local g = d.Library
            assert(f.Title, "Input - Missing Title")
            f.Callback = f.Callback or function()
                end
            local h, i =
                {
                    Value = f.Default or "",
                    Numeric = f.Numeric or false,
                    Finished = f.Finished or false,
                    Callback = f.Callback or function(h)
                        end,
                    Type = "Input"
                },
                ac(aj.Element)(f.Title, f.Description, d.Container, false)
            h.SetTitle = i.SetTitle
            h.SetDesc = i.SetDesc
            local j = ac(aj.Textbox)(i.Frame, true)
            j.Frame.Position = UDim2.new(1, -10, 0.5, 0)
            j.Frame.AnchorPoint = Vector2.new(1, 0.5)
            j.Frame.Size = UDim2.fromOffset(160, 30)
            j.Input.Text = f.Default or ""
            j.Input.PlaceholderText = f.Placeholder or ""
            local k = j.Input
            function h.SetValue(l, m)
                if f.MaxLength and #m > f.MaxLength then
                    m = m:sub(1, f.MaxLength)
                end
                if h.Numeric then
                    if (not tonumber(m)) and m:len() > 0 then
                        m = h.Value
                    end
                end
                h.Value = m
                k.Text = m
                g:SafeCallback(h.Callback, h.Value)
                g:SafeCallback(h.Changed, h.Value)
            end
            if h.Finished then
                ai(
                    k.FocusLost,
                    function(l)
                        if not l then
                            return
                        end
                        h:SetValue(k.Text)
                    end
                )
            else
                ai(
                    k:GetPropertyChangedSignal "Text",
                    function()
                        h:SetValue(k.Text)
                    end
                )
            end
            function h.OnChanged(l, m)
                h.Changed = m
                m(h.Value)
            end
            function h.Destroy(l)
                i:Destroy()
                g.Options[e] = nil
            end
            g.Options[e] = h
            return h
        end
        return c
    end,
    [24] = function()
        local aa, ab, ac, ad, ae = b(24)
        local af, ag = game:GetService "UserInputService", ab.Parent.Parent
        local ah = ac(ag.Creator)
        local ai, aj, c = ah.New, ag.Components, {}
        c.__index = c
        c.__type = "Keybind"
        function c.New(d, e, f)
            local g = d.Library
            assert(f.Title, "KeyBind - Missing Title")
            assert(f.Default, "KeyBind - Missing default value.")
            local h, i, j =
                {
                    Value = f.Default,
                    Toggled = false,
                    Mode = f.Mode or "Toggle",
                    Type = "Keybind",
                    Callback = f.Callback or function(h)
                        end,
                    ChangedCallback = f.ChangedCallback or function(h)
                        end
                },
                false,
                ac(aj.Element)(f.Title, f.Description, d.Container, true)
            h.SetTitle = j.SetTitle
            h.SetDesc = j.SetDesc
            local k =
                ai(
                "TextLabel",
                {
                    FontFace = Font.new(
                        "rbxasset://fonts/families/GothamSSm.json",
                        Enum.FontWeight.Regular,
                        Enum.FontStyle.Normal
                    ),
                    Text = f.Default,
                    TextColor3 = Color3.fromRGB(240, 240, 240),
                    TextSize = 13,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    Size = UDim2.new(0, 0, 0, 14),
                    Position = UDim2.new(0, 0, 0.5, 0),
                    AnchorPoint = Vector2.new(0, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    AutomaticSize = Enum.AutomaticSize.X,
                    BackgroundTransparency = 1,
                    ThemeTag = {TextColor3 = "Text"}
                }
            )
            local l =
                ai(
                "TextButton",
                {
                    Size = UDim2.fromOffset(0, 30),
                    Position = UDim2.new(1, -10, 0.5, 0),
                    AnchorPoint = Vector2.new(1, 0.5),
                    BackgroundTransparency = 0.9,
                    Parent = j.Frame,
                    AutomaticSize = Enum.AutomaticSize.X,
                    ThemeTag = {BackgroundColor3 = "Keybind"}
                },
                {
                    ai("UICorner", {CornerRadius = UDim.new(0, 5)}),
                    ai("UIPadding", {PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8)}),
                    ai(
                        "UIStroke",
                        {
                            Transparency = 0.5,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                            ThemeTag = {Color = "InElementBorder"}
                        }
                    ),
                    k
                }
            )
            function h.GetState(m)
                if af:GetFocusedTextBox() and h.Mode ~= "Always" then
                    return false
                end
                if h.Mode == "Always" then
                    return true
                elseif h.Mode == "Hold" then
                    if h.Value == "None" then
                        return false
                    end
                    local n = h.Value
                    if n == "MouseLeft" or n == "MouseRight" then
                        return n == "MouseLeft" and af:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or
                            n == "MouseRight" and af:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
                    else
                        return af:IsKeyDown(Enum.KeyCode[h.Value])
                    end
                else
                    return h.Toggled
                end
            end
            function h.SetValue(m, n, o)
                n = n or h.Key
                o = o or h.Mode
                k.Text = n
                h.Value = n
                h.Mode = o
            end
            function h.OnClick(m, n)
                h.Clicked = n
            end
            function h.OnChanged(m, n)
                h.Changed = n
                n(h.Value)
            end
            function h.DoClick(m)
                g:SafeCallback(h.Callback, h.Toggled)
                g:SafeCallback(h.Clicked, h.Toggled)
            end
            function h.Destroy(m)
                j:Destroy()
                g.Options[e] = nil
            end
            ah.AddSignal(
                l.InputBegan,
                function(m)
                    if m.UserInputType == Enum.UserInputType.MouseButton1 or m.UserInputType == Enum.UserInputType.Touch then
                        i = true
                        k.Text = "..."
                        wait(0.2)
                        local n
                        n =
                            af.InputBegan:Connect(
                            function(o)
                                local p
                                if o.UserInputType == Enum.UserInputType.Keyboard then
                                    p = o.KeyCode.Name
                                elseif o.UserInputType == Enum.UserInputType.MouseButton1 then
                                    p = "MouseLeft"
                                elseif o.UserInputType == Enum.UserInputType.MouseButton2 then
                                    p = "MouseRight"
                                end
                                local s
                                s =
                                    af.InputEnded:Connect(
                                    function(t)
                                        if
                                            t.KeyCode.Name == p or
                                                p == "MouseLeft" and t.UserInputType == Enum.UserInputType.MouseButton1 or
                                                p == "MouseRight" and t.UserInputType == Enum.UserInputType.MouseButton2
                                         then
                                            i = false
                                            k.Text = p
                                            h.Value = p
                                            g:SafeCallback(h.ChangedCallback, t.KeyCode or t.UserInputType)
                                            g:SafeCallback(h.Changed, t.KeyCode or t.UserInputType)
                                            n:Disconnect()
                                            s:Disconnect()
                                        end
                                    end
                                )
                            end
                        )
                    end
                end
            )
            ah.AddSignal(
                af.InputBegan,
                function(m)
                    if not i and not af:GetFocusedTextBox() then
                        if h.Mode == "Toggle" then
                            local n = h.Value
                            if n == "MouseLeft" or n == "MouseRight" then
                                if
                                    n == "MouseLeft" and m.UserInputType == Enum.UserInputType.MouseButton1 or
                                        n == "MouseRight" and m.UserInputType == Enum.UserInputType.MouseButton2
                                 then
                                    h.Toggled = not h.Toggled
                                    h:DoClick()
                                end
                            elseif m.UserInputType == Enum.UserInputType.Keyboard then
                                if m.KeyCode.Name == n then
                                    h.Toggled = not h.Toggled
                                    h:DoClick()
                                end
                            end
                        end
                    end
                end
            )
            g.Options[e] = h
            return h
        end
        return c
    end,
    [25] = function()
        local aa, ab, ac, ad, ae = b(25)
        local af = ab.Parent.Parent
        local ag, ah, ai, aj = af.Components, ac(af.Packages.Flipper), ac(af.Creator), {}
        aj.__index = aj
        aj.__type = "Paragraph"
        function aj.New(c, d)
            assert(d.Title, "Paragraph - Missing Title")
            d.Content = d.Content or ""
            local e = ac(ag.Element)(d.Title, d.Content, aj.Container, false)
            e.Frame.BackgroundTransparency = 0.92
            e.Border.Transparency = 0.6
            return e
        end
        return aj
    end,
    [26] = function()
        local aa, ab, ac, ad, ae = b(26)
        local af, ag = game:GetService "UserInputService", ab.Parent.Parent
        local ah = ac(ag.Creator)
        local ai, aj, c = ah.New, ag.Components, {}
        c.__index = c
        c.__type = "Slider"
        function c.New(d, e, f)
            local g = d.Library
            assert(f.Title, "Slider - Missing Title.")
            assert(f.Default, "Slider - Missing default value.")
            assert(f.Min, "Slider - Missing minimum value.")
            assert(f.Max, "Slider - Missing maximum value.")
            assert(f.Rounding, "Slider - Missing rounding value.")
            local h, i, j =
                {Value = nil, Min = f.Min, Max = f.Max, Rounding = f.Rounding, Callback = f.Callback or function(h)
                        end, Type = "Slider"},
                false,
                ac(aj.Element)(f.Title, f.Description, d.Container, false)
            j.DescLabel.Size = UDim2.new(1, -170, 0, 14)
            h.SetTitle = j.SetTitle
            h.SetDesc = j.SetDesc
            local k =
                ai(
                "ImageLabel",
                {
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, -7, 0.5, 0),
                    Size = UDim2.fromOffset(14, 14),
                    Image = "http://www.roblox.com/asset/?id=12266946128",
                    ThemeTag = {ImageColor3 = "Accent"}
                }
            )
            local l, m, n =
                ai(
                    "Frame",
                    {BackgroundTransparency = 1, Position = UDim2.fromOffset(7, 0), Size = UDim2.new(1, -14, 1, 0)},
                    {k}
                ),
                ai(
                    "Frame",
                    {Size = UDim2.new(0, 0, 1, 0), ThemeTag = {BackgroundColor3 = "Accent"}},
                    {ai("UICorner", {CornerRadius = UDim.new(1, 0)})}
                ),
                ai(
                    "TextLabel",
                    {
                        FontFace = Font.new "rbxasset://fonts/families/GothamSSm.json",
                        Text = "Value",
                        TextSize = 12,
                        TextWrapped = true,
                        TextXAlignment = Enum.TextXAlignment.Right,
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        Size = UDim2.new(0, 100, 0, 14),
                        Position = UDim2.new(0, -4, 0.5, 0),
                        AnchorPoint = Vector2.new(1, 0.5),
                        ThemeTag = {TextColor3 = "SubText"}
                    }
                )
            local o =
                ai(
                "Frame",
                {
                    Size = UDim2.new(1, 0, 0, 4),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, -10, 0.5, 0),
                    BackgroundTransparency = 0.4,
                    Parent = j.Frame,
                    ThemeTag = {BackgroundColor3 = "SliderRail"}
                },
                {
                    ai("UICorner", {CornerRadius = UDim.new(1, 0)}),
                    ai("UISizeConstraint", {MaxSize = Vector2.new(150, math.huge)}),
                    n,
                    m,
                    l
                }
            )
            ah.AddSignal(
                k.InputBegan,
                function(p)
                    if p.UserInputType == Enum.UserInputType.MouseButton1 or p.UserInputType == Enum.UserInputType.Touch then
                        i = true
                    end
                end
            )
            ah.AddSignal(
                k.InputEnded,
                function(p)
                    if p.UserInputType == Enum.UserInputType.MouseButton1 or p.UserInputType == Enum.UserInputType.Touch then
                        i = false
                    end
                end
            )
            ah.AddSignal(
                af.InputChanged,
                function(p)
                    if
                        i and
                            (p.UserInputType == Enum.UserInputType.MouseMovement or
                                p.UserInputType == Enum.UserInputType.Touch)
                     then
                        local s = math.clamp((p.Position.X - l.AbsolutePosition.X) / l.AbsoluteSize.X, 0, 1)
                        h:SetValue(h.Min + ((h.Max - h.Min) * s))
                    end
                end
            )
            function h.OnChanged(p, s)
                h.Changed = s
                s(h.Value)
            end
            function h.SetValue(p, s)
                p.Value = g:Round(math.clamp(s, h.Min, h.Max), h.Rounding)
                k.Position = UDim2.new((p.Value - h.Min) / (h.Max - h.Min), -7, 0.5, 0)
                m.Size = UDim2.fromScale((p.Value - h.Min) / (h.Max - h.Min), 1)
                n.Text = tostring(p.Value)
                g:SafeCallback(h.Callback, p.Value)
                g:SafeCallback(h.Changed, p.Value)
            end
            function h.Destroy(p)
                j:Destroy()
                g.Options[e] = nil
            end
            h:SetValue(f.Default)
            g.Options[e] = h
            return h
        end
        return c
    end,
    [27] = function()
        local aa, ab, ac, ad, ae = b(27)
        local af, ag = game:GetService "TweenService", ab.Parent.Parent
        local ah = ac(ag.Creator)
        local ai, aj, c = ah.New, ag.Components, {}
        c.__index = c
        c.__type = "Toggle"
        function c.New(d, e, f)
            local g = d.Library
            assert(f.Title, "Toggle - Missing Title")
            local h, i = {Value = f.Default or false, Callback = f.Callback or function(h)
                        end, Type = "Toggle"}, ac(aj.Element)(f.Title, f.Description, d.Container, true)
            i.DescLabel.Size = UDim2.new(1, -54, 0, 14)
            h.SetTitle = i.SetTitle
            h.SetDesc = i.SetDesc
            local j, k =
                ai(
                    "ImageLabel",
                    {
                        AnchorPoint = Vector2.new(0, 0.5),
                        Size = UDim2.fromOffset(14, 14),
                        Position = UDim2.new(0, 2, 0.5, 0),
                        Image = "http://www.roblox.com/asset/?id=12266946128",
                        ImageTransparency = 0.5,
                        ThemeTag = {ImageColor3 = "ToggleSlider"}
                    }
                ),
                ai("UIStroke", {Transparency = 0.5, ThemeTag = {Color = "ToggleSlider"}})
            local l =
                ai(
                "Frame",
                {
                    Size = UDim2.fromOffset(36, 18),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.new(1, -10, 0.5, 0),
                    Parent = i.Frame,
                    BackgroundTransparency = 1,
                    ThemeTag = {BackgroundColor3 = "Accent"}
                },
                {ai("UICorner", {CornerRadius = UDim.new(0, 9)}), k, j}
            )
            function h.OnChanged(m, n)
                h.Changed = n
                n(h.Value)
            end
            function h.SetValue(m, n)
                n = not (not n)
                h.Value = n
                ah.OverrideTag(k, {Color = h.Value and "Accent" or "ToggleSlider"})
                ah.OverrideTag(j, {ImageColor3 = h.Value and "ToggleToggled" or "ToggleSlider"})
                af:Create(
                    j,
                    TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    {Position = UDim2.new(0, h.Value and 19 or 2, 0.5, 0)}
                ):Play()
                af:Create(
                    l,
                    TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    {BackgroundTransparency = h.Value and 0 or 1}
                ):Play()
                j.ImageTransparency = h.Value and 0 or 0.5
                g:SafeCallback(h.Callback, h.Value)
                g:SafeCallback(h.Changed, h.Value)
            end
            function h.Destroy(m)
                i:Destroy()
                g.Options[e] = nil
            end
            ah.AddSignal(
                i.Frame.MouseButton1Click,
                function()
                    h:SetValue(not h.Value)
                end
            )
            h:SetValue(h.Value)
            g.Options[e] = h
            return h
        end
        return c
    end,
    [28] = function()
        local aa, ab, ac, ad, ae = b(28)
        return {
            assets = {
                ["lucide-accessibility"] = "rbxassetid://10709751939",
                ["lucide-activity"] = "rbxassetid://10709752035",
                ["lucide-air-vent"] = "rbxassetid://10709752131",
                ["lucide-airplay"] = "rbxassetid://10709752254",
                ["lucide-alarm-check"] = "rbxassetid://10709752405",
                ["lucide-alarm-clock"] = "rbxassetid://10709752630",
                ["lucide-alarm-clock-off"] = "rbxassetid://10709752508",
                ["lucide-alarm-minus"] = "rbxassetid://10709752732",
                ["lucide-alarm-plus"] = "rbxassetid://10709752825",
                ["lucide-album"] = "rbxassetid://10709752906",
                ["lucide-alert-circle"] = "rbxassetid://10709752996",
                ["lucide-alert-octagon"] = "rbxassetid://10709753064",
                ["lucide-alert-triangle"] = "rbxassetid://10709753149",
                ["lucide-align-center"] = "rbxassetid://10709753570",
                ["lucide-align-center-horizontal"] = "rbxassetid://10709753272",
                ["lucide-align-center-vertical"] = "rbxassetid://10709753421",
                ["lucide-align-end-horizontal"] = "rbxassetid://10709753692",
                ["lucide-align-end-vertical"] = "rbxassetid://10709753808",
                ["lucide-align-horizontal-distribute-center"] = "rbxassetid://10747779791",
                ["lucide-align-horizontal-distribute-end"] = "rbxassetid://10747784534",
                ["lucide-align-horizontal-distribute-start"] = "rbxassetid://10709754118",
                ["lucide-align-horizontal-justify-center"] = "rbxassetid://10709754204",
                ["lucide-align-horizontal-justify-end"] = "rbxassetid://10709754317",
                ["lucide-align-horizontal-justify-start"] = "rbxassetid://10709754436",
                ["lucide-align-horizontal-space-around"] = "rbxassetid://10709754590",
                ["lucide-align-horizontal-space-between"] = "rbxassetid://10709754749",
                ["lucide-align-justify"] = "rbxassetid://10709759610",
                ["lucide-align-left"] = "rbxassetid://10709759764",
                ["lucide-align-right"] = "rbxassetid://10709759895",
                ["lucide-align-start-horizontal"] = "rbxassetid://10709760051",
                ["lucide-align-start-vertical"] = "rbxassetid://10709760244",
                ["lucide-align-vertical-distribute-center"] = "rbxassetid://10709760351",
                ["lucide-align-vertical-distribute-end"] = "rbxassetid://10709760434",
                ["lucide-align-vertical-distribute-start"] = "rbxassetid://10709760612",
                ["lucide-align-vertical-justify-center"] = "rbxassetid://10709760814",
                ["lucide-align-vertical-justify-end"] = "rbxassetid://10709761003",
                ["lucide-align-vertical-justify-start"] = "rbxassetid://10709761176",
                ["lucide-align-vertical-space-around"] = "rbxassetid://10709761324",
                ["lucide-align-vertical-space-between"] = "rbxassetid://10709761434",
                ["lucide-anchor"] = "rbxassetid://10709761530",
                ["lucide-angry"] = "rbxassetid://10709761629",
                ["lucide-annoyed"] = "rbxassetid://10709761722",
                ["lucide-aperture"] = "rbxassetid://10709761813",
                ["lucide-apple"] = "rbxassetid://10709761889",
                ["lucide-archive"] = "rbxassetid://10709762233",
                ["lucide-archive-restore"] = "rbxassetid://10709762058",
                ["lucide-armchair"] = "rbxassetid://10709762327",
                ["lucide-arrow-big-down"] = "rbxassetid://10747796644",
                ["lucide-arrow-big-left"] = "rbxassetid://10709762574",
                ["lucide-arrow-big-right"] = "rbxassetid://10709762727",
                ["lucide-arrow-big-up"] = "rbxassetid://10709762879",
                ["lucide-arrow-down"] = "rbxassetid://10709767827",
                ["lucide-arrow-down-circle"] = "rbxassetid://10709763034",
                ["lucide-arrow-down-left"] = "rbxassetid://10709767656",
                ["lucide-arrow-down-right"] = "rbxassetid://10709767750",
                ["lucide-arrow-left"] = "rbxassetid://10709768114",
                ["lucide-arrow-left-circle"] = "rbxassetid://10709767936",
                ["lucide-arrow-left-right"] = "rbxassetid://10709768019",
                ["lucide-arrow-right"] = "rbxassetid://10709768347",
                ["lucide-arrow-right-circle"] = "rbxassetid://10709768226",
                ["lucide-arrow-up"] = "rbxassetid://10709768939",
                ["lucide-arrow-up-circle"] = "rbxassetid://10709768432",
                ["lucide-arrow-up-down"] = "rbxassetid://10709768538",
                ["lucide-arrow-up-left"] = "rbxassetid://10709768661",
                ["lucide-arrow-up-right"] = "rbxassetid://10709768787",
                ["lucide-asterisk"] = "rbxassetid://10709769095",
                ["lucide-at-sign"] = "rbxassetid://10709769286",
                ["lucide-award"] = "rbxassetid://10709769406",
                ["lucide-axe"] = "rbxassetid://10709769508",
                ["lucide-axis-3d"] = "rbxassetid://10709769598",
                ["lucide-baby"] = "rbxassetid://10709769732",
                ["lucide-backpack"] = "rbxassetid://10709769841",
                ["lucide-baggage-claim"] = "rbxassetid://10709769935",
                ["lucide-banana"] = "rbxassetid://10709770005",
                ["lucide-banknote"] = "rbxassetid://10709770178",
                ["lucide-bar-chart"] = "rbxassetid://10709773755",
                ["lucide-bar-chart-2"] = "rbxassetid://10709770317",
                ["lucide-bar-chart-3"] = "rbxassetid://10709770431",
                ["lucide-bar-chart-4"] = "rbxassetid://10709770560",
                ["lucide-bar-chart-horizontal"] = "rbxassetid://10709773669",
                ["lucide-barcode"] = "rbxassetid://10747360675",
                ["lucide-baseline"] = "rbxassetid://10709773863",
                ["lucide-bath"] = "rbxassetid://10709773963",
                ["lucide-battery"] = "rbxassetid://10709774640",
                ["lucide-battery-charging"] = "rbxassetid://10709774068",
                ["lucide-battery-full"] = "rbxassetid://10709774206",
                ["lucide-battery-low"] = "rbxassetid://10709774370",
                ["lucide-battery-medium"] = "rbxassetid://10709774513",
                ["lucide-beaker"] = "rbxassetid://10709774756",
                ["lucide-bed"] = "rbxassetid://10709775036",
                ["lucide-bed-double"] = "rbxassetid://10709774864",
                ["lucide-bed-single"] = "rbxassetid://10709774968",
                ["lucide-beer"] = "rbxassetid://10709775167",
                ["lucide-bell"] = "rbxassetid://10709775704",
                ["lucide-bell-minus"] = "rbxassetid://10709775241",
                ["lucide-bell-off"] = "rbxassetid://10709775320",
                ["lucide-bell-plus"] = "rbxassetid://10709775448",
                ["lucide-bell-ring"] = "rbxassetid://10709775560",
                ["lucide-bike"] = "rbxassetid://10709775894",
                ["lucide-binary"] = "rbxassetid://10709776050",
                ["lucide-bitcoin"] = "rbxassetid://10709776126",
                ["lucide-bluetooth"] = "rbxassetid://10709776655",
                ["lucide-bluetooth-connected"] = "rbxassetid://10709776240",
                ["lucide-bluetooth-off"] = "rbxassetid://10709776344",
                ["lucide-bluetooth-searching"] = "rbxassetid://10709776501",
                ["lucide-bold"] = "rbxassetid://10747813908",
                ["lucide-bomb"] = "rbxassetid://10709781460",
                ["lucide-bone"] = "rbxassetid://10709781605",
                ["lucide-book"] = "rbxassetid://10709781824",
                ["lucide-book-open"] = "rbxassetid://10709781717",
                ["lucide-bookmark"] = "rbxassetid://10709782154",
                ["lucide-bookmark-minus"] = "rbxassetid://10709781919",
                ["lucide-bookmark-plus"] = "rbxassetid://10709782044",
                ["lucide-bot"] = "rbxassetid://10709782230",
                ["lucide-box"] = "rbxassetid://10709782497",
                ["lucide-box-select"] = "rbxassetid://10709782342",
                ["lucide-boxes"] = "rbxassetid://10709782582",
                ["lucide-briefcase"] = "rbxassetid://10709782662",
                ["lucide-brush"] = "rbxassetid://10709782758",
                ["lucide-bug"] = "rbxassetid://10709782845",
                ["lucide-building"] = "rbxassetid://10709783051",
                ["lucide-building-2"] = "rbxassetid://10709782939",
                ["lucide-bus"] = "rbxassetid://10709783137",
                ["lucide-cake"] = "rbxassetid://10709783217",
                ["lucide-calculator"] = "rbxassetid://10709783311",
                ["lucide-calendar"] = "rbxassetid://10709789505",
                ["lucide-calendar-check"] = "rbxassetid://10709783474",
                ["lucide-calendar-check-2"] = "rbxassetid://10709783392",
                ["lucide-calendar-clock"] = "rbxassetid://10709783577",
                ["lucide-calendar-days"] = "rbxassetid://10709783673",
                ["lucide-calendar-heart"] = "rbxassetid://10709783835",
                ["lucide-calendar-minus"] = "rbxassetid://10709783959",
                ["lucide-calendar-off"] = "rbxassetid://10709788784",
                ["lucide-calendar-plus"] = "rbxassetid://10709788937",
                ["lucide-calendar-range"] = "rbxassetid://10709789053",
                ["lucide-calendar-search"] = "rbxassetid://10709789200",
                ["lucide-calendar-x"] = "rbxassetid://10709789407",
                ["lucide-calendar-x-2"] = "rbxassetid://10709789329",
                ["lucide-camera"] = "rbxassetid://10709789686",
                ["lucide-camera-off"] = "rbxassetid://10747822677",
                ["lucide-car"] = "rbxassetid://10709789810",
                ["lucide-carrot"] = "rbxassetid://10709789960",
                ["lucide-cast"] = "rbxassetid://10709790097",
                ["lucide-charge"] = "rbxassetid://10709790202",
                ["lucide-check"] = "rbxassetid://10709790644",
                ["lucide-check-circle"] = "rbxassetid://10709790387",
                ["lucide-check-circle-2"] = "rbxassetid://10709790298",
                ["lucide-check-square"] = "rbxassetid://10709790537",
                ["lucide-chef-hat"] = "rbxassetid://10709790757",
                ["lucide-cherry"] = "rbxassetid://10709790875",
                ["lucide-chevron-down"] = "rbxassetid://10709790948",
                ["lucide-chevron-first"] = "rbxassetid://10709791015",
                ["lucide-chevron-last"] = "rbxassetid://10709791130",
                ["lucide-chevron-left"] = "rbxassetid://10709791281",
                ["lucide-chevron-right"] = "rbxassetid://10709791437",
                ["lucide-chevron-up"] = "rbxassetid://10709791523",
                ["lucide-chevrons-down"] = "rbxassetid://10709796864",
                ["lucide-chevrons-down-up"] = "rbxassetid://10709791632",
                ["lucide-chevrons-left"] = "rbxassetid://10709797151",
                ["lucide-chevrons-left-right"] = "rbxassetid://10709797006",
                ["lucide-chevrons-right"] = "rbxassetid://10709797382",
                ["lucide-chevrons-right-left"] = "rbxassetid://10709797274",
                ["lucide-chevrons-up"] = "rbxassetid://10709797622",
                ["lucide-chevrons-up-down"] = "rbxassetid://10709797508",
                ["lucide-chrome"] = "rbxassetid://10709797725",
                ["lucide-circle"] = "rbxassetid://10709798174",
                ["lucide-circle-dot"] = "rbxassetid://10709797837",
                ["lucide-circle-ellipsis"] = "rbxassetid://10709797985",
                ["lucide-circle-slashed"] = "rbxassetid://10709798100",
                ["lucide-citrus"] = "rbxassetid://10709798276",
                ["lucide-clapperboard"] = "rbxassetid://10709798350",
                ["lucide-clipboard"] = "rbxassetid://10709799288",
                ["lucide-clipboard-check"] = "rbxassetid://10709798443",
                ["lucide-clipboard-copy"] = "rbxassetid://10709798574",
                ["lucide-clipboard-edit"] = "rbxassetid://10709798682",
                ["lucide-clipboard-list"] = "rbxassetid://10709798792",
                ["lucide-clipboard-signature"] = "rbxassetid://10709798890",
                ["lucide-clipboard-type"] = "rbxassetid://10709798999",
                ["lucide-clipboard-x"] = "rbxassetid://10709799124",
                ["lucide-clock"] = "rbxassetid://10709805144",
                ["lucide-clock-1"] = "rbxassetid://10709799535",
                ["lucide-clock-10"] = "rbxassetid://10709799718",
                ["lucide-clock-11"] = "rbxassetid://10709799818",
                ["lucide-clock-12"] = "rbxassetid://10709799962",
                ["lucide-clock-2"] = "rbxassetid://10709803876",
                ["lucide-clock-3"] = "rbxassetid://10709803989",
                ["lucide-clock-4"] = "rbxassetid://10709804164",
                ["lucide-clock-5"] = "rbxassetid://10709804291",
                ["lucide-clock-6"] = "rbxassetid://10709804435",
                ["lucide-clock-7"] = "rbxassetid://10709804599",
                ["lucide-clock-8"] = "rbxassetid://10709804784",
                ["lucide-clock-9"] = "rbxassetid://10709804996",
                ["lucide-cloud"] = "rbxassetid://10709806740",
                ["lucide-cloud-cog"] = "rbxassetid://10709805262",
                ["lucide-cloud-drizzle"] = "rbxassetid://10709805371",
                ["lucide-cloud-fog"] = "rbxassetid://10709805477",
                ["lucide-cloud-hail"] = "rbxassetid://10709805596",
                ["lucide-cloud-lightning"] = "rbxassetid://10709805727",
                ["lucide-cloud-moon"] = "rbxassetid://10709805942",
                ["lucide-cloud-moon-rain"] = "rbxassetid://10709805838",
                ["lucide-cloud-off"] = "rbxassetid://10709806060",
                ["lucide-cloud-rain"] = "rbxassetid://10709806277",
                ["lucide-cloud-rain-wind"] = "rbxassetid://10709806166",
                ["lucide-cloud-snow"] = "rbxassetid://10709806374",
                ["lucide-cloud-sun"] = "rbxassetid://10709806631",
                ["lucide-cloud-sun-rain"] = "rbxassetid://10709806475",
                ["lucide-cloudy"] = "rbxassetid://10709806859",
                ["lucide-clover"] = "rbxassetid://10709806995",
                ["lucide-code"] = "rbxassetid://10709810463",
                ["lucide-code-2"] = "rbxassetid://10709807111",
                ["lucide-codepen"] = "rbxassetid://10709810534",
                ["lucide-codesandbox"] = "rbxassetid://10709810676",
                ["lucide-coffee"] = "rbxassetid://10709810814",
                ["lucide-cog"] = "rbxassetid://10709810948",
                ["lucide-coins"] = "rbxassetid://10709811110",
                ["lucide-columns"] = "rbxassetid://10709811261",
                ["lucide-command"] = "rbxassetid://10709811365",
                ["lucide-compass"] = "rbxassetid://10709811445",
                ["lucide-component"] = "rbxassetid://10709811595",
                ["lucide-concierge-bell"] = "rbxassetid://10709811706",
                ["lucide-connection"] = "rbxassetid://10747361219",
                ["lucide-contact"] = "rbxassetid://10709811834",
                ["lucide-contrast"] = "rbxassetid://10709811939",
                ["lucide-cookie"] = "rbxassetid://10709812067",
                ["lucide-copy"] = "rbxassetid://10709812159",
                ["lucide-copyleft"] = "rbxassetid://10709812251",
                ["lucide-copyright"] = "rbxassetid://10709812311",
                ["lucide-corner-down-left"] = "rbxassetid://10709812396",
                ["lucide-corner-down-right"] = "rbxassetid://10709812485",
                ["lucide-corner-left-down"] = "rbxassetid://10709812632",
                ["lucide-corner-left-up"] = "rbxassetid://10709812784",
                ["lucide-corner-right-down"] = "rbxassetid://10709812939",
                ["lucide-corner-right-up"] = "rbxassetid://10709813094",
                ["lucide-corner-up-left"] = "rbxassetid://10709813185",
                ["lucide-corner-up-right"] = "rbxassetid://10709813281",
                ["lucide-cpu"] = "rbxassetid://10709813383",
                ["lucide-croissant"] = "rbxassetid://10709818125",
                ["lucide-crop"] = "rbxassetid://10709818245",
                ["lucide-cross"] = "rbxassetid://10709818399",
                ["lucide-crosshair"] = "rbxassetid://10709818534",
                ["lucide-crown"] = "rbxassetid://10709818626",
                ["lucide-cup-soda"] = "rbxassetid://10709818763",
                ["lucide-curly-braces"] = "rbxassetid://10709818847",
                ["lucide-currency"] = "rbxassetid://10709818931",
                ["lucide-database"] = "rbxassetid://10709818996",
                ["lucide-delete"] = "rbxassetid://10709819059",
                ["lucide-diamond"] = "rbxassetid://10709819149",
                ["lucide-dice-1"] = "rbxassetid://10709819266",
                ["lucide-dice-2"] = "rbxassetid://10709819361",
                ["lucide-dice-3"] = "rbxassetid://10709819508",
                ["lucide-dice-4"] = "rbxassetid://10709819670",
                ["lucide-dice-5"] = "rbxassetid://10709819801",
                ["lucide-dice-6"] = "rbxassetid://10709819896",
                ["lucide-dices"] = "rbxassetid://10723343321",
                ["lucide-diff"] = "rbxassetid://10723343416",
                ["lucide-disc"] = "rbxassetid://10723343537",
                ["lucide-divide"] = "rbxassetid://10723343805",
                ["lucide-divide-circle"] = "rbxassetid://10723343636",
                ["lucide-divide-square"] = "rbxassetid://10723343737",
                ["lucide-dollar-sign"] = "rbxassetid://10723343958",
                ["lucide-download"] = "rbxassetid://10723344270",
                ["lucide-download-cloud"] = "rbxassetid://10723344088",
                ["lucide-droplet"] = "rbxassetid://10723344432",
                ["lucide-droplets"] = "rbxassetid://10734883356",
                ["lucide-drumstick"] = "rbxassetid://10723344737",
                ["lucide-edit"] = "rbxassetid://10734883598",
                ["lucide-edit-2"] = "rbxassetid://10723344885",
                ["lucide-edit-3"] = "rbxassetid://10723345088",
                ["lucide-egg"] = "rbxassetid://10723345518",
                ["lucide-egg-fried"] = "rbxassetid://10723345347",
                ["lucide-electricity"] = "rbxassetid://10723345749",
                ["lucide-electricity-off"] = "rbxassetid://10723345643",
                ["lucide-equal"] = "rbxassetid://10723345990",
                ["lucide-equal-not"] = "rbxassetid://10723345866",
                ["lucide-eraser"] = "rbxassetid://10723346158",
                ["lucide-euro"] = "rbxassetid://10723346372",
                ["lucide-expand"] = "rbxassetid://10723346553",
                ["lucide-external-link"] = "rbxassetid://10723346684",
                ["lucide-eye"] = "rbxassetid://10723346959",
                ["lucide-eye-off"] = "rbxassetid://10723346871",
                ["lucide-factory"] = "rbxassetid://10723347051",
                ["lucide-fan"] = "rbxassetid://10723354359",
                ["lucide-fast-forward"] = "rbxassetid://10723354521",
                ["lucide-feather"] = "rbxassetid://10723354671",
                ["lucide-figma"] = "rbxassetid://10723354801",
                ["lucide-file"] = "rbxassetid://10723374641",
                ["lucide-file-archive"] = "rbxassetid://10723354921",
                ["lucide-file-audio"] = "rbxassetid://10723355148",
                ["lucide-file-audio-2"] = "rbxassetid://10723355026",
                ["lucide-file-axis-3d"] = "rbxassetid://10723355272",
                ["lucide-file-badge"] = "rbxassetid://10723355622",
                ["lucide-file-badge-2"] = "rbxassetid://10723355451",
                ["lucide-file-bar-chart"] = "rbxassetid://10723355887",
                ["lucide-file-bar-chart-2"] = "rbxassetid://10723355746",
                ["lucide-file-box"] = "rbxassetid://10723355989",
                ["lucide-file-check"] = "rbxassetid://10723356210",
                ["lucide-file-check-2"] = "rbxassetid://10723356100",
                ["lucide-file-clock"] = "rbxassetid://10723356329",
                ["lucide-file-code"] = "rbxassetid://10723356507",
                ["lucide-file-cog"] = "rbxassetid://10723356830",
                ["lucide-file-cog-2"] = "rbxassetid://10723356676",
                ["lucide-file-diff"] = "rbxassetid://10723357039",
                ["lucide-file-digit"] = "rbxassetid://10723357151",
                ["lucide-file-down"] = "rbxassetid://10723357322",
                ["lucide-file-edit"] = "rbxassetid://10723357495",
                ["lucide-file-heart"] = "rbxassetid://10723357637",
                ["lucide-file-image"] = "rbxassetid://10723357790",
                ["lucide-file-input"] = "rbxassetid://10723357933",
                ["lucide-file-json"] = "rbxassetid://10723364435",
                ["lucide-file-json-2"] = "rbxassetid://10723364361",
                ["lucide-file-key"] = "rbxassetid://10723364605",
                ["lucide-file-key-2"] = "rbxassetid://10723364515",
                ["lucide-file-line-chart"] = "rbxassetid://10723364725",
                ["lucide-file-lock"] = "rbxassetid://10723364957",
                ["lucide-file-lock-2"] = "rbxassetid://10723364861",
                ["lucide-file-minus"] = "rbxassetid://10723365254",
                ["lucide-file-minus-2"] = "rbxassetid://10723365086",
                ["lucide-file-output"] = "rbxassetid://10723365457",
                ["lucide-file-pie-chart"] = "rbxassetid://10723365598",
                ["lucide-file-plus"] = "rbxassetid://10723365877",
                ["lucide-file-plus-2"] = "rbxassetid://10723365766",
                ["lucide-file-question"] = "rbxassetid://10723365987",
                ["lucide-file-scan"] = "rbxassetid://10723366167",
                ["lucide-file-search"] = "rbxassetid://10723366550",
                ["lucide-file-search-2"] = "rbxassetid://10723366340",
                ["lucide-file-signature"] = "rbxassetid://10723366741",
                ["lucide-file-spreadsheet"] = "rbxassetid://10723366962",
                ["lucide-file-symlink"] = "rbxassetid://10723367098",
                ["lucide-file-terminal"] = "rbxassetid://10723367244",
                ["lucide-file-text"] = "rbxassetid://10723367380",
                ["lucide-file-type"] = "rbxassetid://10723367606",
                ["lucide-file-type-2"] = "rbxassetid://10723367509",
                ["lucide-file-up"] = "rbxassetid://10723367734",
                ["lucide-file-video"] = "rbxassetid://10723373884",
                ["lucide-file-video-2"] = "rbxassetid://10723367834",
                ["lucide-file-volume"] = "rbxassetid://10723374172",
                ["lucide-file-volume-2"] = "rbxassetid://10723374030",
                ["lucide-file-warning"] = "rbxassetid://10723374276",
                ["lucide-file-x"] = "rbxassetid://10723374544",
                ["lucide-file-x-2"] = "rbxassetid://10723374378",
                ["lucide-files"] = "rbxassetid://10723374759",
                ["lucide-film"] = "rbxassetid://10723374981",
                ["lucide-filter"] = "rbxassetid://10723375128",
                ["lucide-fingerprint"] = "rbxassetid://10723375250",
                ["lucide-flag"] = "rbxassetid://10723375890",
                ["lucide-flag-off"] = "rbxassetid://10723375443",
                ["lucide-flag-triangle-left"] = "rbxassetid://10723375608",
                ["lucide-flag-triangle-right"] = "rbxassetid://10723375727",
                ["lucide-flame"] = "rbxassetid://10723376114",
                ["lucide-flashlight"] = "rbxassetid://10723376471",
                ["lucide-flashlight-off"] = "rbxassetid://10723376365",
                ["lucide-flask-conical"] = "rbxassetid://10734883986",
                ["lucide-flask-round"] = "rbxassetid://10723376614",
                ["lucide-flip-horizontal"] = "rbxassetid://10723376884",
                ["lucide-flip-horizontal-2"] = "rbxassetid://10723376745",
                ["lucide-flip-vertical"] = "rbxassetid://10723377138",
                ["lucide-flip-vertical-2"] = "rbxassetid://10723377026",
                ["lucide-flower"] = "rbxassetid://10747830374",
                ["lucide-flower-2"] = "rbxassetid://10723377305",
                ["lucide-focus"] = "rbxassetid://10723377537",
                ["lucide-folder"] = "rbxassetid://10723387563",
                ["lucide-folder-archive"] = "rbxassetid://10723384478",
                ["lucide-folder-check"] = "rbxassetid://10723384605",
                ["lucide-folder-clock"] = "rbxassetid://10723384731",
                ["lucide-folder-closed"] = "rbxassetid://10723384893",
                ["lucide-folder-cog"] = "rbxassetid://10723385213",
                ["lucide-folder-cog-2"] = "rbxassetid://10723385036",
                ["lucide-folder-down"] = "rbxassetid://10723385338",
                ["lucide-folder-edit"] = "rbxassetid://10723385445",
                ["lucide-folder-heart"] = "rbxassetid://10723385545",
                ["lucide-folder-input"] = "rbxassetid://10723385721",
                ["lucide-folder-key"] = "rbxassetid://10723385848",
                ["lucide-folder-lock"] = "rbxassetid://10723386005",
                ["lucide-folder-minus"] = "rbxassetid://10723386127",
                ["lucide-folder-open"] = "rbxassetid://10723386277",
                ["lucide-folder-output"] = "rbxassetid://10723386386",
                ["lucide-folder-plus"] = "rbxassetid://10723386531",
                ["lucide-folder-search"] = "rbxassetid://10723386787",
                ["lucide-folder-search-2"] = "rbxassetid://10723386674",
                ["lucide-folder-symlink"] = "rbxassetid://10723386930",
                ["lucide-folder-tree"] = "rbxassetid://10723387085",
                ["lucide-folder-up"] = "rbxassetid://10723387265",
                ["lucide-folder-x"] = "rbxassetid://10723387448",
                ["lucide-folders"] = "rbxassetid://10723387721",
                ["lucide-form-input"] = "rbxassetid://10723387841",
                ["lucide-forward"] = "rbxassetid://10723388016",
                ["lucide-frame"] = "rbxassetid://10723394389",
                ["lucide-framer"] = "rbxassetid://10723394565",
                ["lucide-frown"] = "rbxassetid://10723394681",
                ["lucide-fuel"] = "rbxassetid://10723394846",
                ["lucide-function-square"] = "rbxassetid://10723395041",
                ["lucide-gamepad"] = "rbxassetid://10723395457",
                ["lucide-gamepad-2"] = "rbxassetid://10723395215",
                ["lucide-gauge"] = "rbxassetid://10723395708",
                ["lucide-gavel"] = "rbxassetid://10723395896",
                ["lucide-gem"] = "rbxassetid://10723396000",
                ["lucide-ghost"] = "rbxassetid://10723396107",
                ["lucide-gift"] = "rbxassetid://10723396402",
                ["lucide-gift-card"] = "rbxassetid://10723396225",
                ["lucide-git-branch"] = "rbxassetid://10723396676",
                ["lucide-git-branch-plus"] = "rbxassetid://10723396542",
                ["lucide-git-commit"] = "rbxassetid://10723396812",
                ["lucide-git-compare"] = "rbxassetid://10723396954",
                ["lucide-git-fork"] = "rbxassetid://10723397049",
                ["lucide-git-merge"] = "rbxassetid://10723397165",
                ["lucide-git-pull-request"] = "rbxassetid://10723397431",
                ["lucide-git-pull-request-closed"] = "rbxassetid://10723397268",
                ["lucide-git-pull-request-draft"] = "rbxassetid://10734884302",
                ["lucide-glass"] = "rbxassetid://10723397788",
                ["lucide-glass-2"] = "rbxassetid://10723397529",
                ["lucide-glass-water"] = "rbxassetid://10723397678",
                ["lucide-glasses"] = "rbxassetid://10723397895",
                ["lucide-globe"] = "rbxassetid://10723404337",
                ["lucide-globe-2"] = "rbxassetid://10723398002",
                ["lucide-grab"] = "rbxassetid://10723404472",
                ["lucide-graduation-cap"] = "rbxassetid://10723404691",
                ["lucide-grape"] = "rbxassetid://10723404822",
                ["lucide-grid"] = "rbxassetid://10723404936",
                ["lucide-grip-horizontal"] = "rbxassetid://10723405089",
                ["lucide-grip-vertical"] = "rbxassetid://10723405236",
                ["lucide-hammer"] = "rbxassetid://10723405360",
                ["lucide-hand"] = "rbxassetid://10723405649",
                ["lucide-hand-metal"] = "rbxassetid://10723405508",
                ["lucide-hard-drive"] = "rbxassetid://10723405749",
                ["lucide-hard-hat"] = "rbxassetid://10723405859",
                ["lucide-hash"] = "rbxassetid://10723405975",
                ["lucide-haze"] = "rbxassetid://10723406078",
                ["lucide-headphones"] = "rbxassetid://10723406165",
                ["lucide-heart"] = "rbxassetid://10723406885",
                ["lucide-heart-crack"] = "rbxassetid://10723406299",
                ["lucide-heart-handshake"] = "rbxassetid://10723406480",
                ["lucide-heart-off"] = "rbxassetid://10723406662",
                ["lucide-heart-pulse"] = "rbxassetid://10723406795",
                ["lucide-help-circle"] = "rbxassetid://10723406988",
                ["lucide-hexagon"] = "rbxassetid://10723407092",
                ["lucide-highlighter"] = "rbxassetid://10723407192",
                ["lucide-history"] = "rbxassetid://10723407335",
                ["lucide-home"] = "rbxassetid://10723407389",
                ["lucide-hourglass"] = "rbxassetid://10723407498",
                ["lucide-ice-cream"] = "rbxassetid://10723414308",
                ["lucide-image"] = "rbxassetid://10723415040",
                ["lucide-image-minus"] = "rbxassetid://10723414487",
                ["lucide-image-off"] = "rbxassetid://10723414677",
                ["lucide-image-plus"] = "rbxassetid://10723414827",
                ["lucide-import"] = "rbxassetid://10723415205",
                ["lucide-inbox"] = "rbxassetid://10723415335",
                ["lucide-indent"] = "rbxassetid://10723415494",
                ["lucide-indian-rupee"] = "rbxassetid://10723415642",
                ["lucide-infinity"] = "rbxassetid://10723415766",
                ["lucide-info"] = "rbxassetid://10723415903",
                ["lucide-inspect"] = "rbxassetid://10723416057",
                ["lucide-italic"] = "rbxassetid://10723416195",
                ["lucide-japanese-yen"] = "rbxassetid://10723416363",
                ["lucide-joystick"] = "rbxassetid://10723416527",
                ["lucide-key"] = "rbxassetid://10723416652",
                ["lucide-keyboard"] = "rbxassetid://10723416765",
                ["lucide-lamp"] = "rbxassetid://10723417513",
                ["lucide-lamp-ceiling"] = "rbxassetid://10723416922",
                ["lucide-lamp-desk"] = "rbxassetid://10723417016",
                ["lucide-lamp-floor"] = "rbxassetid://10723417131",
                ["lucide-lamp-wall-down"] = "rbxassetid://10723417240",
                ["lucide-lamp-wall-up"] = "rbxassetid://10723417356",
                ["lucide-landmark"] = "rbxassetid://10723417608",
                ["lucide-languages"] = "rbxassetid://10723417703",
                ["lucide-laptop"] = "rbxassetid://10723423881",
                ["lucide-laptop-2"] = "rbxassetid://10723417797",
                ["lucide-lasso"] = "rbxassetid://10723424235",
                ["lucide-lasso-select"] = "rbxassetid://10723424058",
                ["lucide-laugh"] = "rbxassetid://10723424372",
                ["lucide-layers"] = "rbxassetid://10723424505",
                ["lucide-layout"] = "rbxassetid://10723425376",
                ["lucide-layout-dashboard"] = "rbxassetid://10723424646",
                ["lucide-layout-grid"] = "rbxassetid://10723424838",
                ["lucide-layout-list"] = "rbxassetid://10723424963",
                ["lucide-layout-template"] = "rbxassetid://10723425187",
                ["lucide-leaf"] = "rbxassetid://10723425539",
                ["lucide-library"] = "rbxassetid://10723425615",
                ["lucide-life-buoy"] = "rbxassetid://10723425685",
                ["lucide-lightbulb"] = "rbxassetid://10723425852",
                ["lucide-lightbulb-off"] = "rbxassetid://10723425762",
                ["lucide-line-chart"] = "rbxassetid://10723426393",
                ["lucide-link"] = "rbxassetid://10723426722",
                ["lucide-link-2"] = "rbxassetid://10723426595",
                ["lucide-link-2-off"] = "rbxassetid://10723426513",
                ["lucide-list"] = "rbxassetid://10723433811",
                ["lucide-list-checks"] = "rbxassetid://10734884548",
                ["lucide-list-end"] = "rbxassetid://10723426886",
                ["lucide-list-minus"] = "rbxassetid://10723426986",
                ["lucide-list-music"] = "rbxassetid://10723427081",
                ["lucide-list-ordered"] = "rbxassetid://10723427199",
                ["lucide-list-plus"] = "rbxassetid://10723427334",
                ["lucide-list-start"] = "rbxassetid://10723427494",
                ["lucide-list-video"] = "rbxassetid://10723427619",
                ["lucide-list-x"] = "rbxassetid://10723433655",
                ["lucide-loader"] = "rbxassetid://10723434070",
                ["lucide-loader-2"] = "rbxassetid://10723433935",
                ["lucide-locate"] = "rbxassetid://10723434557",
                ["lucide-locate-fixed"] = "rbxassetid://10723434236",
                ["lucide-locate-off"] = "rbxassetid://10723434379",
                ["lucide-lock"] = "rbxassetid://10723434711",
                ["lucide-log-in"] = "rbxassetid://10723434830",
                ["lucide-log-out"] = "rbxassetid://10723434906",
                ["lucide-luggage"] = "rbxassetid://10723434993",
                ["lucide-magnet"] = "rbxassetid://10723435069",
                ["lucide-mail"] = "rbxassetid://10734885430",
                ["lucide-mail-check"] = "rbxassetid://10723435182",
                ["lucide-mail-minus"] = "rbxassetid://10723435261",
                ["lucide-mail-open"] = "rbxassetid://10723435342",
                ["lucide-mail-plus"] = "rbxassetid://10723435443",
                ["lucide-mail-question"] = "rbxassetid://10723435515",
                ["lucide-mail-search"] = "rbxassetid://10734884739",
                ["lucide-mail-warning"] = "rbxassetid://10734885015",
                ["lucide-mail-x"] = "rbxassetid://10734885247",
                ["lucide-mails"] = "rbxassetid://10734885614",
                ["lucide-map"] = "rbxassetid://10734886202",
                ["lucide-map-pin"] = "rbxassetid://10734886004",
                ["lucide-map-pin-off"] = "rbxassetid://10734885803",
                ["lucide-maximize"] = "rbxassetid://10734886735",
                ["lucide-maximize-2"] = "rbxassetid://10734886496",
                ["lucide-medal"] = "rbxassetid://10734887072",
                ["lucide-megaphone"] = "rbxassetid://10734887454",
                ["lucide-megaphone-off"] = "rbxassetid://10734887311",
                ["lucide-meh"] = "rbxassetid://10734887603",
                ["lucide-menu"] = "rbxassetid://10734887784",
                ["lucide-message-circle"] = "rbxassetid://10734888000",
                ["lucide-message-square"] = "rbxassetid://10734888228",
                ["lucide-mic"] = "rbxassetid://10734888864",
                ["lucide-mic-2"] = "rbxassetid://10734888430",
                ["lucide-mic-off"] = "rbxassetid://10734888646",
                ["lucide-microscope"] = "rbxassetid://10734889106",
                ["lucide-microwave"] = "rbxassetid://10734895076",
                ["lucide-milestone"] = "rbxassetid://10734895310",
                ["lucide-minimize"] = "rbxassetid://10734895698",
                ["lucide-minimize-2"] = "rbxassetid://10734895530",
                ["lucide-minus"] = "rbxassetid://10734896206",
                ["lucide-minus-circle"] = "rbxassetid://10734895856",
                ["lucide-minus-square"] = "rbxassetid://10734896029",
                ["lucide-monitor"] = "rbxassetid://10734896881",
                ["lucide-monitor-off"] = "rbxassetid://10734896360",
                ["lucide-monitor-speaker"] = "rbxassetid://10734896512",
                ["lucide-moon"] = "rbxassetid://10734897102",
                ["lucide-more-horizontal"] = "rbxassetid://10734897250",
                ["lucide-more-vertical"] = "rbxassetid://10734897387",
                ["lucide-mountain"] = "rbxassetid://10734897956",
                ["lucide-mountain-snow"] = "rbxassetid://10734897665",
                ["lucide-mouse"] = "rbxassetid://10734898592",
                ["lucide-mouse-pointer"] = "rbxassetid://10734898476",
                ["lucide-mouse-pointer-2"] = "rbxassetid://10734898194",
                ["lucide-mouse-pointer-click"] = "rbxassetid://10734898355",
                ["lucide-move"] = "rbxassetid://10734900011",
                ["lucide-move-3d"] = "rbxassetid://10734898756",
                ["lucide-move-diagonal"] = "rbxassetid://10734899164",
                ["lucide-move-diagonal-2"] = "rbxassetid://10734898934",
                ["lucide-move-horizontal"] = "rbxassetid://10734899414",
                ["lucide-move-vertical"] = "rbxassetid://10734899821",
                ["lucide-music"] = "rbxassetid://10734905958",
                ["lucide-music-2"] = "rbxassetid://10734900215",
                ["lucide-music-3"] = "rbxassetid://10734905665",
                ["lucide-music-4"] = "rbxassetid://10734905823",
                ["lucide-navigation"] = "rbxassetid://10734906744",
                ["lucide-navigation-2"] = "rbxassetid://10734906332",
                ["lucide-navigation-2-off"] = "rbxassetid://10734906144",
                ["lucide-navigation-off"] = "rbxassetid://10734906580",
                ["lucide-network"] = "rbxassetid://10734906975",
                ["lucide-newspaper"] = "rbxassetid://10734907168",
                ["lucide-octagon"] = "rbxassetid://10734907361",
                ["lucide-option"] = "rbxassetid://10734907649",
                ["lucide-outdent"] = "rbxassetid://10734907933",
                ["lucide-package"] = "rbxassetid://10734909540",
                ["lucide-package-2"] = "rbxassetid://10734908151",
                ["lucide-package-check"] = "rbxassetid://10734908384",
                ["lucide-package-minus"] = "rbxassetid://10734908626",
                ["lucide-package-open"] = "rbxassetid://10734908793",
                ["lucide-package-plus"] = "rbxassetid://10734909016",
                ["lucide-package-search"] = "rbxassetid://10734909196",
                ["lucide-package-x"] = "rbxassetid://10734909375",
                ["lucide-paint-bucket"] = "rbxassetid://10734909847",
                ["lucide-paintbrush"] = "rbxassetid://10734910187",
                ["lucide-paintbrush-2"] = "rbxassetid://10734910030",
                ["lucide-palette"] = "rbxassetid://10734910430",
                ["lucide-palmtree"] = "rbxassetid://10734910680",
                ["lucide-paperclip"] = "rbxassetid://10734910927",
                ["lucide-party-popper"] = "rbxassetid://10734918735",
                ["lucide-pause"] = "rbxassetid://10734919336",
                ["lucide-pause-circle"] = "rbxassetid://10735024209",
                ["lucide-pause-octagon"] = "rbxassetid://10734919143",
                ["lucide-pen-tool"] = "rbxassetid://10734919503",
                ["lucide-pencil"] = "rbxassetid://10734919691",
                ["lucide-percent"] = "rbxassetid://10734919919",
                ["lucide-person-standing"] = "rbxassetid://10734920149",
                ["lucide-phone"] = "rbxassetid://10734921524",
                ["lucide-phone-call"] = "rbxassetid://10734920305",
                ["lucide-phone-forwarded"] = "rbxassetid://10734920508",
                ["lucide-phone-incoming"] = "rbxassetid://10734920694",
                ["lucide-phone-missed"] = "rbxassetid://10734920845",
                ["lucide-phone-off"] = "rbxassetid://10734921077",
                ["lucide-phone-outgoing"] = "rbxassetid://10734921288",
                ["lucide-pie-chart"] = "rbxassetid://10734921727",
                ["lucide-piggy-bank"] = "rbxassetid://10734921935",
                ["lucide-pin"] = "rbxassetid://10734922324",
                ["lucide-pin-off"] = "rbxassetid://10734922180",
                ["lucide-pipette"] = "rbxassetid://10734922497",
                ["lucide-pizza"] = "rbxassetid://10734922774",
                ["lucide-plane"] = "rbxassetid://10734922971",
                ["lucide-play"] = "rbxassetid://10734923549",
                ["lucide-play-circle"] = "rbxassetid://10734923214",
                ["lucide-plus"] = "rbxassetid://10734924532",
                ["lucide-plus-circle"] = "rbxassetid://10734923868",
                ["lucide-plus-square"] = "rbxassetid://10734924219",
                ["lucide-podcast"] = "rbxassetid://10734929553",
                ["lucide-pointer"] = "rbxassetid://10734929723",
                ["lucide-pound-sterling"] = "rbxassetid://10734929981",
                ["lucide-power"] = "rbxassetid://10734930466",
                ["lucide-power-off"] = "rbxassetid://10734930257",
                ["lucide-printer"] = "rbxassetid://10734930632",
                ["lucide-puzzle"] = "rbxassetid://10734930886",
                ["lucide-quote"] = "rbxassetid://10734931234",
                ["lucide-radio"] = "rbxassetid://10734931596",
                ["lucide-radio-receiver"] = "rbxassetid://10734931402",
                ["lucide-rectangle-horizontal"] = "rbxassetid://10734931777",
                ["lucide-rectangle-vertical"] = "rbxassetid://10734932081",
                ["lucide-recycle"] = "rbxassetid://10734932295",
                ["lucide-redo"] = "rbxassetid://10734932822",
                ["lucide-redo-2"] = "rbxassetid://10734932586",
                ["lucide-refresh-ccw"] = "rbxassetid://10734933056",
                ["lucide-refresh-cw"] = "rbxassetid://10734933222",
                ["lucide-refrigerator"] = "rbxassetid://10734933465",
                ["lucide-regex"] = "rbxassetid://10734933655",
                ["lucide-repeat"] = "rbxassetid://10734933966",
                ["lucide-repeat-1"] = "rbxassetid://10734933826",
                ["lucide-reply"] = "rbxassetid://10734934252",
                ["lucide-reply-all"] = "rbxassetid://10734934132",
                ["lucide-rewind"] = "rbxassetid://10734934347",
                ["lucide-rocket"] = "rbxassetid://10734934585",
                ["lucide-rocking-chair"] = "rbxassetid://10734939942",
                ["lucide-rotate-3d"] = "rbxassetid://10734940107",
                ["lucide-rotate-ccw"] = "rbxassetid://10734940376",
                ["lucide-rotate-cw"] = "rbxassetid://10734940654",
                ["lucide-rss"] = "rbxassetid://10734940825",
                ["lucide-ruler"] = "rbxassetid://10734941018",
                ["lucide-russian-ruble"] = "rbxassetid://10734941199",
                ["lucide-sailboat"] = "rbxassetid://10734941354",
                ["lucide-save"] = "rbxassetid://10734941499",
                ["lucide-scale"] = "rbxassetid://10734941912",
                ["lucide-scale-3d"] = "rbxassetid://10734941739",
                ["lucide-scaling"] = "rbxassetid://10734942072",
                ["lucide-scan"] = "rbxassetid://10734942565",
                ["lucide-scan-face"] = "rbxassetid://10734942198",
                ["lucide-scan-line"] = "rbxassetid://10734942351",
                ["lucide-scissors"] = "rbxassetid://10734942778",
                ["lucide-screen-share"] = "rbxassetid://10734943193",
                ["lucide-screen-share-off"] = "rbxassetid://10734942967",
                ["lucide-scroll"] = "rbxassetid://10734943448",
                ["lucide-search"] = "rbxassetid://10734943674",
                ["lucide-send"] = "rbxassetid://10734943902",
                ["lucide-separator-horizontal"] = "rbxassetid://10734944115",
                ["lucide-separator-vertical"] = "rbxassetid://10734944326",
                ["lucide-server"] = "rbxassetid://10734949856",
                ["lucide-server-cog"] = "rbxassetid://10734944444",
                ["lucide-server-crash"] = "rbxassetid://10734944554",
                ["lucide-server-off"] = "rbxassetid://10734944668",
                ["lucide-settings"] = "rbxassetid://10734950309",
                ["lucide-settings-2"] = "rbxassetid://10734950020",
                ["lucide-share"] = "rbxassetid://10734950813",
                ["lucide-share-2"] = "rbxassetid://10734950553",
                ["lucide-sheet"] = "rbxassetid://10734951038",
                ["lucide-shield"] = "rbxassetid://10734951847",
                ["lucide-shield-alert"] = "rbxassetid://10734951173",
                ["lucide-shield-check"] = "rbxassetid://10734951367",
                ["lucide-shield-close"] = "rbxassetid://10734951535",
                ["lucide-shield-off"] = "rbxassetid://10734951684",
                ["lucide-shirt"] = "rbxassetid://10734952036",
                ["lucide-shopping-bag"] = "rbxassetid://10734952273",
                ["lucide-shopping-cart"] = "rbxassetid://10734952479",
                ["lucide-shovel"] = "rbxassetid://10734952773",
                ["lucide-shower-head"] = "rbxassetid://10734952942",
                ["lucide-shrink"] = "rbxassetid://10734953073",
                ["lucide-shrub"] = "rbxassetid://10734953241",
                ["lucide-shuffle"] = "rbxassetid://10734953451",
                ["lucide-sidebar"] = "rbxassetid://10734954301",
                ["lucide-sidebar-close"] = "rbxassetid://10734953715",
                ["lucide-sidebar-open"] = "rbxassetid://10734954000",
                ["lucide-sigma"] = "rbxassetid://10734954538",
                ["lucide-signal"] = "rbxassetid://10734961133",
                ["lucide-signal-high"] = "rbxassetid://10734954807",
                ["lucide-signal-low"] = "rbxassetid://10734955080",
                ["lucide-signal-medium"] = "rbxassetid://10734955336",
                ["lucide-signal-zero"] = "rbxassetid://10734960878",
                ["lucide-siren"] = "rbxassetid://10734961284",
                ["lucide-skip-back"] = "rbxassetid://10734961526",
                ["lucide-skip-forward"] = "rbxassetid://10734961809",
                ["lucide-skull"] = "rbxassetid://10734962068",
                ["lucide-slack"] = "rbxassetid://10734962339",
                ["lucide-slash"] = "rbxassetid://10734962600",
                ["lucide-slice"] = "rbxassetid://10734963024",
                ["lucide-sliders"] = "rbxassetid://10734963400",
                ["lucide-sliders-horizontal"] = "rbxassetid://10734963191",
                ["lucide-smartphone"] = "rbxassetid://10734963940",
                ["lucide-smartphone-charging"] = "rbxassetid://10734963671",
                ["lucide-smile"] = "rbxassetid://10734964441",
                ["lucide-smile-plus"] = "rbxassetid://10734964188",
                ["lucide-snowflake"] = "rbxassetid://10734964600",
                ["lucide-sofa"] = "rbxassetid://10734964852",
                ["lucide-sort-asc"] = "rbxassetid://10734965115",
                ["lucide-sort-desc"] = "rbxassetid://10734965287",
                ["lucide-speaker"] = "rbxassetid://10734965419",
                ["lucide-sprout"] = "rbxassetid://10734965572",
                ["lucide-square"] = "rbxassetid://10734965702",
                ["lucide-star"] = "rbxassetid://10734966248",
                ["lucide-star-half"] = "rbxassetid://10734965897",
                ["lucide-star-off"] = "rbxassetid://10734966097",
                ["lucide-stethoscope"] = "rbxassetid://10734966384",
                ["lucide-sticker"] = "rbxassetid://10734972234",
                ["lucide-sticky-note"] = "rbxassetid://10734972463",
                ["lucide-stop-circle"] = "rbxassetid://10734972621",
                ["lucide-stretch-horizontal"] = "rbxassetid://10734972862",
                ["lucide-stretch-vertical"] = "rbxassetid://10734973130",
                ["lucide-strikethrough"] = "rbxassetid://10734973290",
                ["lucide-subscript"] = "rbxassetid://10734973457",
                ["lucide-sun"] = "rbxassetid://10734974297",
                ["lucide-sun-dim"] = "rbxassetid://10734973645",
                ["lucide-sun-medium"] = "rbxassetid://10734973778",
                ["lucide-sun-moon"] = "rbxassetid://10734973999",
                ["lucide-sun-snow"] = "rbxassetid://10734974130",
                ["lucide-sunrise"] = "rbxassetid://10734974522",
                ["lucide-sunset"] = "rbxassetid://10734974689",
                ["lucide-superscript"] = "rbxassetid://10734974850",
                ["lucide-swiss-franc"] = "rbxassetid://10734975024",
                ["lucide-switch-camera"] = "rbxassetid://10734975214",
                ["lucide-sword"] = "rbxassetid://10734975486",
                ["lucide-swords"] = "rbxassetid://10734975692",
                ["lucide-syringe"] = "rbxassetid://10734975932",
                ["lucide-table"] = "rbxassetid://10734976230",
                ["lucide-table-2"] = "rbxassetid://10734976097",
                ["lucide-tablet"] = "rbxassetid://10734976394",
                ["lucide-tag"] = "rbxassetid://10734976528",
                ["lucide-tags"] = "rbxassetid://10734976739",
                ["lucide-target"] = "rbxassetid://10734977012",
                ["lucide-tent"] = "rbxassetid://10734981750",
                ["lucide-terminal"] = "rbxassetid://10734982144",
                ["lucide-terminal-square"] = "rbxassetid://10734981995",
                ["lucide-text-cursor"] = "rbxassetid://10734982395",
                ["lucide-text-cursor-input"] = "rbxassetid://10734982297",
                ["lucide-thermometer"] = "rbxassetid://10734983134",
                ["lucide-thermometer-snowflake"] = "rbxassetid://10734982571",
                ["lucide-thermometer-sun"] = "rbxassetid://10734982771",
                ["lucide-thumbs-down"] = "rbxassetid://10734983359",
                ["lucide-thumbs-up"] = "rbxassetid://10734983629",
                ["lucide-ticket"] = "rbxassetid://10734983868",
                ["lucide-timer"] = "rbxassetid://10734984606",
                ["lucide-timer-off"] = "rbxassetid://10734984138",
                ["lucide-timer-reset"] = "rbxassetid://10734984355",
                ["lucide-toggle-left"] = "rbxassetid://10734984834",
                ["lucide-toggle-right"] = "rbxassetid://10734985040",
                ["lucide-tornado"] = "rbxassetid://10734985247",
                ["lucide-toy-brick"] = "rbxassetid://10747361919",
                ["lucide-train"] = "rbxassetid://10747362105",
                ["lucide-trash"] = "rbxassetid://10747362393",
                ["lucide-trash-2"] = "rbxassetid://10747362241",
                ["lucide-tree-deciduous"] = "rbxassetid://10747362534",
                ["lucide-tree-pine"] = "rbxassetid://10747362748",
                ["lucide-trees"] = "rbxassetid://10747363016",
                ["lucide-trending-down"] = "rbxassetid://10747363205",
                ["lucide-trending-up"] = "rbxassetid://10747363465",
                ["lucide-triangle"] = "rbxassetid://10747363621",
                ["lucide-trophy"] = "rbxassetid://10747363809",
                ["lucide-truck"] = "rbxassetid://10747364031",
                ["lucide-tv"] = "rbxassetid://10747364593",
                ["lucide-tv-2"] = "rbxassetid://10747364302",
                ["lucide-type"] = "rbxassetid://10747364761",
                ["lucide-umbrella"] = "rbxassetid://10747364971",
                ["lucide-underline"] = "rbxassetid://10747365191",
                ["lucide-undo"] = "rbxassetid://10747365484",
                ["lucide-undo-2"] = "rbxassetid://10747365359",
                ["lucide-unlink"] = "rbxassetid://10747365771",
                ["lucide-unlink-2"] = "rbxassetid://10747397871",
                ["lucide-unlock"] = "rbxassetid://10747366027",
                ["lucide-upload"] = "rbxassetid://10747366434",
                ["lucide-upload-cloud"] = "rbxassetid://10747366266",
                ["lucide-usb"] = "rbxassetid://10747366606",
                ["lucide-user"] = "rbxassetid://10747373176",
                ["lucide-user-check"] = "rbxassetid://10747371901",
                ["lucide-user-cog"] = "rbxassetid://10747372167",
                ["lucide-user-minus"] = "rbxassetid://10747372346",
                ["lucide-user-plus"] = "rbxassetid://10747372702",
                ["lucide-user-x"] = "rbxassetid://10747372992",
                ["lucide-users"] = "rbxassetid://10747373426",
                ["lucide-utensils"] = "rbxassetid://10747373821",
                ["lucide-utensils-crossed"] = "rbxassetid://10747373629",
                ["lucide-venetian-mask"] = "rbxassetid://10747374003",
                ["lucide-verified"] = "rbxassetid://10747374131",
                ["lucide-vibrate"] = "rbxassetid://10747374489",
                ["lucide-vibrate-off"] = "rbxassetid://10747374269",
                ["lucide-video"] = "rbxassetid://10747374938",
                ["lucide-video-off"] = "rbxassetid://10747374721",
                ["lucide-view"] = "rbxassetid://10747375132",
                ["lucide-voicemail"] = "rbxassetid://10747375281",
                ["lucide-volume"] = "rbxassetid://10747376008",
                ["lucide-volume-1"] = "rbxassetid://10747375450",
                ["lucide-volume-2"] = "rbxassetid://10747375679",
                ["lucide-volume-x"] = "rbxassetid://10747375880",
                ["lucide-wallet"] = "rbxassetid://10747376205",
                ["lucide-wand"] = "rbxassetid://10747376565",
                ["lucide-wand-2"] = "rbxassetid://10747376349",
                ["lucide-watch"] = "rbxassetid://10747376722",
                ["lucide-waves"] = "rbxassetid://10747376931",
                ["lucide-webcam"] = "rbxassetid://10747381992",
                ["lucide-wifi"] = "rbxassetid://10747382504",
                ["lucide-wifi-off"] = "rbxassetid://10747382268",
                ["lucide-wind"] = "rbxassetid://10747382750",
                ["lucide-wrap-text"] = "rbxassetid://10747383065",
                ["lucide-wrench"] = "rbxassetid://10747383470",
                ["lucide-x"] = "rbxassetid://10747384394",
                ["lucide-x-circle"] = "rbxassetid://10747383819",
                ["lucide-x-octagon"] = "rbxassetid://10747384037",
                ["lucide-x-square"] = "rbxassetid://10747384217",
                ["lucide-zoom-in"] = "rbxassetid://10747384552",
                ["lucide-zoom-out"] = "rbxassetid://10747384679"
            }
        }
    end,
    [30] = function()
        local aa, ab, ac, ad, ae = b(30)
        local af = {
            SingleMotor = ac(ab.SingleMotor),
            GroupMotor = ac(ab.GroupMotor),
            Instant = ac(ab.Instant),
            Linear = ac(ab.Linear),
            Spring = ac(ab.Spring),
            isMotor = ac(ab.isMotor)
        }
        return af
    end,
    [31] = function()
        local aa, ab, ac, ad, ae = b(31)
        local af, ag, ah, ai = game:GetService "RunService", ac(ab.Parent.Signal), function()
            end, {}
        ai.__index = ai
        function ai.new()
            return setmetatable({_onStep = ag.new(), _onStart = ag.new(), _onComplete = ag.new()}, ai)
        end
        function ai.onStep(aj, c)
            return aj._onStep:connect(c)
        end
        function ai.onStart(aj, c)
            return aj._onStart:connect(c)
        end
        function ai.onComplete(aj, c)
            return aj._onComplete:connect(c)
        end
        function ai.start(aj)
            if not aj._connection then
                aj._connection =
                    af.RenderStepped:Connect(
                    function(c)
                        aj:step(c)
                    end
                )
            end
        end
        function ai.stop(aj)
            if aj._connection then
                aj._connection:Disconnect()
                aj._connection = nil
            end
        end
        ai.destroy = ai.stop
        ai.step = ah
        ai.getValue = ah
        ai.setGoal = ah
        function ai.__tostring(aj)
            return "Motor"
        end
        return ai
    end,
    [32] = function()
        local aa, ab, ac, ad, ae = b(32)
        return function()
            local af, ag = game:GetService "RunService", ac(ab.Parent.BaseMotor)
            describe(
                "connection management",
                function()
                    local ah = ag.new()
                    it(
                        "should hook up connections on :start()",
                        function()
                            ah:start()
                            expect(typeof(ah._connection)).to.equal "RBXScriptConnection"
                        end
                    )
                    it(
                        "should remove connections on :stop() or :destroy()",
                        function()
                            ah:stop()
                            expect(ah._connection).to.equal(nil)
                        end
                    )
                end
            )
            it(
                "should call :step() with deltaTime",
                function()
                    local ah, ai = (ag.new())
                    function ah.step(aj, ...)
                        ai = {...}
                        ah:stop()
                    end
                    ah:start()
                    local aj = af.RenderStepped:Wait()
                    af.RenderStepped:Wait()
                    expect(ai).to.be.ok()
                    expect(ai[1]).to.equal(aj)
                end
            )
        end
    end,
    [33] = function()
        local aa, ab, ac, ad, ae = b(33)
        local af, ag, ah = ac(ab.Parent.BaseMotor), ac(ab.Parent.SingleMotor), ac(ab.Parent.isMotor)
        local ai = setmetatable({}, af)
        ai.__index = ai
        local aj = function(aj)
            if ah(aj) then
                return aj
            end
            local c = typeof(aj)
            if c == "number" then
                return ag.new(aj, false)
            elseif c == "table" then
                return ai.new(aj, false)
            end
            error(("Unable to convert %q to motor; type %s is unsupported"):format(aj, c), 2)
        end
        function ai.new(c, d)
            assert(c, "Missing argument #1: initialValues")
            assert(typeof(c) == "table", "initialValues must be a table!")
            assert(
                not c.step,
                [[initialValues contains disallowed property "step". Did you mean to put a table of values here?]]
            )
            local e = setmetatable(af.new(), ai)
            if d ~= nil then
                e._useImplicitConnections = d
            else
                e._useImplicitConnections = true
            end
            e._complete = true
            e._motors = {}
            for f, g in pairs(c) do
                e._motors[f] = aj(g)
            end
            return e
        end
        function ai.step(c, d)
            if c._complete then
                return true
            end
            local e = true
            for f, g in pairs(c._motors) do
                local h = g:step(d)
                if not h then
                    e = false
                end
            end
            c._onStep:fire(c:getValue())
            if e then
                if c._useImplicitConnections then
                    c:stop()
                end
                c._complete = true
                c._onComplete:fire()
            end
            return e
        end
        function ai.setGoal(c, d)
            assert(
                not d.step,
                [[goals contains disallowed property "step". Did you mean to put a table of goals here?]]
            )
            c._complete = false
            c._onStart:fire()
            for e, f in pairs(d) do
                local g = assert(c._motors[e], ("Unknown motor for key %s"):format(e))
                g:setGoal(f)
            end
            if c._useImplicitConnections then
                c:start()
            end
        end
        function ai.getValue(c)
            local d = {}
            for e, f in pairs(c._motors) do
                d[e] = f:getValue()
            end
            return d
        end
        function ai.__tostring(c)
            return "Motor(Group)"
        end
        return ai
    end,
    [34] = function()
        local aa, ab, ac, ad, ae = b(34)
        return function()
            local af, ag, ah = ac(ab.Parent.GroupMotor), ac(ab.Parent.Instant), ac(ab.Parent.Spring)
            it(
                "should complete when all child motors are complete",
                function()
                    local ai = af.new({A = 1, B = 2}, false)
                    expect(ai._complete).to.equal(true)
                    ai:setGoal {A = ag.new(3), B = ah.new(4, {frequency = 7.5, dampingRatio = 1})}
                    expect(ai._complete).to.equal(false)
                    ai:step(1.6666666666666665E-2)
                    expect(ai._complete).to.equal(false)
                    for aj = 1, 30 do
                        ai:step(1.6666666666666665E-2)
                    end
                    expect(ai._complete).to.equal(true)
                end
            )
            it(
                "should start when the goal is set",
                function()
                    local ai, aj = af.new({A = 0}, false), false
                    ai:onStart(
                        function()
                            aj = not aj
                        end
                    )
                    ai:setGoal {A = ag.new(1)}
                    expect(aj).to.equal(true)
                    ai:setGoal {A = ag.new(1)}
                    expect(aj).to.equal(false)
                end
            )
            it(
                "should properly return all values",
                function()
                    local ai = af.new({A = 1, B = 2}, false)
                    local aj = ai:getValue()
                    expect(aj.A).to.equal(1)
                    expect(aj.B).to.equal(2)
                end
            )
            it(
                "should error when a goal is given to GroupMotor.new",
                function()
                    local ai =
                        pcall(
                        function()
                            af.new(ag.new(0))
                        end
                    )
                    expect(ai).to.equal(false)
                end
            )
            it(
                [[should error when a single goal is provided to GroupMotor:step]],
                function()
                    local ai =
                        pcall(
                        function()
                            af.new {a = 1}:setGoal(ag.new(0))
                        end
                    )
                    expect(ai).to.equal(false)
                end
            )
        end
    end,
    [35] = function()
        local aa, ab, ac, ad, ae = b(35)
        local af = {}
        af.__index = af
        function af.new(ag)
            return setmetatable({_targetValue = ag}, af)
        end
        function af.step(ag)
            return {complete = true, value = ag._targetValue}
        end
        return af
    end,
    [36] = function()
        local aa, ab, ac, ad, ae = b(36)
        return function()
            local af = ac(ab.Parent.Instant)
            it(
                "should return a completed state with the provided value",
                function()
                    local ag = af.new(1.23)
                    local ah = ag:step(0.1, {value = 0, complete = false})
                    expect(ah.complete).to.equal(true)
                    expect(ah.value).to.equal(1.23)
                end
            )
        end
    end,
    [37] = function()
        local aa, ab, ac, ad, ae = b(37)
        local af = {}
        af.__index = af
        function af.new(ag, ah)
            assert(ag, "Missing argument #1: targetValue")
            ah = ah or {}
            return setmetatable({_targetValue = ag, _velocity = ah.velocity or 1}, af)
        end
        function af.step(ag, ah, ai)
            local aj, c, d = ah.value, ag._velocity, ag._targetValue
            local e = ai * c
            local f = e >= math.abs(d - aj)
            aj = aj + e * (d > aj and 1 or -1)
            if f then
                aj = ag._targetValue
                c = 0
            end
            return {complete = f, value = aj, velocity = c}
        end
        return af
    end,
    [38] = function()
        local aa, ab, ac, ad, ae = b(38)
        return function()
            local af, ag = ac(ab.Parent.SingleMotor), ac(ab.Parent.Linear)
            describe(
                "completed state",
                function()
                    local ah, ai = af.new(0, false), ag.new(1, {velocity = 1})
                    ah:setGoal(ai)
                    for aj = 1, 60 do
                        ah:step(1.6666666666666665E-2)
                    end
                    it(
                        "should complete",
                        function()
                            expect(ah._state.complete).to.equal(true)
                        end
                    )
                    it(
                        "should be exactly the goal value when completed",
                        function()
                            expect(ah._state.value).to.equal(1)
                        end
                    )
                end
            )
            describe(
                "uncompleted state",
                function()
                    local ah, ai = af.new(0, false), ag.new(1, {velocity = 1})
                    ah:setGoal(ai)
                    for aj = 1, 59 do
                        ah:step(1.6666666666666665E-2)
                    end
                    it(
                        "should be uncomplete",
                        function()
                            expect(ah._state.complete).to.equal(false)
                        end
                    )
                end
            )
            describe(
                "negative velocity",
                function()
                    local ah, ai = af.new(1, false), ag.new(0, {velocity = 1})
                    ah:setGoal(ai)
                    for aj = 1, 60 do
                        ah:step(1.6666666666666665E-2)
                    end
                    it(
                        "should complete",
                        function()
                            expect(ah._state.complete).to.equal(true)
                        end
                    )
                    it(
                        "should be exactly the goal value when completed",
                        function()
                            expect(ah._state.value).to.equal(0)
                        end
                    )
                end
            )
        end
    end,
    [39] = function()
        local aa, ab, ac, ad, ae = b(39)
        local af = {}
        af.__index = af
        function af.new(ag, ah)
            return setmetatable({signal = ag, connected = true, _handler = ah}, af)
        end
        function af.disconnect(ag)
            if ag.connected then
                ag.connected = false
                for ah, ai in pairs(ag.signal._connections) do
                    if ai == ag then
                        table.remove(ag.signal._connections, ah)
                        return
                    end
                end
            end
        end
        local ag = {}
        ag.__index = ag
        function ag.new()
            return setmetatable({_connections = {}, _threads = {}}, ag)
        end
        function ag.fire(ah, ...)
            for ai, aj in pairs(ah._connections) do
                aj._handler(...)
            end
            for c, d in pairs(ah._threads) do
                coroutine.resume(d, ...)
            end
            ah._threads = {}
        end
        function ag.connect(ah, aj)
            local c = af.new(ah, aj)
            table.insert(ah._connections, c)
            return c
        end
        function ag.wait(ah)
            table.insert(ah._threads, coroutine.running())
            return coroutine.yield()
        end
        return ag
    end,
    [40] = function()
        local aa, ab, ac, ad, ae = b(40)
        return function()
            local af = ac(ab.Parent.Signal)
            it(
                "should invoke all connections, instantly",
                function()
                    local ag, ah, aj = (af.new())
                    ag:connect(
                        function(c)
                            ah = c
                        end
                    )
                    ag:connect(
                        function(c)
                            aj = c
                        end
                    )
                    ag:fire "hello"
                    expect(ah).to.equal "hello"
                    expect(aj).to.equal "hello"
                end
            )
            it(
                "should return values when :wait() is called",
                function()
                    local ag = af.new()
                    spawn(
                        function()
                            ag:fire(123, "hello")
                        end
                    )
                    local ah, aj = ag:wait()
                    expect(ah).to.equal(123)
                    expect(aj).to.equal "hello"
                end
            )
            it(
                "should properly handle disconnections",
                function()
                    local ag, ah = af.new(), false
                    local aj =
                        ag:connect(
                        function()
                            ah = true
                        end
                    )
                    aj:disconnect()
                    ag:fire()
                    expect(ah).to.equal(false)
                end
            )
        end
    end,
    [41] = function()
        local aa, ab, ac, ad, ae = b(41)
        local af = ac(ab.Parent.BaseMotor)
        local ag = setmetatable({}, af)
        ag.__index = ag
        function ag.new(ah, aj)
            assert(ah, "Missing argument #1: initialValue")
            assert(typeof(ah) == "number", "initialValue must be a number!")
            local c = setmetatable(af.new(), ag)
            if aj ~= nil then
                c._useImplicitConnections = aj
            else
                c._useImplicitConnections = true
            end
            c._goal = nil
            c._state = {complete = true, value = ah}
            return c
        end
        function ag.step(ah, aj)
            if ah._state.complete then
                return true
            end
            local c = ah._goal:step(ah._state, aj)
            ah._state = c
            ah._onStep:fire(c.value)
            if c.complete then
                if ah._useImplicitConnections then
                    ah:stop()
                end
                ah._onComplete:fire()
            end
            return c.complete
        end
        function ag.getValue(ah)
            return ah._state.value
        end
        function ag.setGoal(ah, aj)
            ah._state.complete = false
            ah._goal = aj
            ah._onStart:fire()
            if ah._useImplicitConnections then
                ah:start()
            end
        end
        function ag.__tostring(ah)
            return "Motor(Single)"
        end
        return ag
    end,
    [42] = function()
        local aa, ab, ac, ad, ae = b(42)
        return function()
            local af, ag = ac(ab.Parent.SingleMotor), ac(ab.Parent.Instant)
            it(
                "should assign new state on step",
                function()
                    local ah = af.new(0, false)
                    ah:setGoal(ag.new(5))
                    ah:step(1.6666666666666665E-2)
                    expect(ah._state.complete).to.equal(true)
                    expect(ah._state.value).to.equal(5)
                end
            )
            it(
                [[should invoke onComplete listeners when the goal is completed]],
                function()
                    local ah, aj = af.new(0, false), false
                    ah:onComplete(
                        function()
                            aj = true
                        end
                    )
                    ah:setGoal(ag.new(5))
                    ah:step(1.6666666666666665E-2)
                    expect(aj).to.equal(true)
                end
            )
            it(
                "should start when the goal is set",
                function()
                    local ah, aj = af.new(0, false), false
                    ah:onStart(
                        function()
                            aj = not aj
                        end
                    )
                    ah:setGoal(ag.new(5))
                    expect(aj).to.equal(true)
                    ah:setGoal(ag.new(5))
                    expect(aj).to.equal(false)
                end
            )
        end
    end,
    [43] = function()
        local aa, ab, ac, ad, ae = b(43)
        local af, ag, ah, aj = 0.001, 0.001, 0.0001, {}
        aj.__index = aj
        function aj.new(c, d)
            assert(c, "Missing argument #1: targetValue")
            d = d or {}
            return setmetatable(
                {_targetValue = c, _frequency = d.frequency or 4, _dampingRatio = d.dampingRatio or 1},
                aj
            )
        end
        function aj.step(c, d, e)
            local f, g, h, i, j = c._dampingRatio, c._frequency * 2 * math.pi, c._targetValue, d.value, d.velocity or 0
            local k, l, m, n = i - h, (math.exp(-f * g * e))
            if f == 1 then
                m = (k * (1 + g * e) + j * e) * l + h
                n = (j * (1 - g * e) - k * (g * g * e)) * l
            elseif f < 1 then
                local o = math.sqrt(1 - f * f)
                local p, s, t = math.cos(g * o * e), (math.sin(g * o * e))
                if o > ah then
                    t = s / o
                else
                    local u = e * g
                    t = u + ((u * u) * (o * o) * (o * o) / 20 - o * o) * (u * u * u) / 6
                end
                local u
                if g * o > ah then
                    u = s / (g * o)
                else
                    local v = g * o
                    u = e + ((e * e) * (v * v) * (v * v) / 20 - v * v) * (e * e * e) / 6
                end
                m = (k * (p + f * t) + j * u) * l + h
                n = (j * (p - t * f) - k * (t * g)) * l
            else
                local o = math.sqrt(f * f - 1)
                local p, s = -g * (f - o), -g * (f + o)
                local t = (j - k * p) / (2 * g * o)
                local u = k - t
                local v, w = u * math.exp(p * e), t * math.exp(s * e)
                m = v + w + h
                n = v * p + w * s
            end
            local o = math.abs(n) < af and math.abs(m - h) < ag
            return {complete = o, value = o and h or m, velocity = n}
        end
        return aj
    end,
    [44] = function()
        local aa, ab, ac, ad, ae = b(44)
        return function()
            local af, ag = ac(ab.Parent.SingleMotor), ac(ab.Parent.Spring)
            describe(
                "completed state",
                function()
                    local ah, aj = af.new(0, false), ag.new(1, {frequency = 2, dampingRatio = 0.75})
                    ah:setGoal(aj)
                    for c = 1, 100 do
                        ah:step(1.6666666666666665E-2)
                    end
                    it(
                        "should complete",
                        function()
                            expect(ah._state.complete).to.equal(true)
                        end
                    )
                    it(
                        "should be exactly the goal value when completed",
                        function()
                            expect(ah._state.value).to.equal(1)
                        end
                    )
                end
            )
            it(
                "should inherit velocity",
                function()
                    local ah = af.new(0, false)
                    ah._state = {complete = false, value = 0, velocity = -5}
                    local aj = ag.new(1, {frequency = 2, dampingRatio = 1})
                    ah:setGoal(aj)
                    ah:step(1.6666666666666665E-2)
                    expect(ah._state.velocity < 0).to.equal(true)
                end
            )
        end
    end,
    [45] = function()
        local aa, ab, ac, ad, ae = b(45)
        local af = function(af)
            local ag = tostring(af):match "^Motor%((.+)%)$"
            if ag then
                return true, ag
            else
                return false
            end
        end
        return af
    end,
    [46] = function()
        local aa, ab, ac, ad, ae = b(46)
        return function()
            local af, ag, ah = ac(ab.Parent.isMotor), ac(ab.Parent.SingleMotor), ac(ab.Parent.GroupMotor)
            local aj, c = ag.new(0), ah.new {}
            it(
                "should properly detect motors",
                function()
                    expect(af(aj)).to.equal(true)
                    expect(af(c)).to.equal(true)
                end
            )
            it(
                "shouldn't detect things that aren't motors",
                function()
                    expect(af {}).to.equal(false)
                end
            )
            it(
                "should return the proper motor type",
                function()
                    local d, e = af(aj)
                    local f, g = af(c)
                    expect(e).to.equal "Single"
                    expect(g).to.equal "Group"
                end
            )
        end
    end,
    [47] = function()
        local aa, ab, ac, ad, ae = b(47)
        local af = {Names = {"Dark", "Darker", "Light", "Aqua", "Amethyst", "Rose"}}
        for ag, ah in next, ab:GetChildren() do
            local aj = ac(ah)
            af[aj.Name] = aj
        end
        return af
    end,
    [48] = function()
        local aa, ab, ac, ad, ae = b(48)
        return {
            Name = "Amethyst",
            Accent = Color3.fromRGB(97, 62, 167),
            AcrylicMain = Color3.fromRGB(20, 20, 20),
            AcrylicBorder = Color3.fromRGB(110, 90, 130),
            AcrylicGradient = ColorSequence.new(Color3.fromRGB(85, 57, 139), Color3.fromRGB(40, 25, 65)),
            AcrylicNoise = 0.92,
            TitleBarLine = Color3.fromRGB(95, 75, 110),
            Tab = Color3.fromRGB(160, 140, 180),
            Element = Color3.fromRGB(140, 120, 160),
            ElementBorder = Color3.fromRGB(60, 50, 70),
            InElementBorder = Color3.fromRGB(100, 90, 110),
            ElementTransparency = 0.87,
            ToggleSlider = Color3.fromRGB(140, 120, 160),
            ToggleToggled = Color3.fromRGB(0, 0, 0),
            SliderRail = Color3.fromRGB(140, 120, 160),
            DropdownFrame = Color3.fromRGB(170, 160, 200),
            DropdownHolder = Color3.fromRGB(60, 45, 80),
            DropdownBorder = Color3.fromRGB(50, 40, 65),
            DropdownOption = Color3.fromRGB(140, 120, 160),
            Keybind = Color3.fromRGB(140, 120, 160),
            Input = Color3.fromRGB(140, 120, 160),
            InputFocused = Color3.fromRGB(20, 10, 30),
            InputIndicator = Color3.fromRGB(170, 150, 190),
            Dialog = Color3.fromRGB(60, 45, 80),
            DialogHolder = Color3.fromRGB(45, 30, 65),
            DialogHolderLine = Color3.fromRGB(40, 25, 60),
            DialogButton = Color3.fromRGB(60, 45, 80),
            DialogButtonBorder = Color3.fromRGB(95, 80, 110),
            DialogBorder = Color3.fromRGB(85, 70, 100),
            DialogInput = Color3.fromRGB(70, 55, 85),
            DialogInputLine = Color3.fromRGB(175, 160, 190),
            Text = Color3.fromRGB(240, 240, 240),
            SubText = Color3.fromRGB(170, 170, 170),
            Hover = Color3.fromRGB(140, 120, 160),
            HoverChange = 0.04
        }
    end,
    [49] = function()
        local aa, ab, ac, ad, ae = b(49)
        return {
            Name = "Aqua",
            Accent = Color3.fromRGB(60, 165, 165),
            AcrylicMain = Color3.fromRGB(20, 20, 20),
            AcrylicBorder = Color3.fromRGB(50, 100, 100),
            AcrylicGradient = ColorSequence.new(Color3.fromRGB(60, 140, 140), Color3.fromRGB(40, 80, 80)),
            AcrylicNoise = 0.92,
            TitleBarLine = Color3.fromRGB(60, 120, 120),
            Tab = Color3.fromRGB(140, 180, 180),
            Element = Color3.fromRGB(110, 160, 160),
            ElementBorder = Color3.fromRGB(40, 70, 70),
            InElementBorder = Color3.fromRGB(80, 110, 110),
            ElementTransparency = 0.84,
            ToggleSlider = Color3.fromRGB(110, 160, 160),
            ToggleToggled = Color3.fromRGB(0, 0, 0),
            SliderRail = Color3.fromRGB(110, 160, 160),
            DropdownFrame = Color3.fromRGB(160, 200, 200),
            DropdownHolder = Color3.fromRGB(40, 80, 80),
            DropdownBorder = Color3.fromRGB(40, 65, 65),
            DropdownOption = Color3.fromRGB(110, 160, 160),
            Keybind = Color3.fromRGB(110, 160, 160),
            Input = Color3.fromRGB(110, 160, 160),
            InputFocused = Color3.fromRGB(20, 10, 30),
            InputIndicator = Color3.fromRGB(130, 170, 170),
            Dialog = Color3.fromRGB(40, 80, 80),
            DialogHolder = Color3.fromRGB(30, 60, 60),
            DialogHolderLine = Color3.fromRGB(25, 50, 50),
            DialogButton = Color3.fromRGB(40, 80, 80),
            DialogButtonBorder = Color3.fromRGB(80, 110, 110),
            DialogBorder = Color3.fromRGB(50, 100, 100),
            DialogInput = Color3.fromRGB(45, 90, 90),
            DialogInputLine = Color3.fromRGB(130, 170, 170),
            Text = Color3.fromRGB(240, 240, 240),
            SubText = Color3.fromRGB(170, 170, 170),
            Hover = Color3.fromRGB(110, 160, 160),
            HoverChange = 0.04
        }
    end,
    [50] = function()
        local aa, ab, ac, ad, ae = b(50)
        return {
            Name = "Dark",
            Accent = Color3.fromRGB(0,200,210),
            AcrylicMain = Color3.fromRGB(60, 60, 60),
            AcrylicBorder = Color3.fromRGB(0,200,210),
            AcrylicGradient = ColorSequence.new(Color3.fromRGB(40, 40, 40), Color3.fromRGB(40, 40, 40)),
            AcrylicNoise = 0.9,
            TitleBarLine = Color3.fromRGB(0,200,210),
            Tab = Color3.fromRGB(0,200,210),
            Element = Color3.fromRGB(160, 160, 160),
            ElementBorder = Color3.fromRGB(35, 35, 35),
            InElementBorder = Color3.fromRGB(90, 90, 90),
            ElementTransparency = 0.87,
            ToggleSlider = Color3.fromRGB(0,200,210),
            ToggleToggled = Color3.fromRGB(0,200,210),
            SliderRail = Color3.fromRGB(120, 120, 120),
            DropdownFrame = Color3.fromRGB(0,200,210),
            DropdownHolder = Color3.fromRGB(64, 64, 64),
            DropdownBorder = Color3.fromRGB(35, 35, 35),
            DropdownOption = Color3.fromRGB(0,200,210),
            Keybind = Color3.fromRGB(120, 120, 120),
            Input = Color3.fromRGB(160, 160, 160),
            InputFocused = Color3.fromRGB(10, 10, 10),
            InputIndicator = Color3.fromRGB(150, 150, 150),
            Dialog = Color3.fromRGB(45, 45, 45),
            DialogHolder = Color3.fromRGB(35, 35, 35),
            DialogHolderLine = Color3.fromRGB(30, 30, 30),
            DialogButton = Color3.fromRGB(45, 45, 45),
            DialogButtonBorder = Color3.fromRGB(80, 80, 80),
            DialogBorder = Color3.fromRGB(70, 70, 70),
            DialogInput = Color3.fromRGB(55, 55, 55),
            DialogInputLine = Color3.fromRGB(160, 160, 160),
            Text = Color3.fromRGB(0,200,210),
            SubText = Color3.fromRGB(0,200,210),
            Hover = Color3.fromRGB(120, 120, 120),
            HoverChange = 0.07
        }
    end,
    [51] = function()
        local aa, ab, ac, ad, ae = b(51)
        return {
            Name = "Darker",
            Accent = Color3.fromRGB(72, 138, 182),
            AcrylicMain = Color3.fromRGB(30, 30, 30),
            AcrylicBorder = Color3.fromRGB(60, 60, 60),
            AcrylicGradient = ColorSequence.new(Color3.fromRGB(25, 25, 25), Color3.fromRGB(15, 15, 15)),
            AcrylicNoise = 0.94,
            TitleBarLine = Color3.fromRGB(65, 65, 65),
            Tab = Color3.fromRGB(100, 100, 100),
            Element = Color3.fromRGB(70, 70, 70),
            ElementBorder = Color3.fromRGB(25, 25, 25),
            InElementBorder = Color3.fromRGB(55, 55, 55),
            ElementTransparency = 0.82,
            DropdownFrame = Color3.fromRGB(120, 120, 120),
            DropdownHolder = Color3.fromRGB(35, 35, 35),
            DropdownBorder = Color3.fromRGB(25, 25, 25),
            Dialog = Color3.fromRGB(35, 35, 35),
            DialogHolder = Color3.fromRGB(25, 25, 25),
            DialogHolderLine = Color3.fromRGB(20, 20, 20),
            DialogButton = Color3.fromRGB(35, 35, 35),
            DialogButtonBorder = Color3.fromRGB(55, 55, 55),
            DialogBorder = Color3.fromRGB(50, 50, 50),
            DialogInput = Color3.fromRGB(45, 45, 45),
            DialogInputLine = Color3.fromRGB(120, 120, 120)
        }
    end,
    [52] = function()
        local aa, ab, ac, ad, ae = b(52)
        return {
            Name = "Light",
            Accent = Color3.fromRGB(0, 103, 192),
            AcrylicMain = Color3.fromRGB(200, 200, 200),
            AcrylicBorder = Color3.fromRGB(120, 120, 120),
            AcrylicGradient = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255)),
            AcrylicNoise = 0.96,
            TitleBarLine = Color3.fromRGB(160, 160, 160),
            Tab = Color3.fromRGB(90, 90, 90),
            Element = Color3.fromRGB(255, 255, 255),
            ElementBorder = Color3.fromRGB(180, 180, 180),
            InElementBorder = Color3.fromRGB(150, 150, 150),
            ElementTransparency = 0.65,
            ToggleSlider = Color3.fromRGB(40, 40, 40),
            ToggleToggled = Color3.fromRGB(255, 255, 255),
            SliderRail = Color3.fromRGB(40, 40, 40),
            DropdownFrame = Color3.fromRGB(200, 200, 200),
            DropdownHolder = Color3.fromRGB(240, 240, 240),
            DropdownBorder = Color3.fromRGB(200, 200, 200),
            DropdownOption = Color3.fromRGB(150, 150, 150),
            Keybind = Color3.fromRGB(120, 120, 120),
            Input = Color3.fromRGB(200, 200, 200),
            InputFocused = Color3.fromRGB(100, 100, 100),
            InputIndicator = Color3.fromRGB(80, 80, 80),
            Dialog = Color3.fromRGB(255, 255, 255),
            DialogHolder = Color3.fromRGB(240, 240, 240),
            DialogHolderLine = Color3.fromRGB(228, 228, 228),
            DialogButton = Color3.fromRGB(255, 255, 255),
            DialogButtonBorder = Color3.fromRGB(190, 190, 190),
            DialogBorder = Color3.fromRGB(140, 140, 140),
            DialogInput = Color3.fromRGB(250, 250, 250),
            DialogInputLine = Color3.fromRGB(160, 160, 160),
            Text = Color3.fromRGB(0, 0, 0),
            SubText = Color3.fromRGB(40, 40, 40),
            Hover = Color3.fromRGB(50, 50, 50),
            HoverChange = 0.16
        }
    end,
    [53] = function()
        local aa, ab, ac, ad, ae = b(53)
        return {
            Name = "Rose",
            Accent = Color3.fromRGB(180, 55, 90),
            AcrylicMain = Color3.fromRGB(40, 40, 40),
            AcrylicBorder = Color3.fromRGB(130, 90, 110),
            AcrylicGradient = ColorSequence.new(Color3.fromRGB(190, 60, 135), Color3.fromRGB(165, 50, 70)),
            AcrylicNoise = 0.92,
            TitleBarLine = Color3.fromRGB(140, 85, 105),
            Tab = Color3.fromRGB(180, 140, 160),
            Element = Color3.fromRGB(200, 120, 170),
            ElementBorder = Color3.fromRGB(110, 70, 85),
            InElementBorder = Color3.fromRGB(120, 90, 90),
            ElementTransparency = 0.86,
            ToggleSlider = Color3.fromRGB(200, 120, 170),
            ToggleToggled = Color3.fromRGB(0, 0, 0),
            SliderRail = Color3.fromRGB(200, 120, 170),
            DropdownFrame = Color3.fromRGB(200, 160, 180),
            DropdownHolder = Color3.fromRGB(120, 50, 75),
            DropdownBorder = Color3.fromRGB(90, 40, 55),
            DropdownOption = Color3.fromRGB(200, 120, 170),
            Keybind = Color3.fromRGB(200, 120, 170),
            Input = Color3.fromRGB(200, 120, 170),
            InputFocused = Color3.fromRGB(20, 10, 30),
            InputIndicator = Color3.fromRGB(170, 150, 190),
            Dialog = Color3.fromRGB(120, 50, 75),
            DialogHolder = Color3.fromRGB(95, 40, 60),
            DialogHolderLine = Color3.fromRGB(90, 35, 55),
            DialogButton = Color3.fromRGB(120, 50, 75),
            DialogButtonBorder = Color3.fromRGB(155, 90, 115),
            DialogBorder = Color3.fromRGB(100, 70, 90),
            DialogInput = Color3.fromRGB(135, 55, 80),
            DialogInputLine = Color3.fromRGB(190, 160, 180),
            Text = Color3.fromRGB(240, 240, 240),
            SubText = Color3.fromRGB(170, 170, 170),
            Hover = Color3.fromRGB(200, 120, 170),
            HoverChange = 0.04
        }
    end
}
do
    local ab, ac, ad, ae, af, ag, ah, aj, c, e, f, g, h, i, j, k =
        task,
        setmetatable,
        error,
        newproxy,
        getmetatable,
        next,
        table,
        unpack,
        coroutine,
        script,
        type,
        require,
        pcall,
        getfenv,
        setfenv,
        rawget
    local l, m, n, o, p, s, t, u, v, w, x = ah.insert, ah.remove, ah.freeze or function(l)
                return l
            end, ab and ab.defer or function(l, ...)
                local m = c.create(l)
                c.resume(m, ...)
                return m
            end, "0.0.0-venv", {}, {}, {}, {}, {}, {}
    local y, z = {GetChildren = function(y)
                local z, A = x[y], {}
                for B in ag, z do
                    l(A, B)
                end
                return A
            end, FindFirstChild = function(y, z)
                if not z then
                    ad("Argument 1 missing or nil", 2)
                end
                for A in ag, x[y] do
                    if A.Name == z then
                        return A
                    end
                end
                return
            end, GetFullName = function(y)
                local z, A = y.Name, y.Parent
                while A do
                    z = A.Name .. "." .. z
                    A = A.Parent
                end
                return "VirtualEnv." .. z
            end}, {}
    for A, B in ag, y do
        z[A] = function(C, ...)
            if not x[C] then
                ad("Expected ':' not '.' calling member function " .. A, 1)
            end
            return B(C, ...)
        end
    end
    local C = function(C, D, E)
        local F, G, H, I, J = ac({}, {__mode = "k"}), function(F)
                ad(F .. " is not a valid (virtual) member of " .. C .. ' "' .. D .. '"', 1)
            end, function(F)
                ad("Unable to assign (virtual) property " .. F .. ". Property is read only", 1)
            end, (ae(true))
        local K = af(I)
        K.__index = function(L, M)
            if M == "ClassName" then
                return C
            elseif M == "Name" then
                return D
            elseif M == "Parent" then
                return E
            elseif C == "StringValue" and M == "Value" then
                return J
            else
                local N = z[M]
                if N then
                    return N
                end
            end
            for N in ag, F do
                if N.Name == M then
                    return N
                end
            end
            G(M)
        end
        K.__newindex = function(L, M, N)
            if M == "ClassName" then
                H(M)
            elseif M == "Name" then
                D = N
            elseif M == "Parent" then
                if N == I then
                    return
                end
                if E ~= nil then
                    x[E][I] = nil
                end
                E = N
                if N ~= nil then
                    x[N][I] = true
                end
            elseif C == "StringValue" and M == "Value" then
                J = N
            else
                G(M)
            end
        end
        K.__tostring = function()
            return D
        end
        x[I] = F
        if E ~= nil then
            x[E][I] = true
        end
        return I
    end
    local function D(E, F)
        local G, H, I, J = E[1], E[2], E[3], E[4]
        local K = m(I, 1)
        local L = C(H, K, F)
        s[G] = L
        if I then
            for M, N in ag, I do
                L[M] = N
            end
        end
        if J then
            for M, N in ag, J do
                D(N, L)
            end
        end
        return L
    end
    local E = {}
    for F, G in ag, a do
        l(E, D(G))
    end
    for H, I in ag, aa do
        local J = s[H]
        t[J] = I
        local K = J.ClassName
        if K == "LocalScript" or K == "Script" then
            l(v, J)
        end
    end
    local J = function(J)
        local K, L = J.ClassName, u[J]
        if L and K == "ModuleScript" then
            return aj(L)
        end
        local M = t[J]
        if not M then
            return
        end
        if K == "LocalScript" or K == "Script" then
            M()
            return
        else
            local N = {M()}
            u[J] = N
            return aj(N)
        end
    end
    function b(K)
        local L = s[K]
        local M = t[L]
        if not M then
            return
        end
        local N, O, P, Q, R, S, T = false, n {Version = p, Script = e, Shared = w, GetScript = function()
                    return e
                end, GetShared = function()
                    return w
                end}, L, function(N, ...)
                if x[N] and N.ClassName == "ModuleScript" and t[N] then
                    return J(N)
                end
                return g(N, ...)
            end
        local U, V = function(U, ...)
                if not N then
                    T()
                end
                if f(U) == "number" and U >= 0 then
                    if U == 0 then
                        return S
                    else
                        U = U + 1
                        local V, W = h(i, U)
                        if V and W == R then
                            return S
                        end
                    end
                end
                return i(U, ...)
            end, function(U, V, ...)
                if not N then
                    T()
                end
                if f(U) == "number" and U >= 0 then
                    if U == 0 then
                        return j(S, V)
                    else
                        U = U + 1
                        local W, X = h(i, U)
                        if W and X == R then
                            return j(S, V)
                        end
                    end
                end
                return j(U, V, ...)
            end
        function T()
            R = i(0)
            local W = {maui = O, script = P, require = Q, getfenv = U, setfenv = V}
            S =
                ac(
                {},
                {__index = function(X, Y)
                        local Z = k(S, Y)
                        if Z ~= nil then
                            return Z
                        end
                        local _ = W[Y]
                        if _ ~= nil then
                            return _
                        end
                        return R[Y]
                    end}
            )
            j(M, S)
            N = true
        end
        return O, P, Q, U, V
    end
    for K, L in ag, v do
        o(J, L)
    end
    do
        local M
        for N, O in ag, E do
            if O.ClassName == "ModuleScript" and O.Name == "MainModule" then
                M = O
                break
            end
        end
        if M then
            return J(M)
        end
    end
end

end)()
local v15 = v14:CreateWindow({
    Title = "Văn Thành IOS",
    SubTitle = "by VanThanhIOS",
    TabWidth = 160,
    Theme = "Dark",
    Acrylic = false,
    Size = UDim2.fromOffset(580, 360),
    MinimizeKey = Enum.KeyCode.RightShift
});
local v16 = {
    Home = v15:AddTab({
        Title = "Thông Tin"
    }),
    Main = v15:AddTab({
        Title = "Cày"
    }),
    Sea = v15:AddTab({
        Title = "Sự Kiện"
    }),
    ITM = v15:AddTab({
        Title = "Vật Phẩm"
    }),
    Setting = v15:AddTab({
        Title = "Cài Đặt"
    }),
    Status = v15:AddTab({
        Title = "Máy Chủ"
    }),
    Stats = v15:AddTab({
        Title = "Chỉ Số"
    }),
    Player = v15:AddTab({
        Title = "Người Chơi"
    }),
    Teleport = v15:AddTab({
        Title = "Dịch Chuyển"
    }),
    Visual = v15:AddTab({
        Title = "Giả"
    }),
    Fruit = v15:AddTab({
        Title = "Trái"
    }),
    Raid = v15:AddTab({
        Title = "Tập Kích"
    }),
    Race = v15:AddTab({
        Title = "Tộc"
    }),
    Shop = v15:AddTab({
        Title = "Cửa Hàng"
    }),
    Misc = v15:AddTab({
        Title = "Khác"
    })
};
local v17 = v14.Options;
local v18 = game.PlaceId;
if (v18 == 2753915549) then
    Sea1 = true;
elseif (v18 == 4442272183) then
    Sea2 = true;
elseif (v18 == 7449423635) then
    Sea3 = true;
end
game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame);
    wait();
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame);
end);

-- Single toggle button (RightShift to open/close)
do
    local _gui = Instance.new("ScreenGui")
    _gui.Name = "ToggleBtn"
    _gui.ResetOnSpawn = false
    _gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    _gui.Parent = game:GetService("CoreGui")
    local _btn = Instance.new("ImageButton")
    _btn.Name = "Toggle"
    _btn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    _btn.BorderSizePixel = 0
    _btn.Position = UDim2.new(0, 10, 0.5, -30)
    _btn.Size = UDim2.new(0, 55, 0, 55)
    _btn.Image = "rbxassetid://110365071974573"
    _btn.Parent = _gui
    local _corner = Instance.new("UICorner")
    _corner.CornerRadius = UDim.new(0, 10)
    _corner.Parent = _btn
    local _stroke = Instance.new("UIStroke")
    _stroke.Color = Color3.fromRGB(60, 60, 80)
    _stroke.Thickness = 1.5
    _stroke.Parent = _btn
    _btn.MouseButton1Click:Connect(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.RightShift, false, game)
        task.wait(0.05)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.RightShift, false, game)
    end)
end

Sea1 = false;
Sea2 = false;
Sea3 = false;
local v19 = game.PlaceId;
if (v19 == 2753915549) then
    Sea1 = true;
elseif (v19 == 4442272183) then
    Sea2 = true;
elseif (v19 == 7449423635) then
    Sea3 = true;
end
function CheckLevel()
    local v197 = game:GetService("Players").LocalPlayer.Data.Level.Value;
    if Sea1 then
        if ((v197 == 1) or (v197 <= 9) or (SelectMonster == "Bandit")) then
            Ms = "Bandit";
            NameQuest = "BanditQuest1";
            QuestLv = 1;
            NameMon = "Bandit";
            CFrameQ = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875);
            CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953);
        elseif ((v197 == 10) or (v197 <= 14) or (SelectMonster == "Monkey")) then
            Ms = "Monkey";
            NameQuest = "JungleQuest";
            QuestLv = 1;
            NameMon = "Monkey";
            CFrameQ = CFrame.new(- 1601.6553955078, 36.85213470459, 153.38809204102);
            CFrameMon = CFrame.new(- 1448.1446533203, 50.851993560791, 63.60718536377);
        elseif ((v197 == 15) or (v197 <= 29) or (SelectMonster == "Gorilla")) then
            Ms = "Gorilla";
            NameQuest = "JungleQuest";
            QuestLv = 2;
            NameMon = "Gorilla";
            CFrameQ = CFrame.new(- 1601.6553955078, 36.85213470459, 153.38809204102);
            CFrameMon = CFrame.new(- 1142.6488037109, 40.462348937988, - 515.39227294922);
        elseif ((v197 == 30) or (v197 <= 39) or (SelectMonster == "Pirate")) then
            Ms = "Pirate";
            NameQuest = "BuggyQuest1";
            QuestLv = 1;
            NameMon = "Pirate";
            CFrameQ = CFrame.new(- 1140.1761474609, 4.752049446106, 3827.4057617188);
            CFrameMon = CFrame.new(- 1201.0881347656, 40.628940582275, 3857.5966796875);
        elseif ((v197 == 40) or (v197 <= 59) or (SelectMonster == "Brute")) then
            Ms = "Brute";
            NameQuest = "BuggyQuest1";
            QuestLv = 2;
            NameMon = "Brute";
            CFrameQ = CFrame.new(- 1140.1761474609, 4.752049446106, 3827.4057617188);
            CFrameMon = CFrame.new(- 1387.5324707031, 24.592035293579, 4100.9575195313);
        elseif ((v197 == 60) or (v197 <= 74) or (SelectMonster == "Desert Bandit")) then
            Ms = "Desert Bandit";
            NameQuest = "DesertQuest";
            QuestLv = 1;
            NameMon = "Desert Bandit";
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625);
            CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625);
        elseif ((v197 == 75) or (v197 <= 89) or (SelectMonster == "Desert Officer")) then
            Ms = "Desert Officer";
            NameQuest = "DesertQuest";
            QuestLv = 2;
            NameMon = "Desert Officer";
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625);
            CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688);
        elseif ((v197 == 90) or (v197 <= 99) or (SelectMonster == "Snow Bandit")) then
            Ms = "Snow Bandit";
            NameQuest = "SnowQuest";
            QuestLv = 1;
            NameMon = "Snow Bandit";
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, - 1298.3576660156);
            CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, - 1328.2418212891);
        elseif ((v197 == 100) or (v197 <= 119) or (SelectMonster == "Snowman")) then
            Ms = "Snowman";
            NameQuest = "SnowQuest";
            QuestLv = 2;
            NameMon = "Snowman";
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, - 1298.3576660156);
            CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, - 1488.0262451172);
        elseif ((v197 == 120) or (v197 <= 149) or (SelectMonster == "Chief Petty Officer")) then
            Ms = "Chief Petty Officer";
            NameQuest = "MarineQuest2";
            QuestLv = 1;
            NameMon = "Chief Petty Officer";
            CFrameQ = CFrame.new(- 5035.49609375, 28.677835464478, 4324.1840820313);
            CFrameMon = CFrame.new(- 4931.1552734375, 65.793113708496, 4121.8393554688);
        elseif ((v197 == 150) or (v197 <= 174) or (SelectMonster == "Sky Bandit")) then
            Ms = "Sky Bandit";
            NameQuest = "SkyQuest";
            QuestLv = 1;
            NameMon = "Sky Bandit";
            CFrameQ = CFrame.new(- 4842.1372070313, 717.69543457031, - 2623.0483398438);
            CFrameMon = CFrame.new(- 4955.6411132813, 365.46365356445, - 2908.1865234375);
        elseif ((v197 == 175) or (v197 <= 189) or (SelectMonster == "Dark Master")) then
            Ms = "Dark Master";
            NameQuest = "SkyQuest";
            QuestLv = 2;
            NameMon = "Dark Master";
            CFrameQ = CFrame.new(- 4842.1372070313, 717.69543457031, - 2623.0483398438);
            CFrameMon = CFrame.new(- 5148.1650390625, 439.04571533203, - 2332.9611816406);
        elseif ((v197 == 190) or (v197 <= 209) or (SelectMonster == "Prisoner")) then
            Ms = "Prisoner";
            NameQuest = "PrisonerQuest";
            QuestLv = 1;
            NameMon = "Prisoner";
            CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, - 0.999846935, 0, 0.0175017118);
            CFrameMon = CFrame.new(4937.31885, 0.332031399, 649.574524, 0.694649816, 0, - 0.719348073, 0, 1, 0, 0.719348073, 0, 0.694649816);
        elseif ((v197 == 210) or (v197 <= 249) or (SelectMonster == "Dangerous Prisoner")) then
            Ms = "Dangerous Prisoner";
            NameQuest = "PrisonerQuest";
            QuestLv = 2;
            NameMon = "Dangerous Prisoner";
            CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, - 0.999846935, 0, 0.0175017118);
            CFrameMon = CFrame.new(5099.6626, 0.351562679, 1055.7583, 0.898906827, 0, - 0.438139856, 0, 1, 0, 0.438139856, 0, 0.898906827);
        elseif ((v197 == 250) or (v197 <= 274) or (SelectMonster == "Toga Warrior")) then
            Ms = "Toga Warrior";
            NameQuest = "ColosseumQuest";
            QuestLv = 1;
            NameMon = "Toga Warrior";
            CFrameQ = CFrame.new(- 1577.7890625, 7.4151420593262, - 2984.4838867188);
            CFrameMon = CFrame.new(- 1872.5166015625, 49.080215454102, - 2913.810546875);
        elseif ((v197 == 275) or (v197 <= 299) or (SelectMonster == "Gladiator")) then
            Ms = "Gladiator";
            NameQuest = "ColosseumQuest";
            QuestLv = 2;
            NameMon = "Gladiator";
            CFrameQ = CFrame.new(- 1577.7890625, 7.4151420593262, - 2984.4838867188);
            CFrameMon = CFrame.new(- 1521.3740234375, 81.203170776367, - 3066.3139648438);
        elseif ((v197 == 300) or (v197 <= 324) or (SelectMonster == "Military Soldier")) then
            Ms = "Military Soldier";
            NameQuest = "MagmaQuest";
            QuestLv = 1;
            NameMon = "Military Soldier";
            CFrameQ = CFrame.new(- 5316.1157226563, 12.262831687927, 8517.00390625);
            CFrameMon = CFrame.new(- 5369.0004882813, 61.24352645874, 8556.4921875);
        elseif ((v197 == 325) or (v197 <= 374) or (SelectMonster == "Military Spy")) then
            Ms = "Military Spy";
            NameQuest = "MagmaQuest";
            QuestLv = 2;
            NameMon = "Military Spy";
            CFrameQ = CFrame.new(- 5316.1157226563, 12.262831687927, 8517.00390625);
            CFrameMon = CFrame.new(- 5787.00293, 75.8262634, 8651.69922, 0.838590562, 0, - 0.544762194, 0, 1, 0, 0.544762194, 0, 0.838590562);
        elseif ((v197 == 375) or (v197 <= 399) or (SelectMonster == "Fishman Warrior")) then
            Ms = "Fishman Warrior";
            NameQuest = "FishmanQuest";
            QuestLv = 1;
            NameMon = "Fishman Warrior";
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734);
            CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703);
            if (_G.AutoLevel and ((CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000)) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875));
            end
        elseif ((v197 == 400) or (v197 <= 449) or (SelectMonster == "Fishman Commando")) then
            Ms = "Fishman Commando";
            NameQuest = "FishmanQuest";
            QuestLv = 2;
            NameMon = "Fishman Commando";
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734);
            CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141);
            if (_G.AutoLevel and ((CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000)) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875));
            end
        elseif ((v197 == 10) or (v197 <= 474) or (SelectMonster == "God's Guard")) then
            Ms = "God's Guard";
            NameQuest = "SkyExp1Quest";
            QuestLv = 1;
            NameMon = "God's Guard";
            CFrameQ = CFrame.new(- 4721.8603515625, 845.30297851563, - 1953.8489990234);
            CFrameMon = CFrame.new(- 4628.0498046875, 866.92877197266, - 1931.2352294922);
            if (_G.AutoLevel and ((CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000)) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.82275, 872.54248, - 1667.55688));
            end
        elseif ((v197 == 475) or (v197 <= 524) or (SelectMonster == "Shanda")) then
            Ms = "Shanda";
            NameQuest = "SkyExp1Quest";
            QuestLv = 2;
            NameMon = "Shanda";
            CFrameQ = CFrame.new(- 7863.1596679688, 5545.5190429688, - 378.42266845703);
            CFrameMon = CFrame.new(- 7685.1474609375, 5601.0751953125, - 441.38876342773);
            if (_G.AutoLevel and ((CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000)) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 7894.6176757813, 5547.1416015625, - 380.29119873047));
            end
        elseif ((v197 == 525) or (v197 <= 549) or (SelectMonster == "Royal Squad")) then
            Ms = "Royal Squad";
            NameQuest = "SkyExp2Quest";
            QuestLv = 1;
            NameMon = "Royal Squad";
            CFrameQ = CFrame.new(- 7903.3828125, 5635.9897460938, - 1410.923828125);
            CFrameMon = CFrame.new(- 7654.2514648438, 5637.1079101563, - 1407.7550048828);
        elseif ((v197 == 550) or (v197 <= 624) or (SelectMonster == "Royal Soldier")) then
            Ms = "Royal Soldier";
            NameQuest = "SkyExp2Quest";
            QuestLv = 2;
            NameMon = "Royal Soldier";
            CFrameQ = CFrame.new(- 7903.3828125, 5635.9897460938, - 1410.923828125);
            CFrameMon = CFrame.new(- 7760.4106445313, 5679.9077148438, - 1884.8112792969);
        elseif ((v197 == 625) or (v197 <= 649) or (SelectMonster == "Galley Pirate")) then
            Ms = "Galley Pirate";
            NameQuest = "FountainQuest";
            QuestLv = 1;
            NameMon = "Galley Pirate";
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875);
            CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063);
        elseif ((v197 >= 650) or (SelectMonster == "Galley Captain")) then
            Ms = "Galley Captain";
            NameQuest = "FountainQuest";
            QuestLv = 2;
            NameMon = "Galley Captain";
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875);
            CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188);
        end
    end
    if Sea2 then
        if ((v197 == 700) or (v197 <= 724) or (SelectMonster == "Raider")) then
            Ms = "Raider";
            NameQuest = "Area1Quest";
            QuestLv = 1;
            NameMon = "Raider";
            CFrameQ = CFrame.new(- 427.72567749023, 72.99634552002, 1835.9426269531);
            CFrameMon = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688);
        elseif ((v197 == 725) or (v197 <= 774) or (SelectMonster == "Mercenary")) then
            Ms = "Mercenary";
            NameQuest = "Area1Quest";
            QuestLv = 2;
            NameMon = "Mercenary";
            CFrameQ = CFrame.new(- 427.72567749023, 72.99634552002, 1835.9426269531);
            CFrameMon = CFrame.new(- 864.85009765625, 122.47104644775, 1453.1505126953);
        elseif ((v197 == 775) or (v197 <= 799) or (SelectMonster == "Swan Pirate")) then
            Ms = "Swan Pirate";
            NameQuest = "Area2Quest";
            QuestLv = 1;
            NameMon = "Swan Pirate";
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125);
            CFrameMon = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125);
        elseif ((v197 == 800) or (v197 <= 874) or (SelectMonster == "Factory Staff")) then
            Ms = "Factory Staff";
            NameQuest = "Area2Quest";
            QuestLv = 2;
            NameMon = "Factory Staff";
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125);
            CFrameMon = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797);
        elseif ((v197 == 875) or (v197 <= 899) or (SelectMonster == "Marine Lieutenan")) then
            Ms = "Marine Lieutenant";
            NameQuest = "MarineQuest3";
            QuestLv = 1;
            NameMon = "Marine Lieutenant";
            CFrameQ = CFrame.new(- 2440.9934082031, 73.04190826416, - 3217.7082519531);
            CFrameMon = CFrame.new(- 2489.2622070313, 84.613594055176, - 3151.8830566406);
        elseif ((v197 == 900) or (v197 <= 949) or (SelectMonster == "Marine Captain")) then
            Ms = "Marine Captain";
            NameQuest = "MarineQuest3";
            QuestLv = 2;
            NameMon = "Marine Captain";
            CFrameQ = CFrame.new(- 2440.9934082031, 73.04190826416, - 3217.7082519531);
            CFrameMon = CFrame.new(- 2335.2026367188, 79.786659240723, - 3245.8674316406);
        elseif ((v197 == 950) or (v197 <= 974) or (SelectMonster == "Zombie")) then
            Ms = "Zombie";
            NameQuest = "ZombieQuest";
            QuestLv = 1;
            NameMon = "Zombie";
            CFrameQ = CFrame.new(- 5494.3413085938, 48.505931854248, - 794.59094238281);
            CFrameMon = CFrame.new(- 5536.4970703125, 101.08577728271, - 835.59075927734);
        elseif ((v197 == 975) or (v197 <= 999) or (SelectMonster == "Vampire")) then
            Ms = "Vampire";
            NameQuest = "ZombieQuest";
            QuestLv = 2;
            NameMon = "Vampire";
            CFrameQ = CFrame.new(- 5494.3413085938, 48.505931854248, - 794.59094238281);
            CFrameMon = CFrame.new(- 5806.1098632813, 16.722528457642, - 1164.4384765625);
        elseif ((v197 == 1000) or (v197 <= 1049) or (SelectMonster == "Snow Trooper")) then
            Ms = "Snow Trooper";
            NameQuest = "SnowMountainQuest";
            QuestLv = 1;
            NameMon = "Snow Trooper";
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, - 5370.5546875);
            CFrameMon = CFrame.new(535.21051025391, 432.74209594727, - 5484.9165039063);
        elseif ((v197 == 1050) or (v197 <= 1099) or (SelectMonster == "Winter Warrior")) then
            Ms = "Winter Warrior";
            NameQuest = "SnowMountainQuest";
            QuestLv = 2;
            NameMon = "Winter Warrior";
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, - 5370.5546875);
            CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, - 5174.130859375);
        elseif ((v197 == 1100) or (v197 <= 1124) or (SelectMonster == "Lab Subordinate")) then
            Ms = "Lab Subordinate";
            NameQuest = "IceSideQuest";
            QuestLv = 1;
            NameMon = "Lab Subordinate";
            CFrameQ = CFrame.new(- 6061.841796875, 15.926671981812, - 4902.0385742188);
            CFrameMon = CFrame.new(- 5720.5576171875, 63.309471130371, - 4784.6103515625);
        elseif ((v197 == 1125) or (v197 <= 1174) or (SelectMonster == "Horned Warrior")) then
            Ms = "Horned Warrior";
            NameQuest = "IceSideQuest";
            QuestLv = 2;
            NameMon = "Horned Warrior";
            CFrameQ = CFrame.new(- 6061.841796875, 15.926671981812, - 4902.0385742188);
            CFrameMon = CFrame.new(- 6292.751953125, 91.181983947754, - 5502.6499023438);
        elseif ((v197 == 1175) or (v197 <= 1199) or (SelectMonster == "Magma Ninja")) then
            Ms = "Magma Ninja";
            NameQuest = "FireSideQuest";
            QuestLv = 1;
            NameMon = "Magma Ninja";
            CFrameQ = CFrame.new(- 5429.0473632813, 15.977565765381, - 5297.9614257813);
            CFrameMon = CFrame.new(- 5461.8388671875, 130.36347961426, - 5836.4702148438);
        elseif ((v197 == 1200) or (v197 <= 1249) or (SelectMonster == "Lava Pirate")) then
            Ms = "Lava Pirate";
            NameQuest = "FireSideQuest";
            QuestLv = 2;
            NameMon = "Lava Pirate";
            CFrameQ = CFrame.new(- 5429.0473632813, 15.977565765381, - 5297.9614257813);
            CFrameMon = CFrame.new(- 5251.1889648438, 55.164535522461, - 4774.4096679688);
        elseif ((v197 == 1250) or (v197 <= 1274) or (SelectMonster == "Ship Deckhand")) then
            Ms = "Ship Deckhand";
            NameQuest = "ShipQuest1";
            QuestLv = 1;
            NameMon = "Ship Deckhand";
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625);
            CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125);
            if (_G.AutoLevel and ((CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000)) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
            end
        elseif ((v197 == 1275) or (v197 <= 1299) or (SelectMonster == "Ship Engineer")) then
            Ms = "Ship Engineer";
            NameQuest = "ShipQuest1";
            QuestLv = 2;
            NameMon = "Ship Engineer";
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625);
            CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125);
            if (_G.AutoLevel and ((CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000)) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
            end
        elseif ((v197 == 1300) or (v197 <= 1324) or (SelectMonster == "Ship Steward")) then
            Ms = "Ship Steward";
            NameQuest = "ShipQuest2";
            QuestLv = 1;
            NameMon = "Ship Steward";
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875);
            CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875);
            if (_G.AutoLevel and ((CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000)) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
            end
        elseif ((v197 == 1325) or (v197 <= 1349) or (SelectMonster == "Ship Officer")) then
            Ms = "Ship Officer";
            NameQuest = "ShipQuest2";
            QuestLv = 2;
            NameMon = "Ship Officer";
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875);
            CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625);
            if (_G.AutoLevel and ((CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000)) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
            end
        elseif ((v197 == 1350) or (v197 <= 1374) or (SelectMonster == "Arctic Warrior")) then
            Ms = "Arctic Warrior";
            NameQuest = "FrostQuest";
            QuestLv = 1;
            NameMon = "Arctic Warrior";
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, - 6484.6005859375);
            CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, - 6472.7568359375);
            if (_G.AutoLevel and ((CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000)) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 6508.5581054688, 89.034996032715, - 132.83953857422));
            end
        elseif ((v197 == 1375) or (v197 <= 1424) or (SelectMonster == "Snow Lurker")) then
            Ms = "Snow Lurker";
            NameQuest = "FrostQuest";
            QuestLv = 2;
            NameMon = "Snow Lurker";
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, - 6484.6005859375);
            CFrameMon = CFrame.new(5628.482421875, 57.574996948242, - 6618.3481445313);
        elseif ((v197 == 1425) or (v197 <= 1449) or (SelectMonster == "Sea Soldier")) then
            Ms = "Sea Soldier";
            NameQuest = "ForgottenQuest";
            QuestLv = 1;
            NameMon = "Sea Soldier";
            CFrameQ = CFrame.new(- 3054.5827636719, 236.87213134766, - 10147.790039063);
            CFrameMon = CFrame.new(- 3185.0153808594, 58.789089202881, - 9663.6064453125);
        elseif ((v197 >= 1450) or (SelectMonster == "Water Fighter")) then
            Ms = "Water Fighter";
            NameQuest = "ForgottenQuest";
            QuestLv = 2;
            NameMon = "Water Fighter";
            CFrameQ = CFrame.new(- 3054.5827636719, 236.87213134766, - 10147.790039063);
            CFrameMon = CFrame.new(- 3262.9301757813, 298.69036865234, - 10552.529296875);
        end
    end
    if Sea3 then
        if ((v197 == 1500) or (v197 <= 1524) or (SelectMonster == "Pirate Millionaire")) then
            Ms = "Pirate Millionaire";
            NameQuest = "PiratePortQuest";
            QuestLv = 1;
            NameMon = "Pirate Millionaire";
            CFrameQ = CFrame.new(- 450.1046447753906, 107.68145751953125, 5950.72607421875);
            CFrameMon = CFrame.new(- 193.99227905273438, 56.12502670288086, 5755.7880859375);
        elseif ((v197 == 1525) or (v197 <= 1574) or (SelectMonster == "Pistol Billionaire")) then
            Ms = "Pistol Billionaire";
            NameQuest = "PiratePortQuest";
            QuestLv = 2;
            NameMon = "Pistol Billionaire";
            CFrameQ = CFrame.new(- 450.1046447753906, 107.68145751953125, 5950.72607421875);
            CFrameMon = CFrame.new(- 188.14462280273438, 84.49613189697266, 6337.0419921875);
        elseif ((v197 == 1575) or (v197 <= 1599) or (SelectMonster == "Dragon Crew Warrior")) then
            Ms = "Dragon Crew Warrior";
            NameQuest = "DragonCrewQuest";
            QuestLv = 1;
            NameMon = "Dragon Crew Warrior";
            CFrameQ = CFrame.new(6735.11083984375, 126.99046325683594, - 711.0979614257812);
            CFrameMon = CFrame.new(6615.2333984375, 50.847679138183594, - 978.93408203125);
        elseif ((v197 == 1600) or (v197 <= 1624) or (SelectMonster == "Dragon Crew Archer")) then
            Ms = "Dragon Crew Archer";
            NameQuest = "DragonCrewQuest";
            QuestLv = 2;
            NameMon = "Dragon Crew Archer";
            CFrameQ = CFrame.new(6735.11083984375, 126.99046325683594, - 711.0979614257812);
            CFrameMon = CFrame.new(6818.58935546875, 483.718994140625, 512.726806640625);
        elseif ((v197 == 1625) or (v197 <= 1649) or (SelectMonster == "Hydra Enforcer")) then
            Ms = "Hydra Enforcer";
            NameQuest = "VenomCrewQuest";
            QuestLv = 1;
            NameMon = "Hydra Enforcer";
            CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422);
            CFrameMon = CFrame.new(4547.115234375, 1001.60205078125, 334.1954650878906);
        elseif ((v197 == 1650) or (v197 <= 1699) or (SelectMonster == "Venomous Assailant")) then
            Ms = "Venomous Assailant";
            NameQuest = "VenomCrewQuest";
            QuestLv = 2;
            NameMon = "Venomous Assailant";
            CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422);
            CFrameMon = CFrame.new(4637.88525390625, 1077.85595703125, 882.4183959960938);
        elseif ((v197 == 1700) or (v197 <= 1724) or (SelectMonster == "Marine Commodore")) then
            Ms = "Marine Commodore";
            NameQuest = "MarineTreeIsland";
            QuestLv = 1;
            NameMon = "Marine Commodore";
            CFrameQ = CFrame.new(2179.98828125, 28.731239318848, - 6740.0551757813);
            CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, - 7109.5043945313);
        elseif ((v197 == 1725) or (v197 <= 1774) or (SelectMonster == "Marine Rear Admiral")) then
            Ms = "Marine Rear Admiral";
            NameQuest = "MarineTreeIsland";
            QuestLv = 2;
            NameMon = "Marine Rear Admiral";
            CFrameQ = CFrame.new(2179.98828125, 28.731239318848, - 6740.0551757813);
            CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, - 7048.6342773438);
        elseif ((v197 == 1775) or (v197 <= 1799) or (SelectMonster == "Fishman Raider")) then
            Ms = "Fishman Raider";
            NameQuest = "DeepForestIsland3";
            QuestLv = 1;
            NameMon = "Fishman Raider";
            CFrameQ = CFrame.new(- 10582.759765625, 331.78845214844, - 8757.666015625);
            CFrameMon = CFrame.new(- 10553.268554688, 521.38439941406, - 8176.9458007813);
        elseif ((v197 == 1800) or (v197 <= 1824) or (SelectMonster == "Fishman Captain")) then
            Ms = "Fishman Captain";
            NameQuest = "DeepForestIsland3";
            QuestLv = 2;
            NameMon = "Fishman Captain";
            CFrameQ = CFrame.new(- 10583.099609375, 331.78845214844, - 8759.4638671875);
            CFrameMon = CFrame.new(- 10789.401367188, 427.18637084961, - 9131.4423828125);
        elseif ((v197 == 1825) or (v197 <= 1849) or (SelectMonster == "Forest Pirate")) then
            Ms = "Forest Pirate";
            NameQuest = "DeepForestIsland";
            QuestLv = 1;
            NameMon = "Forest Pirate";
            CFrameQ = CFrame.new(- 13232.662109375, 332.40396118164, - 7626.4819335938);
            CFrameMon = CFrame.new(- 13489.397460938, 400.30349731445, - 7770.251953125);
        elseif ((v197 == 1850) or (v197 <= 1899) or (SelectMonster == "Mythological Pirate")) then
            Ms = "Mythological Pirate";
            NameQuest = "DeepForestIsland";
            QuestLv = 2;
            NameMon = "Mythological Pirate";
            CFrameQ = CFrame.new(- 13232.662109375, 332.40396118164, - 7626.4819335938);
            CFrameMon = CFrame.new(- 13508.616210938, 582.46228027344, - 6985.3037109375);
        elseif ((v197 == 1900) or (v197 <= 1924) or (SelectMonster == "Jungle Pirate")) then
            Ms = "Jungle Pirate";
            NameQuest = "DeepForestIsland2";
            QuestLv = 1;
            NameMon = "Jungle Pirate";
            CFrameQ = CFrame.new(- 12682.096679688, 390.88653564453, - 9902.1240234375);
            CFrameMon = CFrame.new(- 12267.103515625, 459.75262451172, - 10277.200195313);
        elseif ((v197 == 1925) or (v197 <= 1974) or (SelectMonster == "Musketeer Pirate")) then
            Ms = "Musketeer Pirate";
            NameQuest = "DeepForestIsland2";
            QuestLv = 2;
            NameMon = "Musketeer Pirate";
            CFrameQ = CFrame.new(- 12682.096679688, 390.88653564453, - 9902.1240234375);
            CFrameMon = CFrame.new(- 13291.5078125, 520.47338867188, - 9904.638671875);
        elseif ((v197 == 1975) or (v197 <= 1999) or (SelectMonster == "Reborn Skeleton")) then
            Ms = "Reborn Skeleton";
            NameQuest = "HauntedQuest1";
            QuestLv = 1;
            NameMon = "Reborn Skeleton";
            CFrameQ = CFrame.new(- 9480.80762, 142.130661, 5566.37305, - 0.00655503059, 4.5295423e-8, - 0.999978542, 2.0492047e-8, 1, 4.5162068e-8, 0.999978542, - 2.0195568e-8, - 0.00655503059);
            CFrameMon = CFrame.new(- 8761.77148, 183.431747, 6168.33301, 0.978073597, - 0.000013950732, - 0.208259016, - 0.0000010807393, 1, - 0.00007206303, 0.208259016, 0.00007070804, 0.978073597);
        elseif ((v197 == 2000) or (v197 <= 2024) or (SelectMonster == "Living Zombie")) then
            Ms = "Living Zombie";
            NameQuest = "HauntedQuest1";
            QuestLv = 2;
            NameMon = "Living Zombie";
            CFrameQ = CFrame.new(- 9480.80762, 142.130661, 5566.37305, - 0.00655503059, 4.5295423e-8, - 0.999978542, 2.0492047e-8, 1, 4.5162068e-8, 0.999978542, - 2.0195568e-8, - 0.00655503059);
            CFrameMon = CFrame.new(- 10103.7529, 238.565979, 6179.75977, 0.999474227, 2.7754714e-8, 0.0324240364, - 2.5800633e-8, 1, - 6.068485e-8, - 0.0324240364, 5.981639e-8, 0.999474227);
        elseif ((v197 == 2025) or (v197 <= 2049) or (SelectMonster == "Demonic Soul")) then
            Ms = "Demonic Soul";
            NameQuest = "HauntedQuest2";
            QuestLv = 1;
            NameMon = "Demonic Soul";
            CFrameQ = CFrame.new(- 9516.9931640625, 178.00651550293, 6078.4653320313);
            CFrameMon = CFrame.new(- 9712.03125, 204.69589233398, 6193.322265625);
        elseif ((v197 == 2050) or (v197 <= 2074) or (SelectMonster == "Posessed Mummy")) then
            Ms = "Posessed Mummy";
            NameQuest = "HauntedQuest2";
            QuestLv = 2;
            NameMon = "Posessed Mummy";
            CFrameQ = CFrame.new(- 9516.9931640625, 178.00651550293, 6078.4653320313);
            CFrameMon = CFrame.new(- 9545.7763671875, 69.619895935059, 6339.5615234375);
        elseif ((v197 == 2075) or (v197 <= 2099) or (SelectMonster == "Peanut Scout")) then
            Ms = "Peanut Scout";
            NameQuest = "NutsIslandQuest";
            QuestLv = 1;
            NameMon = "Peanut Scout";
            CFrameQ = CFrame.new(- 2105.53198, 37.2495995, - 10195.5088, - 0.766061664, 0, - 0.642767608, 0, 1, 0, 0.642767608, 0, - 0.766061664);
            CFrameMon = CFrame.new(- 2150.587890625, 122.49767303467, - 10358.994140625);
        elseif ((v197 == 2100) or (v197 <= 2124) or (SelectMonster == "Peanut President")) then
            Ms = "Peanut President";
            NameQuest = "NutsIslandQuest";
            QuestLv = 2;
            NameMon = "Peanut President";
            CFrameQ = CFrame.new(- 2105.53198, 37.2495995, - 10195.5088, - 0.766061664, 0, - 0.642767608, 0, 1, 0, 0.642767608, 0, - 0.766061664);
            CFrameMon = CFrame.new(- 2150.587890625, 122.49767303467, - 10358.994140625);
        elseif ((v197 == 2125) or (v197 <= 2149) or (SelectMonster == "Ice Cream Chef")) then
            Ms = "Ice Cream Chef";
            NameQuest = "IceCreamIslandQuest";
            QuestLv = 1;
            NameMon = "Ice Cream Chef";
            CFrameQ = CFrame.new(- 819.376709, 64.9259796, - 10967.2832, - 0.766061664, 0, 0.642767608, 0, 1, 0, - 0.642767608, 0, - 0.766061664);
            CFrameMon = CFrame.new(- 789.941528, 209.382889, - 11009.9805, - 0.0703101531, "-0", - 0.997525156, "-0", 1.00000012, "-0", 0.997525275, 0, - 0.0703101456);
        elseif ((v197 == 2150) or (v197 <= 2199) or (SelectMonster == "Ice Cream Commander")) then
            Ms = "Ice Cream Commander";
            NameQuest = "IceCreamIslandQuest";
            QuestLv = 2;
            NameMon = "Ice Cream Commander";
            CFrameQ = CFrame.new(- 819.376709, 64.9259796, - 10967.2832, - 0.766061664, 0, 0.642767608, 0, 1, 0, - 0.642767608, 0, - 0.766061664);
            CFrameMon = CFrame.new(- 789.941528, 209.382889, - 11009.9805, - 0.0703101531, "-0", - 0.997525156, "-0", 1.00000012, "-0", 0.997525275, 0, - 0.0703101456);
        elseif ((v197 == 2200) or (v197 <= 2224) or (SelectMonster == "Cookie Crafter")) then
            Ms = "Cookie Crafter";
            NameQuest = "CakeQuest1";
            QuestLv = 1;
            NameMon = "Cookie Crafter";
            CFrameQ = CFrame.new(- 2022.29858, 36.9275894, - 12030.9766, - 0.961273909, 0, - 0.275594592, 0, 1, 0, 0.275594592, 0, - 0.961273909);
            CFrameMon = CFrame.new(- 2321.71216, 36.699482, - 12216.7871, - 0.780074954, 0, 0.625686109, 0, 1, 0, - 0.625686109, 0, - 0.780074954);
        elseif ((v197 == 2225) or (v197 <= 2249) or (SelectMonster == "Cake Guard")) then
            Ms = "Cake Guard";
            NameQuest = "CakeQuest1";
            QuestLv = 2;
            NameMon = "Cake Guard";
            CFrameQ = CFrame.new(- 2022.29858, 36.9275894, - 12030.9766, - 0.961273909, 0, - 0.275594592, 0, 1, 0, 0.275594592, 0, - 0.961273909);
            CFrameMon = CFrame.new(- 1418.11011, 36.6718941, - 12255.7324, 0.0677844882, 0, 0.997700036, 0, 1, 0, - 0.997700036, 0, 0.0677844882);
        elseif ((v197 == 2250) or (v197 <= 2274) or (SelectMonster == "Baking Staff")) then
            Ms = "Baking Staff";
            NameQuest = "CakeQuest2";
            QuestLv = 1;
            NameMon = "Baking Staff";
            CFrameQ = CFrame.new(- 1928.31763, 37.7296638, - 12840.626, 0.951068401, "-0", - 0.308980465, 0, 1, "-0", 0.308980465, 0, 0.951068401);
            CFrameMon = CFrame.new(- 1980.43848, 36.6716766, - 12983.8418, - 0.254443765, 0, - 0.967087567, 0, 1, 0, 0.967087567, 0, - 0.254443765);
        elseif ((v197 == 2275) or (v197 <= 2299) or (SelectMonster == "Head Baker")) then
            Ms = "Head Baker";
            NameQuest = "CakeQuest2";
            QuestLv = 2;
            NameMon = "Head Baker";
            CFrameQ = CFrame.new(- 1928.31763, 37.7296638, - 12840.626, 0.951068401, "-0", - 0.308980465, 0, 1, "-0", 0.308980465, 0, 0.951068401);
            CFrameMon = CFrame.new(- 2251.5791, 52.2714615, - 13033.3965, - 0.991971016, 0, - 0.126466095, 0, 1, 0, 0.126466095, 0, - 0.991971016);
        elseif ((v197 == 2300) or (v197 <= 2324) or (SelectMonster == "Cocoa Warrior")) then
            Ms = "Cocoa Warrior";
            NameQuest = "ChocQuest1";
            QuestLv = 1;
            NameMon = "Cocoa Warrior";
            CFrameQ = CFrame.new(231.75, 23.9003029, - 12200.292, - 1, 0, 0, 0, 1, 0, 0, 0, - 1);
            CFrameMon = CFrame.new(167.978516, 26.2254658, - 12238.874, - 0.939700961, 0, 0.341998369, 0, 1, 0, - 0.341998369, 0, - 0.939700961);
        elseif ((v197 == 2325) or (v197 <= 2349) or (SelectMonster == "Chocolate Bar Battler")) then
            Ms = "Chocolate Bar Battler";
            NameQuest = "ChocQuest1";
            QuestLv = 2;
            NameMon = "Chocolate Bar Battler";
            CFrameQ = CFrame.new(231.75, 23.9003029, - 12200.292, - 1, 0, 0, 0, 1, 0, 0, 0, - 1);
            CFrameMon = CFrame.new(701.312073, 25.5824986, - 12708.2148, - 0.342042685, 0, - 0.939684391, 0, 1, 0, 0.939684391, 0, - 0.342042685);
        elseif ((v197 == 2350) or (v197 <= 2374) or (SelectMonster == "Sweet Thief")) then
            Ms = "Sweet Thief";
            NameQuest = "ChocQuest2";
            QuestLv = 1;
            NameMon = "Sweet Thief";
            CFrameQ = CFrame.new(151.198242, 23.8907146, - 12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, - 0.906319618, 0, 0.422592998);
            CFrameMon = CFrame.new(- 140.258301, 25.5824986, - 12652.3115, 0.173624337, "-0", - 0.984811902, 0, 1, "-0", 0.984811902, 0, 0.173624337);
        elseif ((v197 == 2375) or (v197 <= 2400) or (SelectMonster == "Candy Rebel")) then
            Ms = "Candy Rebel";
            NameQuest = "ChocQuest2";
            QuestLv = 2;
            NameMon = "Candy Rebel";
            CFrameQ = CFrame.new(151.198242, 23.8907146, - 12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, - 0.906319618, 0, 0.422592998);
            CFrameMon = CFrame.new(47.9231453, 25.5824986, - 13029.2402, - 0.819156051, 0, - 0.573571265, 0, 1, 0, 0.573571265, 0, - 0.819156051);
        elseif ((v197 == 2400) or (v197 <= 2424) or (SelectMonster == "Candy Pirate")) then
            Ms = "Candy Pirate";
            NameQuest = "CandyQuest1";
            QuestLv = 1;
            NameMon = "Candy Pirate";
            CFrameQ = CFrame.new(- 1149.328, 13.5759039, - 14445.6143, - 0.156446099, 0, - 0.987686574, 0, 1, 0, 0.987686574, 0, - 0.156446099);
            CFrameMon = CFrame.new(- 1437.56348, 17.1481285, - 14385.6934, 0.173624337, "-0", - 0.984811902, 0, 1, "-0", 0.984811902, 0, 0.173624337);
        elseif ((v197 == 2425) or (v197 <= 2449) or (SelectMonster == "Snow Demon")) then
            Ms = "Snow Demon";
            NameQuest = "CandyQuest1";
            QuestLv = 2;
            NameMon = "Snow Demon";
            CFrameQ = CFrame.new(- 1149.328, 13.5759039, - 14445.6143, - 0.156446099, 0, - 0.987686574, 0, 1, 0, 0.987686574, 0, - 0.156446099);
            CFrameMon = CFrame.new(- 916.222656, 17.1481285, - 14638.8125, 0.866007268, 0, 0.500031412, 0, 1, 0, - 0.500031412, 0, 0.866007268);
        elseif ((v197 == 2450) or (v197 <= 2474) or (SelectMonster == "Isle Outlaw")) then
            Ms = "Isle Outlaw";
            NameQuest = "TikiQuest1";
            QuestLv = 1;
            NameMon = "Isle Outlaw";
            CFrameQ = CFrame.new(- 16549.890625, 55.68635559082031, - 179.91360473632812);
            CFrameMon = CFrame.new(- 16162.8193359375, 11.6863374710083, - 96.45481872558594);
        elseif ((v197 == 2475) or (v197 <= 2499) or (SelectMonster == "Island Boy")) then
            Ms = "Island Boy";
            NameQuest = "TikiQuest1";
            QuestLv = 2;
            NameMon = "Island Boy";
            CFrameQ = CFrame.new(- 16549.890625, 55.68635559082031, - 179.91360473632812);
            CFrameMon = CFrame.new(- 16357.3125, 20.632822036743164, 1005.64892578125);
        elseif ((v197 == 2500) or (v197 <= 2524) or (SelectMonster == "Sun-kissed Warrior")) then
            Ms = "Sun-kissed Warrior";
            NameQuest = "TikiQuest2";
            QuestLv = 1;
            NameMon = "Sun-kissed Warrior";
            CFrameQ = CFrame.new(- 16541.021484375, 54.77081298828125, 1051.461181640625);
            CFrameMon = CFrame.new(- 16357.3125, 20.632822036743164, 1005.64892578125);
        elseif ((v197 == 2525) or (v197 <= 2549) or (SelectMonster == "Isle Champion")) then
            Ms = "Isle Champion";
            NameQuest = "TikiQuest2";
            QuestLv = 2;
            NameMon = "Isle Champion";
            CFrameQ = CFrame.new(- 16541.021484375, 54.77081298828125, 1051.461181640625);
            CFrameMon = CFrame.new(- 16848.94140625, 21.68633460998535, 1041.4490966796875);
        elseif ((v197 == 2550) or (v197 <= 2574) or (SelectMonster == "Serpent Hunter")) then
            Ms = "Serpent Hunter";
            NameQuest = "TikiQuest3";
            QuestLv = 1;
            NameMon = "Serpent Hunter";
            CFrameQ = CFrame.new(- 16665.19140625, 104.59640502929688, 1579.6943359375);
            CFrameMon = CFrame.new(- 16621.4140625, 121.40631103515625, 1290.6881103515625);
        elseif ((v197 == 2575) or (v197 <= 2599) or (SelectMonster == "Skull Slayer") or (v197 == 2600)) then
            Ms = "Skull Slayer";
            NameQuest = "TikiQuest3";
            QuestLv = 2;
            NameMon = "Skull Slayer";
            CFrameQ = CFrame.new(- 16665.19140625, 104.59640502929688, 1579.6943359375);
            CFrameMon = CFrame.new(- 16811.5703125, 84.625244140625, 1542.235107421875);
        end
    end
end
if Sea1 then
    tableMon = {
        "Bandit",
        "Monkey",
        "Gorilla",
        "Pirate",
        "Brute",
        "Desert Bandit",
        "Desert Officer",
        "Snow Bandit",
        "Snowman",
        "Chief Petty Officer",
        "Sky Bandit",
        "Dark Master",
        "Prisoner",
        "Dangerous Prisoner",
        "Toga Warrior",
        "Gladiator",
        "Military Soldier",
        "Military Spy",
        "Fishman Warrior",
        "Fishman Commando",
        "God's Guard",
        "Shanda",
        "Royal Squad",
        "Royal Soldier",
        "Galley Pirate",
        "Galley Captain"
    };
elseif Sea2 then
    tableMon = {
        "Raider",
        "Mercenary",
        "Swan Pirate",
        "Factory Staff",
        "Marine Lieutenant",
        "Marine Captain",
        "Zombie",
        "Vampire",
        "Snow Trooper",
        "Winter Warrior",
        "Lab Subordinate",
        "Horned Warrior",
        "Magma Ninja",
        "Lava Pirate",
        "Ship Deckhand",
        "Ship Engineer",
        "Ship Steward",
        "Ship Officer",
        "Arctic Warrior",
        "Snow Lurker",
        "Sea Soldier",
        "Water Fighter"
    };
elseif Sea3 then
    tableMon = {
        "Pirate Millionaire",
        "Dragon Crew Warrior",
        "Dragon Crew Archer",
        "Hydra Enforcer",
        "Venomous Assailant",
        "Marine Commodore",
        "Marine Rear Admiral",
        "Fishman Raider",
        "Fishman Captain",
        "Forest Pirate",
        "Mythological Pirate",
        "Jungle Pirate",
        "Musketeer Pirate",
        "Reborn Skeleton",
        "Living Zombie",
        "Demonic Soul",
        "Posessed Mummy",
        "Peanut Scout",
        "Peanut President",
        "Ice Cream Chef",
        "Ice Cream Commander",
        "Cookie Crafter",
        "Cake Guard",
        "Baking Staff",
        "Head Baker",
        "Cocoa Warrior",
        "Chocolate Bar Battler",
        "Sweet Thief",
        "Candy Rebel",
        "Candy Pirate",
        "Snow Demon",
        "Isle Outlaw",
        "Island Boy",
        "Sun-kissed Warrior",
        "Isle Champion",
        "Serpent Hunter",
        "Skull Slayer"
    };
end
if Sea1 then
    AreaList = {
        "Jungle",
        "Buggy",
        "Desert",
        "Snow",
        "Marine",
        "Sky",
        "Prison",
        "Colosseum",
        "Magma",
        "Fishman",
        "Sky Island",
        "Fountain"
    };
elseif Sea2 then
    AreaList = {
        "Area 1",
        "Area 2",
        "Zombie",
        "Marine",
        "Snow Mountain",
        "Ice fire",
        "Ship",
        "Frost",
        "Forgotten"
    };
elseif Sea3 then
    AreaList = {
        "Pirate Port",
        "Amazon",
        "Marine Tree",
        "Deep Forest",
        "Haunted Castle",
        "Nut Island",
        "Ice Cream Island",
        "Cake Island",
        "Choco Island",
        "Candy Island",
        "Tiki Outpost"
    };
end
function CheckBossQuest()
    if Sea1 then
        if (SelectBoss == "The Gorilla King") then
            BossMon = "The Gorilla King";
            NameBoss = "The Gorrila King";
            NameQuestBoss = "JungleQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$2,000\n7,000 Exp.";
            CFrameQBoss = CFrame.new(- 1601.6553955078, 36.85213470459, 153.38809204102);
            CFrameBoss = CFrame.new(- 1088.75977, 8.13463783, - 488.559906, - 0.707134247, 0, 0.707079291, 0, 1, 0, - 0.707079291, 0, - 0.707134247);
        elseif (SelectBoss == "Bobby") then
            BossMon = "Bobby";
            NameBoss = "Bobby";
            NameQuestBoss = "BuggyQuest1";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$8,000\n35,000 Exp.";
            CFrameQBoss = CFrame.new(- 1140.1761474609, 4.752049446106, 3827.4057617188);
            CFrameBoss = CFrame.new(- 1087.3760986328, 46.949409484863, 4040.1462402344);
        elseif (SelectBoss == "The Saw") then
            BossMon = "The Saw";
            NameBoss = "The Saw";
            CFrameBoss = CFrame.new(- 784.89715576172, 72.427383422852, 1603.5822753906);
        elseif (SelectBoss == "Yeti") then
            BossMon = "Yeti";
            NameBoss = "Yeti";
            NameQuestBoss = "SnowQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$10,000\n180,000 Exp.";
            CFrameQBoss = CFrame.new(1386.8073730469, 87.272789001465, - 1298.3576660156);
            CFrameBoss = CFrame.new(1218.7956542969, 138.01184082031, - 1488.0262451172);
        elseif (SelectBoss == "Mob Leader") then
            BossMon = "Mob Leader";
            NameBoss = "Mob Leader";
            CFrameBoss = CFrame.new(- 2844.7307128906, 7.4180502891541, 5356.6723632813);
        elseif (SelectBoss == "Vice Admiral") then
            BossMon = "Vice Admiral";
            NameBoss = "Vice Admiral";
            NameQuestBoss = "MarineQuest2";
            QuestLvBoss = 2;
            RewardBoss = "Reward:\n$10,000\n180,000 Exp.";
            CFrameQBoss = CFrame.new(- 5036.2465820313, 28.677835464478, 4324.56640625);
            CFrameBoss = CFrame.new(- 5006.5454101563, 88.032081604004, 4353.162109375);
        elseif (SelectBoss == "Saber Expert") then
            NameBoss = "Saber Expert";
            BossMon = "Saber Expert";
            CFrameBoss = CFrame.new(- 1458.89502, 29.8870335, - 50.633564);
        elseif (SelectBoss == "Warden") then
            BossMon = "Warden";
            NameBoss = "Warden";
            NameQuestBoss = "ImpelQuest";
            QuestLvBoss = 1;
            RewardBoss = "Reward:\n$6,000\n850,000 Exp.";
            CFrameBoss = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, - 0.000004499464, 0.975376427, - 0.000019541258, 1, 0.000009031621, - 0.975376427, - 0.000021051976, 0.220546961);
            CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, - 0.731384635, 0, 0.681965172, 0, 1, 0, - 0.681965172, 0, - 0.731384635);
        elseif (SelectBoss == "Chief Warden") then
            BossMon = "Chief Warden";
            NameBoss = "Chief Warden";
            NameQuestBoss = "ImpelQuest";
            QuestLvBoss = 2;
            RewardBoss = "Reward:\n$10,000\n1,000,000 Exp.";
            CFrameBoss = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, - 0.00062915677, 0.939684749, 0.00191645394, 0.999998152, - 0.000028042234, - 0.939682961, 0.00181045406, 0.342041939);
            CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, - 0.731384635, 0, 0.681965172, 0, 1, 0, - 0.681965172, 0, - 0.731384635);
        elseif (SelectBoss == "Swan") then
            BossMon = "Swan";
            NameBoss = "Swan";
            NameQuestBoss = "ImpelQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$15,000\n1,600,000 Exp.";
            CFrameBoss = CFrame.new(5325.09619, 7.03906584, 719.570679, - 0.309060812, 0, 0.951042235, 0, 1, 0, - 0.951042235, 0, - 0.309060812);
            CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, - 0.731384635, 0, 0.681965172, 0, 1, 0, - 0.681965172, 0, - 0.731384635);
        elseif (SelectBoss == "Magma Admiral") then
            BossMon = "Magma Admiral";
            NameBoss = "Magma Admiral";
            NameQuestBoss = "MagmaQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$15,000\n2,800,000 Exp.";
            CFrameQBoss = CFrame.new(- 5314.6220703125, 12.262420654297, 8517.279296875);
            CFrameBoss = CFrame.new(- 5765.8969726563, 82.92064666748, 8718.3046875);
        elseif (SelectBoss == "Fishman Lord") then
            BossMon = "Fishman Lord";
            NameBoss = "Fishman Lord";
            NameQuestBoss = "FishmanQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$15,000\n4,000,000 Exp.";
            CFrameQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734);
            CFrameBoss = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984);
        elseif (SelectBoss == "Wysper") then
            BossMon = "Wysper";
            NameBoss = "Wysper";
            NameQuestBoss = "SkyExp1Quest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$15,000\n4,800,000 Exp.";
            CFrameQBoss = CFrame.new(- 7861.947265625, 5545.517578125, - 379.85974121094);
            CFrameBoss = CFrame.new(- 7866.1333007813, 5576.4311523438, - 546.74816894531);
        elseif (SelectBoss == "Thunder God") then
            BossMon = "Thunder God";
            NameBoss = "Thunder God";
            NameQuestBoss = "SkyExp2Quest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$20,000\n5,800,000 Exp.";
            CFrameQBoss = CFrame.new(- 7903.3828125, 5635.9897460938, - 1410.923828125);
            CFrameBoss = CFrame.new(- 7994.984375, 5761.025390625, - 2088.6479492188);
        elseif (SelectBoss == "Cyborg") then
            BossMon = "Cyborg";
            NameBoss = "Cyborg";
            NameQuestBoss = "FountainQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$20,000\n7,500,000 Exp.";
            CFrameQBoss = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875);
            CFrameBoss = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813);
        elseif (SelectBoss == "Ice Admiral") then
            BossMon = "Ice Admiral";
            NameBoss = "Ice Admiral";
            CFrameBoss = CFrame.new(1266.08948, 26.1757946, - 1399.57678, - 0.573599219, 0, - 0.81913656, 0, 1, 0, 0.81913656, 0, - 0.573599219);
        elseif (SelectBoss == "Greybeard") then
            BossMon = "Greybeard";
            NameBoss = "Greybeard";
            CFrameBoss = CFrame.new(- 5081.3452148438, 85.221641540527, 4257.3588867188);
        end
    end
    if Sea2 then
        if (SelectBoss == "Diamond") then
            BossMon = "Diamond";
            NameBoss = "Diamond";
            NameQuestBoss = "Area1Quest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$25,000\n9,000,000 Exp.";
            CFrameQBoss = CFrame.new(- 427.5666809082, 73.313781738281, 1835.4208984375);
            CFrameBoss = CFrame.new(- 1576.7166748047, 198.59265136719, 13.724286079407);
        elseif (SelectBoss == "Jeremy") then
            BossMon = "Jeremy";
            NameBoss = "Jeremy";
            NameQuestBoss = "Area2Quest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$25,000\n11,500,000 Exp.";
            CFrameQBoss = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063);
            CFrameBoss = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109);
        elseif (SelectBoss == "Fajita") then
            BossMon = "Fajita";
            NameBoss = "Fajita";
            NameQuestBoss = "MarineQuest3";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$25,000\n15,000,000 Exp.";
            CFrameQBoss = CFrame.new(- 2441.986328125, 73.359344482422, - 3217.5324707031);
            CFrameBoss = CFrame.new(- 2172.7399902344, 103.32216644287, - 4015.025390625);
        elseif (SelectBoss == "Don Swan") then
            BossMon = "Don Swan";
            NameBoss = "Don Swan";
            CFrameBoss = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875);
        elseif (SelectBoss == "Smoke Admiral") then
            BossMon = "Smoke Admiral";
            NameBoss = "Smoke Admiral";
            NameQuestBoss = "IceSideQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$20,000\n25,000,000 Exp.";
            CFrameQBoss = CFrame.new(- 5429.0473632813, 15.977565765381, - 5297.9614257813);
            CFrameBoss = CFrame.new(- 5275.1987304688, 20.757257461548, - 5260.6669921875);
        elseif (SelectBoss == "Awakened Ice Admiral") then
            BossMon = "Awakened Ice Admiral";
            NameBoss = "Awakened Ice Admiral";
            NameQuestBoss = "FrostQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$20,000\n36,000,000 Exp.";
            CFrameQBoss = CFrame.new(5668.9780273438, 28.519989013672, - 6483.3520507813);
            CFrameBoss = CFrame.new(6403.5439453125, 340.29766845703, - 6894.5595703125);
        elseif (SelectBoss == "Tide Keeper") then
            BossMon = "Tide Keeper";
            NameBoss = "Tide Keeper";
            NameQuestBoss = "ForgottenQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$12,500\n38,000,000 Exp.";
            CFrameQBoss = CFrame.new(- 3053.9814453125, 237.18954467773, - 10145.0390625);
            CFrameBoss = CFrame.new(- 3795.6423339844, 105.88877105713, - 11421.307617188);
        elseif (SelectBoss == "Darkbeard") then
            BossMon = "Darkbeard";
            NameBoss = "Darkbeard";
            CFrameMon = CFrame.new(3677.08203125, 62.751937866211, - 3144.8332519531);
        elseif (SelectBoss == "Cursed Captain") then
            BossMon = "Cursed Captain";
            NameBoss = "Cursed Captain";
            CFrameBoss = CFrame.new(916.928589, 181.092773, 33422);
        elseif (SelectBoss == "Order") then
            BossMon = "Order";
            NameBoss = "Order";
            CFrameBoss = CFrame.new(- 6217.2021484375, 28.047645568848, - 5053.1357421875);
        end
    end
    if Sea3 then
        if (SelectBoss == "Stone") then
            BossMon = "Stone";
            NameBoss = "Stone";
            NameQuestBoss = "PiratePortQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$25,000\n40,000,000 Exp.";
            CFrameQBoss = CFrame.new(- 289.76705932617, 43.819011688232, 5579.9384765625);
            CFrameBoss = CFrame.new(- 1027.6512451172, 92.404174804688, 6578.8530273438);
        elseif (SelectBoss == "Hydra Leader") then
            BossMon = "Hydra Leader";
            NameBoss = "Hydra Leader";
            NameQuestBoss = "VenomCrewQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$30,000\n52,000,000 Exp.";
            CFrameQBoss = CFrame.new(5445.9541015625, 601.62945556641, 751.43792724609);
            CFrameBoss = CFrame.new(5543.86328125, 668.97399902344, 199.0341796875);
        elseif (SelectBoss == "Kilo Admiral") then
            BossMon = "Kilo Admiral";
            NameBoss = "Kilo Admiral";
            NameQuestBoss = "MarineTreeIsland";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$35,000\n56,000,000 Exp.";
            CFrameQBoss = CFrame.new(2179.3010253906, 28.731239318848, - 6739.9741210938);
            CFrameBoss = CFrame.new(2764.2233886719, 432.46154785156, - 7144.4580078125);
        elseif (SelectBoss == "Captain Elephant") then
            BossMon = "Captain Elephant";
            NameBoss = "Captain Elephant";
            NameQuestBoss = "DeepForestIsland";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$40,000\n67,000,000 Exp.";
            CFrameQBoss = CFrame.new(- 13232.682617188, 332.40396118164, - 7626.01171875);
            CFrameBoss = CFrame.new(- 13376.7578125, 433.28689575195, - 8071.392578125);
        elseif (SelectBoss == "Beautiful Pirate") then
            BossMon = "Beautiful Pirate";
            NameBoss = "Beautiful Pirate";
            NameQuestBoss = "DeepForestIsland2";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$50,000\n70,000,000 Exp.";
            CFrameQBoss = CFrame.new(- 12682.096679688, 390.88653564453, - 9902.1240234375);
            CFrameBoss = CFrame.new(5283.609375, 22.56223487854, - 110.78285217285);
        elseif (SelectBoss == "Cake Queen") then
            BossMon = "Cake Queen";
            NameBoss = "Cake Queen";
            NameQuestBoss = "IceCreamIslandQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$30,000\n112,500,000 Exp.";
            CFrameQBoss = CFrame.new(- 819.376709, 64.9259796, - 10967.2832, - 0.766061664, 0, 0.642767608, 0, 1, 0, - 0.642767608, 0, - 0.766061664);
            CFrameBoss = CFrame.new(- 678.648804, 381.353943, - 11114.2012, - 0.908641815, 0.00149294338, 0.41757378, 0.00837114919, 0.999857843, 0.0146408929, - 0.417492568, 0.0167988986, - 0.90852499);
        elseif (SelectBoss == "Longma") then
            BossMon = "Longma";
            NameBoss = "Longma";
            CFrameBoss = CFrame.new(- 10238.875976563, 389.7912902832, - 9549.7939453125);
        elseif (SelectBoss == "Soul Reaper") then
            BossMon = "Soul Reaper";
            NameBoss = "Soul Reaper";
            CFrameBoss = CFrame.new(- 9524.7890625, 315.80429077148, 6655.7192382813);
        elseif (SelectBoss == "rip_indra True Form") then
            BossMon = "rip_indra True Form";
            NameBoss = "rip_indra True Form";
            CFrameBoss = CFrame.new(- 5415.3920898438, 505.74133300781, - 2814.0166015625);
        end
    end
end
function MaterialMon()
    if (SelectMaterial == "Radioactive Material") then
        MMon = "Factory Staff";
        MPos = CFrame.new(295, 73, - 56);
        SP = "Default";
    elseif (SelectMaterial == "Mystic Droplet") then
        MMon = "Water Fighter";
        MPos = CFrame.new(- 3385, 239, - 10542);
        SP = "Default";
    elseif (SelectMaterial == "Magma Ore") then
        if Sea1 then
            MMon = "Military Spy";
            MPos = CFrame.new(- 5815, 84, 8820);
            SP = "Default";
        elseif Sea2 then
            MMon = "Magma Ninja";
            MPos = CFrame.new(- 5428, 78, - 5959);
            SP = "Default";
        end
    elseif (SelectMaterial == "Angel Wings") then
        MMon = "God's Guard";
        MPos = CFrame.new(- 4698, 845, - 1912);
        SP = "Default";
        if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 7859.09814, 5544.19043, - 381.476196)).Magnitude >= 5000) then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 7859.09814, 5544.19043, - 381.476196));
        end
    elseif (SelectMaterial == "Leather") then
        if Sea1 then
            MMon = "Brute";
            MPos = CFrame.new(- 1145, 15, 4350);
            SP = "Default";
        elseif Sea2 then
            MMon = "Marine Captain";
            MPos = CFrame.new(- 2010.5059814453125, 73.00115966796875, - 3326.620849609375);
            SP = "Default";
        elseif Sea3 then
            MMon = "Jungle Pirate";
            MPos = CFrame.new(- 11975.78515625, 331.7734069824219, - 10620.0302734375);
            SP = "Default";
        end
    elseif (SelectMaterial == "Scrap Metal") then
        if Sea1 then
            MMon = "Brute";
            MPos = CFrame.new(- 1145, 15, 4350);
            SP = "Default";
        elseif Sea2 then
            MMon = "Swan Pirate";
            MPos = CFrame.new(878, 122, 1235);
            SP = "Default";
        elseif Sea3 then
            MMon = "Jungle Pirate";
            MPos = CFrame.new(- 12107, 332, - 10549);
            SP = "Default";
        end
    elseif (SelectMaterial == "Fish Tail") then
        if Sea3 then
            MMon = "Fishman Raider";
            MPos = CFrame.new(- 10993, 332, - 8940);
            SP = "Default";
        elseif Sea1 then
            MMon = "Fishman Warrior";
            MPos = CFrame.new(61123, 19, 1569);
            SP = "Default";
            if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)).Magnitude >= 17000) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875));
            end
        end
    elseif (SelectMaterial == "Demonic Wisp") then
        MMon = "Demonic Soul";
        MPos = CFrame.new(- 9507, 172, 6158);
        SP = "Default";
    elseif (SelectMaterial == "Vampire Fang") then
        MMon = "Vampire";
        MPos = CFrame.new(- 6033, 7, - 1317);
        SP = "Default";
    elseif (SelectMaterial == "Conjured Cocoa") then
        MMon = "Chocolate Bar Battler";
        MPos = CFrame.new(620.6344604492188, 78.93644714355469, - 12581.369140625);
        SP = "Default";
    elseif (SelectMaterial == "Dragon Scale") then
        MMon = "Dragon Crew Archer";
        MPos = CFrame.new(6827.91455078125, 609.4127197265625, 252.3538055419922);
        SP = "Default";
    elseif (SelectMaterial == "Gunpowder") then
        MMon = "Pistol Billionaire";
        MPos = CFrame.new(- 469, 74, 5904);
        SP = "Default";
    elseif (SelectMaterial == "Hydra Enforcer") then
        MMon = "Hydra Enforcer";
        MPos = CFrame.new(4581.517578125, 1001.55908203125, 704.9378662109375);
        SP = "Default";
    elseif (SelectMaterial == "Venomous Assailant") then
        MMon = "Venomous Assailant";
        MPos = CFrame.new(4879.92041015625, 1089.46142578125, 1104.00830078125);
        SP = "Default";
    elseif (SelectMaterial == "Mini Tusk") then
        MMon = "Mythological Pirate";
        MPos = CFrame.new();
        SP = "Default";
    end
end
function UpdateIslandESP()
    for v425, v426 in pairs(game:GetService("Workspace")['_WorldOrigin'].Locations:GetChildren()) do
        pcall(function()
            if IslandESP then
                if (v426.Name ~= "Sea") then
                    if not v426:FindFirstChild("NameEsp") then
                        local v1130 = Instance.new("BillboardGui", v426);
                        v1130.Name = "NameEsp";
                        v1130.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1130.Size = UDim2.new(1, 200, 1, 30);
                        v1130.Adornee = v426;
                        v1130.AlwaysOnTop = true;
                        local v1136 = Instance.new("TextLabel", v1130);
                        v1136.Font = "GothamBold";
                        v1136.FontSize = "Size14";
                        v1136.TextWrapped = true;
                        v1136.Size = UDim2.new(1, 0, 1, 0);
                        v1136.TextYAlignment = "Top";
                        v1136.BackgroundTransparency = 1;
                        v1136.TextStrokeTransparency = 0.5;
                        v1136.TextColor3 = Color3.fromRGB(8, 0, 0);
                    else
                        v426['NameEsp'].TextLabel.Text = v426.Name .. "   \n" .. round((game:GetService("Players").LocalPlayer.Character.Head.Position - v426.Position).Magnitude / 3) .. " Distance" ;
                    end
                end
            elseif v426:FindFirstChild("NameEsp") then
                v426:FindFirstChild("NameEsp"):Destroy();
            end
        end);
    end
end
function isnil(v198)
    return v198 == nil ;
end
local function v20(v199)
    return math.floor(tonumber(v199) + 0.5);
end
Number = math.random(1, 1000000);
function UpdatePlayerChams()
    for v427, v428 in pairs(game:GetService("Players"):GetChildren()) do
        pcall(function()
            if not isnil(v428.Character) then
                if ESPPlayer then
                    if (not isnil(v428.Character.Head) and not v428.Character.Head:FindFirstChild("NameEsp" .. Number)) then
                        local v1146 = Instance.new("BillboardGui", v428.Character.Head);
                        v1146.Name = "NameEsp" .. Number ;
                        v1146.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1146.Size = UDim2.new(1, 200, 1, 30);
                        v1146.Adornee = v428.Character.Head;
                        v1146.AlwaysOnTop = true;
                        local v1153 = Instance.new("TextLabel", v1146);
                        v1153.Font = Enum.Font.GothamSemibold;
                        v1153.FontSize = "Size10";
                        v1153.TextWrapped = true;
                        v1153.Text = v428.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v428.Character.Head.Position).Magnitude / 3) .. " Distance" ;
                        v1153.Size = UDim2.new(1, 0, 1, 0);
                        v1153.TextYAlignment = "Top";
                        v1153.BackgroundTransparency = 1;
                        v1153.TextStrokeTransparency = 0.5;
                        if (v428.Team == game.Players.LocalPlayer.Team) then
                            v1153.TextColor3 = Color3.new(0, 0, 254);
                        else
                            v1153.TextColor3 = Color3.new(255, 0, 0);
                        end
                    else
                        v428.Character.Head["NameEsp" .. Number ].TextLabel.Text = v428.Name .. " | " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v428.Character.Head.Position).Magnitude / 3) .. " Distance\nHealth : " .. v20((v428.Character.Humanoid.Health * 100) / v428.Character.Humanoid.MaxHealth) .. "%" ;
                    end
                elseif v428.Character.Head:FindFirstChild("NameEsp" .. Number) then
                    v428.Character.Head:FindFirstChild("NameEsp" .. Number):Destroy();
                end
            end
        end);
    end
end
function UpdateChestChams()
    for v429, v430 in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if string.find(v430.Name, "Chest") then
                if ChestESP then
                    if string.find(v430.Name, "Chest") then
                        if not v430:FindFirstChild("NameEsp" .. Number) then
                            local v1475 = Instance.new("BillboardGui", v430);
                            v1475.Name = "NameEsp" .. Number ;
                            v1475.ExtentsOffset = Vector3.new(0, 1, 0);
                            v1475.Size = UDim2.new(1, 200, 1, 30);
                            v1475.Adornee = v430;
                            v1475.AlwaysOnTop = true;
                            local v1481 = Instance.new("TextLabel", v1475);
                            v1481.Font = Enum.Font.GothamSemibold;
                            v1481.FontSize = "Size14";
                            v1481.TextWrapped = true;
                            v1481.Size = UDim2.new(1, 0, 1, 0);
                            v1481.TextYAlignment = "Top";
                            v1481.BackgroundTransparency = 1;
                            v1481.TextStrokeTransparency = 0.5;
                            if (v430.Name == "Chest1") then
                                v1481.TextColor3 = Color3.fromRGB(109, 109, 109);
                                v1481.Text = "Chest 1" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v430.Position).Magnitude / 3) .. " Distance" ;
                            end
                            if (v430.Name == "Chest2") then
                                v1481.TextColor3 = Color3.fromRGB(173, 158, 21);
                                v1481.Text = "Chest 2" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v430.Position).Magnitude / 3) .. " Distance" ;
                            end
                            if (v430.Name == "Chest3") then
                                v1481.TextColor3 = Color3.fromRGB(85, 255, 255);
                                v1481.Text = "Chest 3" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v430.Position).Magnitude / 3) .. " Distance" ;
                            end
                        else
                            v430["NameEsp" .. Number ].TextLabel.Text = v430.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v430.Position).Magnitude / 3) .. " Distance" ;
                        end
                    end
                elseif v430:FindFirstChild("NameEsp" .. Number) then
                    v430:FindFirstChild("NameEsp" .. Number):Destroy();
                end
            end
        end);
    end
end
function UpdateDevilChams()
    for v431, v432 in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if DevilFruitESP then
                if string.find(v432.Name, "Fruit") then
                    if not v432.Handle:FindFirstChild("NameEsp" .. Number) then
                        local v1164 = Instance.new("BillboardGui", v432.Handle);
                        v1164.Name = "NameEsp" .. Number ;
                        v1164.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1164.Size = UDim2.new(1, 200, 1, 30);
                        v1164.Adornee = v432.Handle;
                        v1164.AlwaysOnTop = true;
                        local v1171 = Instance.new("TextLabel", v1164);
                        v1171.Font = Enum.Font.GothamSemibold;
                        v1171.FontSize = "Size14";
                        v1171.TextWrapped = true;
                        v1171.Size = UDim2.new(1, 0, 1, 0);
                        v1171.TextYAlignment = "Top";
                        v1171.BackgroundTransparency = 1;
                        v1171.TextStrokeTransparency = 0.5;
                        v1171.TextColor3 = Color3.fromRGB(255, 255, 255);
                        v1171.Text = v432.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v432.Handle.Position).Magnitude / 3) .. " Distance" ;
                    else
                        v432.Handle["NameEsp" .. Number ].TextLabel.Text = v432.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v432.Handle.Position).Magnitude / 3) .. " Distance" ;
                    end
                end
            elseif v432.Handle:FindFirstChild("NameEsp" .. Number) then
                v432.Handle:FindFirstChild("NameEsp" .. Number):Destroy();
            end
        end);
    end
end
function UpdateFlowerChams()
    for v433, v434 in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if ((v434.Name == "Flower2") or (v434.Name == "Flower1")) then
                if FlowerESP then
                    if not v434:FindFirstChild("NameEsp" .. Number) then
                        local v1183 = Instance.new("BillboardGui", v434);
                        v1183.Name = "NameEsp" .. Number ;
                        v1183.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1183.Size = UDim2.new(1, 200, 1, 30);
                        v1183.Adornee = v434;
                        v1183.AlwaysOnTop = true;
                        local v1189 = Instance.new("TextLabel", v1183);
                        v1189.Font = Enum.Font.GothamSemibold;
                        v1189.FontSize = "Size14";
                        v1189.TextWrapped = true;
                        v1189.Size = UDim2.new(1, 0, 1, 0);
                        v1189.TextYAlignment = "Top";
                        v1189.BackgroundTransparency = 1;
                        v1189.TextStrokeTransparency = 0.5;
                        v1189.TextColor3 = Color3.fromRGB(255, 0, 0);
                        if (v434.Name == "Flower1") then
                            v1189.Text = "Blue Flower" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v434.Position).Magnitude / 3) .. " Distance" ;
                            v1189.TextColor3 = Color3.fromRGB(0, 0, 255);
                        end
                        if (v434.Name == "Flower2") then
                            v1189.Text = "Red Flower" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v434.Position).Magnitude / 3) .. " Distance" ;
                            v1189.TextColor3 = Color3.fromRGB(255, 0, 0);
                        end
                    else
                        v434["NameEsp" .. Number ].TextLabel.Text = v434.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v434.Position).Magnitude / 3) .. " Distance" ;
                    end
                elseif v434:FindFirstChild("NameEsp" .. Number) then
                    v434:FindFirstChild("NameEsp" .. Number):Destroy();
                end
            end
        end);
    end
end
function UpdateRealFruitChams()
    for v435, v436 in pairs(game.Workspace.AppleSpawner:GetChildren()) do
        if v436:IsA("Tool") then
            if RealFruitESP then
                if not v436.Handle:FindFirstChild("NameEsp" .. Number) then
                    local v907 = Instance.new("BillboardGui", v436.Handle);
                    v907.Name = "NameEsp" .. Number ;
                    v907.ExtentsOffset = Vector3.new(0, 1, 0);
                    v907.Size = UDim2.new(1, 200, 1, 30);
                    v907.Adornee = v436.Handle;
                    v907.AlwaysOnTop = true;
                    local v914 = Instance.new("TextLabel", v907);
                    v914.Font = Enum.Font.GothamSemibold;
                    v914.FontSize = "Size14";
                    v914.TextWrapped = true;
                    v914.Size = UDim2.new(1, 0, 1, 0);
                    v914.TextYAlignment = "Top";
                    v914.BackgroundTransparency = 1;
                    v914.TextStrokeTransparency = 0.5;
                    v914.TextColor3 = Color3.fromRGB(255, 0, 0);
                    v914.Text = v436.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v436.Handle.Position).Magnitude / 3) .. " Distance" ;
                else
                    v436.Handle["NameEsp" .. Number ].TextLabel.Text = v436.Name .. " " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v436.Handle.Position).Magnitude / 3) .. " Distance" ;
                end
            elseif v436.Handle:FindFirstChild("NameEsp" .. Number) then
                v436.Handle:FindFirstChild("NameEsp" .. Number):Destroy();
            end
        end
    end
    for v437, v438 in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
        if v438:IsA("Tool") then
            if RealFruitESP then
                if not v438.Handle:FindFirstChild("NameEsp" .. Number) then
                    local v926 = Instance.new("BillboardGui", v438.Handle);
                    v926.Name = "NameEsp" .. Number ;
                    v926.ExtentsOffset = Vector3.new(0, 1, 0);
                    v926.Size = UDim2.new(1, 200, 1, 30);
                    v926.Adornee = v438.Handle;
                    v926.AlwaysOnTop = true;
                    local v933 = Instance.new("TextLabel", v926);
                    v933.Font = Enum.Font.GothamSemibold;
                    v933.FontSize = "Size14";
                    v933.TextWrapped = true;
                    v933.Size = UDim2.new(1, 0, 1, 0);
                    v933.TextYAlignment = "Top";
                    v933.BackgroundTransparency = 1;
                    v933.TextStrokeTransparency = 0.5;
                    v933.TextColor3 = Color3.fromRGB(255, 174, 0);
                    v933.Text = v438.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v438.Handle.Position).Magnitude / 3) .. " Distance" ;
                else
                    v438.Handle["NameEsp" .. Number ].TextLabel.Text = v438.Name .. " " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v438.Handle.Position).Magnitude / 3) .. " Distance" ;
                end
            elseif v438.Handle:FindFirstChild("NameEsp" .. Number) then
                v438.Handle:FindFirstChild("NameEsp" .. Number):Destroy();
            end
        end
    end
    for v439, v440 in pairs(game.Workspace.BananaSpawner:GetChildren()) do
        if v440:IsA("Tool") then
            if RealFruitESP then
                if not v440.Handle:FindFirstChild("NameEsp" .. Number) then
                    local v945 = Instance.new("BillboardGui", v440.Handle);
                    v945.Name = "NameEsp" .. Number ;
                    v945.ExtentsOffset = Vector3.new(0, 1, 0);
                    v945.Size = UDim2.new(1, 200, 1, 30);
                    v945.Adornee = v440.Handle;
                    v945.AlwaysOnTop = true;
                    local v952 = Instance.new("TextLabel", v945);
                    v952.Font = Enum.Font.GothamSemibold;
                    v952.FontSize = "Size14";
                    v952.TextWrapped = true;
                    v952.Size = UDim2.new(1, 0, 1, 0);
                    v952.TextYAlignment = "Top";
                    v952.BackgroundTransparency = 1;
                    v952.TextStrokeTransparency = 0.5;
                    v952.TextColor3 = Color3.fromRGB(251, 255, 0);
                    v952.Text = v440.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v440.Handle.Position).Magnitude / 3) .. " Distance" ;
                else
                    v440.Handle["NameEsp" .. Number ].TextLabel.Text = v440.Name .. " " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v440.Handle.Position).Magnitude / 3) .. " Distance" ;
                end
            elseif v440.Handle:FindFirstChild("NameEsp" .. Number) then
                v440.Handle:FindFirstChild("NameEsp" .. Number):Destroy();
            end
        end
    end
end
function UpdateIslandESP()
    for v441, v442 in pairs(game:GetService("Workspace")['_WorldOrigin'].Locations:GetChildren()) do
        pcall(function()
            if IslandESP then
                if (v442.Name ~= "Sea") then
                    if not v442:FindFirstChild("NameEsp") then
                        local v1200 = Instance.new("BillboardGui", v442);
                        v1200.Name = "NameEsp";
                        v1200.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1200.Size = UDim2.new(1, 200, 1, 30);
                        v1200.Adornee = v442;
                        v1200.AlwaysOnTop = true;
                        local v1206 = Instance.new("TextLabel", v1200);
                        v1206.Font = "GothamBold";
                        v1206.FontSize = "Size14";
                        v1206.TextWrapped = true;
                        v1206.Size = UDim2.new(1, 0, 1, 0);
                        v1206.TextYAlignment = "Top";
                        v1206.BackgroundTransparency = 1;
                        v1206.TextStrokeTransparency = 0.5;
                        v1206.TextColor3 = Color3.fromRGB(7, 236, 240);
                    else
                        v442['NameEsp'].TextLabel.Text = v442.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v442.Position).Magnitude / 3) .. " Distance" ;
                    end
                end
            elseif v442:FindFirstChild("NameEsp") then
                v442:FindFirstChild("NameEsp"):Destroy();
            end
        end);
    end
end
function isnil(v200)
    return v200 == nil ;
end
local function v20(v201)
    return math.floor(tonumber(v201) + 0.5);
end
Number = math.random(1, 1000000);
function UpdatePlayerChams()
    for v443, v444 in pairs(game:GetService("Players"):GetChildren()) do
        pcall(function()
            if not isnil(v444.Character) then
                if ESPPlayer then
                    if (not isnil(v444.Character.Head) and not v444.Character.Head:FindFirstChild("NameEsp" .. Number)) then
                        local v1216 = Instance.new("BillboardGui", v444.Character.Head);
                        v1216.Name = "NameEsp" .. Number ;
                        v1216.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1216.Size = UDim2.new(1, 200, 1, 30);
                        v1216.Adornee = v444.Character.Head;
                        v1216.AlwaysOnTop = true;
                        local v1223 = Instance.new("TextLabel", v1216);
                        v1223.Font = Enum.Font.GothamSemibold;
                        v1223.FontSize = "Size14";
                        v1223.TextWrapped = true;
                        v1223.Text = v444.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v444.Character.Head.Position).Magnitude / 3) .. " Distance" ;
                        v1223.Size = UDim2.new(1, 0, 1, 0);
                        v1223.TextYAlignment = "Top";
                        v1223.BackgroundTransparency = 1;
                        v1223.TextStrokeTransparency = 0.5;
                        if (v444.Team == game.Players.LocalPlayer.Team) then
                            v1223.TextColor3 = Color3.new(0, 255, 0);
                        else
                            v1223.TextColor3 = Color3.new(255, 0, 0);
                        end
                    else
                        v444.Character.Head["NameEsp" .. Number ].TextLabel.Text = v444.Name .. " | " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v444.Character.Head.Position).Magnitude / 3) .. " Distance\nHealth : " .. v20((v444.Character.Humanoid.Health * 100) / v444.Character.Humanoid.MaxHealth) .. "%" ;
                    end
                elseif v444.Character.Head:FindFirstChild("NameEsp" .. Number) then
                    v444.Character.Head:FindFirstChild("NameEsp" .. Number):Destroy();
                end
            end
        end);
    end
end
function UpdateChestChams()
    for v445, v446 in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if string.find(v446.Name, "Chest") then
                if ChestESP then
                    if string.find(v446.Name, "Chest") then
                        if not v446:FindFirstChild("NameEsp" .. Number) then
                            local v1497 = Instance.new("BillboardGui", v446);
                            v1497.Name = "NameEsp" .. Number ;
                            v1497.ExtentsOffset = Vector3.new(0, 1, 0);
                            v1497.Size = UDim2.new(1, 200, 1, 30);
                            v1497.Adornee = v446;
                            v1497.AlwaysOnTop = true;
                            local v1503 = Instance.new("TextLabel", v1497);
                            v1503.Font = Enum.Font.GothamSemibold;
                            v1503.FontSize = "Size14";
                            v1503.TextWrapped = true;
                            v1503.Size = UDim2.new(1, 0, 1, 0);
                            v1503.TextYAlignment = "Top";
                            v1503.BackgroundTransparency = 1;
                            v1503.TextStrokeTransparency = 0.5;
                            if (v446.Name == "Chest1") then
                                v1503.TextColor3 = Color3.fromRGB(109, 109, 109);
                                v1503.Text = "Chest 1" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v446.Position).Magnitude / 3) .. " Distance" ;
                            end
                            if (v446.Name == "Chest2") then
                                v1503.TextColor3 = Color3.fromRGB(173, 158, 21);
                                v1503.Text = "Chest 2" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v446.Position).Magnitude / 3) .. " Distance" ;
                            end
                            if (v446.Name == "Chest3") then
                                v1503.TextColor3 = Color3.fromRGB(85, 255, 255);
                                v1503.Text = "Chest 3" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v446.Position).Magnitude / 3) .. " Distance" ;
                            end
                        else
                            v446["NameEsp" .. Number ].TextLabel.Text = v446.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v446.Position).Magnitude / 3) .. " Distance" ;
                        end
                    end
                elseif v446:FindFirstChild("NameEsp" .. Number) then
                    v446:FindFirstChild("NameEsp" .. Number):Destroy();
                end
            end
        end);
    end
end
function UpdateDevilChams()
    for v447, v448 in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if DevilFruitESP then
                if string.find(v448.Name, "Fruit") then
                    if not v448.Handle:FindFirstChild("NameEsp" .. Number) then
                        local v1234 = Instance.new("BillboardGui", v448.Handle);
                        v1234.Name = "NameEsp" .. Number ;
                        v1234.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1234.Size = UDim2.new(1, 200, 1, 30);
                        v1234.Adornee = v448.Handle;
                        v1234.AlwaysOnTop = true;
                        local v1241 = Instance.new("TextLabel", v1234);
                        v1241.Font = Enum.Font.GothamSemibold;
                        v1241.FontSize = "Size14";
                        v1241.TextWrapped = true;
                        v1241.Size = UDim2.new(1, 0, 1, 0);
                        v1241.TextYAlignment = "Top";
                        v1241.BackgroundTransparency = 1;
                        v1241.TextStrokeTransparency = 0.5;
                        v1241.TextColor3 = Color3.fromRGB(255, 255, 255);
                        v1241.Text = v448.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v448.Handle.Position).Magnitude / 3) .. " Distance" ;
                    else
                        v448.Handle["NameEsp" .. Number ].TextLabel.Text = v448.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v448.Handle.Position).Magnitude / 3) .. " Distance" ;
                    end
                end
            elseif v448.Handle:FindFirstChild("NameEsp" .. Number) then
                v448.Handle:FindFirstChild("NameEsp" .. Number):Destroy();
            end
        end);
    end
end
function UpdateFlowerChams()
    for v449, v450 in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if ((v450.Name == "Flower2") or (v450.Name == "Flower1")) then
                if FlowerESP then
                    if not v450:FindFirstChild("NameEsp" .. Number) then
                        local v1253 = Instance.new("BillboardGui", v450);
                        v1253.Name = "NameEsp" .. Number ;
                        v1253.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1253.Size = UDim2.new(1, 200, 1, 30);
                        v1253.Adornee = v450;
                        v1253.AlwaysOnTop = true;
                        local v1259 = Instance.new("TextLabel", v1253);
                        v1259.Font = Enum.Font.GothamSemibold;
                        v1259.FontSize = "Size14";
                        v1259.TextWrapped = true;
                        v1259.Size = UDim2.new(1, 0, 1, 0);
                        v1259.TextYAlignment = "Top";
                        v1259.BackgroundTransparency = 1;
                        v1259.TextStrokeTransparency = 0.5;
                        v1259.TextColor3 = Color3.fromRGB(255, 0, 0);
                        if (v450.Name == "Flower1") then
                            v1259.Text = "Blue Flower" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v450.Position).Magnitude / 3) .. " Distance" ;
                            v1259.TextColor3 = Color3.fromRGB(0, 0, 255);
                        end
                        if (v450.Name == "Flower2") then
                            v1259.Text = "Red Flower" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v450.Position).Magnitude / 3) .. " Distance" ;
                            v1259.TextColor3 = Color3.fromRGB(255, 0, 0);
                        end
                    else
                        v450["NameEsp" .. Number ].TextLabel.Text = v450.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v450.Position).Magnitude / 3) .. " Distance" ;
                    end
                elseif v450:FindFirstChild("NameEsp" .. Number) then
                    v450:FindFirstChild("NameEsp" .. Number):Destroy();
                end
            end
        end);
    end
end
function UpdateRealFruitChams()
    for v451, v452 in pairs(game.Workspace.AppleSpawner:GetChildren()) do
        if v452:IsA("Tool") then
            if RealFruitESP then
                if not v452.Handle:FindFirstChild("NameEsp" .. Number) then
                    local v964 = Instance.new("BillboardGui", v452.Handle);
                    v964.Name = "NameEsp" .. Number ;
                    v964.ExtentsOffset = Vector3.new(0, 1, 0);
                    v964.Size = UDim2.new(1, 200, 1, 30);
                    v964.Adornee = v452.Handle;
                    v964.AlwaysOnTop = true;
                    local v971 = Instance.new("TextLabel", v964);
                    v971.Font = Enum.Font.GothamSemibold;
                    v971.FontSize = "Size14";
                    v971.TextWrapped = true;
                    v971.Size = UDim2.new(1, 0, 1, 0);
                    v971.TextYAlignment = "Top";
                    v971.BackgroundTransparency = 1;
                    v971.TextStrokeTransparency = 0.5;
                    v971.TextColor3 = Color3.fromRGB(255, 0, 0);
                    v971.Text = v452.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v452.Handle.Position).Magnitude / 3) .. " Distance" ;
                else
                    v452.Handle["NameEsp" .. Number ].TextLabel.Text = v452.Name .. " " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v452.Handle.Position).Magnitude / 3) .. " Distance" ;
                end
            elseif v452.Handle:FindFirstChild("NameEsp" .. Number) then
                v452.Handle:FindFirstChild("NameEsp" .. Number):Destroy();
            end
        end
    end
    for v453, v454 in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
        if v454:IsA("Tool") then
            if RealFruitESP then
                if not v454.Handle:FindFirstChild("NameEsp" .. Number) then
                    local v983 = Instance.new("BillboardGui", v454.Handle);
                    v983.Name = "NameEsp" .. Number ;
                    v983.ExtentsOffset = Vector3.new(0, 1, 0);
                    v983.Size = UDim2.new(1, 200, 1, 30);
                    v983.Adornee = v454.Handle;
                    v983.AlwaysOnTop = true;
                    local v990 = Instance.new("TextLabel", v983);
                    v990.Font = Enum.Font.GothamSemibold;
                    v990.FontSize = "Size14";
                    v990.TextWrapped = true;
                    v990.Size = UDim2.new(1, 0, 1, 0);
                    v990.TextYAlignment = "Top";
                    v990.BackgroundTransparency = 1;
                    v990.TextStrokeTransparency = 0.5;
                    v990.TextColor3 = Color3.fromRGB(255, 174, 0);
                    v990.Text = v454.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v454.Handle.Position).Magnitude / 3) .. " Distance" ;
                else
                    v454.Handle["NameEsp" .. Number ].TextLabel.Text = v454.Name .. " " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v454.Handle.Position).Magnitude / 3) .. " Distance" ;
                end
            elseif v454.Handle:FindFirstChild("NameEsp" .. Number) then
                v454.Handle:FindFirstChild("NameEsp" .. Number):Destroy();
            end
        end
    end
    for v455, v456 in pairs(game.Workspace.BananaSpawner:GetChildren()) do
        if v456:IsA("Tool") then
            if RealFruitESP then
                if not v456.Handle:FindFirstChild("NameEsp" .. Number) then
                    local v1002 = Instance.new("BillboardGui", v456.Handle);
                    v1002.Name = "NameEsp" .. Number ;
                    v1002.ExtentsOffset = Vector3.new(0, 1, 0);
                    v1002.Size = UDim2.new(1, 200, 1, 30);
                    v1002.Adornee = v456.Handle;
                    v1002.AlwaysOnTop = true;
                    local v1009 = Instance.new("TextLabel", v1002);
                    v1009.Font = Enum.Font.GothamSemibold;
                    v1009.FontSize = "Size14";
                    v1009.TextWrapped = true;
                    v1009.Size = UDim2.new(1, 0, 1, 0);
                    v1009.TextYAlignment = "Top";
                    v1009.BackgroundTransparency = 1;
                    v1009.TextStrokeTransparency = 0.5;
                    v1009.TextColor3 = Color3.fromRGB(251, 255, 0);
                    v1009.Text = v456.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v456.Handle.Position).Magnitude / 3) .. " Distance" ;
                else
                    v456.Handle["NameEsp" .. Number ].TextLabel.Text = v456.Name .. " " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v456.Handle.Position).Magnitude / 3) .. " Distance" ;
                end
            elseif v456.Handle:FindFirstChild("NameEsp" .. Number) then
                v456.Handle:FindFirstChild("NameEsp" .. Number):Destroy();
            end
        end
    end
end
spawn(function()
    while wait() do
        pcall(function()
            if MobESP then
                for v822, v823 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v823:FindFirstChild("HumanoidRootPart") then
                        if not v823:FindFirstChild("MobEap") then
                            local v1372 = Instance.new("BillboardGui");
                            local v1373 = Instance.new("TextLabel");
                            v1372.Parent = v823;
                            v1372.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
                            v1372.Active = true;
                            v1372.Name = "MobEap";
                            v1372.AlwaysOnTop = true;
                            v1372.LightInfluence = 1;
                            v1372.Size = UDim2.new(0, 200, 0, 50);
                            v1372.StudsOffset = Vector3.new(0, 2.5, 0);
                            v1373.Parent = v1372;
                            v1373.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                            v1373.BackgroundTransparency = 1;
                            v1373.Size = UDim2.new(0, 200, 0, 50);
                            v1373.Font = Enum.Font.GothamBold;
                            v1373.TextColor3 = Color3.fromRGB(7, 236, 240);
                            v1373.Text.Size = 35;
                        end
                        local v1021 = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v823.HumanoidRootPart.Position).Magnitude);
                        v823.MobEap.TextLabel.Text = v823.Name .. "-" .. v1021 .. " Distance" ;
                    end
                end
            else
                for v824, v825 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v825:FindFirstChild("MobEap") then
                        v825.MobEap:Destroy();
                    end
                end
            end
        end);
    end
end);
spawn(function()
    while wait() do
        pcall(function()
            if SeaESP then
                for v826, v827 in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                    if v827:FindFirstChild("HumanoidRootPart") then
                        if not v827:FindFirstChild("Seaesps") then
                            local v1391 = Instance.new("BillboardGui");
                            local v1392 = Instance.new("TextLabel");
                            v1391.Parent = v827;
                            v1391.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
                            v1391.Active = true;
                            v1391.Name = "Seaesps";
                            v1391.AlwaysOnTop = true;
                            v1391.LightInfluence = 1;
                            v1391.Size = UDim2.new(0, 200, 0, 50);
                            v1391.StudsOffset = Vector3.new(0, 2.5, 0);
                            v1392.Parent = v1391;
                            v1392.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                            v1392.BackgroundTransparency = 1;
                            v1392.Size = UDim2.new(0, 200, 0, 50);
                            v1392.Font = Enum.Font.GothamBold;
                            v1392.TextColor3 = Color3.fromRGB(7, 236, 240);
                            v1392.Text.Size = 35;
                        end
                        local v1023 = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v827.HumanoidRootPart.Position).Magnitude);
                        v827.Seaesps.TextLabel.Text = v827.Name .. "-" .. v1023 .. " Distance" ;
                    end
                end
            else
                for v828, v829 in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                    if v829:FindFirstChild("Seaesps") then
                        v829.Seaesps:Destroy();
                    end
                end
            end
        end);
    end
end);
spawn(function()
    while wait() do
        pcall(function()
            if NpcESP then
                for v830, v831 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                    if v831:FindFirstChild("HumanoidRootPart") then
                        if not v831:FindFirstChild("NpcEspes") then
                            local v1410 = Instance.new("BillboardGui");
                            local v1411 = Instance.new("TextLabel");
                            v1410.Parent = v831;
                            v1410.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
                            v1410.Active = true;
                            v1410.Name = "NpcEspes";
                            v1410.AlwaysOnTop = true;
                            v1410.LightInfluence = 1;
                            v1410.Size = UDim2.new(0, 200, 0, 50);
                            v1410.StudsOffset = Vector3.new(0, 2.5, 0);
                            v1411.Parent = v1410;
                            v1411.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                            v1411.BackgroundTransparency = 1;
                            v1411.Size = UDim2.new(0, 200, 0, 50);
                            v1411.Font = Enum.Font.GothamBold;
                            v1411.TextColor3 = Color3.fromRGB(7, 236, 240);
                            v1411.Text.Size = 35;
                        end
                        local v1025 = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v831.HumanoidRootPart.Position).Magnitude);
                        v831.NpcEspes.TextLabel.Text = v831.Name .. "-" .. v1025 .. " Distance" ;
                    end
                end
            else
                for v832, v833 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                    if v833:FindFirstChild("NpcEspes") then
                        v833.NpcEspes:Destroy();
                    end
                end
            end
        end);
    end
end);
function isnil(v202)
    return v202 == nil ;
end
local function v20(v203)
    return math.floor(tonumber(v203) + 0.5);
end
Number = math.random(1, 1000000);
function UpdateIslandMirageESP()
    for v457, v458 in pairs(game:GetService("Workspace")['_WorldOrigin'].Locations:GetChildren()) do
        pcall(function()
            if MirageIslandESP then
                if (v458.Name == "Mirage Island") then
                    if not v458:FindFirstChild("NameEsp") then
                        local v1270 = Instance.new("BillboardGui", v458);
                        v1270.Name = "NameEsp";
                        v1270.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1270.Size = UDim2.new(1, 200, 1, 30);
                        v1270.Adornee = v458;
                        v1270.AlwaysOnTop = true;
                        local v1276 = Instance.new("TextLabel", v1270);
                        v1276.Font = "Code";
                        v1276.FontSize = "Size14";
                        v1276.TextWrapped = true;
                        v1276.Size = UDim2.new(1, 0, 1, 0);
                        v1276.TextYAlignment = "Top";
                        v1276.BackgroundTransparency = 1;
                        v1276.TextStrokeTransparency = 0.5;
                        v1276.TextColor3 = Color3.fromRGB(80, 245, 245);
                    else
                        v458['NameEsp'].TextLabel.Text = v458.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v458.Position).Magnitude / 3) .. " M" ;
                    end
                end
            elseif v458:FindFirstChild("NameEsp") then
                v458:FindFirstChild("NameEsp"):Destroy();
            end
        end);
    end
end
function UpdateAuraESP()
    for v459, v460 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
        pcall(function()
            if AuraESP then
                if (v460.Name == "Master of Enhancement") then
                    if not v460:FindFirstChild("NameEsp") then
                        local v1286 = Instance.new("BillboardGui", v460);
                        v1286.Name = "NameEsp";
                        v1286.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1286.Size = UDim2.new(1, 200, 1, 30);
                        v1286.Adornee = v460;
                        v1286.AlwaysOnTop = true;
                        local v1292 = Instance.new("TextLabel", v1286);
                        v1292.Font = "Code";
                        v1292.FontSize = "Size14";
                        v1292.TextWrapped = true;
                        v1292.Size = UDim2.new(1, 0, 1, 0);
                        v1292.TextYAlignment = "Top";
                        v1292.BackgroundTransparency = 1;
                        v1292.TextStrokeTransparency = 0.5;
                        v1292.TextColor3 = Color3.fromRGB(80, 245, 245);
                    else
                        v460['NameEsp'].TextLabel.Text = v460.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v460.Position).Magnitude / 3) .. " M" ;
                    end
                end
            elseif v460:FindFirstChild("NameEsp") then
                v460:FindFirstChild("NameEsp"):Destroy();
            end
        end);
    end
end
function UpdateLSDESP()
    for v461, v462 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
        pcall(function()
            if LADESP then
                if (v462.Name == "Legendary Sword Dealer") then
                    if not v462:FindFirstChild("NameEsp") then
                        local v1302 = Instance.new("BillboardGui", v462);
                        v1302.Name = "NameEsp";
                        v1302.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1302.Size = UDim2.new(1, 200, 1, 30);
                        v1302.Adornee = v462;
                        v1302.AlwaysOnTop = true;
                        local v1308 = Instance.new("TextLabel", v1302);
                        v1308.Font = "Code";
                        v1308.FontSize = "Size14";
                        v1308.TextWrapped = true;
                        v1308.Size = UDim2.new(1, 0, 1, 0);
                        v1308.TextYAlignment = "Top";
                        v1308.BackgroundTransparency = 1;
                        v1308.TextStrokeTransparency = 0.5;
                        v1308.TextColor3 = Color3.fromRGB(80, 245, 245);
                    else
                        v462['NameEsp'].TextLabel.Text = v462.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v462.Position).Magnitude / 3) .. " M" ;
                    end
                end
            elseif v462:FindFirstChild("NameEsp") then
                v462:FindFirstChild("NameEsp"):Destroy();
            end
        end);
    end
end
function UpdateGeaESP()
    for v463, v464 in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
        pcall(function()
            if GearESP then
                if (v464.Name == "MeshPart") then
                    if not v464:FindFirstChild("NameEsp") then
                        local v1318 = Instance.new("BillboardGui", v464);
                        v1318.Name = "NameEsp";
                        v1318.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1318.Size = UDim2.new(1, 200, 1, 30);
                        v1318.Adornee = v464;
                        v1318.AlwaysOnTop = true;
                        local v1324 = Instance.new("TextLabel", v1318);
                        v1324.Font = "Code";
                        v1324.FontSize = "Size14";
                        v1324.TextWrapped = true;
                        v1324.Size = UDim2.new(1, 0, 1, 0);
                        v1324.TextYAlignment = "Top";
                        v1324.BackgroundTransparency = 1;
                        v1324.TextStrokeTransparency = 0.5;
                        v1324.TextColor3 = Color3.fromRGB(80, 245, 245);
                    else
                        v464['NameEsp'].TextLabel.Text = v464.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v464.Position).Magnitude / 3) .. " M" ;
                    end
                end
            elseif v464:FindFirstChild("NameEsp") then
                v464:FindFirstChild("NameEsp"):Destroy();
            end
        end);
    end
end
function Tween2(v204)
    local v205 = (v204.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude;
    local v206 = 350;
    if (v205 >= 350) then
        v206 = 350;
    end
    local v207 = TweenInfo.new(v205 / v206, Enum.EasingStyle.Linear);
    local v208 = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, v207, {
        CFrame = v204
    });
    v208:Play();
    if _G.CancelTween2 then
        v208:Cancel();
    end
    _G.Clip2 = true;
    wait(v205 / v206);
    _G.Clip2 = false;
end
function BTPZ(v209)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v209;
    task.wait();
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v209;
end
TweenSpeed = 350;
function Tween(v211)
    local v212 = (v211.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude;
    local v213 = TweenSpeed;
    if (v212 >= 350) then
        v213 = TweenSpeed;
    end
    local v214 = TweenInfo.new(v212 / v213, Enum.EasingStyle.Linear);
    local v215 = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, v214, {
        CFrame = v211
    });
    v215:Play();
    if _G.StopTween then
        v215:Cancel();
    end
end
function CancelTween(v216)
    if not v216 then
        _G.StopTween = true;
        wait();
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame);
        wait();
        _G.StopTween = false;
    end
end
function EquipTool(v217)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(v217) then
        local v570 = game.Players.LocalPlayer.Backpack:FindFirstChild(v217);
        wait();
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v570);
    end
end
spawn(function()
    local v218 = getrawmetatable(game);
    local v219 = v218.__namecall;
    setreadonly(v218, false);
    v218.__namecall = newcclosure(function(...)
        local v465 = getnamecallmethod();
        local v466 = {
            ...
        };
        if (tostring(v465) == "FireServer") then
            if (tostring(v466[1]) == "RemoteEvent") then
                if ((tostring(v466[2]) ~= "true") and (tostring(v466[2]) ~= "false")) then
                    if _G.UseSkill then
                        if (type(v466[2]) == "vector") then
                            v466[2] = PositionSkillMasteryDevilFruit;
                        else
                            v466[2] = CFrame.new(PositionSkillMasteryDevilFruit);
                        end
                        return v219(unpack(v466));
                    end
                end
            end
        end
        return v219(...);
    end);
end);
spawn(function()
    while task.wait() do
        pcall(function()
            if (_G.AutoEvoRace or _G.CastleRaid or _G.CollectAzure or _G.TweenToKitsune or _G.GhostShip or _G.Ship or _G.Auto_Holy_Torch or _G.TeleportPly or _G.Auto_Sea3 or _G.Auto_Sea2 or _G.Tweenfruit or _G.AutoFishCrew or _G.Auto_Saber or _G.AutoShark or _G.Auto_Warden or _G.Auto_RainbowHaki or AutoFarmRace or _G.AutoQuestRace or Auto_Law or AutoTushita or _G.AutoHolyTorch or _G.AutoTerrorshark or _G.farmpiranya or _G.Auto_MusketeerHat or _G.Auto_ObservationV2 or _G.AutoNear or _G.Auto_PoleV1 or _G.Auto_Buddy or _G.Ectoplasm or AutoEvoRace or AutoBartilo or _G.Auto_Canvander or _G.AutoLevel or _G.Auto_DualKatana or Auto_Quest_Yama_3 or Auto_Quest_Yama_2 or Auto_Quest_Yama_1 or Auto_Quest_Tushita_1 or Auto_Quest_Tushita_2 or Auto_Quest_Tushita_3 or _G.Clip2 or _G.Auto_Regoku or _G.AutoBone or _G.AutoBoneNoQuest or _G.AutoBoss or AutoFarmMasDevilFruit or AutoHallowSycthe or AutoTushita or _G.CakePrince or _G.Auto_SkullGuitar or _G.AutoFarmSwan or _G.DoughKing or _G.AutoEliteor or AutoNextIsland or Musketeer or _G.AutoMaterial or AutoFarmRaceQuest or _G.Factory or _G.Auto_Saw or _G.AutoFrozenDimension or _G.AutoKillTrial or _G.AutoUpgrade or _G.TweenToFrozenDimension) then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local v887 = Instance.new("BodyVelocity");
                    v887.Name = "BodyClip";
                    v887.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
                    v887.MaxForce = Vector3.new(100000, 100000, 100000);
                    v887.Velocity = Vector3.new(0, 0, 0);
                end
            else
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy();
            end
        end);
    end
end);
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if (_G.AutoEvoRace or _G.Auto_RainbowHaki or _G.Auto_SkullGuitar or _G.CastleRaid or _G.CollectAzure or _G.TweenToKitsune or _G.Auto_Sea3 or _G.Auto_Sea2 or _G.GhostShip or _G.Ship or _G.Auto_Holy_Torch or _G.TeleportPly or _G.Tweenfruit or _G.Auto_Saber or _G.Auto_PoleV1 or _G.Auto_MusketeerHat or _G.AutoFishCrew or _G.AutoShark or AutoFarmRace or _G.AutoQuestRace or _G.Auto_Warden or Auto_Law or _G.Auto_DualKatana or Auto_Quest_Tushita_1 or Auto_Quest_Tushita_2 or Auto_Quest_Tushita_3 or AutoTushita or _G.AutoHolyTorch or _G.Auto_Buddy or _G.AutoTerrorshark or _G.farmpiranya or Auto_Quest_Yama_3 or _G.Auto_ObservationV2 or Auto_Quest_Yama_2 or Auto_Quest_Yama_1 or _G.AutoNear or _G.Ectoplasm or AutoEvoRace or _G.AutoKillTrial or AutoBartilo or _G.Auto_Regoku or _G.AutoLevel or _G.Clip2 or _G.AutoBone or _G.Auto_Canvander or _G.AutoBoneNoQuest or _G.AutoBoss or _G.Auto_Saw or AutoFarmMasDevilFruit or AutoHallowSycthe or AutoTushita or _G.CakePrince or _G.DoughKing or _G.AutoFarmSwan or _G.AutoEliteor or AutoNextIsland or Musketeer or _G.AutoMaterial or _G.Factory or _G.AutoFrozenDimension or AutoFarmRaceQuest or _G.AutoUpgrade or _G.TweenToFrozenDimension) then
                for v834, v835 in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v835:IsA("BasePart") then
                        v835.CanCollide = false;
                    end
                end
            end
        end);
    end);
end);
task.spawn(function()
    if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
        game.Players.LocalPlayer.Character.Stun.Changed:connect(function()
            pcall(function()
                if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
                    game.Players.LocalPlayer.Character.Stun.Value = 0;
                end
            end);
        end);
    end
end);
function CheckMaterial(v221)
    for v467, v468 in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
        if (type(v468) == "table") then
            if (v468.Type == "Material") then
                if (v468.Name == v221) then
                    return v468.Count;
                end
            end
        end
    end
    return 0;
end
function GetWeaponInventory(v222)
    for v469, v470 in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
        if (type(v470) == "table") then
            if (v470.Type == "Sword") then
                if (v470.Name == v222) then
                    return true;
                end
            end
        end
    end
    return false;
end
local v21 = game.Players.LocalPlayer;
function FindEnemiesInRange(v223, v224)
    local v225 = (v21.Character or v21.CharacterAdded:Wait()):GetPivot().Position;
    local v226 = nil;
    for v471, v472 in ipairs(v224) do
        if (not v472:GetAttribute("IsBoat") and v472:FindFirstChildOfClass("Humanoid") and (v472.Humanoid.Health > 0)) then
            local v671 = v472:FindFirstChild("Head");
            if (v671 and ((v225 - v671.Position).Magnitude <= 60)) then
                if (v472 ~= v21.Character) then
                    table.insert(v223, {
                        v472,
                        v671
                    });
                    v226 = v671;
                end
            end
        end
    end
    for v473, v474 in ipairs(game.Players:GetPlayers()) do
        if (v474.Character and (v474 ~= v21)) then
            local v672 = v474.Character:FindFirstChild("Head");
            if (v672 and ((v225 - v672.Position).Magnitude <= 60)) then
                table.insert(v223, {
                    v474.Character,
                    v672
                });
                v226 = v672;
            end
        end
    end
    return v226;
end
function GetEquippedTool()
    local v227 = v21.Character;
    if not v227 then
        return nil;
    end
    for v475, v476 in ipairs(v227:GetChildren()) do
        if v476:IsA("Tool") then
            return v476;
        end
    end
    return nil;
end
function AttackNoCoolDown()
    local v228 = {};
    local v229 = game:GetService("Workspace").Enemies:GetChildren();
    local v230 = FindEnemiesInRange(v228, v229);
    if not v230 then
        return;
    end
    local v231 = GetEquippedTool();
    if not v231 then
        return;
    end
    pcall(function()
        local v477 = game:GetService("ReplicatedStorage");
        local v478 = v477:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack");
        local v479 = v477:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit");
        if (# v228 > 0) then
            v478:FireServer(1e-9);
            v479:FireServer(v230, v228);
        else
            task.wait(1e-9);
        end
    end);
end
Type = 1;
spawn(function()
    while wait() do
        if (Type == 1) then
            Pos = CFrame.new(0, 40, 0);
        elseif (Type == 2) then
            Pos = CFrame.new(- 40, 40, 0);
        elseif (Type == 3) then
            Pos = CFrame.new(40, 40, 0);
        elseif (Type == 4) then
            Pos = CFrame.new(0, 40, 40);
        elseif (Type == 5) then
            Pos = CFrame.new(0, 40, - 40);
        end
    end
end);
spawn(function()
    while wait() do
        Type = 1;
        wait(0.2);
        Type = 2;
        wait(0.2);
        Type = 3;
        wait(0.2);
        Type = 4;
        wait(0.2);
        Type = 5;
        wait(0.2);
    end
end);
function AutoHaki()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso");
    end
end
function to(v232)
    repeat
        wait(_G.Fast_Delay);
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(15);
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v232;
        task.wait();
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v232;
    until (v232.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000
end
function to(v233)
    pcall(function()
        if (((v233.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000) and not Auto_Raid and (game.Players.LocalPlayer.Character.Humanoid.Health > 0)) then
            if (NameMon == "FishmanQuest") then
                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame);
                wait();
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875));
            elseif (Mon == "God's Guard") then
                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame);
                wait();
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.82275, 872.54248, - 1667.55688));
            elseif (NameMon == "SkyExp1Quest") then
                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame);
                wait();
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 7894.6176757813, 5547.1416015625, - 380.29119873047));
            elseif (NameMon == "ShipQuest1") then
                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame);
                wait();
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
            elseif (NameMon == "ShipQuest2") then
                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame);
                wait();
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
            elseif (NameMon == "FrostQuest") then
                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame);
                wait();
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 6508.5581054688, 89.034996032715, - 132.83953857422));
            else
                repeat
                    wait(_G.Fast_Delay);
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v233;
                    wait(0.05);
                    game.Players.LocalPlayer.Character.Head:Destroy();
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v233;
                until ((v233.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2500) and (game.Players.LocalPlayer.Character.Humanoid.Health > 0)
                wait();
            end
        end
    end);
end
local v22 = Instance.new("ScreenGui");
local v23 = Instance.new("ImageButton");
local v24 = Instance.new("UICorner");
local v25 = Instance.new("ParticleEmitter");
local v26 = game:GetService("TweenService");
v22.Parent = game.CoreGui;
v22.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
v23.Parent = v22;
v23.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
v23.BorderSizePixel = 0;
v23.Position = UDim2.new(0.120833337 - 0.1, 0, 0.0952890813 + 0.01, 0);
v23.Size = UDim2.new(0, 50, 0, 50);
v23.Draggable = true;
v23.Image = "http://www.roblox.com/asset/?id=13717478897";
v24.Parent = v23;
v24.CornerRadius = UDim.new(0, 12);
v25.Parent = v23;
v25.LightEmission = 1;
v25.Size = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.1),
    NumberSequenceKeypoint.new(1, 0)
});
v25.Lifetime = NumberRange.new(0.5, 1);
v25.Rate = 0;
v25.Speed = NumberRange.new(5, 10);
v25.Color = ColorSequence.new(Color3.fromRGB(255, 85, 255), Color3.fromRGB(85, 255, 255));
local v47 = v26:Create(v23, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Rotation = 360
});
v23.MouseButton1Down:Connect(function()
    v25.Rate = 100;
    task.delay(1, function()
        v25.Rate = 0;
    end);
    v47:Play();
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game);
    v47.Completed:Connect(function()
        v23.Rotation = 0;
    end);
    local v235 = v26:Create(v23, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 60, 0, 60)
    });
    v235:Play();
    v235.Completed:Connect(function()
        local v483 = v26:Create(v23, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 50, 0, 50)
        });
        v483:Play();
    end);
end);
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Death") then
    game:GetService("ReplicatedStorage").Effect.Container.Death:Destroy();
end
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Respawn") then
    game:GetService("ReplicatedStorage").Effect.Container.Respawn:Destroy();
end
v16.Home:AddButton({
    Title = "Youtube",
    Description = "Tại Đây",
    Callback = function()
        setclipboard("https://youtube.com/@thanhdzso1");
    end
});
_G.FastAttackStrix_Mode = "Super Fast Attack";
spawn(function()
    while wait() do
        if _G.FastAttackStrix_Mode then
            pcall(function()
                if (_G.FastAttackStrix_Mode == "Super Fast Attack") then
                    _G.Fast_Delay = 1e-9;
                end
            end);
        end
    end
end);
local v48 = v16.Main:AddDropdown("DropdownSelectWeapon", {
    Title = "Vũ Khí",
    Description = "",
    Values = {
        "Melee",
        "Sword",
        "Blox Fruits"
    },
    Multi = false,
    Default = 1
});
v48:SetValue("Melee");
v48:OnChanged(function(v236)
    ChooseWeapon = v236;
end);
task.spawn(function()
    while wait() do
        pcall(function()
            if (ChooseWeapon == "Melee") then
                for v836, v837 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if (v837.ToolTip == "Melee") then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v837.Name)) then
                            SelectWeapon = v837.Name;
                        end
                    end
                end
            elseif (ChooseWeapon == "Sword") then
                for v1028, v1029 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if (v1029.ToolTip == "Sword") then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v1029.Name)) then
                            SelectWeapon = v1029.Name;
                        end
                    end
                end
            elseif (ChooseWeapon == "Blox Fruit") then
                for v1430, v1431 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if (v1431.ToolTip == "Blox Fruit") then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v1431.Name)) then
                            SelectWeapon = v1431.Name;
                        end
                    end
                end
            end
        end);
    end
end);
local v49 = v16.Main:AddToggle("ToggleLevel", {
    Title = "Cày Cấp",
    Description = "",
    Default = false
});
v49:OnChanged(function(v237)
    _G.AutoLevel = v237;
    if (v237 == false) then
        wait();
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame);
        wait();
    end
end);
v17.ToggleLevel:SetValue(false);
spawn(function()
    while task.wait() do
        if _G.AutoLevel then
            pcall(function()
                CheckLevel();
                if (not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false)) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest");
                    Tween(CFrameQ);
                    if ((CFrameQ.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv);
                    end
                elseif (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true)) then
                    for v1432, v1433 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v1433:FindFirstChild("Humanoid") and v1433:FindFirstChild("HumanoidRootPart") and (v1433.Humanoid.Health > 0)) then
                            if (v1433.Name == Ms) then
                                repeat
                                    wait(_G.Fast_Delay);
                                    AttackNoCoolDown();
                                    bringmob = true;
                                    AutoHaki();
                                    EquipTool(SelectWeapon);
                                    Tween(v1433.HumanoidRootPart.CFrame * Pos);
                                    v1433.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                    v1433.HumanoidRootPart.Transparency = 1;
                                    v1433.Humanoid.JumpPower = 0;
                                    v1433.Humanoid.WalkSpeed = 0;
                                    v1433.HumanoidRootPart.CanCollide = false;
                                    FarmPos = v1433.HumanoidRootPart.CFrame;
                                    MonFarm = v1433.Name;
                                until not _G.AutoLevel or not v1433.Parent or (v1433.Humanoid.Health <= 0) or not game:GetService("Workspace").Enemies:FindFirstChild(v1433.Name) or (game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false)
                                bringmob = false;
                            end
                        end
                    end
                    for v1434, v1435 in pairs(game:GetService("Workspace")['_WorldOrigin'].EnemySpawns:GetChildren()) do
                        if string.find(v1435.Name, NameMon) then
                            if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v1435.Position).Magnitude >= 10) then
                                Tween(v1435.HumanoidRootPart.CFrame * Pos);
                            end
                        end
                    end
                end
            end);
        end
    end
end);
local v50 = v16.Main:AddToggle("ToggleMobAura", {
    Title = "Đấm Quái Gần",
    Description = "",
    Default = false
});
v50:OnChanged(function(v238)
    _G.AutoNear = v238;
    if (v238 == false) then
        wait();
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame);
        wait();
    end
end);
v17.ToggleMobAura:SetValue(false);
spawn(function()
    while wait() do
        if _G.AutoNear then
            pcall(function()
                for v838, v839 in pairs(game.Workspace.Enemies:GetChildren()) do
                    if (v839:FindFirstChild("Humanoid") and v839:FindFirstChild("HumanoidRootPart") and (v839.Humanoid.Health > 0)) then
                        if v839.Name then
                            if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v839:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000) then
                                repeat
                                    wait(_G.Fast_Delay);
                                    AttackNoCoolDown();
                                    bringmob = true;
                                    AutoHaki();
                                    EquipTool(SelectWeapon);
                                    Tween(v839.HumanoidRootPart.CFrame * Pos);
                                    v839.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                    v839.HumanoidRootPart.Transparency = 1;
                                    v839.Humanoid.JumpPower = 0;
                                    v839.Humanoid.WalkSpeed = 0;
                                    v839.HumanoidRootPart.CanCollide = false;
                                    FarmPos = v839.HumanoidRootPart.CFrame;
                                    MonFarm = v839.Name;
                                until not _G.AutoNear or not v839.Parent or (v839.Humanoid.Health <= 0) or not game.Workspace.Enemies:FindFirstChild(v839.Name)
                                bringmob = false;
                            end
                        end
                    end
                end
            end);
        end
    end
end);
local v51 = v16.Main:AddToggle("ToggleCastleRaid", {
    Title = "Đấm Hải Tặc",
    Description = "",
    Default = false
});
v51:OnChanged(function(v239)
    _G.CastleRaid = v239;
end);
v17.ToggleCastleRaid:SetValue(false);
spawn(function()
    while wait() do
        if _G.CastleRaid then
            pcall(function()
                local v764 = CFrame.new(- 5496.17432, 313.768921, - 2841.53027, 0.924894512, 7.37058e-9, 0.380223751, 3.588102e-8, 1, - 1.06665446e-7, - 0.380223751, 1.1229711e-7, 0.924894512);
                if ((CFrame.new(- 5539.3115234375, 313.800537109375, - 2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500) then
                    for v1030, v1031 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (_G.CastleRaid and v1031:FindFirstChild("HumanoidRootPart") and v1031:FindFirstChild("Humanoid") and (v1031.Humanoid.Health > 0)) then
                            if ((v1031.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000) then
                                repeat
                                    wait(_G.Fast_Delay);
                                    AttackNoCoolDown();
                                    AutoHaki();
                                    EquipTool(SelectWeapon);
                                    v1031.HumanoidRootPart.CanCollide = false;
                                    v1031.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                    Tween(v1031.HumanoidRootPart.CFrame * Pos);
                                until (v1031.Humanoid.Health <= 0) or not v1031.Parent or not _G.CastleRaid
                            end
                        end
                    end
                else
                    Tween(v764);
                end
            end);
        end
    end
end);
local v52 = v16.Main:AddToggle("ToggleHakiFortress", {
    Title = "Bật Haki Màu Pháo Đài",
    Description = "",
    Default = false
});
v52:OnChanged(function(v240)
    _G.EnableHakiFortress = v240;
end);
v17.ToggleHakiFortress:SetValue(false);
local function v53(v241, v242)
    local v243 = {
        [1] = {
            StorageName = v241,
            Type = "AuraSkin",
            Context = "Equip"
        }
    };
    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/FruitCustomizerRF"):InvokeServer(unpack(v243));
    Tween2(v242);
end
local function v54(v244, v245)
    local v246 = game.Players.LocalPlayer.Character;
    if (not v246 or not v246:FindFirstChild("HumanoidRootPart")) then
        return false;
    end
    local v247 = v246.HumanoidRootPart.Position;
    return (v247 - v244).Magnitude < v245 ;
end
spawn(function()
    while true do
        if _G.EnableHakiFortress then
            v53("Snow White", Vector3.new(- 4971.71826171875, 335.9582214355469, - 3720.0595703125));
            while not v54(Vector3.new(- 4971.71826171875, 335.9582214355469, - 3720.0595703125), 1) do
                wait(0.1);
            end
            wait(0.5);
            v53("Pure Red", Vector3.new(- 5414.92041015625, 314.2582092285156, - 2212.20166015625));
            while not v54(Vector3.new(- 5414.92041015625, 314.2582092285156, - 2212.20166015625), 1) do
                wait(0.1);
            end
            wait(0.5);
            v53("Winter Sky", Vector3.new(- 5420.26318359375, 1089.3582763671875, - 2666.8193359375));
            while not v54(Vector3.new(- 5420.26318359375, 1089.3582763671875, - 2666.8193359375), 1) do
                wait(0.1);
            end
            wait(0.5);
            _G.EnableHakiFortress = false;
        end
        wait(0.5);
    end
end);
local v55 = v16.Main:AddToggle("ToggleCollectChest", {
    Title = "Lụm Rương",
    Description = "",
    Default = false
});
v55:OnChanged(function(v248)
    _G.AutoCollectChest = v248;
end);
spawn(function()
    while wait() do
        if _G.AutoCollectChest then
            local v673 = game:GetService("Players");
            local v674 = v673.LocalPlayer;
            local v675 = v674.Character or v674.CharacterAdded:Wait() ;
            local v676 = v675:GetPivot().Position;
            local v677 = game:GetService("CollectionService");
            local v678 = v677:GetTagged("_ChestTagged");
            local v679, v680 = math.huge;
            for v765 = 1, # v678 do
                local v766 = v678[v765];
                local v767 = (v766:GetPivot().Position - v676).Magnitude;
                if (not v766:GetAttribute("IsDisabled") and (v767 < v679)) then
                    v679, v680 = v767, v766;
                end
            end
            if v680 then
                local v840 = v680:GetPivot().Position;
                local v841 = CFrame.new(v840);
                Tween2(v841);
            end
        end
    end
end);
local v56 = v16.Main:AddSection("Thông Thạo");
local v57 = v16.Main:AddDropdown("DropdownMastery", {
    Title = "Cày Thông Thạo",
    Description = "",
    Values = {
        "Near Mobs"
    },
    Multi = false,
    Default = 1
});
v57:SetValue(TypeMastery);
v57:OnChanged(function(v249)
    TypeMastery = v249;
end);
local v58 = v16.Main:AddToggle("ToggleMasteryFruit", {
    Title = "Cày Trái",
    Description = "",
    Default = false
});
v58:OnChanged(function(v250)
    AutoFarmMasDevilFruit = v250;
end);
v17.ToggleMasteryFruit:SetValue(false);
local v59 = v16.Main:AddSlider("SliderHealt", {
    Title = "Máu Quái",
    Description = "",
    Default = 20,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Callback = function(v251)
        KillPercent = v251;
    end
});
v59:OnChanged(function(v252)
    KillPercent = v252;
end);
v59:SetValue(20);
spawn(function()
    while task.wait() do
        if _G.UseSkill then
            pcall(function()
                if _G.UseSkill then
                    for v1032, v1033 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if ((v1033.Name == MonFarm) and v1033:FindFirstChild("Humanoid") and v1033:FindFirstChild("HumanoidRootPart") and (v1033.Humanoid.Health <= ((v1033.Humanoid.MaxHealth * KillPercent) / 100))) then
                            repeat
                                game:GetService("RunService").Heartbeat:wait();
                                EquipTool(game.Players.LocalPlayer.Data.DevilFruit.Value);
                                Tween(v1033.HumanoidRootPart.CFrame * Pos);
                                PositionSkillMasteryDevilFruit = v1033.HumanoidRootPart.Position;
                                if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
                                    game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).MousePos.Value = PositionSkillMasteryDevilFruit;
                                    local v1606 = game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value;
                                    if (SkillZ and (v1606 >= 1)) then
                                        game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game);
                                        wait();
                                        game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game);
                                    end
                                    if (SkillX and (v1606 >= 2)) then
                                        game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game);
                                        wait();
                                        game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game);
                                    end
                                    if (SkillC and (v1606 >= 3)) then
                                        game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game);
                                        wait();
                                        game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game);
                                    end
                                    if (SkillV and (v1606 >= 4)) then
                                        game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game);
                                        wait();
                                        game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game);
                                    end
                                    if (SkillF and (v1606 >= 5)) then
                                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "F", false, game);
                                        wait();
                                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "F", false, game);
                                    end
                                end
                            until not AutoFarmMasDevilFruit or not _G.UseSkill or (v1033.Humanoid.Health == 0)
                        end
                    end
                end
            end);
        end
    end
end);
spawn(function()
    while task.wait(0.1) do
        if (AutoFarmMasDevilFruit and (TypeMastery == "Near Mobs")) then
            pcall(function()
                for v842, v843 in pairs(game.Workspace.Enemies:GetChildren()) do
                    if (v843.Name and v843:FindFirstChild("Humanoid") and v843:FindFirstChild("HumanoidRootPart")) then
                        if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v843:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000) then
                            repeat
                                wait(_G.Fast_Delay);
                                if (v843.Humanoid.Health <= ((v843.Humanoid.MaxHealth * KillPercent) / 100)) then
                                    _G.UseSkill = true;
                                else
                                    _G.UseSkill = false;
                                    AutoHaki();
                                    bringmob = true;
                                    EquipTool(SelectWeapon);
                                    Tween(v843.HumanoidRootPart.CFrame * Pos);
                                    v843.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                    v843.HumanoidRootPart.Transparency = 1;
                                    v843.Humanoid.JumpPower = 0;
                                    v843.Humanoid.WalkSpeed = 0;
                                    v843.HumanoidRootPart.CanCollide = false;
                                    FarmPos = v843.HumanoidRootPart.CFrame;
                                    MonFarm = v843.Name;
                                    AttackNoCoolDown();
                                end
                            until not AutoFarmMasDevilFruit or (not MasteryType == "Near Mobs") or not v843.Parent or (v843.Humanoid.Health == 0)
                            bringmob = false;
                            _G.UseSkill = false;
                        end
                    end
                end
            end);
        end
    end
end);
if Sea3 then
    local v484 = v16.Main:AddSection("Xương");
    local v485 = v16.Main:AddParagraph({
        Title = "Xương Trạng Thái",
        Content = ""
    });
    spawn(function()
        pcall(function()
            while wait() do
                local v768 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check");
                v485:SetDesc("Mày Có: " .. tostring(v768) .. " Xương");
            end
        end);
    end);
    local v486 = v16.Main:AddToggle("ToggleBone", {
        Title = "Cày Xương",
        Description = "",
        Default = false
    });
    v486:OnChanged(function(v571)
        _G.AutoBone = v571;
        if (v571 == false) then
            wait();
            Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame);
            wait();
        end
    end);
    v17.ToggleBone:SetValue(false);
    local v487 = CFrame.new(- 9515.75, 174.8521728515625, 6079.40625);
    spawn(function()
        while wait() do
            if _G.AutoBone then
                pcall(function()
                    local v894 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text;
                    if not string.find(v894, "Demonic Soul") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest");
                    end
                    if (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false) then
                        Tween(v487);
                        if ((v487.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 1);
                        end
                    elseif (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true) then
                        if (game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy")) then
                            for v1661, v1662 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if (v1662:FindFirstChild("HumanoidRootPart") and v1662:FindFirstChild("Humanoid") and (v1662.Humanoid.Health > 0)) then
                                    if ((v1662.Name == "Reborn Skeleton") or (v1662.Name == "Living Zombie") or (v1662.Name == "Demonic Soul") or (v1662.Name == "Posessed Mummy")) then
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") then
                                            repeat
                                                wait(_G.Fast_Delay);
                                                AttackNoCoolDown();
                                                AutoHaki();
                                                bringmob = true;
                                                EquipTool(SelectWeapon);
                                                Tween(v1662.HumanoidRootPart.CFrame * Pos);
                                                v1662.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                                v1662.HumanoidRootPart.Transparency = 1;
                                                v1662.Humanoid.JumpPower = 0;
                                                v1662.Humanoid.WalkSpeed = 0;
                                                v1662.HumanoidRootPart.CanCollide = false;
                                                FarmPos = v1662.HumanoidRootPart.CFrame;
                                                MonFarm = v1662.Name;
                                            until not _G.AutoBone or (v1662.Humanoid.Health <= 0) or not v1662.Parent or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false)
                                        else
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest");
                                            bringmob = false;
                                        end
                                    end
                                end
                            end
                        else
                        end
                    end
                end);
            end
        end
    end);
    local v488 = CFrame.new(- 9515.75, 174.8521728515625, 6079.40625);
    spawn(function()
        while wait() do
            if _G.AutoBoneNoQuest then
                pcall(function()
                    Tween(v488);
                    if ((v488.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) then
                    end
                    if (game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy")) then
                        for v1436, v1437 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1437:FindFirstChild("HumanoidRootPart") and v1437:FindFirstChild("Humanoid") and (v1437.Humanoid.Health > 0)) then
                                if ((v1437.Name == "Reborn Skeleton") or (v1437.Name == "Living Zombie") or (v1437.Name == "Demonic Soul") or (v1437.Name == "Posessed Mummy")) then
                                    repeat
                                        wait(_G.Fast_Delay);
                                        AttackNoCoolDown();
                                        AutoHaki();
                                        bringmob = true;
                                        EquipTool(SelectWeapon);
                                        Tween(v1437.HumanoidRootPart.CFrame * Pos);
                                        v1437.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                        v1437.HumanoidRootPart.Transparency = 1;
                                        v1437.Humanoid.JumpPower = 0;
                                        v1437.Humanoid.WalkSpeed = 0;
                                        v1437.HumanoidRootPart.CanCollide = false;
                                        FarmPos = v1437.HumanoidRootPart.CFrame;
                                        MonFarm = v1437.Name;
                                    until not _G.AutoBoneNoQuest or (v1437.Humanoid.Health <= 0) or not v1437.Parent
                                end
                            end
                        end
                    end
                end);
            end
        end
    end);
    v16.Main:AddButton({
        Title = "Cầu Nguyện",
        Description = "",
        Callback = function()
            local v572 = {
                [1] = "gravestoneEvent",
                [2] = 1
            };
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v572));
        end
    });
    v16.Main:AddButton({
        Title = "Thử Vận May",
        Description = "",
        Callback = function()
            local v573 = {
                [1] = "gravestoneEvent",
                [2] = 2
            };
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v573));
        end
    });
    local v489 = v16.Main:AddToggle("ToggleRandomBone", {
        Title = "Random Xương",
        Description = "",
        Default = false
    });
    v489:OnChanged(function(v574)
        _G.AutoRandomBone = v574;
    end);
    v17.ToggleRandomBone:SetValue(false);
    spawn(function()
        while wait() do
            if _G.AutoRandomBone then
                local v844 = {
                    [1] = "Bones",
                    [2] = "Buy",
                    [3] = 1,
                    [4] = 1
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v844));
            end
        end
    end);
end
if Sea3 then
    local v490 = v16.Main:AddSection("Tư Lệnh Bánh");
    local v491 = v16.Main:AddParagraph({
        Title = "Trạng Thái Nó Ra",
        Content = ""
    });
    spawn(function()
        while wait() do
            pcall(function()
                if (string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88) then
                    v491:SetDesc("Còn: " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 41) .. "");
                elseif (string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87) then
                    v491:SetDesc("Còn: " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 40) .. "");
                elseif (string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86) then
                    v491:SetDesc("Còn: " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 39) .. " ");
                else
                    v491:SetDesc("Tư Lệnh Bánh : ✅️");
                end
            end);
        end
    end);
    local v492 = v16.Main:AddToggle("ToggleCake", {
        Title = "Cày Tư Lệnh Bánh",
        Description = "",
        Default = false
    });
    local v493 = true;
    v492:OnChanged(function(v575)
        _G.CakePrince = v575;
        if v575 then
            if v493 then
                v493 = false;
                local v895 = CFrame.new(- 2003.932861328125, 380.4824523925781, - 12561.0185546875);
                Tween(v895);
            end
        else
            v493 = true;
            wait();
            Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame);
            wait();
        end
    end);
    v17.ToggleCake:SetValue(false);
    spawn(function()
        while wait() do
            if _G.CakePrince then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                        for v1438, v1439 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1439.Name == "Cake Prince") then
                                if (v1439:FindFirstChild("Humanoid") and v1439:FindFirstChild("HumanoidRootPart") and (v1439.Humanoid.Health > 0)) then
                                    repeat
                                        task.wait(_G.Fast_Delay);
                                        AutoHaki();
                                        EquipTool(SelectWeapon);
                                        v1439.HumanoidRootPart.CanCollide = false;
                                        v1439.Humanoid.WalkSpeed = 0;
                                        v1439.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                        Tween(v1439.HumanoidRootPart.CFrame * Pos);
                                        AttackNoCoolDown();
                                    until not _G.CakePrince or not v1439.Parent or (v1439.Humanoid.Health <= 0)
                                end
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                    elseif (game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 1) then
                        if (game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker")) then
                            for v1754, v1755 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if ((v1755.Name == "Cookie Crafter") or (v1755.Name == "Cake Guard") or (v1755.Name == "Baking Staff") or (v1755.Name == "Head Baker")) then
                                    if (v1755:FindFirstChild("Humanoid") and v1755:FindFirstChild("HumanoidRootPart") and (v1755.Humanoid.Health > 0)) then
                                        repeat
                                            task.wait(_G.Fast_Delay);
                                            AutoHaki();
                                            bringmob = true;
                                            EquipTool(SelectWeapon);
                                            v1755.HumanoidRootPart.CanCollide = false;
                                            v1755.Humanoid.WalkSpeed = 0;
                                            v1755.Head.CanCollide = false;
                                            v1755.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                            FarmPos = v1755.HumanoidRootPart.CFrame;
                                            MonFarm = v1755.Name;
                                            Tween(v1755.HumanoidRootPart.CFrame * Pos);
                                            AttackNoCoolDown();
                                        until not _G.CakePrince or not v1755.Parent or (v1755.Humanoid.Health <= 0) or (game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0) or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]")
                                        bringmob = false;
                                    end
                                end
                            end
                        end
                    end
                end);
            end
        end
    end);
    local v494 = v16.Main:AddToggle("ToggleDoughKing", {
        Title = "Đấm Vua Bột",
        Description = "",
        Default = false
    });
    v494:OnChanged(function(v576)
        _G.DoughKing = v576;
        if (v576 == false) then
            wait();
            Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame);
            wait();
        end
    end);
    v17.ToggleDoughKing:SetValue(false);
    spawn(function()
        while wait() do
            if _G.DoughKing then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                        for v1440, v1441 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1441.Name == "Dough King") then
                                if (v1441:FindFirstChild("Humanoid") and v1441:FindFirstChild("HumanoidRootPart") and (v1441.Humanoid.Health > 0)) then
                                    repeat
                                        task.wait(_G.Fast_Delay);
                                        AutoHaki();
                                        EquipTool(SelectWeapon);
                                        v1441.HumanoidRootPart.CanCollide = false;
                                        v1441.Humanoid.WalkSpeed = 0;
                                        v1441.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                        Tween(v1441.HumanoidRootPart.CFrame * Pos);
                                        AttackNoCoolDown();
                                    until not _G.DoughKing or not v1441.Parent or (v1441.Humanoid.Health <= 0)
                                end
                            end
                        end
                    end
                end);
            end
        end
    end);
    local v495 = v16.Main:AddToggle("ToggleSpawnCake", {
        Title = "Triệu Hồi Tư Lệnh Bánh",
        Description = "",
        Default = true
    });
    v495:OnChanged(function(v577)
        _G.SpawnCakePrince = v577;
    end);
    v17.ToggleSpawnCake:SetValue(true);
end
spawn(function()
    while wait() do
        if _G.SpawnCakePrince then
            local v681 = {
                [1] = "CakePrinceSpawner",
                [2] = true
            };
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v681));
            local v681 = {
                [1] = "CakePrinceSpawner"
            };
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v681));
        end
    end
end);
if Sea2 then
    local v496 = v16.Main:AddSection("Ectoplasm Farm");
    local v497 = v16.Main:AddToggle("ToggleVatChatKiDi", {
        Title = "Auto Farm Ectoplasm",
        Description = "",
        Default = false
    });
    v497:OnChanged(function(v578)
        _G.Ectoplasm = v578;
    end);
    v17.ToggleVatChatKiDi:SetValue(false);
    spawn(function()
        while wait() do
            pcall(function()
                if _G.Ectoplasm then
                    if (game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer")) then
                        for v1442, v1443 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if ((v1443.Name == "Ship Steward") or (v1443.Name == "Ship Engineer") or (v1443.Name == "Ship Deckhand") or ((v1443.Name == "Ship Officer") and v1443:FindFirstChild("Humanoid"))) then
                                if (v1443.Humanoid.Health > 0) then
                                    repeat
                                        wait(_G.Fast_Delay);
                                        AttackNoCoolDown();
                                        AutoHaki();
                                        bringmob = true;
                                        EquipTool(SelectWeapon);
                                        Tween(v1443.HumanoidRootPart.CFrame * Pos);
                                        v1443.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                        v1443.HumanoidRootPart.Transparency = 1;
                                        v1443.Humanoid.JumpPower = 0;
                                        v1443.Humanoid.WalkSpeed = 0;
                                        v1443.HumanoidRootPart.CanCollide = false;
                                        FarmPos = v1443.HumanoidRootPart.CFrame;
                                        MonFarm = v1443.Name;
                                    until (_G.Ectoplasm == false) or not v1443.Parent or (v1443.Humanoid.Health == 0) or not game:GetService("Workspace").Enemies:FindFirstChild(v1443.Name)
                                    bringmob = false;
                                end
                            end
                        end
                    else
                        local v1334 = (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude;
                        if (v1334 > 20000) then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
                        end
                        Tween(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875));
                    end
                end
            end);
        end
    end);
end
local v60 = v16.Main:AddSection("Trùm");
if Sea1 then
    tableBoss = {
        "The Gorilla King",
        "Bobby",
        "Yeti",
        "Mob Leader",
        "Vice Admiral",
        "Warden",
        "Chief Warden",
        "Swan",
        "Magma Admiral",
        "Fishman Lord",
        "Wysper",
        "Thunder God",
        "Cyborg",
        "Saber Expert"
    };
elseif Sea2 then
    tableBoss = {
        "Diamond",
        "Jeremy",
        "Fajita",
        "Don Swan",
        "Smoke Admiral",
        "Cursed Captain",
        "Darkbeard",
        "Order",
        "Awakened Ice Admiral",
        "Tide Keeper"
    };
elseif Sea3 then
    tableBoss = {
        "Stone",
        "Hydra Leader",
        "Kilo Admiral",
        "Captain Elephant",
        "Beautiful Pirate",
        "rip_indra True Form",
        "Longma",
        "Soul Reaper",
        "Cake Queen"
    };
end
local v61 = v16.Main:AddDropdown("DropdownBoss", {
    Title = "Chọn Trùm",
    Description = "",
    Values = tableBoss,
    Multi = false,
    Default = 1
});
v61:SetValue(_G.SelectBoss);
v61:OnChanged(function(v253)
    _G.SelectBoss = v253;
end);
local v62 = v16.Main:AddToggle("ToggleAutoFarmBoss", {
    Title = "Đấm Trùm",
    Description = "",
    Default = false
});
v62:OnChanged(function(v254)
    _G.AutoBoss = v254;
end);
v17.ToggleAutoFarmBoss:SetValue(false);
spawn(function()
    while wait() do
        if _G.AutoBoss then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                    for v1034, v1035 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v1035.Name == _G.SelectBoss) then
                            if (v1035:FindFirstChild("Humanoid") and v1035:FindFirstChild("HumanoidRootPart") and (v1035.Humanoid.Health > 0)) then
                                repeat
                                    wait(_G.Fast_Delay);
                                    AttackNoCoolDown();
                                    AutoHaki();
                                    EquipTool(SelectWeapon);
                                    v1035.HumanoidRootPart.CanCollide = false;
                                    v1035.Humanoid.WalkSpeed = 0;
                                    v1035.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                    Tween(v1035.HumanoidRootPart.CFrame * Pos);
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
                                until not _G.AutoBoss or not v1035.Parent or (v1035.Humanoid.Health <= 0)
                            end
                        end
                    end
                elseif game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame * CFrame.new(5, 10, 7));
                end
            end);
        end
    end
end);
local v63 = v16.Main:AddSection("Nguyên Liệu");
if Sea1 then
    MaterialList = {
        "Scrap Metal",
        "Leather",
        "Angel Wings",
        "Magma Ore",
        "Fish Tail"
    };
elseif Sea2 then
    MaterialList = {
        "Scrap Metal",
        "Leather",
        "Radioactive Material",
        "Mystic Droplet",
        "Magma Ore",
        "Vampire Fang"
    };
elseif Sea3 then
    MaterialList = {
        "Scrap Metal",
        "Leather",
        "Demonic Wisp",
        "Conjured Cocoa",
        "Dragon Scale",
        "Gunpowder",
        "Fish Tail",
        "Mini Tusk",
        "Hydra Enforcer",
        "Venomous Assailant"
    };
end
local v64 = v16.Main:AddDropdown("DropdownMaterial", {
    Title = "Chọn Nguyên Liệu",
    Description = "",
    Values = MaterialList,
    Multi = false,
    Default = 1
});
v64:SetValue(SelectMaterial);
v64:OnChanged(function(v255)
    SelectMaterial = v255;
end);
local v65 = v16.Main:AddToggle("ToggleMaterial", {
    Title = "Cày Nguyên Liệu",
    Description = "",
    Default = false
});
v65:OnChanged(function(v256)
    _G.AutoMaterial = v256;
    if (v256 == false) then
        wait();
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame);
        wait();
    end
end);
v17.ToggleMaterial:SetValue(false);
spawn(function()
    while task.wait() do
        if _G.AutoMaterial then
            pcall(function()
                MaterialMon(SelectMaterial);
                Tween(MPos);
                if game:GetService("Workspace").Enemies:FindFirstChild(MMon) then
                    for v1036, v1037 in pairs(game.Workspace.Enemies:GetChildren()) do
                        if (v1037:FindFirstChild("Humanoid") and v1037:FindFirstChild("HumanoidRootPart") and (v1037.Humanoid.Health > 0)) then
                            if (v1037.Name == MMon) then
                                repeat
                                    wait(_G.Fast_Delay);
                                    AttackNoCoolDown();
                                    AutoHaki();
                                    bringmob = true;
                                    EquipTool(SelectWeapon);
                                    Tween(v1037.HumanoidRootPart.CFrame * Pos);
                                    v1037.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                    v1037.HumanoidRootPart.Transparency = 1;
                                    v1037.Humanoid.JumpPower = 0;
                                    v1037.Humanoid.WalkSpeed = 0;
                                    v1037.HumanoidRootPart.CanCollide = false;
                                    FarmPos = v1037.HumanoidRootPart.CFrame;
                                    MonFarm = v1037.Name;
                                until not _G.AutoMaterial or not v1037.Parent or (v1037.Humanoid.Health <= 0)
                                bringmob = false;
                            end
                        end
                    end
                else
                    for v1038, v1039 in pairs(game:GetService("Workspace")['_WorldOrigin'].EnemySpawns:GetChildren()) do
                        if string.find(v1039.Name, Mon) then
                            if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v1039.Position).Magnitude >= 10) then
                                Tween(v1039.HumanoidRootPart.CFrame * Pos);
                            end
                        end
                    end
                end
            end);
        end
    end
end);
if Sea3 then
    local v498 = v16.Sea:AddSection("Đảo Cáo");
    local v499 = v16.Sea:AddParagraph({
        Title = "Trạng Thái Đảo Cáo",
        Content = ""
    });
    function UpdateKitsune()
        if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
            v499:SetDesc("Đảo Cáo : ✅️");
        else
            v499:SetDesc("Đảo Cáo : ❌️");
        end
    end
    spawn(function()
        pcall(function()
            while wait() do
                UpdateKitsune();
            end
        end);
    end);
    local v500 = v16.Sea:AddToggle("ToggleEspKitsune", {
        Title = "Định Vị Đảo Cáo",
        Description = "",
        Default = false
    });
    v500:OnChanged(function(v579)
        KitsuneIslandEsp = v579;
        while KitsuneIslandEsp do
            wait();
            UpdateIslandKisuneESP();
        end
    end);
    v17.ToggleEspKitsune:SetValue(false);
    function UpdateIslandKisuneESP()
        for v682, v683 in pairs(game:GetService("Workspace")['_WorldOrigin'].Locations:GetChildren()) do
            pcall(function()
                if KitsuneIslandEsp then
                    if (v683.Name == "Kitsune Island") then
                        if not v683:FindFirstChild("NameEsp") then
                            local v1518 = Instance.new("BillboardGui", v683);
                            v1518.Name = "NameEsp";
                            v1518.ExtentsOffset = Vector3.new(0, 1, 0);
                            v1518.Size = UDim2.new(1, 200, 1, 30);
                            v1518.Adornee = v683;
                            v1518.AlwaysOnTop = true;
                            local v1524 = Instance.new("TextLabel", v1518);
                            v1524.Font = "Code";
                            v1524.FontSize = "Size14";
                            v1524.TextWrapped = true;
                            v1524.Size = UDim2.new(1, 0, 1, 0);
                            v1524.TextYAlignment = "Top";
                            v1524.BackgroundTransparency = 1;
                            v1524.TextStrokeTransparency = 0.5;
                            v1524.TextColor3 = Color3.fromRGB(80, 245, 245);
                        else
                            v683['NameEsp'].TextLabel.Text = v683.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v683.Position).Magnitude / 3) .. " M" ;
                        end
                    end
                elseif v683:FindFirstChild("NameEsp") then
                    v683:FindFirstChild("NameEsp"):Destroy();
                end
            end);
        end
    end
    local v501 = v16.Sea:AddToggle("ToggleTPKitsune", {
        Title = "Bay Vô Đảo Cáo",
        Description = "",
        Default = false
    });
    v501:OnChanged(function(v580)
        _G.TweenToKitsune = v580;
    end);
    v17.ToggleTPKitsune:SetValue(false);
    spawn(function()
        local v581;
        while not v581 do
            v581 = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland");
            wait();
        end
        while wait() do
            if _G.TweenToKitsune then
                local v845 = v581:FindFirstChild("ShrineActive");
                if v845 then
                    for v1335, v1336 in pairs(v845:GetDescendants()) do
                        if (v1336:IsA("BasePart") and v1336.Name:find("NeonShrinePart")) then
                            Tween(v1336.CFrame);
                        end
                    end
                end
            end
        end
    end);
    local v502 = v16.Sea:AddToggle("ToggleCollectAzure", {
        Title = "Lụm Linh Hồn Xanh",
        Description = "",
        Default = false
    });
    v502:OnChanged(function(v582)
        _G.CollectAzure = v582;
    end);
    v17.ToggleCollectAzure:SetValue(false);
    spawn(function()
        while wait() do
            if _G.CollectAzure then
                pcall(function()
                    if game:GetService("Workspace"):FindFirstChild("AttachedAzureEmber") then
                        Tween(game:GetService("Workspace"):WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame);
                    end
                end);
            end
        end
    end);
end
v16.Sea:AddButton({
    Title = "Đổi Linh Hồn Xanh",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/KitsuneStatuePray"):InvokeServer();
    end
});
if Sea3 then
    local v503 = v16.Sea:AddSection("Biển");
    local v504 = game:GetService("Players");
    local v505 = game:GetService("RunService");
    local v506 = game:GetService("VirtualInputManager");
    local v507 = game:GetService("Workspace");
    local v508 = 350;
    local v509 = v16.Sea:AddSlider("SliderSpeedBoat", {
        Title = "Tốc Độ Thuyền",
        Description = "",
        Default = v508,
        Min = 0,
        Max = 350,
        Rounding = 1,
        Callback = function(v583)
            v508 = v583;
        end
    });
    v509:SetValue(v508);
    local v510 = v16.Sea:AddToggle("AutoFindPrehistoric", {
        Title = "Tìm Đảo Dung Nham",
        Description = "",
        Default = false
    });
    v17.AutoFindPrehistoric:SetValue(false);
    v510:OnChanged(function(v584)
        _G.AutoFindPrehistoric = v584;
    end);
    local v511 = {};
    local v512 = false;
    local v513 = false;
    v505.RenderStepped:Connect(function()
        if not _G.AutoFindPrehistoric then
            v513 = false;
            return;
        end
        local v585 = v504.LocalPlayer;
        local v586 = v585.Character;
        if (not v586 or not v586:FindFirstChild("Humanoid")) then
            return;
        end
        local function v587()
            if v512 then
                return;
            end
            v512 = true;
            for v769, v770 in pairs(v511) do
                if (v770 and v770.Parent and (v770.Name == "VehicleSeat") and not v770.Occupant) then
                    Tween2(v770.CFrame);
                    break;
                end
            end
            v512 = false;
        end
        local v588 = v586.Humanoid;
        local v589 = false;
        local v590 = nil;
        for v684, v685 in pairs(v507.Boats:GetChildren()) do
            local v686 = v685:FindFirstChild("VehicleSeat");
            if (v686 and (v686.Occupant == v588)) then
                v589 = true;
                v590 = v686;
                v511[v685.Name] = v686;
            elseif (v686 and (v686.Occupant == nil)) then
                v587();
            end
        end
        if not v589 then
            return;
        end
        v590.MaxSpeed = v508;
        v590.CFrame = CFrame.new(Vector3.new(v590.Position.X, v590.Position.Y, v590.Position.Z)) * v590.CFrame.Rotation ;
        v506:SendKeyEvent(true, "W", false, game);
        for v687, v688 in pairs(v507.Boats:GetDescendants()) do
            if v688:IsA("BasePart") then
                v688.CanCollide = false;
            end
        end
        for v689, v690 in pairs(v586:GetDescendants()) do
            if v690:IsA("BasePart") then
                v690.CanCollide = false;
            end
        end
        local v593 = {
            "ShipwreckIsland",
            "SandIsland",
            "TreeIsland",
            "TinyIsland",
            "MysticIsland",
            "KitsuneIsland",
            "FrozenDimension"
        };
        for v691, v692 in ipairs(v593) do
            local v693 = v507.Map:FindFirstChild(v692);
            if (v693 and v693:IsA("Model")) then
                v693:Destroy();
            end
        end
        local v594 = v507.Map:FindFirstChild("PrehistoricIsland");
        if v594 then
            v506:SendKeyEvent(false, "W", false, game);
            _G.AutoFindPrehistoric = false;
            if not v513 then
                v14:Notify({
                    Title = "Min Gaming",
                    Content = "Đảo Dung Nham Tìm Thấy",
                    Duration = 10
                });
                v513 = true;
            end
            return;
        end
    end);
    local v514 = v16.Sea:AddToggle("AutoFindMirage", {
        Title = "Tìm Đảo Bí Ẩn",
        Description = "",
        Default = false
    });
    v17.AutoFindMirage:SetValue(false);
    v514:OnChanged(function(v595)
        _G.AutoFindMirage = v595;
    end);
    local v511 = {};
    local v512 = false;
    local v513 = false;
    v505.RenderStepped:Connect(function()
        if not _G.AutoFindMirage then
            v513 = false;
            return;
        end
        local v596 = v504.LocalPlayer;
        local v597 = v596.Character;
        if (not v597 or not v597:FindFirstChild("Humanoid")) then
            return;
        end
        local function v598()
            if v512 then
                return;
            end
            v512 = true;
            for v771, v772 in pairs(v511) do
                if (v772 and v772.Parent and (v772.Name == "VehicleSeat") and not v772.Occupant) then
                    Tween2(v772.CFrame);
                    break;
                end
            end
            v512 = false;
        end
        local v599 = v597.Humanoid;
        local v600 = false;
        local v601 = nil;
        for v694, v695 in pairs(v507.Boats:GetChildren()) do
            local v696 = v695:FindFirstChild("VehicleSeat");
            if (v696 and (v696.Occupant == v599)) then
                v600 = true;
                v601 = v696;
                v511[v695.Name] = v696;
            elseif (v696 and (v696.Occupant == nil)) then
                v598();
            end
        end
        if not v600 then
            return;
        end
        v601.MaxSpeed = v508;
        v601.CFrame = CFrame.new(Vector3.new(v601.Position.X, v601.Position.Y, v601.Position.Z)) * v601.CFrame.Rotation ;
        v506:SendKeyEvent(true, "W", false, game);
        for v697, v698 in pairs(v507.Boats:GetDescendants()) do
            if v698:IsA("BasePart") then
                v698.CanCollide = false;
            end
        end
        for v699, v700 in pairs(v597:GetDescendants()) do
            if v700:IsA("BasePart") then
                v700.CanCollide = false;
            end
        end
        local v604 = {
            "ShipwreckIsland",
            "SandIsland",
            "TreeIsland",
            "TinyIsland",
            "PrehistoricIsland",
            "KitsuneIsland",
            "FrozenDimension"
        };
        for v701, v702 in ipairs(v604) do
            local v703 = v507.Map:FindFirstChild(v702);
            if (v703 and v703:IsA("Model")) then
                v703:Destroy();
            end
        end
        local v605 = v507.Map:FindFirstChild("MysticIsland");
        if v605 then
            v506:SendKeyEvent(false, "W", false, game);
            _G.AutoFindMirage = false;
            if not v513 then
                v14:Notify({
                    Title = "Min Gaming",
                    Content = "Đảo Bí Ẩn Tìm Thấy",
                    Duration = 10
                });
                v513 = true;
            end
            return;
        end
    end);
    local v515 = v16.Sea:AddToggle("AutoFindFrozen", {
        Title = "Tìm Đảo Leviathan",
        Description = "Cần 5 Người Không Idk",
        Default = false
    });
    v17.AutoFindFrozen:SetValue(false);
    v515:OnChanged(function(v606)
        _G.AutoFindFrozen = v606;
    end);
    local v511 = {};
    local v512 = false;
    local v513 = false;
    v505.RenderStepped:Connect(function()
        if not _G.AutoFindFrozen then
            v513 = false;
            return;
        end
        local v607 = v504.LocalPlayer;
        local v608 = v607.Character;
        if (not v608 or not v608:FindFirstChild("Humanoid")) then
            return;
        end
        local function v609()
            if v512 then
                return;
            end
            v512 = true;
            for v773, v774 in pairs(v511) do
                if (v774 and v774.Parent and (v774.Name == "VehicleSeat") and not v774.Occupant) then
                    Tween2(v774.CFrame);
                    break;
                end
            end
            v512 = false;
        end
        local v610 = v608.Humanoid;
        local v611 = false;
        local v612 = nil;
        for v704, v705 in pairs(v507.Boats:GetChildren()) do
            local v706 = v705:FindFirstChild("VehicleSeat");
            if (v706 and (v706.Occupant == v610)) then
                v611 = true;
                v612 = v706;
                v511[v705.Name] = v706;
            elseif (v706 and (v706.Occupant == nil)) then
                v609();
            end
        end
        if not v611 then
            return;
        end
        v612.MaxSpeed = v508;
        v612.CFrame = CFrame.new(Vector3.new(v612.Position.X, v612.Position.Y, v612.Position.Z)) * v612.CFrame.Rotation ;
        v506:SendKeyEvent(true, "W", false, game);
        for v707, v708 in pairs(v507.Boats:GetDescendants()) do
            if v708:IsA("BasePart") then
                v708.CanCollide = false;
            end
        end
        for v709, v710 in pairs(v608:GetDescendants()) do
            if v710:IsA("BasePart") then
                v710.CanCollide = false;
            end
        end
        local v615 = {
            "ShipwreckIsland",
            "SandIsland",
            "TreeIsland",
            "TinyIsland",
            "MysticIsland",
            "KitsuneIsland",
            "PrehistoricIsland"
        };
        for v711, v712 in ipairs(v615) do
            local v713 = v507.Map:FindFirstChild(v712);
            if (v713 and v713:IsA("Model")) then
                v713:Destroy();
            end
        end
        local v616 = v507.Map:FindFirstChild("FrozenDimension");
        if v616 then
            v506:SendKeyEvent(false, "W", false, game);
            _G.AutoFindFrozen = false;
            if not v513 then
                v14:Notify({
                    Title = "Min Gaming",
                    Content = "Đảo Leviathan Tìm Thấy",
                    Duration = 10
                });
                v513 = true;
            end
            return;
        end
    end);
    local v516 = v16.Sea:AddToggle("AutoComeTiki", {
        Title = "Lái Thuyền Về Đảo Tiki",
        Description = "",
        Default = false
    });
    v516:OnChanged(function(v617)
        _G.AutoComeTiki = v617;
    end);
    v505.RenderStepped:Connect(function()
        if not _G.AutoComeTiki then
            return;
        end
        local v618 = v504.LocalPlayer;
        local v619 = v618.Character;
        if (not v619 or not v619:FindFirstChild("Humanoid")) then
            return;
        end
        local v620 = v619.Humanoid;
        local v621 = nil;
        for v714, v715 in pairs(v507.Boats:GetChildren()) do
            local v716 = v715:FindFirstChild("VehicleSeat");
            if (v716 and (v716.Occupant == v620)) then
                v621 = v716;
                break;
            end
        end
        if v621 then
            v621.MaxSpeed = v508;
            local v776 = CFrame.new(- 16217.7568359375, 9.126761436462402, 446.06536865234375);
            local v777 = v621.Position;
            local v778 = v776.Position;
            local v779 = (v778 - v777).unit;
            local v780 = v779 * v621.MaxSpeed * v505.RenderStepped:Wait() ;
            v621.CFrame = v621.CFrame + v780 ;
            local v782 = CFrame.new(v777, v778);
            v621.CFrame = CFrame.new(v621.Position, v778);
            if ((v621.Position - v778).magnitude < 120) then
                _G.AutoComeTiki = false;
                v506:SendKeyEvent(false, "W", false, game);
            end
        end
    end);
    local v517 = v16.Sea:AddToggle("AutoComeHydra", {
        Title = "Lái Thuyền Về Đảo Hydra",
        Description = "",
        Default = false
    });
    v517:OnChanged(function(v622)
        _G.AutoComeHydra = v622;
    end);
    v505.RenderStepped:Connect(function()
        if not _G.AutoComeHydra then
            return;
        end
        local v623 = v504.LocalPlayer;
        local v624 = v623.Character;
        if (not v624 or not v624:FindFirstChild("Humanoid")) then
            return;
        end
        local v625 = v624.Humanoid;
        local v626 = nil;
        for v717, v718 in pairs(v507.Boats:GetChildren()) do
            local v719 = v718:FindFirstChild("VehicleSeat");
            if (v719 and (v719.Occupant == v625)) then
                v626 = v719;
                break;
            end
        end
        if v626 then
            v626.MaxSpeed = v508;
            local v784 = CFrame.new(5193.9375, - 0.04690289497375488, 1631.578369140625);
            local v785 = v626.Position;
            local v786 = v784.Position;
            local v787 = (v786 - v785).unit;
            local v788 = v787 * v626.MaxSpeed * v505.RenderStepped:Wait() ;
            v626.CFrame = v626.CFrame + v788 ;
            local v790 = CFrame.new(v785, v786);
            v626.CFrame = CFrame.new(v626.Position, v786);
            if ((v626.Position - v786).magnitude < 120) then
                _G.AutoComeHydra = false;
                v506:SendKeyEvent(false, "W", false, game);
            end
        end
    end);
    v16.Sea:AddButton({
        Title = "Bay Đến Khu Vực Săn",
        Description = "",
        Callback = function()
            Tween2(CFrame.new(- 16917.154296875, 7.757596015930176, 511.8203125));
        end
    });
    local v511 = {};
    local v518 = {
        "Beast Hunter",
        "Sleigh",
        "Miracle",
        "The Sentinel",
        "Guardian",
        "Lantern",
        "Dinghy",
        "PirateSloop",
        "PirateBrigade",
        "PirateGrandBrigade",
        "MarineGrandBrigade",
        "MarineBrigade",
        "MarineSloop"
    };
    local v519 = v16.Sea:AddDropdown("DropdownBoat", {
        Title = "Chọn Thuyền",
        Description = "",
        Values = v518,
        Multi = false,
        Default = 1
    });
    v519:SetValue(selectedBoat);
    v519:OnChanged(function(v627)
        selectedBoat = v627;
    end);
    local function v520(v628)
        local v629 = {
            [1] = "BuyBoat",
            [2] = v628
        };
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v629));
        task.delay(2, function()
            for v791, v792 in pairs(v507.Boats:GetChildren()) do
                if (v792:IsA("Model") and (v792.Name == v628)) then
                    local v896 = v792:FindFirstChild("VehicleSeat");
                    if (v896 and not v896.Occupant) then
                        v511[v628] = v896;
                    end
                end
            end
        end);
    end
    local function v521()
        for v720, v721 in pairs(v511) do
            if (v721 and v721.Parent and (v721.Name == "VehicleSeat") and not v721.Occupant) then
                Tween2(v721.CFrame);
            end
        end
    end
    game:GetService("RunService").RenderStepped:Connect(function()
        for v722, v723 in pairs(v511) do
            if (v723 and v723.Parent and (v723.Name == "VehicleSeat") and not v723.Occupant) then
                v511[v722] = v723;
            end
        end
    end);
    v16.Sea:AddButton({
        Title = "Mua Thuyền",
        Description = "",
        Callback = function()
            v520(selectedBoat);
        end
    });
    v16.Sea:AddButton({
        Title = "Bay Đến Thuyền",
        Description = "Duy Nhất Thuyền Bạn Mua Ở Chỗ Chọn",
        Callback = function()
            v521();
        end
    });
    local v522 = v16.Sea:AddToggle("ToggleTerrorshark", {
        Title = "Đấm Cá Mập",
        Description = "",
        Default = false
    });
    v522:OnChanged(function(v630)
        _G.AutoTerrorshark = v630;
    end);
    v17.ToggleTerrorshark:SetValue(false);
    spawn(function()
        while wait() do
            if _G.AutoTerrorshark then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") then
                        for v1444, v1445 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1445.Name == "Terrorshark") then
                                if (v1445:FindFirstChild("Humanoid") and v1445:FindFirstChild("HumanoidRootPart") and (v1445.Humanoid.Health > 0)) then
                                    repeat
                                        wait(_G.Fast_Delay);
                                        AttackNoCoolDown();
                                        AutoHaki();
                                        EquipTool(SelectWeapon);
                                        v1445.HumanoidRootPart.CanCollide = false;
                                        v1445.Humanoid.WalkSpeed = 0;
                                        v1445.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                        Tween(v1445.HumanoidRootPart.CFrame * Pos);
                                    until not _G.AutoTerrorshark or not v1445.Parent or (v1445.Humanoid.Health <= 0)
                                end
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                    else
                    end
                end);
            end
        end
    end);
    local v523 = v16.Sea:AddToggle("TogglePiranha", {
        Title = "Đấm Piranha",
        Description = "",
        Default = false
    });
    v523:OnChanged(function(v631)
        _G.farmpiranya = v631;
    end);
    v17.TogglePiranha:SetValue(false);
    spawn(function()
        while wait() do
            if _G.farmpiranya then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Piranha") then
                        for v1446, v1447 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1447.Name == "Piranha") then
                                if (v1447:FindFirstChild("Humanoid") and v1447:FindFirstChild("HumanoidRootPart") and (v1447.Humanoid.Health > 0)) then
                                    repeat
                                        wait(_G.Fast_Delay);
                                        AttackNoCoolDown();
                                        AutoHaki();
                                        EquipTool(SelectWeapon);
                                        v1447.HumanoidRootPart.CanCollide = false;
                                        v1447.Humanoid.WalkSpeed = 0;
                                        v1447.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                        Tween(v1447.HumanoidRootPart.CFrame * Pos);
                                    until not _G.farmpiranya or not v1447.Parent or (v1447.Humanoid.Health <= 0)
                                end
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Piranha") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Piranha").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                    else
                    end
                end);
            end
        end
    end);
    local v524 = v16.Sea:AddToggle("ToggleShark", {
        Title = "Đấm Cá Con",
        Description = "",
        Default = false
    });
    v524:OnChanged(function(v632)
        _G.AutoShark = v632;
    end);
    v17.ToggleShark:SetValue(false);
    spawn(function()
        while wait() do
            if _G.AutoShark then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Shark") then
                        for v1448, v1449 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1449.Name == "Shark") then
                                if (v1449:FindFirstChild("Humanoid") and v1449:FindFirstChild("HumanoidRootPart") and (v1449.Humanoid.Health > 0)) then
                                    repeat
                                        wait(_G.Fast_Delay);
                                        AttackNoCoolDown();
                                        AutoHaki();
                                        EquipTool(SelectWeapon);
                                        v1449.HumanoidRootPart.CanCollide = false;
                                        v1449.Humanoid.WalkSpeed = 0;
                                        v1449.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                        Tween(v1449.HumanoidRootPart.CFrame * Pos);
                                        game.Players.LocalPlayer.Character.Humanoid.Sit = false;
                                    until not _G.AutoShark or not v1449.Parent or (v1449.Humanoid.Health <= 0)
                                end
                            end
                        end
                    else
                        Tween(game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0));
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
                            Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                        else
                        end
                    end
                end);
            end
        end
    end);
    local v525 = v16.Sea:AddToggle("ToggleFishCrew", {
        Title = "Đấm Tàu Cá",
        Description = "",
        Default = false
    });
    v525:OnChanged(function(v633)
        _G.AutoFishCrew = v633;
    end);
    v17.ToggleFishCrew:SetValue(false);
    spawn(function()
        while wait() do
            if _G.AutoFishCrew then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") then
                        for v1450, v1451 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1451.Name == "Fish Crew Member") then
                                if (v1451:FindFirstChild("Humanoid") and v1451:FindFirstChild("HumanoidRootPart") and (v1451.Humanoid.Health > 0)) then
                                    repeat
                                        wait(_G.Fast_Delay);
                                        AttackNoCoolDown();
                                        AutoHaki();
                                        EquipTool(SelectWeapon);
                                        v1451.HumanoidRootPart.CanCollide = false;
                                        v1451.Humanoid.WalkSpeed = 0;
                                        v1451.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                        Tween(v1451.HumanoidRootPart.CFrame * Pos);
                                        game.Players.LocalPlayer.Character.Humanoid.Sit = false;
                                    until not _G.AutoFishCrew or not v1451.Parent or (v1451.Humanoid.Health <= 0)
                                end
                            end
                        end
                    else
                        Tween(game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0));
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member") then
                            Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                        else
                        end
                    end
                end);
            end
        end
    end);
    local v526 = v16.Sea:AddToggle("ToggleShip", {
        Title = "Đấm Tàu",
        Description = "",
        Default = false
    });
    v526:OnChanged(function(v634)
        _G.Ship = v634;
    end);
    v17.ToggleShip:SetValue(false);
    function CheckPirateBoat()
        local v635 = {
            "PirateGrandBrigade",
            "PirateBrigade"
        };
        for v724, v725 in next, game:GetService("Workspace").Enemies:GetChildren() do
            if (table.find(v635, v725.Name) and v725:FindFirstChild("Health") and (v725.Health.Value > 0)) then
                return v725;
            end
        end
    end
    spawn(function()
        while wait() do
            if _G.Ship then
                pcall(function()
                    if CheckPirateBoat() then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game);
                        wait(0.5);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game);
                        local v1338 = CheckPirateBoat();
                        repeat
                            wait();
                            spawn(Tween(v1338.Engine.CFrame * CFrame.new(0, - 20, 0)), 1);
                            AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, - 5, 0) ;
                            Skillaimbot = true;
                            AutoSkill = false;
                        until not v1338 or not v1338.Parent or (v1338.Health.Value <= 0) or not CheckPirateBoat()
                        Skillaimbot = true;
                        AutoSkill = false;
                    end
                end);
            end
        end
    end);
    local v527 = v16.Sea:AddToggle("ToggleGhostShip", {
        Title = "Đấm Tàu Ma",
        Description = "",
        Default = false
    });
    v527:OnChanged(function(v636)
        _G.GhostShip = v636;
    end);
    v17.ToggleGhostShip:SetValue(false);
    function CheckPirateBoat()
        local v637 = {
            "FishBoat"
        };
        for v726, v727 in next, game:GetService("Workspace").Enemies:GetChildren() do
            if (table.find(v637, v727.Name) and v727:FindFirstChild("Health") and (v727.Health.Value > 0)) then
                return v727;
            end
        end
    end
    spawn(function()
        while wait() do
            pcall(function()
                if _G.bjirFishBoat then
                    if CheckPirateBoat() then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game);
                        wait();
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game);
                        local v1339 = CheckPirateBoat();
                        repeat
                            wait();
                            spawn(Tween(v1339.Engine.CFrame * CFrame.new(0, - 20, 0), 1));
                            AutoSkill = true;
                            Skillaimbot = true;
                            AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, - 5, 0) ;
                        until v1339.Parent or (v1339.Health.Value <= 0) or not CheckPirateBoat()
                        AutoSkill = false;
                        Skillaimbot = false;
                    end
                end
            end);
        end
    end);
    spawn(function()
        while wait() do
            if _G.bjirFishBoat then
                pcall(function()
                    if CheckPirateBoat() then
                        AutoHaki();
                        game:GetService("VirtualUser"):CaptureController();
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672));
                        for v1452, v1453 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v1453:IsA("Tool") then
                                if (v1453.ToolTip == "Melee") then
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1453);
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait(0.2);
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait(0.2);
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait(0.2);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        for v1454, v1455 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v1455:IsA("Tool") then
                                if (v1455.ToolTip == "Blox Fruit") then
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1455);
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait(0.2);
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait(0.2);
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait(0.2);
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait();
                        for v1456, v1457 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v1457:IsA("Tool") then
                                if (v1457.ToolTip == "Sword") then
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1457);
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait(0.2);
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait(0.2);
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait();
                        for v1458, v1459 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v1459:IsA("Tool") then
                                if (v1459.ToolTip == "Gun") then
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1459);
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait(0.2);
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait(0.2);
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                    end
                end);
            end
        end
    end);
    local v528 = v16.Main:AddSection("Elite");
    local v529 = v16.Main:AddParagraph({
        Title = "Trạng Thái Elite",
        Content = ""
    });
    spawn(function()
        while wait() do
            pcall(function()
                if (game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban")) then
                    v529:SetDesc("Elite Boss: ✅️ | Killed:  " .. game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress"));
                else
                    v529:SetDesc("Elite Boss: ❌️ | Killed: " .. game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress"));
                end
            end);
        end
    end);
    local v530 = v16.Main:AddToggle("ToggleElite", {
        Title = "Đấm Elite",
        Description = "",
        Default = false
    });
    v530:OnChanged(function(v638)
        _G.AutoElite = v638;
    end);
    v17.ToggleElite:SetValue(false);
    spawn(function()
        while task.wait() do
            if _G.AutoElite then
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter");
                    if (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true) then
                        if (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban")) then
                            if (game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban")) then
                                for v1663, v1664 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if (v1664:FindFirstChild("Humanoid") and v1664:FindFirstChild("HumanoidRootPart") and (v1664.Humanoid.Health > 0)) then
                                        if ((v1664.Name == "Diablo") or (v1664.Name == "Deandre") or (v1664.Name == "Urban")) then
                                            repeat
                                                wait(_G.Fast_Delay);
                                                AttackNoCoolDown();
                                                EquipTool(SelectWeapon);
                                                AutoHaki();
                                                Tween2(v1664.HumanoidRootPart.CFrame * Pos);
                                                v1664.Humanoid.WalkSpeed = 0;
                                                v1664.HumanoidRootPart.CanCollide = false;
                                                v1664.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                            until (_G.AutoElite == false) or (v1664.Humanoid.Health <= 0) or not v1664.Parent
                                        end
                                    end
                                end
                            elseif game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                                Tween2(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                            elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                                Tween2(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                            elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                                Tween2(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                            end
                        end
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter");
                    end
                end);
            end
        end
    end);
end
if Sea3 then
    local v531 = v16.Sea:AddSection("Đảo Bí Ẩn");
    local v532 = v16.Sea:AddParagraph({
        Title = "Trạng Thái",
        Content = ""
    });
    task.spawn(function()
        while task.wait() do
            pcall(function()
                local v793 = game:GetService("Lighting").Sky.MoonTextureId;
                if (v793 == "http://www.roblox.com/asset/?id=9709149431") then
                    FullMoonStatus = "100%";
                elseif (v793 == "http://www.roblox.com/asset/?id=9709149052") then
                    FullMoonStatus = "75%";
                elseif (v793 == "http://www.roblox.com/asset/?id=9709143733") then
                    FullMoonStatus = "50%";
                elseif (v793 == "http://www.roblox.com/asset/?id=9709150401") then
                    FullMoonStatus = "25%";
                elseif (v793 == "http://www.roblox.com/asset/?id=9709149680") then
                    FullMoonStatus = "15%";
                else
                    FullMoonStatus = "0%";
                end
            end);
        end
    end);
    task.spawn(function()
        while task.wait() do
            pcall(function()
                if game.Workspace.Map:FindFirstChild("MysticIsland") then
                    MirageStatus = "✅️";
                else
                    MirageStatus = "❌️";
                end
            end);
        end
    end);
    spawn(function()
        pcall(function()
            while wait() do
                v532:SetDesc("Đảo Bí Ẩn: " .. MirageStatus .. " | Trăng Tròn: " .. FullMoonStatus);
            end
        end);
    end);
    v16.Sea:AddButton({
        Title = "Bay Đến Chỗ Cao",
        Description = "",
        Callback = function()
            TweenToHighestPoint();
        end
    });
    function TweenToHighestPoint()
        local v639 = getHighestPoint();
        if v639 then
            Tween2(v639.CFrame * CFrame.new(0, 211.88, 0));
        end
    end
    function getHighestPoint()
        if not game.Workspace.Map:FindFirstChild("MysticIsland") then
            return nil;
        end
        for v728, v729 in pairs(game:GetService("Workspace").Map.MysticIsland:GetDescendants()) do
            if v729:IsA("MeshPart") then
                if (v729.MeshId == "rbxassetid://6745037796") then
                    return v729;
                end
            end
        end
    end
end
local v66 = v16.Sea:AddToggle("ToggleTpAdvanced", {
    Title = "Bay Đến Advanced Fruit Dealer",
    Description = "",
    Default = false
});
v66:OnChanged(function(v257)
    _G.AutoTpAdvanced = v257;
end);
spawn(function()
    while wait() do
        if _G.AutoTpAdvanced then
            local v730 = game.ReplicatedStorage.NPCs:FindFirstChild("Advanced Fruit Dealer");
            if (v730 and v730:IsA("Model")) then
                local v856 = v730.PrimaryPart and v730.PrimaryPart.Position ;
                if v856 then
                    Tween2(CFrame.new(v856));
                end
            end
        end
    end
end);
local v67 = v16.Sea:AddToggle("ToggleTweenGear", {
    Title = "Bay Đến Bánh Răng",
    Description = "",
    Default = false
});
v67:OnChanged(function(v258)
    _G.TweenToGear = v258;
end);
v17.ToggleTweenGear:SetValue(false);
spawn(function()
    pcall(function()
        while wait() do
            if _G.TweenToGear then
                if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                    for v1040, v1041 in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
                        if v1041:IsA("MeshPart") then
                            if (v1041.Material == Enum.Material.Neon) then
                                Tween2(v1041.CFrame);
                            end
                        end
                    end
                end
            end
        end
    end);
end);
local v68 = v16.Sea:AddToggle("Togglelockmoon", {
    Title = "Nhìn Trăng Và Dùng Tộc",
    Description = "",
    Default = false
});
v68:OnChanged(function(v259)
    _G.AutoLockMoon = v259;
end);
v17.Togglelockmoon:SetValue(false);
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoLockMoon then
                local v794 = game.Lighting:GetMoonDirection();
                local v795 = game.Workspace.CurrentCamera.CFrame.p + (v794 * 100) ;
                game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, v795);
            end
        end);
    end
end);
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoLockMoon then
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility");
            end
        end);
    end
end);
local v69 = v16.ITM:AddToggle("ToggleAutoSaber", {
    Title = "Saber",
    Description = "",
    Default = false
});
v69:OnChanged(function(v260)
    _G.Auto_Saber = v260;
end);
v17.ToggleAutoSaber:SetValue(false);
spawn(function()
    while task.wait() do
        if (_G.Auto_Saber and (game.Players.LocalPlayer.Data.Level.Value >= 200)) then
            pcall(function()
                if (game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0) then
                    if (game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0) then
                        if ((CFrame.new(- 1612.55884, 36.9774132, 148.719543, 0.37091279, 3.071715e-9, - 0.928667724, 3.970995e-8, 1, 1.9167935e-8, 0.928667724, - 4.398698e-8, 0.37091279).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100) then
                            Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame);
                            wait(1);
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame;
                            wait(1);
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame;
                            wait(1);
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame;
                            wait(1);
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame;
                            wait(1);
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame;
                            wait(1);
                        else
                            Tween(CFrame.new(- 1612.55884, 36.9774132, 148.719543, 0.37091279, 3.071715e-9, - 0.928667724, 3.970995e-8, 1, 1.9167935e-8, 0.928667724, - 4.398698e-8, 0.37091279));
                        end
                    elseif (game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0) then
                        if (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch")) then
                            EquipTool("Torch");
                            Tween(CFrame.new(1114.61475, 5.04679728, 4350.22803, - 0.648466587, - 1.2879909e-9, 0.761243105, - 5.706529e-10, 1, 1.2058454e-9, - 0.761243105, 3.4754488e-10, - 0.648466587));
                        else
                            Tween(CFrame.new(- 1610.00757, 11.5049858, 164.001587, 0.984807551, - 0.167722285, - 0.0449818149, 0.17364943, 0.951244235, 0.254912198, 0.00003423728, - 0.258850515, 0.965917408));
                        end
                    elseif (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan") ~= 0) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup");
                        wait(0.5);
                        EquipTool("Cup");
                        wait(0.5);
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "FillCup", game:GetService("Players").LocalPlayer.Character.Cup);
                        wait(0);
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan");
                    elseif (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == nil) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon");
                    elseif (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 0) then
                        if (game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") or game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader")) then
                            Tween(CFrame.new(- 2967.59521, - 4.91089821, 5328.70703, 0.342208564, - 0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, - 0.939287126, 0.0184739735, 0.342634559));
                            for v1799, v1800 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if (v1800.Name == "Mob Leader") then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") then
                                        if (v1800:FindFirstChild("Humanoid") and v1800:FindFirstChild("HumanoidRootPart") and (v1800.Humanoid.Health > 0)) then
                                            repeat
                                                task.wait(_G.Fast_Delay);
                                                AutoHaki();
                                                EquipTool(SelectWeapon);
                                                v1800.HumanoidRootPart.CanCollide = false;
                                                v1800.Humanoid.WalkSpeed = 0;
                                                v1800.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                                Tween(v1800.HumanoidRootPart.CFrame * Pos);
                                                AttackNoCoolDown();
                                            until (v1800.Humanoid.Health <= 0) or not _G.Auto_Saber
                                        end
                                    end
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
                                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                                    end
                                end
                            end
                        end
                    elseif (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 1) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon");
                        wait(0.5);
                        EquipTool("Relic");
                        wait(0.5);
                        Tween(CFrame.new(- 1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.6690688e-9, 0.481375456, 2.53852e-8, 1, - 5.799956e-8, - 0.481375456, 6.3057264e-8, 0.876514494));
                    end
                elseif (game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert")) then
                    for v1460, v1461 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v1461:FindFirstChild("Humanoid") and v1461:FindFirstChild("HumanoidRootPart") and (v1461.Humanoid.Health > 0)) then
                            if (v1461.Name == "Saber Expert") then
                                repeat
                                    task.wait(_G.Fast_Delay);
                                    EquipTool(SelectWeapon);
                                    Tween(v1461.HumanoidRootPart.CFrame * Pos);
                                    v1461.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                    v1461.HumanoidRootPart.Transparency = 1;
                                    v1461.Humanoid.JumpPower = 0;
                                    v1461.Humanoid.WalkSpeed = 0;
                                    v1461.HumanoidRootPart.CanCollide = false;
                                    bringmob = true;
                                    FarmPos = v1461.HumanoidRootPart.CFrame;
                                    MonFarm = v1461.Name;
                                    AttackNoCoolDown();
                                until (v1461.Humanoid.Health <= 0) or not _G.Auto_Saber
                                bringmob = true;
                                if (v1461.Humanoid.Health <= 0) then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic");
                                end
                            end
                        end
                    end
                end
            end);
        end
    end
end);
local v70 = v16.ITM:AddToggle("ToggleAutoPoleV1", {
    Title = "Pole V1",
    Description = "",
    Default = false
});
v70:OnChanged(function(v261)
    _G.Auto_PoleV1 = v261;
end);
v17.ToggleAutoPoleV1:SetValue(false);
local v71 = CFrame.new(- 7748.0185546875, 5606.80615234375, - 2305.898681640625);
spawn(function()
    while wait() do
        if _G.Auto_PoleV1 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Thunder God") then
                    for v1042, v1043 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v1043.Name == "Thunder God") then
                            if (v1043:FindFirstChild("Humanoid") and v1043:FindFirstChild("HumanoidRootPart") and (v1043.Humanoid.Health > 0)) then
                                repeat
                                    task.wait(_G.Fast_Delay);
                                    AutoHaki();
                                    EquipTool(SelectWeapon);
                                    v1043.HumanoidRootPart.CanCollide = false;
                                    v1043.Humanoid.WalkSpeed = 0;
                                    v1043.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                    Tween(v1043.HumanoidRootPart.CFrame * Pos);
                                    AttackNoCoolDown();
                                until not _G.Auto_PoleV1 or not v1043.Parent or (v1043.Humanoid.Health <= 0)
                            end
                        end
                    end
                elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v71.Position).Magnitude < 1500) then
                    Tween(v71);
                end
                Tween(CFrame.new(- 7748.0185546875, 5606.80615234375, - 2305.898681640625));
                if game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                end
            end);
        end
    end
end);
local v72 = v16.ITM:AddToggle("ToggleAutoSaw", {
    Title = "Cưa Cá Mập",
    Description = "",
    Default = false
});
v72:OnChanged(function(v262)
    _G.Auto_Saw = v262;
end);
v17.ToggleAutoSaw:SetValue(false);
local v71 = CFrame.new(- 690.33081054688, 15.09425163269, 1582.2380371094);
spawn(function()
    while wait() do
        if _G.Auto_Saw then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("The Saw") then
                    for v1044, v1045 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v1045.Name == "The Saw") then
                            if (v1045:FindFirstChild("Humanoid") and v1045:FindFirstChild("HumanoidRootPart") and (v1045.Humanoid.Health > 0)) then
                                repeat
                                    task.wait(_G.Fast_Delay);
                                    AutoHaki();
                                    EquipTool(SelectWeapon);
                                    v1045.HumanoidRootPart.CanCollide = false;
                                    v1045.Humanoid.WalkSpeed = 0;
                                    v1045.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                    Tween(v1045.HumanoidRootPart.CFrame * Pos);
                                    AttackNoCoolDown();
                                until not _G.Auto_Saw or not v1045.Parent or (v1045.Humanoid.Health <= 0)
                            end
                        end
                    end
                elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v71.Position).Magnitude < 1500) then
                    Tween(v71);
                end
                Tween(CFrame.new(- 690.33081054688, 15.09425163269, 1582.2380371094));
                if game:GetService("ReplicatedStorage"):FindFirstChild("The Saw") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("The Saw").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                end
            end);
        end
    end
end);
local v73 = v16.ITM:AddToggle("ToggleAutoWarden", {
    Title = "Kiếm Quản Ngục",
    Description = "",
    Default = false
});
v73:OnChanged(function(v263)
    _G.Auto_Warden = v263;
end);
v17.ToggleAutoWarden:SetValue(false);
local v74 = CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976562);
spawn(function()
    while wait() do
        if _G.Auto_Warden then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Chief Warden") then
                    for v1046, v1047 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v1047.Name == "Chief Warden") then
                            if (v1047:FindFirstChild("Humanoid") and v1047:FindFirstChild("HumanoidRootPart") and (v1047.Humanoid.Health > 0)) then
                                repeat
                                    task.wait(_G.Fast_Delay);
                                    AutoHaki();
                                    EquipTool(SelectWeapon);
                                    v1047.HumanoidRootPart.CanCollide = false;
                                    v1047.Humanoid.WalkSpeed = 0;
                                    v1047.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                    Tween(v1047.HumanoidRootPart.CFrame * Pos);
                                    AttackNoCoolDown();
                                until not _G.Auto_Warden or not v1047.Parent or (v1047.Humanoid.Health <= 0)
                            end
                        end
                    end
                elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v74.Position).Magnitude < 1500) then
                    Tween(v74);
                end
                Tween(CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976562));
                if game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                end
            end);
        end
    end
end);
if Sea3 then
    local v533 = v16.ITM:AddToggle("ToggleHallow", {
        Title = "Lưỡi Hái",
        Description = "",
        Default = false
    });
    v533:OnChanged(function(v640)
        AutoHallowSycthe = v640;
    end);
    v17.ToggleHallow:SetValue(false);
    spawn(function()
        while wait() do
            if AutoHallowSycthe then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                        for v1462, v1463 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if string.find(v1463.Name, "Soul Reaper") then
                                repeat
                                    wait(_G.Fast_Delay);
                                    AttackNoCoolDown();
                                    AutoHaki();
                                    EquipTool(SelectWeapon);
                                    v1463.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                    Tween(v1463.HumanoidRootPart.CFrame * Pos);
                                    v1463.HumanoidRootPart.Transparency = 1;
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
                                until (v1463.Humanoid.Health <= 0) or (AutoHallowSycthe == false)
                            end
                        end
                    elseif (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hallow Essence")) then
                        repeat
                            Tween(CFrame.new(- 8932.322265625, 146.83154296875, 6062.55078125));
                            wait();
                        until (CFrame.new(- 8932.322265625, 146.83154296875, 6062.55078125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8
                        wait();
                        EquipTool("Hallow Essence");
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                    else
                    end
                end);
            end
        end
    end);
    spawn(function()
        while wait() do
            if AutoHallowSycthe then
                local v857 = {
                    [1] = "Bones",
                    [2] = "Buy",
                    [3] = 1,
                    [4] = 1
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v857));
            end
        end
    end);
    local v534 = v16.ITM:AddToggle("ToggleYama", {
        Title = "Yama",
        Description = "",
        Default = false
    });
    v534:OnChanged(function(v641)
        _G.AutoYama = v641;
    end);
    v17.ToggleYama:SetValue(false);
    spawn(function()
        while wait() do
            if _G.AutoYama then
                if (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress") >= 30) then
                    repeat
                        wait();
                        fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector);
                    until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or not _G.AutoYama
                end
            end
        end
    end);
    local v535 = v16.ITM:AddToggle("ToggleTushita", {
        Title = "Tushita",
        Description = "",
        Default = false
    });
    v535:OnChanged(function(v642)
        AutoTushita = v642;
    end);
    v17.ToggleTushita:SetValue(false);
    spawn(function()
        while wait() do
            if AutoTushita then
                if game:GetService("Workspace").Enemies:FindFirstChild("Longma") then
                    for v1340, v1341 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if ((v1341.Name == ("Longma" or (v1341.Name == "Longma"))) and (v1341.Humanoid.Health > 0) and v1341:IsA("Model") and v1341:FindFirstChild("Humanoid") and v1341:FindFirstChild("HumanoidRootPart")) then
                            repeat
                                wait(_G.Fast_Delay);
                                AttackNoCoolDown();
                                AutoHaki();
                                if not game.Players.LocalPlayer.Character:FindFirstChild(SelectWeapon) then
                                    wait();
                                    EquipTool(SelectWeapon);
                                end
                                FarmPos = v1341.HumanoidRootPart.CFrame;
                                v1341.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                v1341.Humanoid.JumpPower = 0;
                                v1341.Humanoid.WalkSpeed = 0;
                                v1341.HumanoidRootPart.CanCollide = false;
                                v1341.Humanoid:ChangeState(11);
                                Tween(v1341.HumanoidRootPart.CFrame * Pos);
                            until not AutoTushita or not v1341.Parent or (v1341.Humanoid.Health <= 0)
                        end
                    end
                else
                    Tween(CFrame.new(- 10238.875976563, 389.7912902832, - 9549.7939453125));
                end
            end
        end
    end);
    local v536 = v16.ITM:AddToggle("ToggleHoly", {
        Title = "Đốt Đuốc",
        Description = "",
        Default = false
    });
    v536:OnChanged(function(v643)
        _G.Auto_Holy_Torch = v643;
    end);
    v17.ToggleHoly:SetValue(false);
    spawn(function()
        while wait() do
            if _G.Auto_Holy_Torch then
                pcall(function()
                    wait();
                    repeat
                        Tween(CFrame.new(- 10752, 417, - 9366));
                        wait();
                    until not _G.Auto_Holy_Torch or ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 10752, 417, - 9366)).Magnitude <= 10)
                    wait();
                    repeat
                        Tween(CFrame.new(- 11672, 334, - 9474));
                        wait();
                    until not _G.Auto_Holy_Torch or ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 11672, 334, - 9474)).Magnitude <= 10)
                    wait();
                    repeat
                        Tween(CFrame.new(- 12132, 521, - 10655));
                        wait();
                    until not _G.Auto_Holy_Torch or ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 12132, 521, - 10655)).Magnitude <= 10)
                    wait();
                    repeat
                        Tween(CFrame.new(- 13336, 486, - 6985));
                        wait();
                    until not _G.Auto_Holy_Torch or ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 13336, 486, - 6985)).Magnitude <= 10)
                    wait();
                    repeat
                        Tween(CFrame.new(- 13489, 332, - 7925));
                        wait();
                    until not _G.Auto_Holy_Torch or ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 13489, 332, - 7925)).Magnitude <= 10)
                end);
            end
        end
    end);
end
local v75 = v16.ITM:AddToggle("ToggleAutoCanvander", {
    Title = "Canvander",
    Description = "",
    Default = false
});
v75:OnChanged(function(v264)
    _G.Auto_Canvander = v264;
end);
v17.ToggleAutoCanvander:SetValue(false);
local v71 = CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875);
spawn(function()
    while wait() do
        if _G.Auto_Canvander then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
                    for v1048, v1049 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v1049.Name == "Beautiful Pirate") then
                            if (v1049:FindFirstChild("Humanoid") and v1049:FindFirstChild("HumanoidRootPart") and (v1049.Humanoid.Health > 0)) then
                                repeat
                                    task.wait(_G.Fast_Delay);
                                    AutoHaki();
                                    EquipTool(SelectWeapon);
                                    v1049.HumanoidRootPart.CanCollide = false;
                                    v1049.Humanoid.WalkSpeed = 0;
                                    v1049.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                    Tween(v1049.HumanoidRootPart.CFrame * Pos);
                                    AttackNoCoolDown();
                                until not _G.Auto_Canvander or not v1049.Parent or (v1049.Humanoid.Health <= 0)
                            end
                        end
                    end
                elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v71.Position).Magnitude < 1500) then
                    Tween(v71);
                end
                Tween(CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875));
                if game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                end
            end);
        end
    end
end);
local v76 = v16.ITM:AddToggle("ToggleAutoMusketeerHat", {
    Title = "Mũ Lính Ngự Lâm",
    Description = "",
    Default = false
});
v76:OnChanged(function(v265)
    _G.Auto_MusketeerHat = v265;
end);
v17.ToggleAutoMusketeerHat:SetValue(false);
spawn(function()
    pcall(function()
        while wait(0.1) do
            if _G.Auto_MusketeerHat then
                if ((game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800) and (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits == false)) then
                    if (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true)) then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate") then
                            for v1559, v1560 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if (v1560.Name == "Forest Pirate") then
                                    repeat
                                        task.wait(_G.Fast_Delay);
                                        pcall(function()
                                            EquipTool(SelectWeapon);
                                            AutoHaki();
                                            v1560.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                            Tween(v1560.HumanoidRootPart.CFrame * Pos);
                                            v1560.HumanoidRootPart.CanCollide = false;
                                            AttackNoCoolDown();
                                            PosMon = v1560.HumanoidRootPart.CFrame;
                                            MonFarm = v1560.Name;
                                            bringmob = true;
                                        end);
                                    until (_G.Auto_MusketeerHat == false) or not v1560.Parent or (v1560.Humanoid.Health <= 0) or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false)
                                    bringmob = false;
                                end
                            end
                        else
                            bringmob = false;
                            Tween(CFrame.new(- 13206.452148438, 425.89199829102, - 7964.5537109375));
                        end
                    else
                        Tween(CFrame.new(- 12443.8671875, 332.40396118164, - 7675.4892578125));
                        if ((Vector3.new(- 12443.8671875, 332.40396118164, - 7675.4892578125) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30) then
                            wait(1.5);
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1);
                        end
                    end
                elseif ((game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800) and (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss == false)) then
                    if (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true)) then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                            for v1665, v1666 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if (v1666.Name == "Captain Elephant") then
                                    OldCFrameElephant = v1666.HumanoidRootPart.CFrame;
                                    repeat
                                        task.wait(_G.Fast_Delay);
                                        pcall(function()
                                            EquipTool(SelectWeapon);
                                            AutoHaki();
                                            v1666.HumanoidRootPart.CanCollide = false;
                                            v1666.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                            Tween(v1666.HumanoidRootPart.CFrame * Pos);
                                            v1666.HumanoidRootPart.CanCollide = false;
                                            v1666.HumanoidRootPart.CFrame = OldCFrameElephant;
                                            AttackNoCoolDown();
                                        end);
                                    until (_G.Auto_MusketeerHat == false) or (v1666.Humanoid.Health <= 0) or not v1666.Parent or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false)
                                end
                            end
                        else
                            Tween(CFrame.new(- 13374.889648438, 421.27752685547, - 8225.208984375));
                        end
                    else
                        Tween(CFrame.new(- 12443.8671875, 332.40396118164, - 7675.4892578125));
                        if ((CFrame.new(- 12443.8671875, 332.40396118164, - 7675.4892578125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4) then
                            wait(1.5);
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen");
                        end
                    end
                elseif ((game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800) and (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 2)) then
                    Tween(CFrame.new(- 12512.138671875, 340.39279174805, - 9872.8203125));
                end
            end
        end
    end);
end);
local v77 = v16.ITM:AddToggle("ToggleAutoObservationV2", {
    Title = "Haki Quan Sát V2",
    Description = "",
    Default = false
});
v77:OnChanged(function(v266)
    _G.Auto_ObservationV2 = v266;
end);
v17.ToggleAutoObservationV2:SetValue(false);
spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_ObservationV2 then
                if (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 3) then
                    _G.Auto_MusketeerHat = false;
                    if (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Banana") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Apple") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pineapple")) then
                        repeat
                            Tween(CFrame.new(- 12444.78515625, 332.40396118164, - 7673.1806640625));
                            wait();
                        until not _G.Auto_ObservationV2 or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 12444.78515625, 332.40396118164, - 7673.1806640625)).Magnitude <= 10)
                        wait(0.5);
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen");
                    elseif (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fruit Bowl")) then
                        repeat
                            Tween(CFrame.new(- 10920.125, 624.20275878906, - 10266.995117188));
                            wait();
                        until not _G.Auto_ObservationV2 or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 10920.125, 624.20275878906, - 10266.995117188)).Magnitude <= 10)
                        wait(0.5);
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Start");
                        wait(1);
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Buy");
                    else
                        for v1561, v1562 in pairs(game:GetService("Workspace"):GetDescendants()) do
                            if ((v1562.Name == "Apple") or (v1562.Name == "Banana") or (v1562.Name == "Pineapple")) then
                                v1562.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10) ;
                                wait();
                                firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, v1562.Handle, 0);
                                wait();
                            end
                        end
                    end
                else
                    _G.Auto_MusketeerHat = true;
                end
            end
        end);
    end
end);
local v78 = v16.ITM:AddToggle("ToggleAutoRainbowHaki", {
    Title = "Haki 7 Màu",
    Description = "",
    Default = false
});
v78:OnChanged(function(v267)
    _G.Auto_RainbowHaki = v267;
end);
v17.ToggleAutoRainbowHaki:SetValue(false);
spawn(function()
    pcall(function()
        while wait(0.1) do
            if _G.Auto_RainbowHaki then
                if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible then
                    Tween(CFrame.new(- 11892.0703125, 930.57672119141, - 8760.1591796875));
                    if ((Vector3.new(- 11892.0703125, 930.57672119141, - 8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30) then
                        wait(1.5);
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet");
                    end
                elseif (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone")) then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Stone") then
                        for v1563, v1564 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1564.Name == "Stone") then
                                OldCFrameRainbow = v1564.HumanoidRootPart.CFrame;
                                repeat
                                    task.wait(_G.Fast_Delay);
                                    EquipTool(SelectWeapon);
                                    Tween(v1564.HumanoidRootPart.CFrame * Pos);
                                    v1564.HumanoidRootPart.CanCollide = false;
                                    v1564.HumanoidRootPart.CFrame = OldCFrameRainbow;
                                    v1564.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                    AttackNoCoolDown();
                                until not _G.Auto_RainbowHaki or (v1564.Humanoid.Health <= 0) or not v1564.Parent or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                            end
                        end
                    else
                        Tween(CFrame.new(- 1086.11621, 38.8425903, 6768.71436));
                    end
                elseif (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Hydra Leader")) then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Hydra Leader") then
                        for v1669, v1670 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1670.Name == "Hydra Leader") then
                                OldCFrameRainbow = v1670.HumanoidRootPart.CFrame;
                                repeat
                                    task.wait(_G.Fast_Delay);
                                    EquipTool(SelectWeapon);
                                    Tween(v1670.HumanoidRootPart.CFrame * Pos);
                                    v1670.HumanoidRootPart.CanCollide = false;
                                    v1670.HumanoidRootPart.CFrame = OldCFrameRainbow;
                                    v1670.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                    AttackNoCoolDown();
                                until not _G.Auto_RainbowHaki or (v1670.Humanoid.Health <= 0) or not v1670.Parent or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                            end
                        end
                    else
                        Tween(CFrame.new(5713.98877, 601.922974, 202.751251));
                    end
                elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral") then
                        for v1762, v1763 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1763.Name == "Kilo Admiral") then
                                OldCFrameRainbow = v1763.HumanoidRootPart.CFrame;
                                repeat
                                    task.wait(_G.Fast_Delay);
                                    EquipTool(SelectWeapon);
                                    Tween(v1763.HumanoidRootPart.CFrame * Pos);
                                    v1763.HumanoidRootPart.CanCollide = false;
                                    v1763.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                    v1763.HumanoidRootPart.CFrame = OldCFrameRainbow;
                                    AttackNoCoolDown();
                                until not _G.Auto_RainbowHaki or (v1763.Humanoid.Health <= 0) or not v1763.Parent or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                            end
                        end
                    else
                        Tween(CFrame.new(2877.61743, 423.558685, - 7207.31006));
                    end
                elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                        for v1774, v1775 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1775.Name == "Captain Elephant") then
                                OldCFrameRainbow = v1775.HumanoidRootPart.CFrame;
                                repeat
                                    task.wait(_G.Fast_Delay);
                                    EquipTool(SelectWeapon);
                                    Tween(v1775.HumanoidRootPart.CFrame * Pos);
                                    v1775.HumanoidRootPart.CanCollide = false;
                                    v1775.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                    v1775.HumanoidRootPart.CFrame = OldCFrameRainbow;
                                    AttackNoCoolDown();
                                until not _G.Auto_RainbowHaki or (v1775.Humanoid.Health <= 0) or not v1775.Parent or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                            end
                        end
                    else
                        Tween(CFrame.new(- 13485.0283, 331.709259, - 8012.4873));
                    end
                elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
                        for v1802, v1803 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1803.Name == "Beautiful Pirate") then
                                OldCFrameRainbow = v1803.HumanoidRootPart.CFrame;
                                repeat
                                    task.wait(_G.Fast_Delay);
                                    EquipTool(SelectWeapon);
                                    Tween(v1803.HumanoidRootPart.CFrame * Pos);
                                    v1803.HumanoidRootPart.CanCollide = false;
                                    v1803.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                    v1803.HumanoidRootPart.CFrame = OldCFrameRainbow;
                                    AttackNoCoolDown();
                                until not _G.Auto_RainbowHaki or (v1803.Humanoid.Health <= 0) or not v1803.Parent or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                            end
                        end
                    else
                        Tween(CFrame.new(5312.3598632813, 20.141201019287, - 10.158538818359));
                    end
                else
                    Tween(CFrame.new(- 11892.0703125, 930.57672119141, - 8760.1591796875));
                    if ((Vector3.new(- 11892.0703125, 930.57672119141, - 8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30) then
                        wait(1.5);
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet");
                    end
                end
            end
        end
    end);
end);
local v79 = v16.ITM:AddToggle("ToggleAutoSkullGuitar", {
    Title = "Skull Guitar",
    Description = "",
    Default = false
});
v79:OnChanged(function(v268)
    _G.Auto_SkullGuitar = v268;
end);
v17.ToggleAutoSkullGuitar:SetValue(false);
spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_SkullGuitar then
                if (GetWeaponInventory("Skull Guitar") == false) then
                    if ((CFrame.new(- 9681.458984375, 6.139880657196045, 6341.3720703125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000) then
                        if game:GetService("Workspace").NPCs:FindFirstChild("Skeleton Machine") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy", true);
                        elseif (game:GetService("Workspace").Map["Haunted Castle"].Candle1.Transparency == 0) then
                            if (game:GetService("Workspace").Map["Haunted Castle"].Placard1.Left.Part.Transparency == 0) then
                                Quest2 = true;
                                repeat
                                    wait();
                                    Tween(CFrame.new(- 8762.69140625, 176.84783935546875, 6171.3076171875));
                                until ((CFrame.new(- 8762.69140625, 176.84783935546875, 6171.3076171875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) or not _G.Auto_SkullGuitar
                                wait(1);
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard7.Left.ClickDetector);
                                wait(1);
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard6.Left.ClickDetector);
                                wait(1);
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard5.Left.ClickDetector);
                                wait(1);
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard4.Right.ClickDetector);
                                wait(1);
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard3.Left.ClickDetector);
                                wait(1);
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard2.Right.ClickDetector);
                                wait(1);
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard1.Right.ClickDetector);
                                wait(1);
                            elseif game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment1:FindFirstChild("ClickDetector") then
                                if game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part1:FindFirstChild("ClickDetector") then
                                    Quest4 = true;
                                    repeat
                                        wait();
                                        Tween(CFrame.new(- 9553.5986328125, 65.62338256835938, 6041.58837890625));
                                    until ((CFrame.new(- 9553.5986328125, 65.62338256835938, 6041.58837890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) or not _G.Auto_SkullGuitar
                                    wait(1);
                                    Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector);
                                    wait(1);
                                    Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector);
                                    wait(1);
                                    Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector);
                                    wait(1);
                                    Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector);
                                    wait(1);
                                    Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector);
                                else
                                    Quest3 = true;
                                end
                            else
                                if game:GetService("Workspace").NPCs:FindFirstChild("Ghost") then
                                    local v1798 = {
                                        [1] = "GuitarPuzzleProgress",
                                        [2] = "Ghost"
                                    };
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1798));
                                end
                                if game.Workspace.Enemies:FindFirstChild("Living Zombie") then
                                    for v1804, v1805 in pairs(game.Workspace.Enemies:GetChildren()) do
                                        if (v1805:FindFirstChild("HumanoidRootPart") and v1805:FindFirstChild("Humanoid") and (v1805.Humanoid.Health > 0)) then
                                            if (v1805.Name == "Living Zombie") then
                                                EquipTool(SelectWeapon);
                                                v1805.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                                v1805.HumanoidRootPart.Transparency = 1;
                                                v1805.Humanoid.JumpPower = 0;
                                                v1805.Humanoid.WalkSpeed = 0;
                                                v1805.HumanoidRootPart.CanCollide = false;
                                                v1805.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0) ;
                                                Tween(CFrame.new(- 10160.787109375, 138.6616973876953, 5955.03076171875));
                                                game:GetService("VirtualUser"):CaptureController();
                                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672));
                                            end
                                        end
                                    end
                                else
                                    Tween(CFrame.new(- 10160.787109375, 138.6616973876953, 5955.03076171875));
                                end
                            end
                        elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2), "Error") then
                            Tween(CFrame.new(- 8653.2060546875, 140.98487854003906, 6160.033203125));
                        elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2), "Nothing") then
                            Tween("Wait Full Moon");
                        else
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true);
                        end
                    else
                        Tween(CFrame.new(- 9681.458984375, 6.139880657196045, 6341.3720703125));
                    end
                end
            end
        end);
    end
end);
local v80 = v16.ITM:AddToggle("ToggleAutoBuddy", {
    Title = "Kiếm Buddy",
    Description = "",
    Default = false
});
v80:OnChanged(function(v269)
    _G.Auto_Buddy = v269;
end);
v17.ToggleAutoBuddy:SetValue(false);
local v81 = CFrame.new(- 731.2034301757812, 381.5658874511719, - 11198.4951171875);
spawn(function()
    while wait() do
        if _G.Auto_Buddy then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
                    for v1050, v1051 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v1051.Name == "Cake Queen") then
                            if (v1051:FindFirstChild("Humanoid") and v1051:FindFirstChild("HumanoidRootPart") and (v1051.Humanoid.Health > 0)) then
                                repeat
                                    task.wait(_G.Fast_Delay);
                                    AutoHaki();
                                    EquipTool(SelectWeapon);
                                    v1051.HumanoidRootPart.CanCollide = false;
                                    v1051.Humanoid.WalkSpeed = 0;
                                    v1051.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                    Tween(v1051.HumanoidRootPart.CFrame * Pos);
                                    AttackNoCoolDown();
                                until not _G.Auto_Buddy or not v1051.Parent or (v1051.Humanoid.Health <= 0)
                            end
                        end
                    end
                elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v81.Position).Magnitude < 1500) then
                    Tween(v81);
                end
                Tween(CFrame.new(- 731.2034301757812, 381.5658874511719, - 11198.4951171875));
                if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                end
            end);
        end
    end
end);
local v82 = v16.ITM:AddToggle("ToggleAutoDualKatana", {
    Title = "Song Kiếm",
    Description = "",
    Default = false
});
v82:OnChanged(function(v270)
    _G.Auto_DualKatana = v270;
end);
v17.ToggleAutoDualKatana:SetValue(false);
spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_DualKatana then
                if (game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") or game.Players.LocalPlayer.Character:FindFirstChild("Yama") or game.Players.LocalPlayer.Backpack:FindFirstChild("Yama")) then
                    if (game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita")) then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") then
                            EquipTool("Tushita");
                        end
                    elseif (game.Players.LocalPlayer.Character:FindFirstChild("Yama") or game.Players.LocalPlayer.Backpack:FindFirstChild("Yama")) then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") then
                            EquipTool("Yama");
                        end
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem", "Tushita");
                end
            end
        end);
    end
end);
spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_DualKatana then
                if (GetMaterial("Alucard Fragment") == 0) then
                    Auto_Quest_Yama_1 = true;
                    Auto_Quest_Yama_2 = false;
                    Auto_Quest_Yama_3 = false;
                    Auto_Quest_Tushita_1 = false;
                    Auto_Quest_Tushita_2 = false;
                    Auto_Quest_Tushita_3 = false;
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil");
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil");
                elseif (GetMaterial("Alucard Fragment") == 1) then
                    Auto_Quest_Yama_1 = false;
                    Auto_Quest_Yama_2 = true;
                    Auto_Quest_Yama_3 = false;
                    Auto_Quest_Tushita_1 = false;
                    Auto_Quest_Tushita_2 = false;
                    Auto_Quest_Tushita_3 = false;
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil");
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil");
                elseif (GetMaterial("Alucard Fragment") == 2) then
                    Auto_Quest_Yama_1 = false;
                    Auto_Quest_Yama_2 = false;
                    Auto_Quest_Yama_3 = true;
                    Auto_Quest_Tushita_1 = false;
                    Auto_Quest_Tushita_2 = false;
                    Auto_Quest_Tushita_3 = false;
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil");
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil");
                elseif (GetMaterial("Alucard Fragment") == 3) then
                    Auto_Quest_Yama_1 = false;
                    Auto_Quest_Yama_2 = false;
                    Auto_Quest_Yama_3 = false;
                    Auto_Quest_Tushita_1 = true;
                    Auto_Quest_Tushita_2 = false;
                    Auto_Quest_Tushita_3 = false;
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good");
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good");
                elseif (GetMaterial("Alucard Fragment") == 4) then
                    Auto_Quest_Yama_1 = false;
                    Auto_Quest_Yama_2 = false;
                    Auto_Quest_Yama_3 = false;
                    Auto_Quest_Tushita_1 = false;
                    Auto_Quest_Tushita_2 = true;
                    Auto_Quest_Tushita_3 = false;
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good");
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good");
                elseif (GetMaterial("Alucard Fragment") == 5) then
                    Auto_Quest_Yama_1 = false;
                    Auto_Quest_Yama_2 = false;
                    Auto_Quest_Yama_3 = false;
                    Auto_Quest_Tushita_1 = false;
                    Auto_Quest_Tushita_2 = false;
                    Auto_Quest_Tushita_3 = true;
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good");
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good");
                elseif (GetMaterial("Alucard Fragment") == 6) then
                    if (game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") or game:GetService("Workspace").ReplicatedStorage:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]")) then
                        Auto_Quest_Yama_1 = false;
                        Auto_Quest_Yama_2 = false;
                        Auto_Quest_Yama_3 = false;
                        Auto_Quest_Tushita_1 = false;
                        Auto_Quest_Tushita_2 = false;
                        Auto_Quest_Tushita_3 = false;
                        if (game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]")) then
                            for v1842, v1843 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if ((v1843.Name == "Cursed Skeleton Boss") or (v1843.Name == "Cursed Skeleton")) then
                                    if (v1843.Humanoid.Health > 0) then
                                        EquipTool(Sword);
                                        Tween(v1843.HumanoidRootPart.CFrame * pos);
                                        v1843.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                        v1843.HumanoidRootPart.Transparency = 1;
                                        v1843.Humanoid.JumpPower = 0;
                                        v1843.Humanoid.WalkSpeed = 0;
                                        v1843.HumanoidRootPart.CanCollide = false;
                                        bringmob = true;
                                        FarmPos = v1843.HumanoidRootPart.CFrame;
                                        MonFarm = v1843.Name;
                                        AttackNoCoolDown();
                                    end
                                end
                            end
                        end
                    elseif ((CFrame.new(- 12361.7060546875, 603.3547973632812, - 6550.5341796875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good");
                        wait(1);
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil");
                        wait(1);
                        Tween(CFrame.new(- 12361.7060546875, 603.3547973632812, - 6550.5341796875));
                        wait(1.5);
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game);
                        wait(1.5);
                        Tween(CFrame.new(- 12253.5419921875, 598.8999633789062, - 6546.8388671875));
                    else
                        Tween(CFrame.new(- 12361.7060546875, 603.3547973632812, - 6550.5341796875));
                    end
                end
            end
        end);
    end
end);
spawn(function()
    while wait() do
        if Auto_Quest_Yama_1 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Mythological Pirate") then
                    for v1052, v1053 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v1053.Name == "Mythological Pirate") then
                            repeat
                                wait();
                                Tween(v1053.HumanoidRootPart.CFrame * CFrame.new(0, 0, - 2));
                            until (_G.Auto_DualKatana == false) or (Auto_Quest_Yama_1 == false)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil");
                        end
                    end
                else
                    Tween(CFrame.new(- 13451.46484375, 543.712890625, - 6961.0029296875));
                end
            end);
        end
    end
end);
spawn(function()
    while wait() do
        pcall(function()
            if Auto_Quest_Yama_2 then
                for v858, v859 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v859:FindFirstChild("HazeESP") then
                        v859.HazeESP.Size = UDim2.new(50, 50, 50, 50);
                        v859.HazeESP.MaxDistance = "inf";
                    end
                end
                for v860, v861 in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                    if v861:FindFirstChild("HazeESP") then
                        v861.HazeESP.Size = UDim2.new(50, 50, 50, 50);
                        v861.HazeESP.MaxDistance = "inf";
                    end
                end
            end
        end);
    end
end);
spawn(function()
    while wait() do
        pcall(function()
            for v731, v732 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if (Auto_Quest_Yama_2 and v732:FindFirstChild("HazeESP") and ((v732.HumanoidRootPart.Position - FarmPossEsp.Position).magnitude <= 300)) then
                    v732.HumanoidRootPart.CFrame = FarmPossEsp;
                    v732.HumanoidRootPart.CanCollide = false;
                    v732.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                    if not v732.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                        local v1058 = Instance.new("BodyVelocity", v732.HumanoidRootPart);
                        v1058.MaxForce = Vector3.new(1, 1, 1) * math.huge ;
                        v1058.Velocity = Vector3.new(0, 0, 0);
                    end
                end
            end
        end);
    end
end);
spawn(function()
    while wait() do
        if Auto_Quest_Yama_2 then
            pcall(function()
                for v865, v866 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v866:FindFirstChild("HazeESP") then
                        repeat
                            wait();
                            if ((v866.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000) then
                                Tween(v866.HumanoidRootPart.CFrame * Pos);
                            else
                                EquipTool(Sword);
                                Tween(v866.HumanoidRootPart.CFrame * Pos);
                                v866.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                v866.HumanoidRootPart.Transparency = 1;
                                v866.Humanoid.JumpPower = 0;
                                v866.Humanoid.WalkSpeed = 0;
                                v866.HumanoidRootPart.CanCollide = false;
                                FarmPos = v866.HumanoidRootPart.CFrame;
                                MonFarm = v866.Name;
                                AttackNoCoolDown();
                                if ((v866.Humanoid.Health <= 0) and v866.Humanoid:FindFirstChild("Animator")) then
                                    v866.Humanoid.Animator:Destroy();
                                end
                            end
                        until (_G.Auto_DualKatana == false) or (Auto_Quest_Yama_2 == false) or not v866.Parent or (v866.Humanoid.Health <= 0) or not v866:FindFirstChild("HazeESP")
                    else
                        for v1342, v1343 in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                            if v1343:FindFirstChild("HazeESP") then
                                if ((v1343.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000) then
                                    Tween(v1343.HumanoidRootPart.CFrameMon * CFrame.new(2, 20, 2));
                                else
                                    Tween(v1343.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                                end
                            end
                        end
                    end
                end
            end);
        end
    end
end);
spawn(function()
    while wait() do
        if Auto_Quest_Yama_3 then
            pcall(function()
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") then
                    Tween(game:GetService("Workspace").Map["Haunted Castle"].Summoner.Detection.CFrame);
                elseif game:GetService("Workspace").Map:FindFirstChild("HellDimension") then
                    repeat
                        wait();
                        if (game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Hell's Messenger [Lv. 2200] [Boss]")) then
                            for v1641, v1642 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if ((v1642.Name == "Cursed Skeleton") or (v1642.Name == "Cursed Skeleton") or (v1642.Name == "Hell's Messenger")) then
                                    if (v1642.Humanoid.Health > 0) then
                                        repeat
                                            wait();
                                            EquipTool(Sword);
                                            Tween(v1642.HumanoidRootPart.CFrame * Pos);
                                            v1642.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                            v1642.HumanoidRootPart.Transparency = 1;
                                            v1642.Humanoid.JumpPower = 0;
                                            v1642.Humanoid.WalkSpeed = 0;
                                            v1642.HumanoidRootPart.CanCollide = false;
                                            FarmPos = v1642.HumanoidRootPart.CFrame;
                                            MonFarm = v1642.Name;
                                            AttackNoCoolDown();
                                            if ((v1642.Humanoid.Health <= 0) and v1642.Humanoid:FindFirstChild("Animator")) then
                                                v1642.Humanoid.Animator:Destroy();
                                            end
                                        until (v1642.Humanoid.Health <= 0) or not v1642.Parent or (Auto_Quest_Yama_3 == false)
                                    end
                                end
                            end
                        else
                            wait(5);
                            Tween(game:GetService("Workspace").Map.HellDimension.Torch1.CFrame);
                            wait(1.5);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game);
                            wait(1.5);
                            Tweem(game:GetService("Workspace").Map.HellDimension.Torch2.CFrame);
                            wait(1.5);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game);
                            wait(1.5);
                            Tween(game:GetService("Workspace").Map.HellDimension.Torch3.CFrame);
                            wait(1.5);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game);
                            wait(1.5);
                            Tween(game:GetService("Workspace").Map.HellDimension.Exit.CFrame);
                        end
                    until (_G.Auto_DualKatana == false) or (Auto_Quest_Yama_3 == false) or (GetMaterial("Alucard Fragment") == 3)
                elseif (game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") or game.ReplicatedStorage:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]")) then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                        for v1671, v1672 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1672.Name == "Soul Reaper") then
                                if (v1672.Humanoid.Health > 0) then
                                    repeat
                                        wait();
                                        Tween(v1672.HumanoidRootPart.CFrame * Pos);
                                    until (_G.Auto_DualKatana == false) or (Auto_Quest_Yama_3 == false) or game:GetService("Workspace").Map:FindFirstChild("HellDimension")
                                end
                            end
                        end
                    else
                        Tween(CFrame.new(- 9570.033203125, 315.9346923828125, 6726.89306640625));
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1);
                end
            end);
        end
    end
end);
spawn(function()
    while wait() do
        if Auto_Quest_Tushita_1 then
            Tween(CFrame.new(- 9546.990234375, 21.139892578125, 4686.1142578125));
            wait(5);
            Tween(CFrame.new(- 6120.0576171875, 16.455780029296875, - 2250.697265625));
            wait(5);
            Tween(CFrame.new(- 9533.2392578125, 7.254445552825928, - 8372.69921875));
        end
    end
end);
spawn(function()
    while wait() do
        if Auto_Quest_Tushita_2 then
            pcall(function()
                if ((CFrame.new(- 5539.3115234375, 313.800537109375, - 2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500) then
                    for v1061, v1062 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (Auto_Quest_Tushita_2 and v1062:FindFirstChild("HumanoidRootPart") and v1062:FindFirstChild("Humanoid") and (v1062.Humanoid.Health > 0)) then
                            if ((v1062.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000) then
                                repeat
                                    wait();
                                    EquipTool(Sword);
                                    Tween(v1062.HumanoidRootPart.CFrame * Pos);
                                    v1062.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                    v1062.HumanoidRootPart.Transparency = 1;
                                    v1062.Humanoid.JumpPower = 0;
                                    v1062.Humanoid.WalkSpeed = 0;
                                    v1062.HumanoidRootPart.CanCollide = false;
                                    FarmPos = v1062.HumanoidRootPart.CFrame;
                                    MonFarm = v1062.Name;
                                    AttackNoCoolDown();
                                    if ((v1062.Humanoid.Health <= 0) and v1062.Humanoid:FindFirstChild("Animator")) then
                                        v1062.Humanoid.Animator:Destroy();
                                    end
                                until (v1062.Humanoid.Health <= 0) or not v1062.Parent or (Auto_Quest_Tushita_2 == false)
                            end
                        end
                    end
                else
                    Tween(CFrame.new(- 5545.1240234375, 313.800537109375, - 2976.616455078125));
                end
            end);
        end
    end
end);
spawn(function()
    while wait() do
        if Auto_Quest_Tushita_3 then
            pcall(function()
                if (game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") or game.ReplicatedStorage:FindFirstChild("Cake Queen [Lv. 2175] [Boss]")) then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
                        for v1464, v1465 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1465.Name == "Cake Queen") then
                                if (v1465.Humanoid.Health > 0) then
                                    repeat
                                        wait();
                                        EquipTool(Sword);
                                        Tween(v1465.HumanoidRootPart.CFrame * Pos);
                                        v1465.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                        v1465.HumanoidRootPart.Transparency = 1;
                                        v1465.Humanoid.JumpPower = 0;
                                        v1465.Humanoid.WalkSpeed = 0;
                                        v1465.HumanoidRootPart.CanCollide = false;
                                        FarmPos = v1465.HumanoidRootPart.CFrame;
                                        MonFarm = v1465.Name;
                                        AttackNoCoolDown();
                                        if ((v1465.Humanoid.Health <= 0) and v1465.Humanoid:FindFirstChild("Animator")) then
                                            v1465.Humanoid.Animator:Destroy();
                                        end
                                    until (_G.Auto_DualKatana == false) or (Auto_Quest_Tushita_3 == false) or game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension")
                                end
                            end
                        end
                    else
                        Tween(CFrame.new(- 709.3132934570312, 381.6005859375, - 11011.396484375));
                    end
                elseif game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension") then
                    repeat
                        wait();
                        if (game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Heaven's Guardian [Lv. 2200] [Boss]")) then
                            for v1650, v1651 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if ((v1651.Name == "Cursed Skeleton") or (v1651.Name == "Cursed Skeleton") or (v1651.Name == "Heaven's Guardian")) then
                                    if (v1651.Humanoid.Health > 0) then
                                        repeat
                                            wait();
                                            EquipTool(Sword);
                                            Tween(v1651.HumanoidRootPart.CFrame * Pos);
                                            v1651.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                            v1651.HumanoidRootPart.Transparency = 1;
                                            v1651.Humanoid.JumpPower = 0;
                                            v1651.Humanoid.WalkSpeed = 0;
                                            v1651.HumanoidRootPart.CanCollide = false;
                                            FarmPos = v1651.HumanoidRootPart.CFrame;
                                            MonFarm = v1651.Name;
                                            AttackNoCoolDown();
                                            if ((v1651.Humanoid.Health <= 0) and v1651.Humanoid:FindFirstChild("Animator")) then
                                                v1651.Humanoid.Animator:Destroy();
                                            end
                                        until (v1651.Humanoid.Health <= 0) or not v1651.Parent or (Auto_Quest_Tushita_3 == false)
                                    end
                                end
                            end
                        else
                            wait(5);
                            Tween(game:GetService("Workspace").Map.HeavenlyDimension.Torch1.CFrame);
                            wait(1.5);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game);
                            wait(1.5);
                            Tween(game:GetService("Workspace").Map.HeavenlyDimension.Torch2.CFrame);
                            wait(1.5);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game);
                            wait(1.5);
                            Tween(game:GetService("Workspace").Map.HeavenlyDimension.Torch3.CFrame);
                            wait(1.5);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game);
                            wait(1.5);
                            Tween(game:GetService("Workspace").Map.HeavenlyDimension.Exit.CFrame);
                        end
                    until not _G.Auto_DualKatana or not Auto_Quest_Tushita_3 or (GetMaterial("Alucard Fragment") == 6)
                end
            end);
        end
    end
end);
if Sea2 then
    local v537 = v16.ITM:AddToggle("ToggleFactory", {
        Title = "Đấm Nhà Máy",
        Description = "",
        Default = false
    });
    v537:OnChanged(function(v644)
        _G.Factory = v644;
    end);
    v17.ToggleFactory:SetValue(false);
    spawn(function()
        while wait() do
            if _G.Factory then
                if game.Workspace.Enemies:FindFirstChild("Core") then
                    for v1344, v1345 in pairs(game.Workspace.Enemies:GetChildren()) do
                        if ((v1345.Name == "Core") and (v1345.Humanoid.Health > 0)) then
                            repeat
                                wait(_G.Fast_Delay);
                                AttackNoCoolDown();
                                repeat
                                    Tween(CFrame.new(448.46756, 199.356781, - 441.389252));
                                    wait();
                                until not _G.Factory or ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(448.46756, 199.356781, - 441.389252)).Magnitude <= 10)
                                EquipTool(SelectWeapon);
                                AutoHaki();
                                Tween(v1345.HumanoidRootPart.CFrame * Pos);
                                v1345.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                v1345.HumanoidRootPart.Transparency = 1;
                                v1345.Humanoid.JumpPower = 0;
                                v1345.Humanoid.WalkSpeed = 0;
                                v1345.HumanoidRootPart.CanCollide = false;
                                FarmPos = v1345.HumanoidRootPart.CFrame;
                                MonFarm = v1345.Name;
                            until not v1345.Parent or (v1345.Humanoid.Health <= 0) or (_G.Factory == false)
                        end
                    end
                elseif game.ReplicatedStorage:FindFirstChild("Core") then
                    repeat
                        Tween(CFrame.new(448.46756, 199.356781, - 441.389252));
                        wait();
                    until not _G.Factory or ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(448.46756, 199.356781, - 441.389252)).Magnitude <= 10)
                end
            end
        end
    end);
end
local v83 = v16.ITM:AddToggle("ToggleAutoFarmSwan", {
    Title = "Đấm Swan",
    Description = "",
    Default = false
});
v83:OnChanged(function(v271)
    _G.Auto_FarmSwan = v271;
end);
v17.ToggleAutoFarmSwan:SetValue(false);
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoFarmSwan then
                if game:GetService("Workspace").Enemies:FindFirstChild("Don Swan") then
                    for v1063, v1064 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if ((v1064.Name == "Don Swan") and (v1064.Humanoid.Health > 0) and v1064:IsA("Model") and v1064:FindFirstChild("Humanoid") and v1064:FindFirstChild("HumanoidRootPart")) then
                            repeat
                                task.wait();
                                pcall(function()
                                    AutoHaki();
                                    EquipTool(SelectWeapon);
                                    v1064.HumanoidRootPart.CanCollide = false;
                                    v1064.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                    Tween(v1064.HumanoidRootPart.CFrame * Pos);
                                    AttackNoCoolDown();
                                end);
                            until (_G.AutoFarmSwan == false) or (v1064.Humanoid.Health <= 0)
                        end
                    end
                else
                    repeat
                        task.wait();
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2284.912109375, 15.537666320801, 905.48291015625));
                    until ((CFrame.new(2284.912109375, 15.537666320801, 905.48291015625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4) or (_G.AutoFarmSwan == false)
                end
            end
        end
    end);
end);
local v84 = v16.ITM:AddToggle("ToggleAutoRengoku", {
    Title = "Rengoku",
    Description = "",
    Default = false
});
v84:OnChanged(function(v272)
    _G.Auto_Regoku = v272;
end);
v17.ToggleAutoRengoku:SetValue(false);
spawn(function()
    pcall(function()
        while wait() do
            if _G.Auto_Regoku then
                if (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hidden Key")) then
                    EquipTool("Hidden Key");
                    Tween(CFrame.new(6571.1201171875, 299.23028564453, - 6967.841796875));
                elseif (game:GetService("Workspace").Enemies:FindFirstChild("Snow Lurker") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior")) then
                    for v1466, v1467 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (((v1467.Name == "Snow Lurker") or (v1467.Name == "Arctic Warrior")) and (v1467.Humanoid.Health > 0)) then
                            repeat
                                task.wait(_G.Fast_Delay);
                                EquipTool(SelectWeapon);
                                AutoHaki();
                                v1467.HumanoidRootPart.CanCollide = false;
                                v1467.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                FarmPos = v1467.HumanoidRootPart.CFrame;
                                MonFarm = v1467.Name;
                                Tween(v1467.HumanoidRootPart.CFrame * Pos);
                                AttackNoCoolDown();
                                bringmob = true;
                            until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or (_G.Auto_Regoku == false) or not v1467.Parent or (v1467.Humanoid.Health <= 0)
                            bringmob = false;
                        end
                    end
                else
                    bringmob = false;
                    Tween(CFrame.new(5439.716796875, 84.420944213867, - 6715.1635742188));
                end
            end
        end
    end);
end);
if (Sea2 or Sea3) then
    local v538 = v16.ITM:AddToggle("ToggleHakiColor", {
        Title = "Mua Màu Haki",
        Description = "",
        Default = false
    });
    v538:OnChanged(function(v645)
        _G.Auto_Buy_Enchancement = v645;
    end);
    v17.ToggleHakiColor:SetValue(false);
    spawn(function()
        while wait() do
            if _G.Auto_Buy_Enchancement then
                local v867 = {
                    [1] = "ColorsDealer",
                    [2] = "2"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v867));
            end
        end
    end);
end
if Sea2 then
    local v539 = v16.Main:AddToggle("ToggleSwordLengend", {
        Title = "Mua Kiếm Huyền Thoại",
        Description = "",
        Default = false
    });
    v539:OnChanged(function(v646)
        _G.BuyLengendSword = v646;
    end);
    v17.ToggleSwordLengend:SetValue(false);
    spawn(function()
        while wait() do
            pcall(function()
                if (_G.BuyLengendSword or Triple_A) then
                    local v897 = {
                        [1] = "LegendarySwordDealer",
                        [2] = "2"
                    };
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v897));
                else
                    wait();
                end
            end);
        end
    end);
end
if Sea2 then
    local v540 = v16.Main:AddToggle("ToggleEvoRace", {
        Title = "Nâng Tộc V2",
        Description = "",
        Default = false
    });
    v540:OnChanged(function(v647)
        _G.AutoEvoRace = v647;
    end);
    v17.ToggleEvoRace:SetValue(false);
    spawn(function()
        pcall(function()
            while wait(0.1) do
                if _G.AutoEvoRace then
                    if not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
                        if (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 0) then
                            Tween(CFrame.new(- 2779.83521, 72.9661407, - 3574.02002, - 0.730484903, 6.390141e-8, - 0.68292886, 3.5996322e-8, 1, 5.5066703e-8, 0.68292886, 1.5642467e-8, - 0.730484903));
                            if ((Vector3.new(- 2779.83521, 72.9661407, - 3574.02002) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4) then
                                wait(1.3);
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "2");
                            end
                        elseif (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 1) then
                            pcall(function()
                                if (not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1")) then
                                    Tween(game:GetService("Workspace").Flower1.CFrame);
                                elseif (not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2")) then
                                    Tween(game:GetService("Workspace").Flower2.CFrame);
                                elseif (not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3")) then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Zombie") then
                                        for v1834, v1835 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if (v1835.Name == "Zombie") then
                                                repeat
                                                    task.wait(_G.Fast_Delay);
                                                    AutoHaki();
                                                    EquipTool(SelectWeapon);
                                                    Tween(v1835.HumanoidRootPart.CFrame * Pos);
                                                    v1835.HumanoidRootPart.CanCollide = false;
                                                    v1835.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                                    AttackNoCoolDown();
                                                    FarmPos = v1835.HumanoidRootPart.CFrame;
                                                    MonFarm = v1835.Name;
                                                    bringmob = true;
                                                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or not v1835.Parent or (v1835.Humanoid.Health <= 0) or (_G.AutoEvoRace == false)
                                                bringmob = false;
                                            end
                                        end
                                    else
                                        Tween(CFrame.new(- 5685.9233398438, 48.480125427246, - 853.23724365234));
                                    end
                                end
                            end);
                        elseif (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 2) then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3");
                        end
                    end
                end
            end
        end);
    end);
end
local v85 = v16.Setting:AddToggle("ToggleAutoT", {
    Title = "Bật Tộc V3",
    Description = "",
    Default = false
});
v85:OnChanged(function(v273)
    _G.AutoT = v273;
end);
v17.ToggleAutoT:SetValue(false);
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoT then
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility");
            end
        end);
    end
end);
local v86 = v16.Setting:AddToggle("ToggleAutoY", {
    Title = "Bật Tộc V4",
    Description = "",
    Default = false
});
v86:OnChanged(function(v274)
    _G.AutoY = v274;
end);
v17.ToggleAutoY:SetValue(false);
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoY then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game);
                wait();
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game);
            end
        end);
    end
end);
local v87 = v16.Setting:AddToggle("ToggleAutoKen", {
    Title = "Bật Haki Quan Sât",
    Description = "",
    Default = false
});
v87:OnChanged(function(v275)
    _G.AutoKen = v275;
    if v275 then
        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true);
    else
        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", false);
    end
end);
v17.ToggleAutoKen:SetValue(false);
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoKen then
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true);
            end
        end);
    end
end);
local v88 = v16.Setting:AddToggle("ToggleSaveSpawn", {
    Title = "Lưu Điểm Hồi Sinh",
    Description = "",
    Default = false
});
v88:OnChanged(function(v276)
    _G.SaveSpawn = v276;
    if v276 then
        local v648 = {
            [1] = "SetSpawnPoint"
        };
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v648));
    end
end);
v17.ToggleSaveSpawn:SetValue(false);
spawn(function()
    while wait() do
        pcall(function()
            if _G.SaveSpawn then
                local v797 = {
                    [1] = "SetSpawnPoint"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v797));
            end
        end);
    end
end);
local v89 = require(game.ReplicatedStorage.Util.CameraShaker);
v89:Stop();
local v90 = v16.Setting:AddToggle("ToggleBringMob", {
    Title = "Gom Quái",
    Description = "",
    Default = true
});
v90:OnChanged(function(v277)
    _G.BringMob = v277;
end);
v17.ToggleBringMob:SetValue(true);
spawn(function()
    while wait() do
        pcall(function()
            for v733, v734 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if (_G.BringMob and bringmob) then
                    if ((v734.Name == MonFarm) and v734:FindFirstChild("Humanoid") and (v734.Humanoid.Health > 0)) then
                        if (v734.Name == "Factory Staff") then
                            if ((v734.HumanoidRootPart.Position - FarmPos.Position).Magnitude <= 1000000000) then
                                v734.Head.CanCollide = false;
                                v734.HumanoidRootPart.CanCollide = false;
                                v734.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                v734.HumanoidRootPart.CFrame = FarmPos;
                                if v734.Humanoid:FindFirstChild("Animator") then
                                    v734.Humanoid.Animator:Destroy();
                                end
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
                            end
                        elseif (v734.Name == MonFarm) then
                            if ((v734.HumanoidRootPart.Position - FarmPos.Position).Magnitude <= 1000000000) then
                                v734.HumanoidRootPart.CFrame = FarmPos;
                                v734.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                v734.HumanoidRootPart.Transparency = 1;
                                v734.Humanoid.JumpPower = 0;
                                v734.Humanoid.WalkSpeed = 0;
                                if v734.Humanoid:FindFirstChild("Animator") then
                                    v734.Humanoid.Animator:Destroy();
                                end
                                v734.HumanoidRootPart.CanCollide = false;
                                v734.Head.CanCollide = false;
                                v734.Humanoid:ChangeState(11);
                                v734.Humanoid:ChangeState(14);
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
                            end
                        end
                    end
                end
            end
        end);
    end
end);
local v91 = v16.Setting:AddToggle("ToggleRemoveNotify", {
    Title = "Xóa Thông Báo",
    Description = "",
    Default = false
});
v91:OnChanged(function(v278)
    RemoveNotify = v278;
end);
v17.ToggleRemoveNotify:SetValue(false);
spawn(function()
    while wait() do
        if RemoveNotify then
            game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = false;
        else
            game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = true;
        end
    end
end);
local v92 = v16.Setting:AddToggle("ToggleWhite", {
    Title = "Màn Hình Trắng",
    Description = "",
    Default = false
});
v92:OnChanged(function(v279)
    _G.WhiteScreen = v279;
    if (_G.WhiteScreen == true) then
        game:GetService("RunService"):Set3dRenderingEnabled(false);
    elseif (_G.WhiteScreen == false) then
        game:GetService("RunService"):Set3dRenderingEnabled(true);
    end
end);
v17.ToggleWhite:SetValue(false);
local v93 = v16.Setting:AddSection("Kĩ Năng Thông Thạo");
local v94 = v16.Setting:AddToggle("ToggleZ", {
    Title = "Kĩ Năng Z",
    Description = "",
    Default = true
});
v94:OnChanged(function(v280)
    SkillZ = v280;
end);
v17.ToggleZ:SetValue(true);
local v95 = v16.Setting:AddToggle("ToggleX", {
    Title = "Kĩ Năng X",
    Description = "",
    Default = true
});
v95:OnChanged(function(v281)
    SkillX = v281;
end);
v17.ToggleX:SetValue(true);
local v96 = v16.Setting:AddToggle("ToggleC", {
    Title = "Kĩ Năng C",
    Description = "",
    Default = true
});
v96:OnChanged(function(v282)
    SkillC = v282;
end);
v17.ToggleC:SetValue(true);
local v97 = v16.Setting:AddToggle("ToggleV", {
    Title = "Kĩ Năng V",
    Description = "",
    Default = true
});
v97:OnChanged(function(v283)
    SkillV = v283;
end);
v17.ToggleV:SetValue(true);
local v98 = v16.Setting:AddToggle("ToggleF", {
    Title = "Kĩ Năng F",
    Description = "",
    Default = false
});
v98:OnChanged(function(v284)
    SkillF = v284;
end);
v17.ToggleF:SetValue(true);
local v99 = v16.Status:AddParagraph({
    Title = "Thông Tin",
    Content = "━━━━━━━━━━━━━━━━━━━━━\n" .. "Tên : " .. game.Players.LocalPlayer.DisplayName .. " (@" .. game.Players.LocalPlayer.Name .. ")\n" .. "Cấp : " .. game:GetService("Players").LocalPlayer.Data.Level.Value .. "\n" .. "Tiền : " .. game:GetService("Players").LocalPlayer.Data.Beli.Value .. "\n" .. "Điểm F : " .. game:GetService("Players").LocalPlayer.Data.Fragments.Value .. "\n" .. "Tiền Truy Nã : " .. game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value .. "\n" .. "Máu: " .. game.Players.LocalPlayer.Character.Humanoid.Health .. "/" .. game.Players.LocalPlayer.Character.Humanoid.MaxHealth .. "\n" .. "Năng Lượng : " .. game.Players.LocalPlayer.Character.Energy.Value .. "/" .. game.Players.LocalPlayer.Character.Energy.MaxValue .. "\n" .. "Tộc : " .. game:GetService("Players").LocalPlayer.Data.Race.Value .. "\n" .. "Trái : " .. game:GetService("Players").LocalPlayer.Data.DevilFruit.Value .. "\n" .. "━━━━━━━━━━━━━━━━━━━━━"
});
local v100 = v16.Status:AddParagraph({
    Title = "Thời Gian",
    Content = ""
});
local function v101()
    local v285 = os.date("*t");
    local v286 = v285.hour % 24 ;
    local v287 = ((v286 < 12) and "AM") or "PM" ;
    local v288 = string.format("%02i:%02i:%02i %s", ((v286 - 1) % 12) + 1, v285.min, v285.sec, v287);
    local v289 = string.format("%02d/%02d/%04d", v285.day, v285.month, v285.year);
    local v290 = game:GetService("LocalizationService");
    local v291 = game:GetService("Players");
    local v292 = v291.LocalPlayer;
    local v293 = v292.Name;
    local v294 = "Unknown";
    local v295, v296 = pcall(function()
        return v290:GetCountryRegionForPlayerAsync(v292);
    end);
    if v295 then
        v294 = v296;
    end
    v100:SetDesc(v289 .. "-" .. v288 .. " [ " .. v294 .. " ]");
end
spawn(function()
    while true do
        v101();
        game:GetService("RunService").RenderStepped:Wait();
    end
end);
local v102 = v16.Status:AddParagraph({
    Title = "Thời Gian Máy Chủ",
    Content = ""
});
local function v103()
    local v297 = math.floor(workspace.DistributedGameTime + 0.5);
    local v298 = math.floor(v297 / (60 ^ 2)) % 24 ;
    local v299 = math.floor(v297 / 60) % 60 ;
    local v300 = v297 % 60 ;
    v102:SetDesc(string.format("%02d Tiếng-%02d Phút-%02d Giây", v298, v299, v300));
end
spawn(function()
    while task.wait() do
        pcall(v103);
    end
end);
local v104 = v16.Status:AddParagraph({
    Title = "Đảo Leviathan",
    Content = ""
});
spawn(function()
    pcall(function()
        while wait() do
            if game:GetService("Workspace").Map:FindFirstChild("FrozenDimension") then
                v104:SetDesc("✅");
            else
                v104:SetDesc("❌");
            end
        end
    end);
end);
local v105 = v16.Status:AddInput("Input", {
    Title = "Job ID",
    Default = "",
    Placeholder = "Dán Job ID Vào Đây",
    Numeric = false,
    Finished = false,
    Callback = function(v301)
        _G.Job = v301;
    end
});
v16.Status:AddButton({
    Title = "Bắt Đầu Tham Gia Job ID",
    Description = "",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, _G.Job, game.Players.LocalPlayer);
    end
});
v16.Status:AddButton({
    Title = "Sao Chép Job ID",
    Description = "",
    Callback = function()
        setclipboard(tostring(game.JobId));
    end
});
local v106 = v16.Status:AddToggle("MyToggle", {
    Title = "Spam Tham Gia Job ID",
    Default = false
});
v106:OnChanged(function(v302)
    _G.Join = v302;
end);
spawn(function()
    while wait() do
        if _G.Join then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, _G.Job, game.Players.LocalPlayer);
        end
    end
end);
local v107 = v16.Stats:AddToggle("ToggleMelee", {
    Title = "Nâng Đấm",
    Description = "",
    Default = false
});
v107:OnChanged(function(v303)
    _G.Auto_Stats_Melee = v303;
end);
v17.ToggleMelee:SetValue(false);
local v108 = v16.Stats:AddToggle("ToggleDe", {
    Title = "Nâng Máu",
    Description = "",
    Default = false
});
v108:OnChanged(function(v304)
    _G.Auto_Stats_Defense = v304;
end);
v17.ToggleDe:SetValue(false);
local v109 = v16.Stats:AddToggle("ToggleSword", {
    Title = "Nâng Kiếm",
    Description = "",
    Default = false
});
v109:OnChanged(function(v305)
    _G.Auto_Stats_Sword = v305;
end);
v17.ToggleSword:SetValue(false);
local v110 = v16.Stats:AddToggle("ToggleGun", {
    Title = "Nâng Súng",
    Description = "",
    Default = false
});
v110:OnChanged(function(v306)
    _G.Auto_Stats_Gun = v306;
end);
v17.ToggleGun:SetValue(false);
local v111 = v16.Stats:AddToggle("ToggleFruit", {
    Title = "Nâng Trái",
    Description = "",
    Default = false
});
v111:OnChanged(function(v307)
    _G.Auto_Stats_Devil_Fruit = v307;
end);
v17.ToggleFruit:SetValue(false);
spawn(function()
    while wait() do
        if _G.Auto_Stats_Devil_Fruit then
            local v737 = {
                [1] = "AddPoint",
                [2] = "Demon Fruit",
                [3] = 3
            };
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v737));
        end
    end
end);
spawn(function()
    while wait() do
        if _G.Auto_Stats_Gun then
            local v738 = {
                [1] = "AddPoint",
                [2] = "Gun",
                [3] = 3
            };
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v738));
        end
    end
end);
spawn(function()
    while wait() do
        if _G.Auto_Stats_Sword then
            local v739 = {
                [1] = "AddPoint",
                [2] = "Sword",
                [3] = 3
            };
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v739));
        end
    end
end);
spawn(function()
    while wait() do
        if _G.Auto_Stats_Defense then
            local v740 = {
                [1] = "AddPoint",
                [2] = "Defense",
                [3] = 3
            };
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v740));
        end
    end
end);
spawn(function()
    while wait() do
        if _G.Auto_Stats_Melee then
            local v741 = {
                [1] = "AddPoint",
                [2] = "Melee",
                [3] = 3
            };
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v741));
        end
    end
end);
local v112 = {};
for v308, v309 in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(v112, v309.Name);
end
local v113 = v16.Player:AddDropdown("SelectedPly", {
    Title = "Chọn Người Chơi",
    Description = "",
    Values = v112,
    Multi = false,
    Default = 1
});
v113:SetValue(_G.SelectPly);
v113:OnChanged(function(v310)
    _G.SelectPly = v310;
end);
v16.Player:AddButton({
    Title = "Tải Lại Người Chơi",
    Description = "",
    Callback = function()
        table.clear(v112);
        for v541, v542 in pairs(game:GetService("Players"):GetChildren()) do
            table.insert(v112, v542.Name);
        end
    end
});
local v114 = v16.Player:AddToggle("ToggleTeleport", {
    Title = "Bay Đến Người Chơi",
    Description = "",
    Default = false
});
v114:OnChanged(function(v311)
    _G.TeleportPly = v311;
    if (v311 == false) then
        wait();
        AutoHaki();
        Tween2(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame);
        wait();
    end
end);
v17.ToggleTeleport:SetValue(false);
spawn(function()
    while wait() do
        if _G.TeleportPly then
            pcall(function()
                if game.Players:FindFirstChild(_G.SelectPly) then
                    Tween2(game.Players[_G.SelectPly].Character.HumanoidRootPart.CFrame);
                end
            end);
        end
    end
end);
local v56 = v16.Player:AddSection("Khác");
local v115 = v16.Player:AddToggle("ToggleNoClip", {
    Title = "Đi Xuyên Tường",
    Description = "",
    Default = true
});
v115:OnChanged(function(v312)
    _G.LOf = v312;
end);
v17.ToggleNoClip:SetValue(true);
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.LOf then
                for v868, v869 in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v869:IsA("BasePart") then
                        v869.CanCollide = false;
                    end
                end
            end
        end);
    end);
end);
local v116 = v16.Player:AddToggle("ToggleWalkonWater", {
    Title = "Đi Trên Nước",
    Description = "",
    Default = true
});
v116:OnChanged(function(v313)
    _G.WalkonWater = v313;
end);
v17.ToggleWalkonWater:SetValue(true);
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.WalkonWater then
                game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000);
            else
                game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000);
            end
        end);
    end
end);
local v117 = v16.Player:AddToggle("ToggleEnablePvp", {
    Title = "Bật PVP",
    Description = "",
    Default = false
});
v117:OnChanged(function(v314)
    _G.EnabledPvP = v314;
end);
v17.ToggleEnablePvp:SetValue(false);
spawn(function()
    pcall(function()
        while wait() do
            if _G.EnabledPvP then
                if (game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp");
                end
            end
        end
    end);
end);
local v118 = v16.Teleport:AddSection("Thế Giới");
local v119 = v16.Teleport:AddToggle("ToggleAutoSea2", {
    Title = "Nhiệm Vụ Qua Biển 2",
    Description = "",
    Default = false
});
v119:OnChanged(function(v315)
    _G.Auto_Sea2 = v315;
end);
v17.ToggleAutoSea2:SetValue(false);
spawn(function()
    while wait() do
        if _G.Auto_Sea2 then
            pcall(function()
                local v800 = game:GetService("Players").LocalPlayer.Data.Level.Value;
                if ((v800 >= 700) and World1) then
                    if ((game:GetService("Workspace").Map.Ice.Door.CanCollide == false) and (game:GetService("Workspace").Map.Ice.Door.Transparency == 1)) then
                        local v1346 = CFrame.new(4849.29883, 5.65138149, 719.611877);
                        repeat
                            Tween(v1346);
                            wait();
                        until ((v1346.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) or (_G.Auto_Sea2 == false)
                        wait(1.1);
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective");
                        wait(0.5);
                        EquipTool("Key");
                        repeat
                            Tween(CFrame.new(1347.7124, 37.3751602, - 1325.6488));
                            wait();
                        until ((Vector3.new(1347.7124, 37.3751602, - 1325.6488) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) or (_G.Auto_Sea2 == false)
                        wait(0.5);
                    elseif ((game:GetService("Workspace").Map.Ice.Door.CanCollide == false) and (game:GetService("Workspace").Map.Ice.Door.Transparency == 1)) then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral") then
                            for v1680, v1681 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if (v1681.Name == "Ice Admiral") then
                                    if (not v1681.Humanoid.Health <= 0) then
                                        if (v1681:FindFirstChild("Humanoid") and v1681:FindFirstChild("HumanoidRootPart") and (v1681.Humanoid.Health > 0)) then
                                            OldCFrameSecond = v1681.HumanoidRootPart.CFrame;
                                            repeat
                                                task.wait(_G.Fast_Delay);
                                                AutoHaki();
                                                EquipTool(SelectWeapon);
                                                v1681.HumanoidRootPart.CanCollide = false;
                                                v1681.Humanoid.WalkSpeed = 0;
                                                v1681.Head.CanCollide = false;
                                                v1681.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                                v1681.HumanoidRootPart.CFrame = OldCFrameSecond;
                                                Tween(v1681.HumanoidRootPart.CFrame * Pos);
                                                AttackNoCoolDown();
                                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
                                            until not _G.Auto_Sea2 or not v1681.Parent or (v1681.Humanoid.Health <= 0)
                                        end
                                    else
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa");
                                    end
                                end
                            end
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral") then
                            Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral").HumanoidRootPart.CFrame * CFrame.new(5, 10, 7));
                        end
                    end
                end
            end);
        end
    end
end);
local v120 = v16.Teleport:AddToggle("ToggleAutoSea3", {
    Title = "Nhiệm Vụ Qua Biển 3",
    Description = "",
    Default = false
});
v120:OnChanged(function(v316)
    _G.Auto_Sea3 = v316;
end);
v17.ToggleAutoSea3:SetValue(false);
spawn(function()
    while wait() do
        if _G.AutoSea3 then
            pcall(function()
                if ((game:GetService("Players").LocalPlayer.Data.Level.Value >= 1500) and World2) then
                    _G.AutoLevel = false;
                    if (game:GetService("ReplicatedStorage").Remotes['CommF_']:InvokeServer("ZQuestProgress", "General") == 0) then
                        Tween(CFrame.new(- 1926.3221435547, 12.819851875305, 1738.3092041016));
                        if ((CFrame.new(- 1926.3221435547, 12.819851875305, 1738.3092041016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10) then
                            wait(1.5);
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "Begin");
                        end
                        wait(1.8);
                        if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
                            for v1578, v1579 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if (v1579.Name == "rip_indra") then
                                    OldCFrameThird = v1579.HumanoidRootPart.CFrame;
                                    repeat
                                        task.wait(_G.Fast_Delay);
                                        AutoHaki();
                                        EquipTool(SelectWeapon);
                                        Tween(v1579.HumanoidRootPart.CFrame * Pos);
                                        v1579.HumanoidRootPart.CFrame = OldCFrameThird;
                                        v1579.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                        v1579.HumanoidRootPart.CanCollide = false;
                                        v1579.Humanoid.WalkSpeed = 0;
                                        AttackNoCoolDown();
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou");
                                    until (_G.AutoSea3 == false) or (v1579.Humanoid.Health <= 0) or not v1579.Parent
                                end
                            end
                        elseif (not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") and ((CFrame.new(- 26880.93359375, 22.848554611206, 473.18951416016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000)) then
                            Tween(CFrame.new(- 26880.93359375, 22.848554611206, 473.18951416016));
                        end
                    end
                end
            end);
        end
    end
end);
v16.Teleport:AddButton({
    Title = "Biến 1",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain");
    end
});
v16.Teleport:AddButton({
    Title = "Biến 2",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa");
    end
});
v16.Teleport:AddButton({
    Title = "Biển 3",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou");
    end
});
local v56 = v16.Teleport:AddSection("Đảo");
if Sea1 then
    IslandList = {
        "WindMill",
        "Marine",
        "Middle Town",
        "Jungle",
        "Pirate Village",
        "Desert",
        "Snow Island",
        "MarineFord",
        "Colosseum",
        "Sky Island 1",
        "Sky Island 2",
        "Sky Island 3",
        "Prison",
        "Magma Village",
        "Under Water Island",
        "Fountain City",
        "Shank Room",
        "Mob Island"
    };
elseif Sea2 then
    IslandList = {
        "The Cafe",
        "Frist Spot",
        "Dark Area",
        "Flamingo Mansion",
        "Flamingo Room",
        "Green Zone",
        "Factory",
        "Colossuim",
        "Zombie Island",
        "Two Snow Mountain",
        "Punk Hazard",
        "Cursed Ship",
        "Ice Castle",
        "Forgotten Island",
        "Ussop Island",
        "Mini Sky Island"
    };
elseif Sea3 then
    IslandList = {
        "Mansion",
        "Port Town",
        "Great Tree",
        "Castle On The Sea",
        "MiniSky",
        "Hydra Island",
        "Floating Turtle",
        "Haunted Castle",
        "Ice Cream Island",
        "Peanut Island",
        "Cake Island",
        "Cocoa Island",
        "Candy Island",
        "Tiki Outpost"
    };
end
local v121 = v16.Teleport:AddDropdown("DropdownIsland", {
    Title = "Chọn Đảo",
    Description = "",
    Values = IslandList,
    Multi = false,
    Default = 1
});
v121:SetValue(_G.SelectIsland);
v121:OnChanged(function(v317)
    _G.SelectIsland = v317;
end);
v16.Teleport:AddButton({
    Title = "Bay Đến Đảo",
    Description = "",
    Callback = function()
        if (_G.SelectIsland == "WindMill") then
            Tween2(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594));
        elseif (_G.SelectIsland == "Marine") then
            Tween2(CFrame.new(- 2566.4296875, 6.8556680679321, 2045.2561035156));
        elseif (_G.SelectIsland == "Middle Town") then
            Tween2(CFrame.new(- 690.33081054688, 15.09425163269, 1582.2380371094));
        elseif (_G.SelectIsland == "Jungle") then
            Tween2(CFrame.new(- 1612.7957763672, 36.852081298828, 149.12843322754));
        elseif (_G.SelectIsland == "Pirate Village") then
            Tween2(CFrame.new(- 1181.3093261719, 4.7514905929565, 3803.5456542969));
        elseif (_G.SelectIsland == "Desert") then
            Tween2(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688));
        elseif (_G.SelectIsland == "Snow Island") then
            Tween2(CFrame.new(1347.8067626953, 104.66806030273, - 1319.7370605469));
        elseif (_G.SelectIsland == "MarineFord") then
            Tween2(CFrame.new(- 4914.8212890625, 50.963626861572, 4281.0278320313));
        elseif (_G.SelectIsland == "Colosseum") then
            Tween2(CFrame.new(- 1427.6203613281, 7.2881078720093, - 2792.7722167969));
        elseif (_G.SelectIsland == "Sky Island 1") then
            Tween2(CFrame.new(- 4869.1025390625, 733.46051025391, - 2667.0180664063));
        elseif (_G.SelectIsland == "Sky Island 2") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.82275, 872.54248, - 1667.55688));
        elseif (_G.SelectIsland == "Sky Island 3") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 7894.6176757813, 5547.1416015625, - 380.29119873047));
        elseif (_G.SelectIsland == "Prison") then
            Tween2(CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656));
        elseif (_G.SelectIsland == "Magma Village") then
            Tween2(CFrame.new(- 5247.7163085938, 12.883934020996, 8504.96875));
        elseif (_G.SelectIsland == "Under Water Island") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875));
        elseif (_G.SelectIsland == "Fountain City") then
            Tween2(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813));
        elseif (_G.SelectIsland == "Shank Room") then
            Tween2(CFrame.new(- 1442.16553, 29.8788261, - 28.3547478));
        elseif (_G.SelectIsland == "Mob Island") then
            Tween2(CFrame.new(- 2850.20068, 7.39224768, 5354.99268));
        elseif (_G.SelectIsland == "The Cafe") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 281.93707275390625, 306.130615234375, 609.280029296875));
            wait();
            Tween2(CFrame.new(- 380.47927856445, 77.220390319824, 255.82550048828));
        elseif (_G.SelectIsland == "Frist Spot") then
            Tween2(CFrame.new(- 11.311455726624, 29.276733398438, 2771.5224609375));
        elseif (_G.SelectIsland == "Dark Area") then
            Tween2(CFrame.new(3780.0302734375, 22.652164459229, - 3498.5859375));
        elseif (_G.SelectIsland == "Flamingo Mansion") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 281.93707275390625, 306.130615234375, 609.280029296875));
        elseif (_G.SelectIsland == "Flamingo Room") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2284.912109375, 15.152034759521484, 905.48291015625));
        elseif (_G.SelectIsland == "Green Zone") then
            Tween2(CFrame.new(- 2448.5300292969, 73.016105651855, - 3210.6306152344));
        elseif (_G.SelectIsland == "Factory") then
            Tween2(CFrame.new(424.12698364258, 211.16171264648, - 427.54049682617));
        elseif (_G.SelectIsland == "Colossuim") then
            Tween2(CFrame.new(- 1503.6224365234, 219.7956237793, 1369.3101806641));
        elseif (_G.SelectIsland == "Zombie Island") then
            Tween2(CFrame.new(- 5622.033203125, 492.19604492188, - 781.78552246094));
        elseif (_G.SelectIsland == "Two Snow Mountain") then
            Tween2(CFrame.new(753.14288330078, 408.23559570313, - 5274.6147460938));
        elseif (_G.SelectIsland == "Punk Hazard") then
            Tween2(CFrame.new(- 6127.654296875, 15.951762199402, - 5040.2861328125));
        elseif (_G.SelectIsland == "Cursed Ship") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.40197753906, 125.05712890625, 32885.875));
        elseif (_G.SelectIsland == "Ice Castle") then
            Tween2(CFrame.new(6148.4116210938, 294.38687133789, - 6741.1166992188));
        elseif (_G.SelectIsland == "Forgotten Island") then
            Tween2(CFrame.new(- 3032.7641601563, 317.89672851563, - 10075.373046875));
        elseif (_G.SelectIsland == "Ussop Island") then
            Tween2(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781));
        elseif (_G.SelectIsland == "Mini Sky Island") then
            Tween2(CFrame.new(- 288.74060058594, 49326.31640625, - 35248.59375));
        elseif (_G.SelectIsland == "Great Tree") then
            Tween2(CFrame.new(2681.2736816406, 1682.8092041016, - 7190.9853515625));
        elseif (_G.SelectIsland == "Castle On The Sea") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 5075.50927734375, 314.5155029296875, - 3150.0224609375));
        elseif (_G.SelectIsland == "MiniSky") then
            Tween2(CFrame.new(- 260.65557861328, 49325.8046875, - 35253.5703125));
        elseif (_G.SelectIsland == "Port Town") then
            Tween2(CFrame.new(- 290.7376708984375, 6.729952812194824, 5343.5537109375));
        elseif (_G.SelectIsland == "Hydra Island") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, - 334.9649963378906));
        elseif (_G.SelectIsland == "Floating Turtle") then
            Tween2(CFrame.new(- 13274.528320313, 531.82073974609, - 7579.22265625));
        elseif (_G.SelectIsland == "Mansion") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 12468.5380859375, 375.0094299316406, - 7554.62548828125));
        elseif (_G.SelectIsland == "Castle On The Sea") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 5075.50927734375, 314.5155029296875, - 3150.0224609375));
        elseif (_G.SelectIsland == "Haunted Castle") then
            Tween2(CFrame.new(- 9515.3720703125, 164.00624084473, 5786.0610351562));
        elseif (_G.SelectIsland == "Ice Cream Island") then
            Tween2(CFrame.new(- 902.56817626953, 79.93204498291, - 10988.84765625));
        elseif (_G.SelectIsland == "Peanut Island") then
            Tween2(CFrame.new(- 2062.7475585938, 50.473892211914, - 10232.568359375));
        elseif (_G.SelectIsland == "Cake Island") then
            Tween2(CFrame.new(- 1884.7747802734375, 19.327526092529297, - 11666.8974609375));
        elseif (_G.SelectIsland == "Cocoa Island") then
            Tween2(CFrame.new(87.94276428222656, 73.55451202392578, - 12319.46484375));
        elseif (_G.SelectIsland == "Candy Island") then
            Tween2(CFrame.new(- 1014.4241943359375, 149.11068725585938, - 14555.962890625));
        elseif (_G.SelectIsland == "Tiki Outpost") then
            Tween2(CFrame.new(- 16542.447265625, 55.68632888793945, 1044.41650390625));
        end
    end
});
v16.Teleport:AddButton({
    Title = "Dừng Bay",
    Description = "",
    Callback = function()
        CancelTween();
    end
});
v16.Visual:AddButton({
    Title = "Giả",
    Description = "",
    Callback = function()
        local v318 = game:GetService("Players").LocalPlayer;
        local v319 = require(game:GetService("ReplicatedStorage").Notification);
        local v320 = v318:WaitForChild("Data");
        local v321 = require(game.ReplicatedStorage:WaitForChild("EXPFunction"));
        local v322 = require(game:GetService("ReplicatedStorage").Effect.Container.LevelUp);
        local v323 = require(game:GetService("ReplicatedStorage").Util.Sound);
        local v324 = game:GetService("ReplicatedStorage").Util.Sound.Storage.Other:FindFirstChild("LevelUp_Proxy") or game:GetService("ReplicatedStorage").Util.Sound.Storage.Other:FindFirstChild("LevelUp") ;
        function v129(v543)
            local v544 = v543;
            while true do
                local v649, v650 = string.gsub(v544, "^(-?%d+)(%d%d%d)", "%1,%2");
                v544 = v649;
                if (v650 == 0) then
                    break;
                end
            end
            return v544;
        end
        v319.new("<Color=Yellow>QUEST COMPLETED!<Color=/>"):Display();
        v319.new("Earned<Color=Yellow>9,999,999,999,999 Exp.<Color=/>(+None)"):Display();
        v319.new("Earned<Color=Green>$9,999,999,999,999<Color=/>"):Display();
        v318.Data.Exp.Value = 999999999999;
        v318.Data.Beli.Value = v318.Data.Beli.Value + 999999999999 ;
        delay = 0;
        count = 0;
        while (v318.Data.Exp.Value - v321(v320.Level.Value)) > 0 do
            v318.Data.Exp.Value = v318.Data.Exp.Value - v321(v320.Level.Value) ;
            v318.Data.Level.Value = v318.Data.Level.Value + 1 ;
            v318.Data.Points.Value = v318.Data.Points.Value + 3 ;
            v322({
                v318
            });
            v323.Play(v323, v324.Value);
            v319.new("<Color=Green>LEVEL UP!<Color=/>(" .. v318.Data.Level.Value .. ")"):Display();
            count = count + 1 ;
            if (count >= 5) then
                delay = tick();
                count = 0;
                wait();
            end
        end
    end
});
v16.Visual:AddInput("Input_Level", {
    Title = "Cấp",
    Default = "",
    Placeholder = "Nhập",
    Numeric = false,
    Finished = false,
    Callback = function(v327)
        game:GetService("Players")['LocalPlayer'].Data.Level.Value = tonumber(v327);
    end
});
v16.Visual:AddInput("Input_EXP", {
    Title = "Kinh Nghiệm",
    Default = "",
    Placeholder = "Nhập",
    Numeric = false,
    Finished = false,
    Callback = function(v329)
        game:GetService("Players")['LocalPlayer'].Data.Exp.Value = tonumber(v329);
    end
});
v16.Visual:AddInput("Input_Beli", {
    Title = "Tiền",
    Default = "",
    Placeholder = "Nhập",
    Numeric = false,
    Finished = false,
    Callback = function(v331)
        game:GetService("Players")['LocalPlayer'].Data.Beli.Value = tonumber(v331);
    end
});
v16.Visual:AddInput("Input_Fragments", {
    Title = "Điểm F",
    Default = "",
    Placeholder = "Nhập",
    Numeric = false,
    Finished = false,
    Callback = function(v333)
        game:GetService("Players")['LocalPlayer'].Data.Fragments.Value = tonumber(v333);
    end
});
local v122 = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits");
Table_DevilFruitSniper = {};
ShopDevilSell = {};
for v335, v336 in next, v122 do
    table.insert(Table_DevilFruitSniper, v336.Name);
    if v336.OnSale then
        table.insert(ShopDevilSell, v336.Name);
    end
end
_G.SelectFruit = "Dragon-Dragon";
_G.PermanentFruit = "Dragon-Dragon";
_G.AutoBuyFruitSniper = false;
_G.AutoSwitchPermanentFruit = false;
local v123 = v16.Fruit:AddDropdown("DropdownFruit", {
    Title = "Chọn Trái",
    Description = "",
    Values = Table_DevilFruitSniper,
    Multi = false,
    Default = 1
});
v123:SetValue(_G.SelectFruit);
v123:OnChanged(function(v337)
    _G.SelectFruit = v337;
end);
local v111 = v16.Fruit:AddToggle("ToggleFruit", {
    Title = "Mua Trái Chọn",
    Description = "",
    Default = false
});
v111:OnChanged(function(v338)
    if v338 then
        _G.AutoBuyFruitSniper = true;
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits");
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit", _G.SelectFruit, false);
        end);
        _G.AutoBuyFruitSniper = false;
    end
end);
v17.ToggleFruit:SetValue(false);
local v124 = v16.Fruit:AddDropdown("DropdownPermanentFruit", {
    Title = "Chọn Trái Vĩnh Viễn",
    Description = "",
    Values = Table_DevilFruitSniper,
    Multi = false,
    Default = 1
});
v124:SetValue(_G.PermanentFruit);
v124:OnChanged(function(v339)
    _G.PermanentFruit = v339;
end);
local v125 = v16.Fruit:AddToggle("TogglePermanentFruit", {
    Title = "Đổi Trái Vĩnh Viễn",
    Description = "",
    Default = false
});
v125:OnChanged(function(v340)
    if v340 then
        _G.AutoSwitchPermanentFruit = true;
        pcall(function()
            local v742 = {
                [1] = "SwitchFruit",
                [2] = _G.PermanentFruit
            };
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v742));
        end);
        _G.AutoSwitchPermanentFruit = false;
    end
end);
v17.TogglePermanentFruit:SetValue(false);
local v126 = v16.Fruit:AddToggle("ToggleStore", {
    Title = "Lưu Trái",
    Description = "",
    Default = false
});
v126:OnChanged(function(v341)
    _G.AutoStoreFruit = v341;
end);
v17.ToggleStore:SetValue(false);
spawn(function()
    while task.wait() do
        if _G.AutoStoreFruit then
            pcall(function()
                if _G.AutoStoreFruit then
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Bomb-Bomb", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spike-Spike", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Chop-Chop", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spring-Spring", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rocket Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Rocket-Rocket", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Smoke-Smoke", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spin-Spin", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Flame-Flame", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Falcon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Falcon Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Falcon", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("alcon Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Ice-Ice", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Sand-Sand", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dark-Dark", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ghost Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Ghost-Ghost", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Diamond-Diamond", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Light-Light", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Love-Love", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Rubber-Rubber", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Barrier-Barrier", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Magma-Magma", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Portal Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Portal Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Door-Door", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Portal Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Quake-Quake", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Buddha Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buddha", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Buddha Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spider Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spider Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spider-Spider", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spider Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Phoenix Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Phoenix", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Phoenix Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Rumble-Rumble", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Pain Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pain Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Pain-Pain", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pain Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Gravity-Gravity", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dough-Dough", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Shadow-Shadow", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Venom-Venom", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Control-Control", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spirit Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Soul-Soul", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Fruit"));
                    end
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit")) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dragon-Dragon", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit"));
                        if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Leopard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit")) then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Leopard-Leopard", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit"));
                        end
                    end
                end
            end);
        end
        wait();
    end
end);
local v127 = v16.Fruit:AddToggle("ToggleRandomFruit", {
    Title = "Random Trái",
    Description = "",
    Default = false
});
v127:OnChanged(function(v342)
    _G.Random_Auto = v342;
end);
v17.ToggleRandomFruit:SetValue(false);
spawn(function()
    pcall(function()
        while wait() do
            if _G.Random_Auto then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy");
            end
        end
    end);
end);
local v128 = v16.Fruit:AddToggle("ToggleCollectTP", {
    Title = "Bay Đến Trái",
    Description = "",
    Default = false
});
v128:OnChanged(function(v343)
    _G.CollectFruitTP = v343;
end);
v17.ToggleCollectTP:SetValue(false);
spawn(function()
    while wait() do
        if _G.CollectFruitTP then
            for v801, v802 in pairs(game.Workspace:GetChildren()) do
                if string.find(v802.Name, "Fruit") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v802.Handle.CFrame;
                end
            end
        end
    end
end);
local v129 = v16.Fruit:AddToggle("ToggleCollect", {
    Title = "Dịch Chuyển Đến Trái",
    Description = "",
    Default = false
});
v129:OnChanged(function(v344)
    _G.Tweenfruit = v344;
end);
v17.ToggleCollect:SetValue(false);
spawn(function()
    while wait() do
        if _G.Tweenfruit then
            for v803, v804 in pairs(game.Workspace:GetChildren()) do
                if string.find(v804.Name, "Fruit") then
                    Tween(v804.Handle.CFrame);
                end
            end
        end
    end
end);
local v56 = v16.Fruit:AddSection("Định Vị");
local v130 = v16.Fruit:AddToggle("ToggleEspPlayer", {
    Title = "Người Chơi",
    Description = "",
    Default = false
});
v130:OnChanged(function(v345)
    ESPPlayer = v345;
    UpdatePlayerChams();
end);
v17.ToggleEspPlayer:SetValue(false);
local v131 = v16.Fruit:AddToggle("ToggleEspFruit", {
    Title = "Trái",
    Description = "",
    Default = false
});
v131:OnChanged(function(v346)
    DevilFruitESP = v346;
    while DevilFruitESP do
        wait();
        UpdateDevilChams();
    end
end);
v17.ToggleEspFruit:SetValue(false);
local v132 = v16.Fruit:AddToggle("ToggleEspIsland", {
    Title = "Đảo",
    Description = "",
    Default = false
});
v132:OnChanged(function(v347)
    IslandESP = v347;
    while IslandESP do
        wait();
        UpdateIslandESP();
    end
end);
v17.ToggleEspIsland:SetValue(false);
local v133 = v16.Fruit:AddToggle("ToggleEspFlower", {
    Title = "Hoa",
    Description = "",
    Default = false
});
v133:OnChanged(function(v348)
    FlowerESP = v348;
    UpdateFlowerChams();
end);
v17.ToggleEspFlower:SetValue(false);
spawn(function()
    while wait() do
        if FlowerESP then
            UpdateFlowerChams();
        end
        if DevilFruitESP then
            UpdateDevilChams();
        end
        if ChestESP then
            UpdateChestChams();
        end
        if ESPPlayer then
            UpdatePlayerChams();
        end
        if RealFruitESP then
            UpdateRealFruitChams();
        end
    end
end);
local v134 = v16.Fruit:AddToggle("ToggleEspRealFruit", {
    Title = "Trái Dứa Khớm Táo",
    Description = "",
    Default = false
});
v134:OnChanged(function(v349)
    RealFruitEsp = v349;
    while RealFruitEsp do
        wait();
        UpdateRealFruitEsp();
    end
end);
v17.ToggleEspRealFruit:SetValue(false);
function UpdateRealFruitEsp()
    for v548, v549 in pairs(game.Workspace.AppleSpawner:GetChildren()) do
        if v549:IsA("Tool") then
            if RealFruitEsp then
                if not v549.Handle:FindFirstChild("NameEsp" .. Number) then
                    local v1066 = Instance.new("BillboardGui", v549.Handle);
                    v1066.Name = "NameEsp" .. Number ;
                    v1066.ExtentsOffset = Vector3.new(0, 1, 0);
                    v1066.Size = UDim2.new(1, 200, 1, 30);
                    v1066.Adornee = v549.Handle;
                    v1066.AlwaysOnTop = true;
                    local v1073 = Instance.new("TextLabel", v1066);
                    v1073.Font = Enum.Font.GothamSemibold;
                    v1073.FontSize = "Size14";
                    v1073.TextWrapped = true;
                    v1073.Size = UDim2.new(1, 0, 1, 0);
                    v1073.TextYAlignment = "Top";
                    v1073.BackgroundTransparency = 1;
                    v1073.TextStrokeTransparency = 0.5;
                    v1073.TextColor3 = Color3.fromRGB(255, 0, 0);
                    v1073.Text = v549.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v549.Handle.Position).Magnitude / 3) .. " Distance" ;
                else
                    v549.Handle["NameEsp" .. Number ].TextLabel.Text = v549.Name .. " " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v549.Handle.Position).Magnitude / 3) .. " Distance" ;
                end
            elseif v549.Handle:FindFirstChild("NameEsp" .. Number) then
                v549.Handle:FindFirstChild("NameEsp" .. Number):Destroy();
            end
        end
    end
    for v550, v551 in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
        if v551:IsA("Tool") then
            if RealFruitEsp then
                if not v551.Handle:FindFirstChild("NameEsp" .. Number) then
                    local v1085 = Instance.new("BillboardGui", v551.Handle);
                    v1085.Name = "NameEsp" .. Number ;
                    v1085.ExtentsOffset = Vector3.new(0, 1, 0);
                    v1085.Size = UDim2.new(1, 200, 1, 30);
                    v1085.Adornee = v551.Handle;
                    v1085.AlwaysOnTop = true;
                    local v1092 = Instance.new("TextLabel", v1085);
                    v1092.Font = Enum.Font.GothamSemibold;
                    v1092.FontSize = "Size14";
                    v1092.TextWrapped = true;
                    v1092.Size = UDim2.new(1, 0, 1, 0);
                    v1092.TextYAlignment = "Top";
                    v1092.BackgroundTransparency = 1;
                    v1092.TextStrokeTransparency = 0.5;
                    v1092.TextColor3 = Color3.fromRGB(255, 174, 0);
                    v1092.Text = v551.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v551.Handle.Position).Magnitude / 3) .. " Distance" ;
                else
                    v551.Handle["NameEsp" .. Number ].TextLabel.Text = v551.Name .. " " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v551.Handle.Position).Magnitude / 3) .. " Distance" ;
                end
            elseif v551.Handle:FindFirstChild("NameEsp" .. Number) then
                v551.Handle:FindFirstChild("NameEsp" .. Number):Destroy();
            end
        end
    end
    for v552, v553 in pairs(game.Workspace.BananaSpawner:GetChildren()) do
        if v553:IsA("Tool") then
            if RealFruitEsp then
                if not v553.Handle:FindFirstChild("NameEsp" .. Number) then
                    local v1104 = Instance.new("BillboardGui", v553.Handle);
                    v1104.Name = "NameEsp" .. Number ;
                    v1104.ExtentsOffset = Vector3.new(0, 1, 0);
                    v1104.Size = UDim2.new(1, 200, 1, 30);
                    v1104.Adornee = v553.Handle;
                    v1104.AlwaysOnTop = true;
                    local v1111 = Instance.new("TextLabel", v1104);
                    v1111.Font = Enum.Font.GothamSemibold;
                    v1111.FontSize = "Size14";
                    v1111.TextWrapped = true;
                    v1111.Size = UDim2.new(1, 0, 1, 0);
                    v1111.TextYAlignment = "Top";
                    v1111.BackgroundTransparency = 1;
                    v1111.TextStrokeTransparency = 0.5;
                    v1111.TextColor3 = Color3.fromRGB(251, 255, 0);
                    v1111.Text = v553.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v553.Handle.Position).Magnitude / 3) .. " Distance" ;
                else
                    v553.Handle["NameEsp" .. Number ].TextLabel.Text = v553.Name .. " " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v553.Handle.Position).Magnitude / 3) .. " Distance" ;
                end
            elseif v553.Handle:FindFirstChild("NameEsp" .. Number) then
                v553.Handle:FindFirstChild("NameEsp" .. Number):Destroy();
            end
        end
    end
end
local v135 = v16.Fruit:AddToggle("ToggleIslandMirageEsp", {
    Title = "Đảo Bí Ẩn",
    Description = "",
    Default = false
});
v135:OnChanged(function(v350)
    IslandMirageEsp = v350;
    while IslandMirageEsp do
        wait();
        UpdateIslandMirageEsp();
    end
end);
v17.ToggleIslandMirageEsp:SetValue(false);
function isnil(v351)
    return v351 == nil ;
end
local function v20(v352)
    return math.floor(tonumber(v352) + 0.5);
end
Number = math.random(1, 1000000);
function UpdateIslandMirageEsp()
    for v554, v555 in pairs(game:GetService("Workspace")['_WorldOrigin'].Locations:GetChildren()) do
        pcall(function()
            if MirageIslandESP then
                if (v555.Name == "Mirage Island") then
                    if not v555:FindFirstChild("NameEsp") then
                        local v1347 = Instance.new("BillboardGui", v555);
                        v1347.Name = "NameEsp";
                        v1347.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1347.Size = UDim2.new(1, 200, 1, 30);
                        v1347.Adornee = v555;
                        v1347.AlwaysOnTop = true;
                        local v1353 = Instance.new("TextLabel", v1347);
                        v1353.Font = Enum.Font.Code;
                        v1353.FontSize = Enum.FontSize.Size14;
                        v1353.TextWrapped = true;
                        v1353.Size = UDim2.new(1, 0, 1, 0);
                        v1353.TextYAlignment = Enum.TextYAlignment.Top;
                        v1353.BackgroundTransparency = 1;
                        v1353.TextStrokeTransparency = 0.5;
                        v1353.TextColor3 = Color3.fromRGB(80, 245, 245);
                    else
                        v555['NameEsp'].TextLabel.Text = v555.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v555.Position).Magnitude / 3) .. " M" ;
                    end
                end
            elseif v555:FindFirstChild("NameEsp") then
                v555:FindFirstChild("NameEsp"):Destroy();
            end
        end);
    end
end
local v136 = {
    "Flame",
    "Ice",
    "Quake",
    "Light",
    "Dark",
    "Spider",
    "Rumble",
    "Magma",
    "Buddha",
    "Sand",
    "Phoenix",
    "Dough"
};
local v137 = v16.Raid:AddDropdown("DropdownRaid", {
    Title = "Chọn Chip",
    Description = "",
    Values = v136,
    Multi = false,
    Default = 1
});
v137:SetValue(SelectChip);
v137:OnChanged(function(v353)
    SelectChip = v353;
end);
local v138 = v16.Raid:AddToggle("ToggleBuy", {
    Title = "Mua Chip",
    Description = "",
    Default = false
});
v138:OnChanged(function(v354)
    _G.Auto_Buy_Chips_Dungeon = v354;
end);
v17.ToggleBuy:SetValue(false);
spawn(function()
    while wait() do
        if _G.Auto_Buy_Chips_Dungeon then
            pcall(function()
                local v805 = {
                    [1] = "RaidsNpc",
                    [2] = "Select",
                    [3] = SelectChip
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v805));
            end);
        end
    end
end);
local v139 = v16.Raid:AddToggle("ToggleStart", {
    Title = "Bắt Đầu Raid",
    Description = "",
    Default = false
});
v139:OnChanged(function(v355)
    _G.Auto_StartRaid = v355;
end);
v17.ToggleStart:SetValue(false);
spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_StartRaid then
                if (game:GetService("Players")['LocalPlayer'].PlayerGui.Main.Timer.Visible == false) then
                    if (not game:GetService("Workspace")['_WorldOrigin'].Locations:FindFirstChild("Island 1") and (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip"))) then
                        if Sea2 then
                            Tween2(CFrame.new(- 6438.73535, 250.645355, - 4501.50684));
                            local v1547 = {
                                [1] = "SetSpawnPoint"
                            };
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1547));
                            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector);
                        elseif Sea3 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 5075.50927734375, 314.5155029296875, - 3150.0224609375));
                            Tween2(CFrame.new(- 5017.40869, 314.844055, - 2823.0127, - 0.925743818, 4.482175e-8, - 0.378151238, 4.5550315e-9, 1, 1.0737756e-7, 0.378151238, 9.768162e-8, - 0.925743818));
                            local v1656 = {
                                [1] = "SetSpawnPoint"
                            };
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1656));
                            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector);
                        end
                    end
                end
            end
        end);
    end
end);
local v140 = v16.Raid:AddToggle("ToggleNextIsland", {
    Title = "Đấm Quái Raid+Bay Đến Đảo",
    Description = "",
    Default = false
});
v140:OnChanged(function(v356)
    AutoNextIsland = v356;
    if not v356 then
        _G.AutoNear = false;
    end
end);
v17.ToggleNextIsland:SetValue(false);
spawn(function()
    local v357 = {};
    while task.wait() do
        if AutoNextIsland then
            pcall(function()
                local v806 = game.Players.LocalPlayer.Character;
                if (v806 and v806:FindFirstChild("HumanoidRootPart")) then
                    local v900 = game:GetService("Workspace")['_WorldOrigin'].Locations;
                    local v901 = v806.HumanoidRootPart.Position;
                    if (((v901 - Vector3.new(- 6438.73535, 250.645355, - 4501.50684)).Magnitude < 1) or ((v901 - Vector3.new(- 5017.40869, 314.844055, - 2823.0127)).Magnitude < 1)) then
                        v357 = {};
                    end
                    if v900:FindFirstChild("Island 1") then
                        _G.AutoNear = true;
                    end
                    if (v900:FindFirstChild("Island 2") and not v357["Island 2"]) then
                        Tween(v900:FindFirstChild("Island 2").CFrame);
                        v357["Island 2"] = true;
                        AutoNextIsland = false;
                        wait();
                        AutoNextIsland = true;
                    elseif (v900:FindFirstChild("Island 3") and not v357["Island 3"]) then
                        Tween(v900:FindFirstChild("Island 3").CFrame);
                        v357["Island 3"] = true;
                        AutoNextIsland = false;
                        wait();
                        AutoNextIsland = true;
                    elseif (v900:FindFirstChild("Island 4") and not v357["Island 4"]) then
                        Tween(v900:FindFirstChild("Island 4").CFrame);
                        v357["Island 4"] = true;
                        AutoNextIsland = false;
                        wait();
                        AutoNextIsland = true;
                    elseif (v900:FindFirstChild("Island 5") and not v357["Island 5"]) then
                        Tween(v900:FindFirstChild("Island 5").CFrame);
                        v357["Island 5"] = true;
                        AutoNextIsland = false;
                        wait();
                        AutoNextIsland = true;
                    end
                end
            end);
        end
    end
end);
local v141 = v16.Raid:AddToggle("ToggleAwake", {
    Title = "Thức Tỉnh",
    Description = "",
    Default = false
});
v141:OnChanged(function(v358)
    AutoAwakenAbilities = v358;
end);
v17.ToggleAwake:SetValue(false);
spawn(function()
    while task.wait() do
        if AutoAwakenAbilities then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Awaken");
            end);
        end
    end
end);
local v142 = v16.Raid:AddToggle("ToggleGetFruit", {
    Title = "Lấy Trái Dưới 1 Triệu",
    Description = "",
    Default = false
});
v142:OnChanged(function(v359)
    _G.Autofruit = v359;
end);
spawn(function()
    while wait() do
        pcall(function()
            if _G.Autofruit then
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Rocket-Rocket"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Spin-Spin"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Chop-Chop"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Spring-Spring"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Bomb-Bomb"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Smoke-Smoke"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Spike-Spike"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Flame-Flame"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Falcon-Falcon"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Ice-Ice"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Sand-Sand"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Dark-Dark"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Ghost-Ghost"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Diamond-Diamond"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Light-Light"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Rubber-Rubber"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Barrier-Barrier"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
            end
        end);
    end
end);
if Sea2 then
    v16.Raid:AddButton({
        Title = "Bay Đến Chỗ Tập Kích",
        Description = "",
        Callback = function()
            Tween2(CFrame.new(- 6438.73535, 250.645355, - 4501.50684));
        end
    });
elseif Sea3 then
    v16.Raid:AddButton({
        Title = "Bay Đến Chỗ Tập Kích",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 5075.50927734375, 314.5155029296875, - 3150.0224609375));
            Tween2(CFrame.new(- 5017.40869, 314.844055, - 2823.0127, - 0.925743818, 4.482175e-8, - 0.378151238, 4.5550315e-9, 1, 1.0737756e-7, 0.378151238, 9.768162e-8, - 0.925743818));
        end
    });
end
local v56 = v16.Raid:AddSection("Tập Kích Law");
local v143 = v16.Raid:AddToggle("ToggleLaw", {
    Title = "Mua Chip Và Đấm Law",
    Description = "",
    Default = false
});
v143:OnChanged(function(v360)
    Auto_Law = v360;
end);
v17.ToggleLaw:SetValue(false);
spawn(function()
    pcall(function()
        while wait() do
            if Auto_Law then
                if (not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") and not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") and not game:GetService("Workspace").Enemies:FindFirstChild("Order") and not game:GetService("ReplicatedStorage"):FindFirstChild("Order")) then
                    wait();
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "1");
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2");
                end
            end
        end
    end);
end);
spawn(function()
    pcall(function()
        while wait() do
            if Auto_Law then
                if (not game:GetService("Workspace").Enemies:FindFirstChild("Order") and not game:GetService("ReplicatedStorage"):FindFirstChild("Order")) then
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip")) then
                        fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector);
                    end
                end
                if (game:GetService("ReplicatedStorage"):FindFirstChild("Order") or game:GetService("Workspace").Enemies:FindFirstChild("Order")) then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                        for v1468, v1469 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1469.Name == "Order") then
                                repeat
                                    wait(_G.Fast_Delay);
                                    AttackNoCoolDown();
                                    AutoHaki();
                                    EquipTool(SelectWeapon);
                                    Tween(v1469.HumanoidRootPart.CFrame * Pos);
                                    v1469.HumanoidRootPart.CanCollide = false;
                                    v1469.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                until not v1469.Parent or (v1469.Humanoid.Health <= 0) or (Auto_Law == false)
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
                        Tween(CFrame.new(- 6217.2021484375, 28.047645568848, - 5053.1357421875));
                    end
                end
            end
        end
    end);
end);
v16.Race:AddButton({
    Title = "Đền Thời Gian",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875));
    end
});
v16.Race:AddButton({
    Title = "Cần Gạt",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875));
        Tween2(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734));
    end
});
v16.Race:AddButton({
    Title = "Chỗ Mua Gear",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875));
        Tween2(CFrame.new(28981.552734375, 14888.4267578125, - 120.245849609375));
    end
});
local v56 = v16.Race:AddSection("Tộc");
v16.Race:AddButton({
    Title = "Cửa Tộc",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875));
        if (game:GetService("Players").LocalPlayer.Data.Race.Value == "Human") then
            Tween2(CFrame.new(29221.822265625, 14890.9755859375, - 205.99114990234375));
        elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea") then
            Tween2(CFrame.new(28960.158203125, 14919.6240234375, 235.03948974609375));
        elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman") then
            Tween2(CFrame.new(28231.17578125, 14890.9755859375, - 211.64173889160156));
        elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg") then
            Tween2(CFrame.new(28502.681640625, 14895.9755859375, - 423.7279357910156));
        elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul") then
            Tween2(CFrame.new(28674.244140625, 14890.6767578125, 445.4310607910156));
        elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink") then
            Tween2(CFrame.new(29012.341796875, 14890.9755859375, - 380.1492614746094));
        end
    end
});
local v144 = v16.Race:AddToggle("ToggleHumanandghoul", {
    Title = "Hoàn Thành Ải [Human/Ghoul]",
    Description = "",
    Default = false
});
v144:OnChanged(function(v361)
    KillAura = v361;
end);
v17.ToggleHumanandghoul:SetValue(false);
local v145 = v16.Race:AddToggle("ToggleAutotrial", {
    Title = "Hoàn Thành Ải",
    Description = "",
    Default = false
});
v145:OnChanged(function(v362)
    _G.AutoQuestRace = v362;
end);
v17.ToggleAutotrial:SetValue(false);
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoQuestRace then
                if (game:GetService("Players").LocalPlayer.Data.Race.Value == "Human") then
                    for v1123, v1124 in pairs(game.Workspace.Enemies:GetDescendants()) do
                        if (v1124:FindFirstChild("Humanoid") and v1124:FindFirstChild("HumanoidRootPart") and (v1124.Humanoid.Health > 0)) then
                            pcall(function()
                                repeat
                                    wait();
                                    v1124.Humanoid.Health = 0;
                                    v1124.HumanoidRootPart.CanCollide = false;
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
                                until not _G.AutoQuestRace or not v1124.Parent or (v1124.Humanoid.Health <= 0)
                            end);
                        end
                    end
                elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea") then
                    for v1470, v1471 in pairs(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants()) do
                        if (v1471.Name == "snowisland_Cylinder.081") then
                            BTPZ(v1471.CFrame * CFrame.new(0, 0, 0));
                        end
                    end
                elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman") then
                    for v1582, v1583 in pairs(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants()) do
                        if (v1583.Name == "HumanoidRootPart") then
                            Tween(v1583.CFrame * Pos);
                            for v1746, v1747 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v1747:IsA("Tool") then
                                    if (v1747.ToolTip == "Melee") then
                                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1747);
                                    end
                                end
                            end
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            wait(0.2);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            wait(0.2);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            for v1748, v1749 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v1749:IsA("Tool") then
                                    if (v1749.ToolTip == "Blox Fruit") then
                                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1749);
                                    end
                                end
                            end
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            wait(0.2);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            wait(0.2);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            wait();
                            for v1750, v1751 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v1751:IsA("Tool") then
                                    if (v1751.ToolTip == "Sword") then
                                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1751);
                                    end
                                end
                            end
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            wait(0.2);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            wait(0.2);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            wait();
                            for v1752, v1753 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v1753:IsA("Tool") then
                                    if (v1753.ToolTip == "Gun") then
                                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1753);
                                    end
                                end
                            end
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            wait(0.2);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            wait(0.2);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        end
                    end
                elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg") then
                    Tween(CFrame.new(28654, 14898.7832, - 30, 1, 0, 0, 0, 1, 0, 0, 0, 1));
                elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul") then
                    for v1764, v1765 in pairs(game.Workspace.Enemies:GetDescendants()) do
                        if (v1765:FindFirstChild("Humanoid") and v1765:FindFirstChild("HumanoidRootPart") and (v1765.Humanoid.Health > 0)) then
                            pcall(function()
                                repeat
                                    wait();
                                    v1765.Humanoid.Health = 0;
                                    v1765.HumanoidRootPart.CanCollide = false;
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
                                until not _G.AutoQuestRace or not v1765.Parent or (v1765.Humanoid.Health <= 0)
                            end);
                        end
                    end
                elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink") then
                    for v1790, v1791 in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if (v1791.Name == "StartPoint") then
                            Tween(v1791.CFrame * CFrame.new(0, 10, 0));
                        end
                    end
                end
            end
        end
    end);
end);
local v146 = v16.Race:AddToggle("ToggleKillTrial", {
    Title = "Đấm Người Chơi Trong Trial",
    Description = "",
    Default = false
});
v146:OnChanged(function(v363)
    _G.AutoKillTrial = v363;
end);
v17.ToggleKillTrial:SetValue(false);
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoKillTrial then
                for v870, v871 in pairs(game:GetService("Players"):GetChildren()) do
                    if (v871.Name and (v871.Name ~= game.Players.LocalPlayer.Name) and ((v871.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100)) then
                        if (v871.Character.Humanoid.Health > 0) then
                            repeat
                                wait(_G.Fast_Delay);
                                EquipTool(SelectWeapon);
                                AutoHaki();
                                Tween(v871.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5));
                                v871.Character.HumanoidRootPart.CanCollide = false;
                                v871.Character.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                AttackNoCoolDown();
                            until not _G.AutoKillTrial or not v871.Parent or (v871.Character.Humanoid.Health <= 0)
                        end
                    end
                end
            end
        end);
    end
end);
local v56 = v16.Race:AddSection("Huấn Luyện");
local v147 = v16.Race:AddToggle("ToggleFarmRace", {
    Title = "Cày Luyện Tộc",
    Description = "",
    Default = false
});
local v148 = false;
v147:OnChanged(function(v364)
    v148 = v364;
end);
v17.ToggleFarmRace:SetValue(false);
spawn(function()
    while wait() do
        if v148 then
            pcall(function()
                if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
                    if (game.Players.LocalPlayer.Character.RaceTransformed.Value == true) then
                        _G.AutoBoneNoQuest = false;
                        Tween(CFrame.new(- 9698.4736328125, 445.09442138671875, 6545.8525390625));
                    elseif (game.Players.LocalPlayer.Character.RaceTransformed.Value == false) then
                        _G.AutoBoneNoQuest = true;
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game);
                        wait();
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game);
                    end
                end
            end);
        else
            _G.AutoBoneNoQuest = false;
        end
    end
end);
local v149 = v16.Race:AddToggle("ToggleUpgrade", {
    Title = "Mua Gear",
    Description = "",
    Default = false
});
v149:OnChanged(function(v365)
    _G.AutoUpgrade = v365;
    if _G.AutoUpgrade then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeRace", "Buy");
    end
end);
v17.ToggleUpgrade:SetValue(false);
local v56 = v16.Shop:AddSection("Khả Năng");
v16.Shop:AddButton({
    Title = "Nhảy",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo");
    end
});
v16.Shop:AddButton({
    Title = "Haki Đấm",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso");
    end
});
v16.Shop:AddButton({
    Title = "Dịch Chuyển",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru");
    end
});
v16.Shop:AddButton({
    Title = "Haki Quan Sát",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk", "Buy");
    end
});
local v56 = v16.Shop:AddSection("Kiếm");
v16.Shop:AddButton({
    Title = "Cutlass",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cutlass");
    end
});
v16.Shop:AddButton({
    Title = "Katana",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Katana");
    end
});
v16.Shop:AddButton({
    Title = "Iron Mace",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace");
    end
});
v16.Shop:AddButton({
    Title = "Duel Katana",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Duel Katana");
    end
});
v16.Shop:AddButton({
    Title = "Triple Katana",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana");
    end
});
v16.Shop:AddButton({
    Title = "Pipe",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Pipe");
    end
});
v16.Shop:AddButton({
    Title = "Dual-Headed Blade",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade");
    end
});
v16.Shop:AddButton({
    Title = "Bisento",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Bisento");
    end
});
v16.Shop:AddButton({
    Title = "Soul Cane",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane");
    end
});
v16.Shop:AddButton({
    Title = "Pole V2",
    Description = "",
    Callback = function()
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ThunderGodTalk");
    end
});
local v56 = v16.Shop:AddSection("Võ");
v16.Shop:AddButton({
    Title = "Black Leg",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg");
    end
});
v16.Shop:AddButton({
    Title = "Electro",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro");
    end
});
v16.Shop:AddButton({
    Title = "Fishman Karate",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate");
    end
});
v16.Shop:AddButton({
    Title = "Dragon Claw",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1");
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2");
    end
});
v16.Shop:AddButton({
    Title = "Superhuman",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman");
    end
});
v16.Shop:AddButton({
    Title = "Death Step",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep");
    end
});
v16.Shop:AddButton({
    Title = "Sharkman Karate",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true);
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate");
    end
});
v16.Shop:AddButton({
    Title = "Electric Claw",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw");
    end
});
v16.Shop:AddButton({
    Title = "Dragon Talon",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon");
    end
});
v16.Shop:AddButton({
    Title = "Godhuman",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman");
    end
});
v16.Shop:AddButton({
    Title = "Sanguine Art",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt");
    end
});
local v56 = v16.Shop:AddSection("Khác");
v16.Shop:AddButton({
    Title = "Đổi Chỉ Số",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "1");
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2");
    end
});
v16.Shop:AddButton({
    Title = "Đổi Tộc",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "1");
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2");
    end
});
v16.Shop:AddButton({
    Title = "Đổi Tộc Ghoul",
    Description = "",
    Callback = function()
        local v366 = {
            [1] = "Ectoplasm",
            [2] = "Change",
            [3] = 4
        };
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v366));
    end
});
v16.Shop:AddButton({
    Title = "Đổi Tộc Cyborg",
    Description = "",
    Callback = function()
        local v367 = {
            [1] = "CyborgTrainer",
            [2] = "Buy"
        };
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v367));
    end
});
v16.Shop:AddButton({
    Title = "Đổi Tộc Draco",
    Description = "Chỉ Ở Biển 3",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, - 334.9649963378906));
        Tween2(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938));
        local v368 = Vector3.new(5814.42724609375, 1208.3267822265625, 884.5785522460938);
        local v369 = game.Players.LocalPlayer;
        local v370 = v369.Character or v369.CharacterAdded:Wait() ;
        repeat
            wait();
        until (v370.HumanoidRootPart.Position - v368).Magnitude < 1
        local v371 = {
            [1] = {
                NPC = "Dragon Wizard",
                Command = "DragonRace"
            }
        };
        game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(v371));
    end
});
v16.Misc:AddButton({
    Title = "Tham Gia Máy Chủ Lại",
    Description = "",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer);
    end
});
v16.Misc:AddButton({
    Title = "Đổi Máy Chủ",
    Description = "",
    Callback = function()
        Hop();
    end
});
function Hop()
    local v372 = game.PlaceId;
    local v373 = {};
    local v374 = "";
    local v375 = os.date("!*t").hour;
    local v376 = false;
    function TPReturner()
        local v556;
        if (v374 == "") then
            v556 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. v372 .. "/servers/Public?sortOrder=Asc&limit=100"));
        else
            v556 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. v372 .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. v374));
        end
        local v557 = "";
        if (v556.nextPageCursor and (v556.nextPageCursor ~= "null") and (v556.nextPageCursor ~= nil)) then
            v374 = v556.nextPageCursor;
        end
        local v558 = 0;
        for v651, v652 in pairs(v556.data) do
            local v653 = true;
            v557 = tostring(v652.id);
            if (tonumber(v652.maxPlayers) > tonumber(v652.playing)) then
                for v872, v873 in pairs(v373) do
                    if (v558 ~= 0) then
                        if (v557 == tostring(v873)) then
                            v653 = false;
                        end
                    elseif (tonumber(v375) ~= tonumber(v873)) then
                        local v1472 = pcall(function()
                            v373 = {};
                            table.insert(v373, v375);
                        end);
                    end
                    v558 = v558 + 1 ;
                end
                if (v653 == true) then
                    table.insert(v373, v557);
                    wait();
                    pcall(function()
                        wait();
                        game:GetService("TeleportService"):TeleportToPlaceInstance(v372, v557, game.Players.LocalPlayer);
                    end);
                    wait();
                end
            end
        end
    end
    function v118()
        while wait() do
            pcall(function()
                TPReturner();
                if (v374 ~= "") then
                    TPReturner();
                end
            end);
        end
    end
    v118();
end
local v56 = v16.Misc:AddSection("Đội");
v16.Misc:AddButton({
    Title = "Hải Tặc",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates");
    end
});
v16.Misc:AddButton({
    Title = "Hải Quân",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines");
    end
});
local v56 = v16.Misc:AddSection("Kinh Nghiệm");
local v150 = {
    "KITT_RESET",
    "Sub2UncleKizaru",
    "SUB2GAMERROBOT_RESET1",
    "Sub2Fer999",
    "Enyu_is_Pro",
    "JCWK",
    "StarcodeHEO",
    "MagicBus",
    "KittGaming",
    "Sub2CaptainMaui",
    "Sub2OfficalNoobie",
    "TheGreatAce",
    "Sub2NoobMaster123",
    "Sub2Daigrock",
    "Axiore",
    "StrawHatMaine",
    "TantaiGaming",
    "Bluxxy",
    "SUB2GAMERROBOT_EXP1",
    "Chandler",
    "NOMOREHACK",
    "BANEXPLOIT",
    "WildDares",
    "BossBuild",
    "GetPranked",
    "EARN_FRUITS",
    "FIGHT4FRUIT",
    "NOEXPLOITER",
    "NOOB2ADMIN",
    "CODESLIDE",
    "ADMINHACKED",
    "ADMINDARES",
    "fruitconcepts",
    "krazydares",
    "TRIPLEABUSE",
    "SEATROLLING",
    "24NOADMIN",
    "REWARDFUN",
    "NEWTROLL",
    "fudd10_v2",
    "Fudd10",
    "Bignews",
    "SECRET_ADMIN"
};
v16.Misc:AddButton({
    Title = "Nhập Hết",
    Description = "",
    Callback = function()
        for v559, v560 in ipairs(v150) do
            RedeemCode(v560);
        end
    end
});
function RedeemCode(v377)
    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(v377);
end
local v56 = v16.Misc:AddSection("Danh Hiệu");
v16.Misc:AddButton({
    Title = "Danh Hiệu",
    Description = "",
    Callback = function()
        local v378 = {
            [1] = "getTitles"
        };
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v378));
        game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true;
    end
});
local v56 = v16.Misc:AddSection("Thức Tỉnh");
v16.Misc:AddButton({
    Title = "Thức Tỉnh",
    Description = "",
    Callback = function()
        game:GetService("Players").LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = true;
    end
});
local v56 = v16.Misc:AddSection("Khác");
local v151 = v16.Misc:AddToggle("ToggleRejoin", {
    Title = "Tham Gia Máy Chủ Lại",
    Description = "",
    Default = true
});
v151:OnChanged(function(v381)
    _G.AutoRejoin = v381;
end);
v17.ToggleRejoin:SetValue(true);
spawn(function()
    while wait() do
        if _G.AutoRejoin then
            getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(v808)
                if ((v808.Name == "ErrorPrompt") and v808:FindFirstChild("MessageArea") and v808.MessageArea:FindFirstChild("ErrorFrame")) then
                    game:GetService("TeleportService"):Teleport(game.PlaceId);
                end
            end);
        end
    end
end);
local v56 = v16.Misc:AddSection("Sương");
local function v152()
    local v382 = game:GetService("Lighting");
    if v382:FindFirstChild("BaseAtmosphere") then
        v382.BaseAtmosphere:Destroy();
    end
    if v382:FindFirstChild("SeaTerrorCC") then
        v382.SeaTerrorCC:Destroy();
    end
    if v382:FindFirstChild("LightingLayers") then
        if v382.LightingLayers:FindFirstChild("Atmosphere") then
            v382.LightingLayers.Atmosphere:Destroy();
        end
        wait();
        if v382.LightingLayers:FindFirstChild("DarkFog") then
            v382.LightingLayers.DarkFog:Destroy();
        end
    end
    v382.FogEnd = 100000;
end
v16.Misc:AddButton({
    Title = "Xóa Sương Mù",
    Description = "",
    Callback = function()
        v152();
    end
});
local v153 = v16.Misc:AddToggle("ToggleAntiBand", {
    Title = "Chống Band",
    Description = "",
    Default = true
});
v153:OnChanged(function(v384)
    _G.AntiBand = v384;
end);
local v154 = {
    17884881,
    120173604,
    912348
};
spawn(function()
    while wait() do
        if _G.AntiBand then
            for v809, v810 in pairs(game:GetService("Players"):GetPlayers()) do
                if table.find(v154, v810.UserId) then
                    Hop();
                end
            end
        end
    end
end);
local v56 = v16.Sea:AddSection("Leviathan");
v16.Sea:AddButton({
    Title = "Mua Chip Leviathan",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("InfoLeviathan", "2");
    end
});
local v155 = v16.Sea:AddToggle("ToggleTPFrozenDimension", {
    Title = "Bay Đến Đảo Leviathan",
    Description = "",
    Default = false
});
v155:OnChanged(function(v385)
    _G.TweenToFrozenDimension = v385;
end);
v155:SetValue(false);
spawn(function()
    local v386;
    while not v386 do
        v386 = game:GetService("Workspace").Map:FindFirstChild("FrozenDimension");
        wait();
    end
    while wait() do
        if _G.TweenToFrozenDimension then
            if v386 then
                Tween(v386.CFrame);
            end
        end
    end
end);
if Sea3 then
    local v561 = v16.Sea:AddParagraph({
        Title = "Trạng Thái Chip Leviathan",
        Content = ""
    });
    spawn(function()
        pcall(function()
            while wait() do
                local v811 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("InfoLeviathan", "1");
                if (v811 == 5) then
                    v561:SetDesc("Leviathan Is Out There");
                elseif (v811 == 0) then
                    v561:SetDesc("I Don't Know");
                else
                    v561:SetDesc("Mua: " .. tostring(v811));
                end
            end
        end);
    end);
end
local v156 = v16.Sea:AddSection("Draco");
local v157 = v16.Sea:AddToggle("ToggleBlazeEmber", {
    Title = "Lụm Lửa Đỏ",
    Description = "",
    Default = false
});
v157:OnChanged(function(v387)
    _G.AutoBlazeEmber = v387;
end);
spawn(function()
    while wait() do
        if _G.AutoBlazeEmber then
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/DragonDojoEmber"):FireServer();
            end);
        end
    end
end);
local v158 = v16.Sea:AddToggle("ToggleReceiveQuest", {
    Title = "Nhận Nhiệm Vụ Lửa Đỏ",
    Description = "Bật Lên 1 Lần Là Nhận 1 Nhận Nữa Thì Tắt Bật Lại",
    Default = false
});
v158:OnChanged(function(v388)
    _G.AutoReceiveQuest = v388;
    if _G.AutoReceiveQuest then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, - 334.9649963378906));
        Tween2(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938));
        spawn(function()
            pcall(function()
                while wait() do
                    local v874 = {
                        [1] = {
                            Context = "RequestQuest"
                        }
                    };
                    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack(v874));
                    local v875 = {
                        [1] = {
                            Context = "Check"
                        }
                    };
                    local v876 = game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack(v875));
                end
            end);
        end);
    end
end);
local v159 = v16.Sea:AddParagraph({
    Title = "Trạng Thái Nhiệm Vụ Lửa Đỏ",
    Content = ""
});
spawn(function()
    pcall(function()
        while wait() do
            local v654 = {
                [1] = {
                    Context = "Check"
                }
            };
            local v655 = game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack(v654));
            if (typeof(v655) == "table") then
                for v877, v878 in pairs(v655) do
                    if (v878 == "Defeat 3 Venomous Assailants on Hydra Island.") then
                        v159:SetDesc("Defeat 3 Venomous Assailants on Hydra Island.");
                    elseif (v878 == "Defeat 3 Hydra Enforcers on Hydra Island.") then
                        v159:SetDesc("Defeat 3 Hydra Enforcers on Hydra Island.");
                    elseif (v878 == "Destroy 10 trees on Hydra Island.") then
                        v159:SetDesc("Destroy 10 trees on Hydra Island.");
                    end
                end
            else
                print(v655);
            end
        end
    end);
end);
local v160 = v16.Sea:AddToggle("ToggleHydraTree", {
    Title = "Phá Cây Ở Đảo Hydra",
    Description = "",
    Default = false
});
v160:OnChanged(function(v389)
    _G.AutoHydraTree = v389;
end);
local function v161(v390)
    local v391 = game:GetService("VirtualInputManager");
    v391:SendKeyEvent(true, v390, false, game);
    v391:SendKeyEvent(false, v390, false, game);
end
local function v162(v392)
    local v393 = game.Players.LocalPlayer;
    local v394 = v393.Backpack;
    for v562, v563 in pairs(v394:GetChildren()) do
        if (v563:IsA("Tool") and (v563.ToolTip == v392)) then
            v563.Parent = v393.Character;
            for v812, v813 in ipairs({
                "Z",
                "X",
                "C",
                "V",
                "F"
            }) do
                wait();
                pcall(function()
                    v161(v813);
                end);
            end
            v563.Parent = v394;
            break;
        end
    end
end
local v163 = {
    CFrame.new(5288.61962890625, 1005.4000244140625, 392.43011474609375),
    CFrame.new(5343.39453125, 1004.1998901367188, 361.0687561035156),
    CFrame.new(5235.78564453125, 1004.1998901367188, 431.4530944824219),
    CFrame.new(5321.30615234375, 1004.1998901367188, 440.8951416015625),
    CFrame.new(5258.96484375, 1004.1998901367188, 345.5052490234375)
};
spawn(function()
    while wait() do
        if _G.AutoHydraTree then
            AutoHaki();
            for v814, v815 in ipairs(v163) do
                if not _G.AutoHydraTree then
                    break;
                end
                Tween2(v815);
                wait();
                local v816 = game.Players.LocalPlayer.Character;
                if (v816 and v816:FindFirstChild("HumanoidRootPart")) then
                    local v902 = (v816.HumanoidRootPart.Position - v815.Position).Magnitude;
                    if (v902 <= 1) then
                        v162("Melee");
                        v162("Sword");
                        v162("Gun");
                    end
                end
            end
        end
    end
end);
v156:AddButton({
    Title = "Bay Đến Khu Vực Dragon Dojo",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, - 334.9649963378906));
        Tween2(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938));
    end
});
v156:AddButton({
    Title = "Chế Tạo Volcanic Magnet",
    Description = "",
    Callback = function()
        local v395 = {
            [1] = "CraftItem",
            [2] = "Craft",
            [3] = "Volcanic Magnet"
        };
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v395));
    end
});
local v164 = v16.Sea:AddToggle("ToggleCollectFireFlowers", {
    Title = "Lụm Hoa Đỏ",
    Description = "",
    Default = false
});
v164:OnChanged(function(v396)
    _G.AutoCollectFireFlowers = v396;
end);
spawn(function()
    while wait() do
        if _G.AutoCollectFireFlowers then
            local v747 = workspace:FindFirstChild("FireFlowers");
            if v747 then
                for v903, v904 in pairs(v747:GetChildren()) do
                    if (v904:IsA("Model") and v904.PrimaryPart) then
                        local v1367 = v904.PrimaryPart.Position;
                        local v1368 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position;
                        local v1369 = (v1367 - v1368).Magnitude;
                        if (v1369 <= 1) then
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game);
                            wait(1.5);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game);
                        else
                            Tween2(CFrame.new(v1367));
                        end
                    end
                end
            end
        end
    end
end);
local v165 = v16.Sea:AddToggle("ToggleWhiteBelt", {
    Title = "Cày Đai Trắng",
    Description = "",
    Default = false
});
v165:OnChanged(function(v397)
    _G.AutoLevel = v397;
    if v397 then
        local v656 = {
            [1] = {
                NPC = "Dojo Trainer",
                Command = "RequestQuest"
            }
        };
        game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(v656));
        spawn(function()
            while _G.AutoLevel do
                local v817 = {
                    [1] = {
                        NPC = "Dojo Trainer",
                        Command = "ClaimQuest"
                    }
                };
                game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(v817));
                wait();
            end
        end);
    end
end);
local v166 = v16.Sea:AddParagraph({
    Title = "Hoàn Thành Ải Draco V4 (Sớm Ra)",
    Content = ""
});
local v167 = v16.Sea:AddToggle("ToggleTrialTeleport", {
    Title = "Bay Đến Cửa Trial Tộc Draco",
    Description = "",
    Default = false
});
v167:OnChanged(function(v398)
    _G.AutoTrialTeleport = v398;
end);
spawn(function()
    while wait() do
        if _G.AutoTrialTeleport then
            local v748 = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport");
            if (v748 and v748:IsA("Part")) then
                Tween2(CFrame.new(v748.Position));
            end
        end
    end
end);
local v168 = v16.Sea:AddSection("Đảo Dung Nham");
local v169 = v16.Sea:AddParagraph({
    Title = "Trạng Thái Đảo Dung Nham",
    Content = ""
});
spawn(function()
    pcall(function()
        while wait() do
            if game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland") then
                v169:SetDesc("Đảo Dung Nham: ✅️");
            else
                v169:SetDesc("Đảo Dung Nham: ❌️");
            end
        end
    end);
end);
local v170 = v16.Sea:AddToggle("ToggleTPVolcano", {
    Title = "Bay Đến Đảo Dung Nham",
    Description = "",
    Default = false
});
v170:OnChanged(function(v399)
    _G.TweenToPrehistoric = v399;
end);
v17.ToggleTPVolcano:SetValue(false);
spawn(function()
    local v400;
    while not v400 do
        v400 = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland");
        wait();
    end
    while wait() do
        if _G.TweenToPrehistoric then
            local v749 = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland");
            if v749 then
                local v879 = v749:FindFirstChild("Core") and v749.Core:FindFirstChild("PrehistoricRelic") ;
                local v880 = v879 and v879:FindFirstChild("Skull") ;
                if v880 then
                    Tween2(CFrame.new(v880.Position));
                    _G.TweenToPrehistoric = false;
                end
            end
        end
    end
end);
local v171 = v16.Sea:AddToggle("ToggleDefendVolcano", {
    Title = "Phòng Thủ",
    Description = "",
    Default = false
});
v171:OnChanged(function(v401)
    _G.AutoDefendVolcano = v401;
end);
local v107 = v16.Sea:AddToggle("ToggleMelee", {
    Title = "Dùng Melee",
    Description = "",
    Default = false
});
v107:OnChanged(function(v402)
    _G.UseMelee = v402;
end);
local v109 = v16.Sea:AddToggle("ToggleSword", {
    Title = "Dùng Sword",
    Description = "",
    Default = false
});
v109:OnChanged(function(v403)
    _G.UseSword = v403;
end);
local v110 = v16.Sea:AddToggle("ToggleGun", {
    Title = "Dùng Gun",
    Description = "",
    Default = false
});
v110:OnChanged(function(v404)
    _G.UseGun = v404;
end);
local function v172(v405)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, v405, false, game);
    game:GetService("VirtualInputManager"):SendKeyEvent(false, v405, false, game);
end
local function v173()
    local v406 = game.Workspace.Map.PrehistoricIsland.Core:FindFirstChild("InteriorLava");
    if (v406 and v406:IsA("Model")) then
        v406:Destroy();
    end
    local v407 = game.Workspace.Map:FindFirstChild("PrehistoricIsland");
    if v407 then
        for v750, v751 in pairs(v407:GetDescendants()) do
            if (v751:IsA("Part") and v751.Name:lower():find("lava")) then
                v751:Destroy();
            end
        end
    end
    local v408 = game.Workspace.Map:FindFirstChild("PrehistoricIsland");
    if v408 then
        for v752, v753 in pairs(v408:GetDescendants()) do
            if v753:IsA("Model") then
                for v905, v906 in pairs(v753:GetDescendants()) do
                    if (v906:IsA("MeshPart") and v906.Name:lower():find("lava")) then
                        v906:Destroy();
                    end
                end
            end
        end
    end
end
local function v174()
    local v409 = game.Workspace.Map.PrehistoricIsland.Core.VolcanoRocks;
    for v564, v565 in pairs(v409:GetChildren()) do
        if v565:IsA("Model") then
            local v754 = v565:FindFirstChild("volcanorock");
            if (v754 and v754:IsA("MeshPart")) then
                local v881 = v754.Color;
                if ((v881 == Color3.fromRGB(185, 53, 56)) or (v881 == Color3.fromRGB(185, 53, 57))) then
                    return v754;
                end
            end
        end
    end
    return nil;
end
local function v162(v410)
    local v411 = game.Players.LocalPlayer;
    local v412 = v411.Backpack;
    for v566, v567 in pairs(v412:GetChildren()) do
        if (v567:IsA("Tool") and (v567.ToolTip == v410)) then
            v567.Parent = v411.Character;
            for v818, v819 in ipairs({
                "Z",
                "X",
                "C",
                "V",
                "F"
            }) do
                wait();
                pcall(function()
                    v172(v819);
                end);
            end
            v567.Parent = v412;
            break;
        end
    end
end
spawn(function()
    while wait() do
        if _G.AutoDefendVolcano then
            AutoHaki();
            pcall(v173);
            local v757 = v174();
            if v757 then
                local v882 = CFrame.new(v757.Position + Vector3.new(0, 0, 0));
                Tween2(v882);
                local v883 = v757.Color;
                if ((v883 ~= Color3.fromRGB(185, 53, 56)) and (v883 ~= Color3.fromRGB(185, 53, 57))) then
                    v757 = v174();
                else
                    local v1125 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position;
                    local v1126 = ((v1125 - v757.Position) - Vector3.new(0, 0, 0)).Magnitude;
                    if (v1126 <= 1) then
                        if _G.UseMelee then
                            v162("Melee");
                        end
                        if _G.UseSword then
                            v162("Sword");
                        end
                        if _G.UseGun then
                            v162("Gun");
                        end
                    end
                    _G.TweenToPrehistoric = false;
                end
            else
                _G.TweenToPrehistoric = true;
            end
        end
    end
end);
local v175 = v16.Sea:AddToggle("ToggleKillAura", {
    Title = "Đấm Golems Aura",
    Description = "",
    Default = false
});
v175:OnChanged(function(v413)
    KillAura = v413;
end);
v17.ToggleKillAura:SetValue(false);
spawn(function()
    while wait() do
        if KillAura then
            pcall(function()
                for v884, v885 in pairs(game.Workspace.Enemies:GetDescendants()) do
                    if (v885:FindFirstChild("Humanoid") and v885:FindFirstChild("HumanoidRootPart") and (v885.Humanoid.Health > 0)) then
                        repeat
                            task.wait();
                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
                            v885.Humanoid.Health = 0;
                            v885.HumanoidRootPart.CanCollide = false;
                        until not KillAura or not v885.Parent or (v885.Humanoid.Health <= 0)
                    end
                end
            end);
        end
    end
end);
local v176 = v16.Sea:AddToggle("ToggleCollectBone", {
    Title = "Lụm Xương",
    Description = "",
    Default = false
});
v176:OnChanged(function(v414)
    _G.AutoCollectBone = v414;
end);
spawn(function()
    while wait() do
        if _G.AutoCollectBone then
            for v820, v821 in pairs(workspace:GetDescendants()) do
                if (v821:IsA("BasePart") and (v821.Name == "DinoBone")) then
                    Tween2(CFrame.new(v821.Position));
                end
            end
        end
    end
end);
local v177 = v16.Sea:AddToggle("ToggleCollectEgg", {
    Title = "Lụm Trứng",
    Description = "",
    Default = false
});
v177:OnChanged(function(v415)
    _G.AutoCollectEgg = v415;
end);
spawn(function()
    while wait() do
        if _G.AutoCollectEgg then
            local v758 = workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:GetChildren();
            if (# v758 > 0) then
                local v886 = v758[math.random(1, # v758)];
                if (v886:IsA("Model") and v886.PrimaryPart) then
                    Tween2(v886.PrimaryPart.CFrame);
                    local v1127 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position;
                    local v1128 = v886.PrimaryPart.Position;
                    local v1129 = (v1127 - v1128).Magnitude;
                    if (v1129 <= 1) then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game);
                        wait(1.5);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game);
                    end
                end
            end
        end
    end
end);
v14:Notify({
    Title = "Văn Thành IOS",
    Content = "Tải Xong",
    Duration = 10
});

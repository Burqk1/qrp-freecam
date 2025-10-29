local QBCore = exports['qb-core']:GetCoreObject()

local normalSpeed = 0.05
local fastSpeed = 0.1
local mouseSensitivity = 4.0
local distanceLimit = 10.0

local minFov = 5.0
local maxFov = 90.0
local fovStep = 2.0
local defaultFov = 50.0

local transitionSpeed = 150
local rotationSensitivity = 1.0
local speedMultiplier = 1.0
local zoomLevel = 1.0

local inFreecam = false
local freecamCam = nil
local savedCoords = nil
local showControls = true
local nuiOpen = false

local vectorMeta = {}
vectorMeta.__index = vectorMeta

function vectorMeta.__add(a, b)
    return vec3(a.x + b.x, a.y + b.y, a.z + b.z)
end

function vectorMeta.__sub(a, b)
    return vec3(a.x - b.x, a.y - b.y, a.z - b.z)
end

function vectorMeta.__mul(a, b)
    if type(a) == "table" and type(b) == "number" then
        return vec3(a.x * b, a.y * b, a.z * b)
    elseif type(b) == "table" and type(a) == "number" then
        return vec3(b.x * a, b.y * a, b.z * a)
    else
        error("Vector multiplication error: must be (vector, number) or (number, vector)")
    end
end

function vectorMeta.__len(a)
    return math.sqrt(a.x * a.x + a.y * a.y + a.z * a.z)
end

function vec3(x, y, z)
    local t = { x = x, y = y, z = z }
    setmetatable(t, vectorMeta)
    return t
end

function OpenNUI()
    if not nuiOpen then
        SetNuiFocus(false, false)
        SendNUIMessage({
            action = 'showUI',
            show = true
        })
        nuiOpen = true
    end
end

function CloseNUI()
    if nuiOpen then
        SendNUIMessage({
            action = 'showUI',
            show = false
        })
        nuiOpen = false
    end
end

RegisterNUICallback('closeUI', function(data, cb)
    CloseNUI()
    cb('ok')
end)

function ForceCloseFreecam(reason)
    if not inFreecam then return end

    local ped = PlayerPedId()

    if DoesCamExist(freecamCam) then
        RenderScriptCams(false, false, 0, true, true)
        DestroyCam(freecamCam, false)
    end
    freecamCam = nil

    FreezeEntityPosition(ped, false)
    SetEntityCollision(ped, true, true)
    SetEntityInvincible(ped, false)

    inFreecam = false
    CloseNUI()

    if reason == "distance" then
        QBCore.Functions.Notify("Mesafe sınırını aştınız, freecam kapatıldı.", "error")
    else
        QBCore.Functions.Notify("Freecam kapatıldı.", "success")
    end
end

function ToggleFreecam()
    local ped = PlayerPedId()

    if not inFreecam then
        savedCoords = GetEntityCoords(ped)
        local heading = GetEntityHeading(ped)
        local headingRad = math.rad(heading)

        local offsetX = -math.sin(headingRad) * 3.0
        local offsetY = math.cos(headingRad) * 3.0

        freecamCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        SetCamCoord(freecamCam,
            savedCoords.x + offsetX,
            savedCoords.y + offsetY,
            savedCoords.z + 2.0)

        SetCamRot(freecamCam, -20.0, 0.0, heading + 180.0)

        FreezeEntityPosition(ped, true)
        SetEntityCollision(ped, false, true)
        SetEntityInvincible(ped, true)

        SetCamNearClip(freecamCam, 0.1)
        SetCamFarClip(freecamCam, 1000.0)
        SetCamFov(freecamCam, defaultFov)
        SetCamActive(freecamCam, true)
        RenderScriptCams(true, true, transitionSpeed, true, true)

        inFreecam = true
        showControls = true
        OpenNUI()

        CreateThread(function()
            FreecamLoop()
        end)
    else
        ForceCloseFreecam()
    end
end

function FreecamLoop()
    local initialRot = GetCamRot(freecamCam, 2)
    local pitch = initialRot.x
    local roll = initialRot.y
    local heading = initialRot.z
    local currentFov = GetCamFov(freecamCam)

    while inFreecam do
        Wait(0)

        DisableAllControlActions(0)
        EnableControlAction(0, 1, true)  -- Mouse X
        EnableControlAction(0, 2, true)  -- Mouse Y
        EnableControlAction(0, 249, true) -- N (chat)
        EnableControlAction(0, 245, true) -- T (chat)

        if IsDisabledControlJustPressed(0, 74) then
            SendNUIMessage({
                action = 'toggleMenu'
            })
        end

        if IsDisabledControlJustPressed(0, 20) then
            showControls = not showControls
            if showControls then
                OpenNUI()
            else
                CloseNUI()
            end
        end

        local mouseX = GetDisabledControlNormal(0, 1) * mouseSensitivity * rotationSensitivity
        local mouseY = GetDisabledControlNormal(0, 2) * mouseSensitivity * rotationSensitivity

        pitch = pitch - mouseY
        if pitch > 89.0 then pitch = 89.0 end
        if pitch < -89.0 then pitch = -89.0 end

        heading = heading - mouseX
        heading = heading % 360.0

        SetCamRot(freecamCam, pitch, roll, heading, 2)

        local scrollUp = GetDisabledControlNormal(0, 241)
        local scrollDown = GetDisabledControlNormal(0, 242)

        if scrollUp ~= 0 then
            currentFov = currentFov - (fovStep * math.abs(scrollUp))
            zoomLevel = (maxFov - currentFov) / (maxFov - minFov)
        end
        if scrollDown ~= 0 then
            currentFov = currentFov + (fovStep * math.abs(scrollDown))
            zoomLevel = (maxFov - currentFov) / (maxFov - minFov)
        end

        if currentFov < minFov then
            currentFov = minFov
        elseif currentFov > maxFov then
            currentFov = maxFov
        end

        SetCamFov(freecamCam, currentFov)

        local camCoords = GetCamCoord(freecamCam)
        local forwardVec = RotationToDirection(pitch, heading)

        local speed = normalSpeed * speedMultiplier
        if IsDisabledControlPressed(0, 21) then
            speed = fastSpeed * speedMultiplier
        end

        if IsDisabledControlPressed(0, 32) then
            camCoords = camCoords + (forwardVec * speed)
        end
        if IsDisabledControlPressed(0, 33) then
            camCoords = camCoords - (forwardVec * speed)
        end

        local rightVec = vec3(forwardVec.y, -forwardVec.x, 0.0)
        if IsDisabledControlPressed(0, 34) then
            camCoords = camCoords - (rightVec * speed)
        end
        if IsDisabledControlPressed(0, 35) then
            camCoords = camCoords + (rightVec * speed)
        end

        if IsDisabledControlPressed(0, 38) then
            roll = roll + (rotationSensitivity * 0.8)
        end
        if IsDisabledControlPressed(0, 44) then
            roll = roll - (rotationSensitivity * 0.8)
        end

        if roll > 360.0 then roll = roll - 360.0 end
        if roll < -360.0 then roll = roll + 360.0 end

        if IsDisabledControlPressed(0, 45) then
            camCoords = vec3(camCoords.x, camCoords.y, camCoords.z + speed)
        end
        if IsDisabledControlPressed(0, 23) then
            camCoords = vec3(camCoords.x, camCoords.y, camCoords.z - speed)
        end

        if IsDisabledControlJustPressed(0, 22) then
            speedMultiplier = speedMultiplier + 0.5
            if speedMultiplier > 5.0 then speedMultiplier = 1.0 end
        end

        SetCamCoord(freecamCam, camCoords.x, camCoords.y, camCoords.z)

        local dist = #(camCoords - savedCoords)
        if dist > distanceLimit then
            ForceCloseFreecam("distance")
        end
    end
end

function RotationToDirection(pitch, yaw)
    local pitchRad = math.rad(pitch)
    local yawRad = math.rad(yaw)
    local x = -math.sin(yawRad) * math.cos(pitchRad)
    local y = math.cos(yawRad) * math.cos(pitchRad)
    local z = math.sin(pitchRad)
    return vec3(x, y, z)
end

RegisterKeyMapping("freecam", "Toggle Freecam", "keyboard", "F6")
RegisterCommand("freecam", function()
    ToggleFreecam()
end)

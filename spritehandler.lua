local SpriteHandler = {}

function SpriteHandler.new()
    local self = {}

    local image
    local animations = {}
    local currentAnimation = nil
    local currentFrame = 1
    local fps = 12
    local sizeMultiplier = 1

    function self:setImage(img)
        image = img
    end

    function parseXML(data)
        local animations = {}
        local _, _, imagePath = data:find('imagePath="([^"]+)"')

        for name, x, y, width, height in data:gmatch('<SubTexture name="([^"]+)" x="(%d+)" y="(%d+)" width="(%d+)" height="(%d+)"') do
            local animationName = name:match("([^%d]+)") -- Extracting animation name without frame number
            if not animations[animationName] then
                animations[animationName] = {}
            end
            table.insert(animations[animationName], {
                quad = love.graphics.newQuad(tonumber(x), tonumber(y), tonumber(width), tonumber(height), image:getWidth(), image:getHeight()),
                width = tonumber(width),
                height = tonumber(height)
            })
        end

        return animations, imagePath
    end

    function self:setXML(data)
        animations, imagePath = parseXML(data)
    end

    function self:setFPS(f)
        fps = f
    end

    function self:setSizeMultiplier(s)
        sizeMultiplier = s
    end

    function self:Play(animationName)
        if animations[animationName] then
            currentAnimation = animationName
            currentFrame = 1
        else
            print("Animation '" .. animationName .. "' not found.")
        end
    end

    function self:Stop()
        currentAnimation = nil
    end

    function self:Pause()
        currentAnimation = nil
    end

    function self:Resume()
        if currentAnimation == nil and animations[currentAnimation] then
            currentAnimation = currentAnimation
        end
    end

    function self:update(dt)
        if currentAnimation then
            currentFrame = currentFrame + fps * dt
            if currentFrame >= #animations[currentAnimation] + 1 then
                currentFrame = 1
            end
        end
    end

    function self:draw(x, y)
        if currentAnimation then
            local animationFrames = animations[currentAnimation]
            local frame = math.floor(currentFrame)
            if frame > #animationFrames then
                frame = #animationFrames
            end
            local animation = animationFrames[frame]
            local quad = animation.quad
            local width = animation.width * sizeMultiplier
            local height = animation.height * sizeMultiplier
            love.graphics.draw(image, quad, x, y, 0, sizeMultiplier, sizeMultiplier)
        end
    end

    return self
end

return SpriteHandler

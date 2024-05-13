# LOVE-SpritesheetHandler
Sparrow v2 and Starling spritesheet handler for LÖVE 2D Game Engine.
This can handle multiple animations from one sprite sheet.

Pop the spritehandler.lua file into your project.

Heres a few snippets

`local SpriteHandler = require("lib.spritehandler")`
`function love.load()
    _G.sprite1 = SpriteHandler.new()
    sprite1:setImage(love.graphics.newImage("spritesheet"))
    sprite1:setXML(love.filesystem.read("spritesheetxml"))
    sprite1:setFPS(24)
    sprite1:setSizeMultiplier(2)
    sprite1:Play("animation")
end
`

Now I need to try implementing Adobe Animate's texture atlases....

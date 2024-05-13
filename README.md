# LOVE-SpritesheetHandler
Sparrow v2 and Starling spritesheet handler for LÖVE 2D Game Engine.
This can handle multiple animations from one sprite sheet.

Pop the spritehandler.lua file into your project.

Heres a few snippets for use in the main.lua fie.

```lua
local SpriteHandler = require("spritehandler") -- Change to the directory of the spritehandler lua file.
```
This adds the following functions below. Make sure to have the spritehandler.lua file somewhere in your project and is in the directory put above.

```lua
function love.load()
    _G.sprite1 = SpriteHandler.new()
    sprite1:setImage(love.graphics.newImage("spritesheet"))
    sprite1:setXML(love.filesystem.read("spritesheetxml"))
    sprite1:setFPS(24)
    sprite1:setSizeMultiplier(2)
    sprite1:Play("animation")

    -- You can also Pause, Resume and Stop the animation.
    sprite1:Stop()
    sprite1:Pause()
    sprite!:Resume()
    
end
```

Now I need to try implementing Adobe Animate's texture atlases....

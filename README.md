# LOVE-SpritesheetHandler v2

Sparrow v2 and (partially) Starling spritesheet handler for LÖVE 2D Game Engine.
This can handle multiple animations from one sprite sheet.

## What the heck is Sparrow v2 or Starling?

Sparrow v2 is a spritesheet format that uses a image file and an XML file to store sprite data.
It is used in the game Friday Night Funkin'

A small example of a spritesheet's XML data:

```xml
<TextureAtlas imagePath="BOYFRIEND.png">
<SubTexture name="BF idle dance0000" x="0" y="2344" width="406" height="392" frameX="-1" frameY="-20" frameWidth="411" frameHeight="412"/>
<SubTexture name="BF idle dance0001" x="0" y="2344" width="406" height="392" frameX="-1" frameY="-20" frameWidth="411" frameHeight="412"/>
<SubTexture name="BF idle dance0002" x="416" y="2344" width="408" height="393" frameX="0" frameY="-19" frameWidth="411" frameHeight="412"/>
<SubTexture name="BF idle dance0003" x="416" y="2344" width="408" height="393" frameX="0" frameY="-19" frameWidth="411" frameHeight="412"/>
<SubTexture name="BF idle dance0004" x="834" y="2344" width="405" height="398" frameX="-3" frameY="-14" frameWidth="411" frameHeight="412"/>
<SubTexture name="BF idle dance0005" x="834" y="2344" width="405" height="398" frameX="-3" frameY="-14" frameWidth="411" frameHeight="412"/>
<SubTexture name="BF idle dance0006" x="1249" y="2344" width="410" height="411" frameX="-1" frameY="-1" frameWidth="411" frameHeight="412"/>
<SubTexture name="BF idle dance0007" x="1249" y="2344" width="410" height="411" frameX="-1" frameY="-1" frameWidth="411" frameHeight="412"/>
<SubTexture name="BF idle dance0008" x="1669" y="2344" width="408" height="412" frameX="-2" frameY="0" frameWidth="411" frameHeight="412"/>
</TextureAtlas>
```

## How the heck do I use this?

Put the spritehandler.lua file somewhere in your project.

Make sure to require the spritesheet handler in your code

```lua
local SpriteHandler = require("spritehandler") -- Change to the directory of the spritehandler lua file.
```

Now you can start using it. Here is a simple example of how you can use the spritehandler:

```lua

local sprite

function love.load()
    sprite = spritehandler.new()
    sprite1:setImage("BOYFRIEND.png") -- Path to the image
    sprite1:setXML("BOYFRIEND.xml") -- Path to the XML file
    sprite1:setFPS(24) -- Sets the FPS

    sprite1:play("BF idle dance") -- Plays the animation provided
end

function love.update(dt)
    sprite:update(dt) -- Updates the sprite
end

function love.draw()
    sprite1:draw(x, y, rotation) -- Draws the sprite with the x, y and rotation provided
end

```

## Theres more functions!?

Theres a few more, and you can always add your own.

```lua

sprite:stop() -- Stops the current animation (sprite will become blank)
sprite:pause() -- Simply pauses the animation
sprite:resume() -- Simply resumes the animation

sprite:mouseTouching() -- Returns a boolean if the mouse is touching the sprite or not.

```

## One more thing

You can store extra data about a sprite simply by creating a variable in the sprite.

Example:

```lua

sprite.numberExample = 100
sprite.stringExample = "hello"
sprite.boolExample = true

```

Now I need to try implementing Adobe Animate's texture atlases....

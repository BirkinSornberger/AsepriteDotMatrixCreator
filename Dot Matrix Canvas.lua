--If you are able to help, I currently have two issues with this script:

--"Pattern aligned to source" should be enabled upon creating a new canvas(sprite)
--The "selection" point of the brush is in the bottom right. It should be in the center of the brush.
--Any help is greatly appreciated and I will gladly merge with my script!

local Dialog = Dialog("Dox Matrix Setup")

Dialog:label{ id="description", text="Dot Matrix Dimensions:" }
Dialog:number{ id="width", label="Width:", text="16" }
Dialog:number{ id="height", label="Height:", text="16" }

Dialog:color{ id="bgColor", label="Background Color:", color=Color{ r=187, g=177, b=77, a=255 } } --Dot matrix-esque color

-- Set up the main dialog
Dialog:button{ id="ok", text="OK", onclick=function()
  local width = Dialog.data.width
  local height = Dialog.data.height
  
  local bgColor = Dialog.data.bgColor

  local newWidth = width * 12
  local newHeight = height * 12
  
  -- Creates a new canvas with the modified dimensions
  local sprite = Sprite(newWidth, newHeight)

  local bgLayer = sprite.layers[1]
  local bgImage = bgLayer.cels[1].image
  
  for y = 0, newHeight - 1 do
    for x = 0, newWidth - 1 do
      bgImage:putPixel(x, y, bgColor) -- Fill the background with bgColor
    end
  end

  -- Create a new palette with two colors
  local palette = Palette(2)
  palette:setColor(0, bgColor)
  palette:setColor(1, Color{ r=0, g=0, b=0, a=255 })

  sprite:setPalette(palette)

  -- Creates an empty 12x12 image to be used as a brush
  local brushImage = Image(12, 12)

  -- Fill in the image with the left and bottom borders using the bg color, and the rest in black
  for y = 0, 11 do
    for x = 0, 11 do
      if x == 0 or y == 11 then
        brushImage:putPixel(x, y, bgColor)
      else
        brushImage:putPixel(x, y, Color{ r=0, g=0, b=0, a=255 })
      end
    end
  end


  local brush = Brush(brushImage)

  app.activeBrush = brush
  app.activeSprite = sprite

  app.command.SnapToGrid{ enabled = true }
  sprite.gridBounds = Rectangle(0, 0, 12, 12)
  app.command.ShowGrid{ enabled = true }

 -- app.activeBrush.center = Point(6, 6) Why doesn't this work?? I tried everything to center it arghhh!

  Dialog:close()

end }

Dialog:show{ wait = true }
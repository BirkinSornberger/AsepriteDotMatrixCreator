-- Sets up the dialog at the top of the window
local Dialog = Dialog("Dox Matrix Setup")

-- Creates the dialog box
Dialog:label{ id="description", text="Dot Matrix Dimensions:" }
Dialog:number{ id="width", label="Width:", text="16" }  -- Default width is 16
Dialog:number{ id="height", label="Height:", text="16" } -- Default height is 16

-- Add a color picker for the background color
Dialog:color{ id="bgColor", label="Background Color:", color=Color{ r=187, g=177, b=77, a=255 } } -- Default to black

-- Add the OK button & do other actions
Dialog:button{ id="ok", text="OK", onclick=function()
  -- Get the width and height entered by the user
  local width = Dialog.data.width
  local height = Dialog.data.height
  
  -- Get the background color selected by the user
  local bgColor = Dialog.data.bgColor

  -- Multiply width and height by 6
  local newWidth = width * 12
  local newHeight = height * 12
  
  -- Creates a new sprite with the modified dimensions
  local sprite = Sprite(newWidth, newHeight)

  -- Set the background color by filling the background layer
  local bgLayer = sprite.layers[1] -- Access the background layer
  local bgImage = bgLayer.cels[1].image -- Get the image in the background layer
  
  for y = 0, newHeight - 1 do
    for x = 0, newWidth - 1 do
      bgImage:putPixel(x, y, bgColor) -- Fill the background with the selected color
    end
  end

  -- Create a new palette with two colors
  local palette = Palette(2)
  palette:setColor(0, bgColor) -- First color: the background color
  palette:setColor(1, Color{ r=0, g=0, b=0, a=255 }) -- Second color: black

  -- Apply the palette to the sprite
  sprite:setPalette(palette)

  -- Creates an empty 12x12 image to be used as a brush
  local brushImage = Image(12, 12)

  -- Fill in the image with a left and bottom border using the background color, and the rest in black
  for y = 0, 11 do  -- Loop through rows (0 to 11 for 12 pixels)
    for x = 0, 11 do  -- Loop through columns (0 to 11 for 12 pixels)
      if x == 0 or y == 11 then
        -- Left border (x == 0) and bottom border (y == 11) using the background color
        brushImage:putPixel(x, y, bgColor)
      else
        -- All other pixels will be black
        brushImage:putPixel(x, y, Color{ r=0, g=0, b=0, a=255 })  -- Black color
      end
    end
  end

  -- Converts the image just created into a brush
  local brush = Brush(brushImage)
  app.activeBrush = brush

  -- Focus on the newly created sprite
  app.activeSprite = sprite

  -- Enable snap to grid and set grid size to 12x12 pixels
  app.command.SnapToGrid{ enabled = true }  -- Enable snapping to grid
  sprite.gridBounds = Rectangle(0, 0, 12, 12)  -- Set grid size to 12x12 pixels

  app.command.ShowGrid{ enabled = true }
  -- Close the window when finished creating the new sprite
  Dialog:close()

end }

-- Show the dialog
Dialog:show{ wait = true }

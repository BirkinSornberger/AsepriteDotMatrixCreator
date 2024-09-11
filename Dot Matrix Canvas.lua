-- Sets up the dialog at the top of the window
local Dialog = Dialog("Dox Matrix Setup")

-- Creates the dialog box
Dialog:label{ id="description", text="Dot Matrix Dimensions:" }
Dialog:number{ id="width", label="Width:", text="16" }  -- Default width is 16
Dialog:number{ id="height", label="Height:", text="16" } -- Default height is 16

-- Add the OK button & do other shit
Dialog:button{ id="ok", text="OK", onclick=function()
  -- Get the width and height entered by the user
  local width = Dialog.data.width
  local height = Dialog.data.height
  
  -- Multiply width and height by 6
  local newWidth = width * 11
  local newHeight = height * 11
  
  -- Creates a new sprite with the modified dimensions
  local sprite = Sprite(newWidth, newHeight)

  --Sets a plain black and white palette
  local palette = Palette(2)
  palette:setColor(0, Color{ r=0, g=0, b=0, a=255 })   --black
  palette:setColor(1, Color{ r=255, g=255, b=255, a=255 }) --white
  sprite:setPalette(palette)
  
    -- Creates an empty 10x10 image to be used as a brush
    local brushImage = Image(10, 10)

    -- This fills in the image black
    for y = 0, 9 do  -- Loop through rows (0 to 5 for 6 pixels)
    for x = 0, 9 do  -- Loop through columns (0 to 5 for 6 pixels)
        brushImage:putPixel(x, y, Color{ r=0, g=0, b=0, a=255 }) -- Black color
    end
    end

    -- Converts the image just created into a brush. Took me literally forever to figure out this stupid brush.
    local brush = Brush(brushImage)
    app.activeBrush = brush

  -- Focus on the newly created sprite
  app.activeSprite = sprite

  --Close the window when finished creating the new sprite
  Dialog:close()

end }

-- Show the dialog
Dialog:show{ wait = true }

NOTE: Upon creating a new canvas, you must enable "Pattern aligned to source" Likely at the top of Aseprite under the "Paint Brush" drop down.

This script will create a canvas for you in Aseprite that is setup for creating art in a dot matrix display style.

What it does is creates a black 12x12 square brush, this is your new pixel size.

When you enter a canvas width and height, it multiplies the values by 12.
This gives you a canvas of the same size you desired, but with larger pixels.

For instance, a 16x16 image will go up to 192, but since your pixel is now 12x12, and you must leave a 1px
space between each larger pixel, you can still only fit 16 pixels in both canvases.

I hope this makes sense, and I hope this script helps you out!

I created it because I need to create many such screens as seen in my example, and I wanted a way to expedite
the process of creating and setting up canvases!

There are still a couple issues, such as I'd like to automatically enable "Pattern aligned to source" upon creating
a new canvas. 
As well as change the "selection" point of the custom brush to be in the center, instead of the bottom right.

The font found in the repository was created by me and is completely free to use. I only ask that you don't try to sell it
as is, but feel free to use it in any projects or games that you intend to monetize, no credit necessary!

Enjoy!

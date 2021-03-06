# Mac Finder Service: Select alreay copied images

This is a Service for the Mac Finder. It selects all files (eg. JPEG images) in a finder window that already exist under a certain directory. The selected files can then be moved or deleted with Mac Finder.

I use this to list all videos and images from an SD card that I already sorted into my local picutes2 folderstructure before. The Service shows me all picture files that already exist on my local disk.

## Install

Copy the Automator workflow `SelectAlreadyCopiedImages.workflow` folder to `~/Library/Services/` under your home folder on your Mac. Configure the path to your local picture folder in the Automator Workflow.

## Usage

 - Open Mac Finder
 - Navigate to a folder that contains your images (eg. the SD card)
 - Right click on an image -> Services -> SelectAlreadyCopiedImages
 - All images that already exist locally will now be selected in the Finder window.
 - You may then for example delete these images from the SD card.

![Select already copied images](./SelectAlreadyCopiedImages_Screenshot.png)

## Licence & Author

This software is public domain. 
Author: www.doogie.de
Date: March 2015

## Version History

Current status of project: A working version that I use myself.

 - Doogie 2015-03-23 - switched to perl for finding files
 - Doogie 2015-03-17 - updated read
 - Doogie 2015-03-17 - correct relative link for screenshot
 - Doogie 2015-03-17 - added screenshot
 - Doogie 2015-03-17 - added screenshot
 - Doogie 2015-03-17 - initial version

## How I did this

Finder Services can easily be created with [Automator](http://www.automator.us) under OS X. I used a Perl script for finding the already exiting files, because perl hashes are quite fast. You can open the workflow in Automator and extend it as you like. Happy coding!
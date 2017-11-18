# PixelOS
Open source lightweight OS shell made in assembly.

## Installation (on a VM)
1. Download the latest.img file
2. Rename the file to pixelos.img
3. Download a VM software like VirtualBox or QEMU
4. Load pixelos.img with your VM software. (How you do it depends on the software.)
5. If everything went right, you should see a shell prompt

## Installation (on an actual computer)
1. Download the latest.img file
2. Rename it pixelos.img
3. Download [Win32 Disc Imager](https://sourceforge.net/projects/win32diskimager/)
4. Insert a flash drive in your computer
5. Open win32 disc imager and select the latest.img file
6. Click the write button and wait for a "write successfull" popup
7. Eject and remove the flash drive and move it into the (powered off) computer that you want to put pixelos on
8. Turn it on, and open the bios (on most computers, you can do that by pressing F12 while it's booting)
9. In the bios menu, tell it to boot from usb drive
10. Save and exit bios, and your computer should resume booting
11. If everything went right, you should see a shell prompt

## Usage
Simply type a command in the shell to run it. Here's a list of commands:
1. hello - A test command that just shows "Hello, world!"
2. A - Run app A (see the section on apps)
2. B - Run app B (see the section on apps)
2. C - Run app C (see the section on apps)

## Apps
PixelOS does not have filenames, but rather a one letter ID for each file.
Each app on PixelOS has a letter id A, B, or C (the latest version only allows 3 apps, but soon we will allow up to 10)
The first app you install will be app A, the second will be app B, and the third will be app C

## Installing Apps
1. Download a pixelos app file on a real os like Windows (PixelOS apps have the .bin extension by the way. A good example is the tedit.bin file included in this repo, a simple text editor)
2. Put it in the same directory as the PixelOS img file
3. Open the command line (cmd) in that folder
4. Run the following command: copy /b pixelos.img + <app file name>.bin pixelos.img
5. Load up pixelos.img (which now has the app installed) in your VM or computer
6. Type A in the shell (If it's your first app. If it's the second app you installed, then you would run B, or if it was the third, C)
7. Watch your app go! (If you got tedit.bin, you won't see anything, but start typing and then you will)

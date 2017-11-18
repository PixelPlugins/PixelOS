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
2. Download [Win32 Disc Imager](https://sourceforge.net/projects/win32diskimager/)
3. Insert a flash drive in your computer
4. Open win32 disc imager and select the latest.img file
5. Click the write button and wait for a "write successfull" popup
6. Eject and remove the flash drive and move it into the (powered off) computer that you want to put pixelos on
7. Turn it on, and open the bios (on most computers, you can do that by pressing F12 while it's booting)
8. In the bios menu, tell it to boot from usb drive
9. Save and exit bios, and your computer should resume booting
10. If everything went right, you should see a shell prompt

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

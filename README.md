### Commodore 64 Desktop attempts to offer a desktop styled launcher program.

Features:

- Icons for program selection
- Built in command line for a limited set of commands
- Screensaver which walks through the c64 RAM and prints the real values of each bit in binary.
- A clock of the systems uptime

## Desktop
![](https://raw.githubusercontent.com/ssshake/commodore-64-desktop/master/documentation/screen1.PNG)

The desktop is a glorified launcher program. Sprites are used to render icons, which accounts for the 9 second load time of the program.

To select an application to launch you can use the cursor keys and Return. Or you can press number keys 1-8 corresponding to application # 1,2,3,4 on the first row and 5,6,7,8 on the second row.

The desktop also features a clock which counts the hours, minutes, seconds of uptime.

To configure the applications to be launched, the application names on screen literally map to the program names on disk. The c64desktop.d64 floppy image provided has 8 corresponding programs included.

- Files: SDBrowse v4
- BBS: CCGMS
- Paint: Pixel Paint
- Game: Portal (for now)
- Word: A light weight word processor
- Sheets: A decent spreadsheets application
- Music: A SD2IEC compatible SID music player
- Basic: Will quit the program and return to basic.

To customize the desktop to use your preferred apps, copy your application to the same location as the desktop program. Then rename your program to 'Files' for example, to have the files icon launch you files program.

There is future consideration for a configuration file based approach with an editor program.

To launch the command line from the desktop press F3

## Commandline

The command line is very basic but it meant to be used with an sd2iec SD card reader. Any commands that the sd2iec can accept are value in this command line.

![](https://raw.githubusercontent.com/ssshake/commodore-64-desktop/master/documentation/screen2.PNG)

## Binary Screensaver

The screensaver will come on after roughly 1 minute. During this time the program will start at byte 1 in RAM and work its way to the end of the C64's ram. And then it will repeat.

Each bit it printed on screen and each byte alternates in color by green and light green. 

While the screensaver is running you can press + or - at any time to move forward or backwards a page at a time through the ram. 1 page = 110 bytes. 

![](https://raw.githubusercontent.com/ssshake/commodore-64-desktop/master/documentation/screen3.PNG)


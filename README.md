s2d - Send to Device
====================

Send text and documentation from the command line to various devices.

Examples
--------
  - Found an interesting URL that I want to have on my iPhone
  - Send the PDF I just produced to my iPad
  - Send a file to my Kindle

User Interface
--------------
I am mostly working on the command line, therefore I want something that works as pipe:

    cat file.txt | 2iphone
    2iphone file.txt
    2kindle book.mobi
    2ipad document.pdf

All of these commands are actualy aliased versions of the `s2d` command:

    # assuming that s2d has a device called 'iPhone' configured
    alias 2iphone="s2d --device=iPhone"
    alias 2kindle="s2d --device=Kindle"
    alias 2ipad="s2d --device=iPad"

Concepts
========

Target Device
-------------
Identifies a device. Holds device name and transport. Examples names are 'iPhone', 'MyKindle' or 'Paula's iPad'.

Transport
---------
A transport defines how to reach a device and holds all information required to reach it:

  * [Prowl](http://www.prowlapp.com/) (for iPhone/iPad)

Not implemented yet:

  * Mail
  * SMS
  * Twitter DM
  * Custom (potentially requires a device-specific app e.g. on the iPhone)

Delivery Strategy
-----------------
Belongs to a transport.

* iPhone & iPad
  - Smaller text, URLs, etc: Send directly
  - Larger files: Upload to Dropbox and send private link
  - Limit probably needs configuration

* Kindle
  - File attachment of an eMail. s2d will create one if input was passed as pipe.


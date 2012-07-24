s2d - Send to Device
====================

Send text and documentation to various devices from the command line.

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

    alias 2iphone="s2d iPhone" # assumes that s2d has a device called 'iPhone' configured
    alias 2kindle="s2d Kindle"
    alias 2ipad="s2d iPad"

Concepts
===============

Target Device
-------------
Identifies a device. Holds device address and transport. Examples are my iPhone, my Kindle or my girlfriend's iPad.

Transport
---------
A transport defines how to reach a device and holds all information required to reach it:

  * Mail
  * SMS
  * Twitter DM
  * Jabber
  * [Boxcar](http://boxcar.io/)
  * [Prowl](http://www.prowlapp.com/) (for iPhone/iPad)
    - [prowler](https://github.com/pixeltrix/prowler)
  * [Urban Airship](http://urbanairship.com/)
  * [Xtify](http://xtify.com/)
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


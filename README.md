# hb.sh

Latest version = 0.6

Simple bash script to convert a directory of videos to a Roku compatible format.

hb.sh will take a directory of videos and use HandBrakeCLI to convert to a .m4v format that should be compatible with Roku.

It converts the video extensions: .mp4, .mkv, .avi, .wmv, .mpg, .webm

## Installation

Place hb.sh in your '/home/user/bin' folder to have access to it anywhere on your system.

This script requires [handbrake](https://handbrake.fr). Install the "command line version".

## Usage example

```
$ hb.sh

    Handbrake CLI Quick Convert
    hb.sh version 0.6

    usage: hb.sh -f [23 or 29] -v [avi mkv mp4 wmv mpg webm] [optional: -6 -w [720 1280]]

    hb.sh must have at least 2 arguments.
    Try help with hb.sh -h

$ hb.sh -h

    Handbrake CLI Quick Convert
    hb.sh version 0.6

    (NOTE: HandBrakeCLI must be installed for script to work)

    hb.sh will convert all videos in a directory,
           of a certain kind, to a Roku compatible
           format using HandBrake command line.

    usage: hb.sh -f [23 or 29] -v [avi mkv mp4 wmv mpg webm] [optional: -6 -w [720 1280]]

    required:
          -f 23|29 =  23 (for 23.976) or 29 (for 29.97)
          -v video =  any video of type: (avi mkv mp4 wmv mpg webm)

    optional:
          -w  =  change width to either: (720 1280)
          -6  =  optional 5.1 [for 6 channel]
                     [default is stereo]

```

**convert all *.avi in current directory to *.m4v with stereo audio and 23.976 video frame rate**
```
$ hb.sh -f 23 -v avi
```

**convert all *.mkv in current directory to *.m4v with 5.1 and stereo audio, a 29.97 frame rate, and a video width of 720**
```
$ hb.sh -f 29 -v mkv -6 -w 720
```

## Release History

* 0.0.6
    * Added webm video option
    * Expanded width option to 720 or 1280
    * Code cleanup
* 0.0.5
    * Major code rewrite
    * Removed hard-coded argument order
    * Added better argument support
* 0.0.4
    * Expanded help
* 0.0.3
    * Added mpg to video option
* 0.0.2
    * The first proper release
    * Added simple help
* 0.0.1
    * Work in progress


## Author

Joseph Archer (C) 2018


## License

The code is covered by the MIT.

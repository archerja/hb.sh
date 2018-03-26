hb.sh
=======

Latest version = 0.5

Simple bash script to convert a directory of videos to a Roku compatible format.

###Handbrake CLI (required)

hb.sh will take a directory of videos and use HandBrakeCLI to convert to a .m4v format that should be compatible with Roku.

It converts the video extensions: .mp4, .mkv, .avi, .wmv, .mpg


Examples
=======

```
$ hb.sh

    Handbrake CL Quick Convert
    hb.sh version 0.5

    usage: hb.sh -f [23 or 29] -v [avi mkv mp4 wmv mpg] [optional: -6 -w]

    hb.sh must have at least 2 arguments.
    Try help with hb.sh -h

$ hb.sh -h


    Handbrake CL Quick Convert
    hb.sh version 0.5

    (NOTE: HandBrakeCLI must be installed for script to work)

    hb.sh will convert all videos in a directory,
           of a certain kind, to a Roku compatible
           format using HandBrake command line.

    usage: hb.sh -f [23 or 29] -v [avi mkv mp4 wmv mpg] [optional: -6 -w]

    required:
          -f 23|29 =  23 (for 23.976) or 29 (for 29.97)
          -v mkv   =  any videos of: (avi mkv mp4 wmv mpg)

    optional:
          -w  =  change width to 720
          -6  =  optional 5.1 [for 6 channel]
                     [default is stereo]

```

```
$ hb.sh -f 23 -v avi    (convert all *.avi in current directory to *.m4v with stereo audio and a 23.976 video frame rate)
```

```
$ hb.sh -f 29 -v mkv -6 -w   (convert all *.mkv in current directory to *.m4v with 5.1 and stereo audio
                              and a 29.97 video frame rate with a width of 720)
```
###Notes

Place hb.sh in your '/home/user/bin' folder to have access to it anywhere on your system.

Author
======

Joseph Archer (C) 2018


License
=======

The code is covered by the MIT.

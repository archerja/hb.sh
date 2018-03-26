hb.sh
=======

Latest version = 0.3

Simple bash script to convert a directory of videos to a Roku compatible format.

###Handbrake CLI (required)

hb.sh will take a directory of videos and use HandBrakeCLI to convert to a .m4v format that should be compatible with Roku.

It converts the video extensions: .mp4, .mkv, .avi, .wmv, .mpg


Examples
=======

```
$ hb.sh -h
 
Handbrake CL Quick Convert version 0.3
hb.sh will convert all videos in a directory
        of a certain kind to a Roku compatible
        format using HandBrake command line.
hb.sh must have at least 2 arguments, IN ORDER.
 
USAGE: hb.sh [FRAMERATE] [VIDEO FORMAT] [OPTIONAL 5.1]
 
framerate           23 (for 23.976) or 29 (for 29.97)
video format        avi mkv mp4 wmv mpg
optional 5.1        6 (for 6 channel, default is stereo)
 
examples:
          hb.sh 29 avi          (convert all avi in current directory
                                      to m4v, with only stereo)
 
          hb.sh 23 mkv 6        (convert all mkv in current directory
                                      to m4v, with stereo and 5.1)
```

```
$ hb.sh 23 avi    (convert all *.avi in current directory to *.m4v with stereo audio and a 23.976 video frame rate)
```

```
$ hb.sh 29 mkv 6    (convert all *.mkv in current directory to *.m4v with 5.1 and stereo audio and a 29.97 video frame rate)
```
###Notes

Place hb.sh in your '/home/user/bin' folder to have access to it anywhere on your system.

Author
======

Joseph Archer (C) 2015


License
=======

The code is covered by the MIT.

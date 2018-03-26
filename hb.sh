#!/bin/bash

appname="Handbrake CL Quick Convert"
version="0.5"

vids="avi mkv mp4 wmv mpg"

shortname=$(basename $0)
fullname=$0
oneliner="usage: $shortname -f [23 or 29] -v [$vids] [optional: -6 -w]"
w7=
ch6=
frame=
video=
realframe=
realwidth=
realchannel=

# display name and version
      echo ""
      echo "    $appname"
      echo "    $shortname version $version"

# check for at least 2 arguments, or help
if [ "$#" -lt 2 ]; then
   if [ $1 ] && [ $1 == '-h' ]; then
      echo ""
   else
      echo ""
      echo "    $oneliner"
      echo ""
      echo "    $shortname must have at least 2 arguments."
      echo "    Try help with $shortname -h"
      exit 1
   fi
fi

# set variables or show help
while getopts :hf:aw6v: opt; do
  case $opt in
  h)
      echo "    (NOTE: HandBrakeCLI must be installed for script to work)"
      echo ""
      echo "    $shortname will convert all videos in a directory,"
      echo "           of a certain kind, to a Roku compatible"
      echo "           format using HandBrake command line."
      echo ""
      echo "    $oneliner"
      echo ""
      echo "    required:"
      echo "          -f 23|29 =  23 (for 23.976) or 29 (for 29.97)"
      echo "          -v mkv   =  any videos of: ($vids)"
      echo ""
      echo "    optional:"
      echo "          -w  =  change width to 720"
      echo "          -6  =  optional 5.1 [for 6 channel]"
      echo "                     [default is stereo]"
      echo ""
      exit 1
      ;;
  f)
      frame=$OPTARG
      ;;
  v)
      video=$OPTARG
      ;;
  w)
      w7=1
      ;;
  6)
      ch6=1
      ;;
  \?)
      echo "Invalid option: -$OPTARG"  >&2
      echo "Try help with $shortname -h"  >&2
      exit 1
      ;;
  :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

shift $((OPTIND - 1))

# list arguments
echo "---------------"
if [ $frame ]; then
    if [ $frame == 23 ]; then
        echo "    Argument -f specified with $frame"
    elif [ $frame == 29 ]; then
        echo "    Argument -f specified with $frame"
    else
        echo "    Argument -f $frame is invalid!"
        exit 1
    fi
else
    echo "    Argument -f is required!"
    exit 1
fi

if [ "$video" ]; then
    if [[ $vids == *$video* ]]; then
        echo "    Argument -v specified with $video"
    else
        echo "    Argument -v $video is invalid!"
        exit 1
    fi
  else
    echo "    Argument -v is required!"
    exit 1
fi

if [ "$w7" ]; then echo "    Argument -w specified";  fi
if [ "$ch6" ]; then echo "    Argument -6 specified";  fi
echo "---------------"

# set parameters

if [ $frame == 23 ]; then
    realframe=23.976
else
    realframe=29.97
fi

if [ $w7 ]; then
    realwidth="-w 720"
fi

if [ $ch6 ]; then
    realchannel="-B 160 -E faac,copy:ac3 -6 stereo,6ch"
else
    realchannel="--cfr -B 160 -E av_aac"
fi

# finally begin work
# loop through directory

for i in *.$video
do
  HandBrakeCLI -i "$i" --no-dvdnav -f av_mp4 -e x264 -q 20 $realwidth -r $realframe -5 -b 3200 $realchannel -o "${i%.*}.m4v"
done

# bye

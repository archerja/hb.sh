#!/bin/bash

program='Handbrake CL Quick Convert'
me=`basename "$0"`
version='0.4'
vids='avi mkv mp4 wmv mpg'
ch6=

# check for at least 2 arguments
if [ "$#" -lt 2 ]; then
  echo " "
  echo "$program version $version"
  echo "$me will convert all videos in a directory"
  echo "        of a certain kind to a Roku compatible"
  echo "        format using HandBrake command line."
  echo "$me must have at least 2 arguments, IN ORDER."
  echo " "
  echo "USAGE: $me [FRAMERATE] [VIDEO FORMAT] [OPTIONAL 5.1]"
  echo " "
  echo "framerate           23 (for 23.976) or 29 (for 29.97)"
  echo "video format        $vids"
  echo "optional 5.1        6 (for 6 channel, default is stereo)"
  echo " "
  echo "examples:"
  echo "          $me 29 avi          (convert all avi in current directory"
  echo "                                      to m4v, with only stereo)"
  echo " "
  echo "          $me 23 mkv 6        (convert all mkv in current directory"
  echo "                                      to m4v, with stereo and 5.1)"
  echo " "
  exit 1
fi


if [[ $3 ]];
  then 
    if [ $3 = '6' ];
      then
      ch6=1
#      echo "5.1 channel"
    fi
fi


# loop through directory
for i in *.$2
do
  if [[ $vids == *$2* ]]
    then
#    echo "valid video"
    if [ $1 = '23' ];
      then
#      echo $1 $2
      if [ $ch6 ];
        then
#        echo "* with 5.1 audio..."
        HandBrakeCLI -i "$i" --no-dvdnav -f av_mp4 -e x264 -q 20 -r 23.976 -5 -b 3200 -B 160 -E faac,copy:ac3 -6 stereo,6ch -o "${i%.*}.m4v"
      else
#        echo "* no 5.1 audio..."
        HandBrakeCLI -i "$i" --no-dvdnav -f av_mp4 -e x264 -q 20 -r 23.976 -5 -b 3200 --cfr -B 160 -E av_aac -o "${i%.*}.m4v"
      fi
    elif [ $1 = '29' ];
      then
      echo $1 $2
      if [ $ch6 ];
        then
#        echo "* with 5.1 audio..."
        HandBrakeCLI -i "$i" --no-dvdnav -f av_mp4 -e x264 -q 20 -r 29.97 -5 -b 3200 -B 160 -E faac,copy:ac3 -6 stereo,6ch -o "${i%.*}.m4v"
      else
#        echo "* no 5.1 audio..."
        HandBrakeCLI -i "$i" --no-dvdnav -f av_mp4 -e x264 -q 20 -r 29.97 -5 -b 3200 --cfr -B 160 -E av_aac -o "${i%.*}.m4v"
      fi
    else
      echo "not a valid framerate"
    fi
  else
    echo "not a valid video format"
  fi
done

# bye

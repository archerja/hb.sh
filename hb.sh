#!/bin/bash

program='Handbrake CL Quick Convert'
version='0.2'
vids='avi mkv mp4 wmv'
ch6=

# check for at least 2 arguments
if [ "$#" -lt 2 ]; then
  echo " "
  echo "$program version $version"
  echo "$0 will convert all videos in a directory"
  echo "        of a certain kind to a Roku compatible"
  echo "        format using HandBrake command line."
  echo "$0 must have at least 2 arguments, in order."
  echo "$0 {framerate(23/29)} {video format($vids)} {6 (optional 5.1 audio)}"
  echo "example: $0 23 mkv 6"
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
        HandBrakeCLI -i "$i" --no-dvdnav -f mp4 -e x264 -q 20 -r 23.976 -5 -b 3200 -B 160 -E faac,copy:ac3 -6 stereo,6ch -o "${i%.*}.m4v"
      else
#        echo "* no 5.1 audio..."
        HandBrakeCLI -i "$i" --no-dvdnav -f mp4 -e x264 -q 20 -r 23.976 -5 -b 3200 -B 160 -E faac -o "${i%.*}.m4v"
      fi
    elif [ $1 = '29' ];
      then
      echo $1 $2
      if [ $ch6 ];
        then
#        echo "* with 5.1 audio..."
        HandBrakeCLI -i "$i" --no-dvdnav -f mp4 -e x264 -q 20 -r 29.97 -5 -b 3200 -B 160 -E faac,copy:ac3 -6 stereo,6ch -o "${i%.*}.m4v"
      else
#        echo "* no 5.1 audio..."
        HandBrakeCLI -i "$i" --no-dvdnav -f mp4 -e x264 -q 20 -r 29.97 -5 -b 3200 -B 160 -E faac -o "${i%.*}.m4v"
      fi
    else
      echo "not a valid framerate"
    fi
  else
    echo "not a valid video format"
  fi
done

# bye


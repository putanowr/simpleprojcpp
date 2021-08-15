#!/bin/bash

# SPDX-FileCopyrightText: 2021 Roman Putanowicz <putanowr@gmail.com>
# SPDX-License-Identifier: MIT

# saner programming env: these switches turn some bugs into errors
set -o errexit -o pipefail -o noclobber -o nounset

usage()
{
  echo "Usage: $0 [--osg] [--eigen] [--platform NAME] [--vs-version VERSION]"

  cat <<-EOH
Arguments: 
     --osg                 configure to use OpenSceneGraph
     --platform NAME       configure given platform e.g. Win32, x64 (default is Win32)
     --vs-version VERSIOn  Visual Studio version (e.g. 2015, 2019)
EOH
}

# -allow a command to fail with !’s side effect on errexit
# -use return value from ${PIPESTATUS[0]}, because ! hosed $?
! getopt --test > /dev/null 
if [[ ${PIPESTATUS[0]} -ne 4 ]]; then
    echo 'I’m sorry, `getopt --test` failed in this environment.'
    exit 1
fi

OPTIONS=hv
LONGOPTS=help,osg,verbose,platform:,vs-version:

# -regarding ! and PIPESTATUS see above
# -temporarily store output to be able to check for errors
# -activate quoting/enhanced mode (e.g. by writing out “--options”)
# -pass arguments only via   -- "$@"   to separate them correctly
! PARSED=$(getopt --options=$OPTIONS --longoptions=$LONGOPTS --name "$0" -- "$@")
if [[ ${PIPESTATUS[0]} -ne 0 ]]; then
    # e.g. return value is 1
    #  then getopt has complained about wrong arguments to stdout
    echo "ERROR : wrong arguments"
    usage
    exit 2
fi
# read getopt’s output this way to handle the quoting right:
eval set -- "$PARSED"

use_osg="OFF"
platform="Win32"
vs_version="2015"

# now enjoy the options in order and nicely split until we see --
while true; do
    case "$1" in
        -h|--help)
            usage
            exit 22
            ;;
         -\?)    
           usage
           exit 23
           ;;
        --osg)
            use_osg="ON"
            shift
            ;;
		--platform)
			shift
			platform=$1
			shift
			;;
		--vs-version)
			shift
			vs_version=$1
			shift
			;;
        --)
            shift
            break
            ;;
        *)
            echo "Programming error"
            exit 3
            ;;
    esac
done

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac
echo ${machine}

hname=`hostname`
NEWTONBODIES_INSTALL=${NEWTONBODIES_INSTALL:-`pwd`}

echo "Bootstraping for host: ${hname}"
echo "Build machine: ${machine}"
if [ ${machine} == "MinGw" ]; then
  echo "Build platform: ${platform}"
fi
echo "Using OSG: ${use_osg}"
echo "Platform: ${platform}"
echo ""
echo "---------------------------------------------"
echo "Installation directory: $NEWTONBODIES_INSTALL"
echo "---------------------------------------------"
echo ""

if [ ${vs_version} == "2015" ]; then
	vs_generator="Visual Studio 14 2015"
elif [ ${vs_version} == "2019" ]; then
	vs_generator="Visual Studio 16 2019"
else
	echo "ERROR - Visual Studio version not supported: ${vs_version}"
	exit 1
fi

if [ ${machine} == "MinGw" ]; then
  cmake -G "${vs_generator}" -A ${platform}  \
                           -DUSE_OSG::BOOL=${use_osg} \
						   ..
elif  [ ${machine} == "Linux" ]; then
  cmake -G "Unix Makefiles" ..
else
  echo "Unsupported machine : $machine"
  exit 22
fi

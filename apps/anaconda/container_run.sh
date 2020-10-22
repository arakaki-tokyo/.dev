#!/bin/bash

NAME="anaconda_$(date +%m%d%H%M)"
IS_SIP=0

while [ "${#}" -gt 0 ]
do
	case "${1}" in
		-s | --sip)
			IS_SIP=1
			shift
			;;
		-n | --name)
			if [[ -z "${2}" ]] || [[ "${2}" =~ ^-+ ]]; then
				echo "$(basename $0): option requires an argument -- $1" 1>&2
				exit 1
			fi
			NAME=$2
			shift 2
			;;
	esac
done

OPT_DOCKER=$(cat << EOS
	-it 
	--name $NAME 
	-v /home/atrenew/apps/anaconda/mnt:/opt/notebooks 
EOS
)

if [ $IS_SIP == 1 ]; then
	OPT_DOCKER=$OPT_DOCKER"--net mynet --ip 172.18.0.254"
fi

# echo "docker run "$OPT_DOCKER

docker run $OPT_DOCKER \
	continuumio/anaconda3:2020.02 \
	/opt/conda/bin/jupyter notebook \
	--notebook-dir=/opt/notebooks \
	--allow-root \
	--ip='0.0.0.0' \
	--port=80 \
	--no-browser \
	--NotebookApp.token='' \
	--NotebookApp.password='' \


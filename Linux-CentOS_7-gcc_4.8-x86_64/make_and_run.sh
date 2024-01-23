if [[ $# -eq 1 ]]; then
	if [[ -f $1 ]]; then
		make && . ../bin/setup.sh && getReconTime.exe $1
	else
		echo "Usage: $0 input_file_path"
		echo "$1 is not a valid file"
	fi
else
	echo "Usage: $0 input_file_path"
	echo "The input file must be at the level of reconstruction (\"reco\")"
	echo "hint: files are likely to be found in /afs/cern.ch/work/l/lgiannes/private/T2K/SWControl_simOutput/"
fi

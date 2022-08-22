#!/bin/bash
# Generate a random string with optional special characters
# Sometimes there may not be a special character in the random string
# because it's random
​
# Default string size
SIZE=${1:-20}
​
# Alphanumeric pool
APOOL='a-zA-Z0-9'
​
# Special character pool
SPOOL='a-zA-Z0-9\`\!\@\#\$\%\^\&\~_\*\(\)\{\}\<\>\-\+\=\|\;\:\\'
​
while true; do
	# Defaults to Yes
	read -p "Include special characters? [Y/n] :" SPEC	
	echo #
	
	case $(echo $SPEC | tr '[A-Z]' '[a-z]') in
		n|no* ) cat /dev/urandom | tr -dc $APOOL | \
			fold -w $SIZE | head -n 1; break;;
		
		* ) cat /dev/urandom | tr -dc \
			$SPOOL | fold -w $SIZE | head -n 1; break;;
	esac
done
echo #
​
exit
​
# To use:
# sh random.sh
​
# To get a random string of specific length
# sh random.sh 42
​
# If you don't need special characters, enter "n" at the prompt
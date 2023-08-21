#!/usr/bin/env bash

CHECK_SHUF=$(which shuf);
SHUF_INSTALL_TRIES=0;

# Checks if the tools of coreutils is installed, if is not it tries to install
if [ "$CHECK_SHUF" = "" ];
	then echo "${SUPER_RED}shuf not installed!${RESET}";
		read -p "${GREEN}Do you want to install it ? (Y/N)${RESET} " INSTALL_SHUF;
		while [ "$INSTALL_SHUF" != "Y" ] && [ "$INSTALL_SHUF" != "YES" ] && [ "$INSTALL_SHUF" != "y" ] && [ "$INSTALL_SHUF" != "N" ] && [ "$INSTALL_SHUF" != "NO" ] && [ "$INSTALL_SHUF" != "n" ] && [ "$SHUF_INSTALL_TRIES" -lt 3 ];
		do
			SHUF_INSTALL_TRIES=`expr $SHUF_INSTALL_TRIES + 1`;
			echo "${SUPER_YELLOW}${SHUF_INSTALL_TRIES}${SUPER_RED} try of 3 retries!${RESET}";
			read -p "${GREEN}Do you want to install it ? (Y/N)${RESET} " INSTALL_SHUF;
		done;
		if [ "$SHUF_INSTALL_TRIES" -eq 3 ] && [ "$INSTALL_SHUF" != "Y" ] && [ "$INSTALL_SHUF" != "YES" ] && [ "$INSTALL_SHUF" != "y" ] && [ "$INSTALL_SHUF" != "N" ] && [ "$INSTALL_SHUF" != "NO" ] && [ "$INSTALL_SHUF" != "n" ];
			then echo "${SUPER_RED}Sorry, you exceeded your retries!${RESET}";
				exit;
		elif [ "$INSTALL_SHUF" = "Y" ] || [ "$INSTALL_SHUF" = "YES" ] || [ "$INSTALL_SHUF" = "y" ];
			then sudo apt-get install coreutils &> /dev/null || brew install coreutils &> /dev/null;
				if [ "$(which shuf)" = "" ];
					then echo "${SUPER_RED}Something went wrong, shuf was not installed!${RESET}";
						exit;
				else
					echo "${SUPER_GREEN}shuf installed with successs!${RESET}";
				fi;
		elif [ "$INSTALL_SHUF" = "N" ] || [ "$INSTALL_SHUF" = "NO" ] || [ "$INSTALL_SHUF" = "n" ];
			then echo "${SUPER_RED}shuf was not installed!";
				exit;
		fi;
fi;

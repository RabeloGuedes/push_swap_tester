#!/usr/bin/env bash

source "$(pwd)/put_color_on_terminal.sh";
sh "$(pwd)/checks_tools.sh";
if [ $(which shuf) != "" ];
	then source "$(pwd)/get_push_swap_path.sh";
fi;
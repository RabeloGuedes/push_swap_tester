#!/usr/bin/env bash

# Define color variables using tput
export BLACK=$(tput setaf 0);
export RED=$(tput setaf 1);
export GREEN=$(tput setaf 2);
export YELLOW=$(tput setaf 3);
export BLUE=$(tput setaf 4);
export MAGENTA=$(tput setaf 5);
export CYAN=$(tput setaf 6);
export WHITE=$(tput setaf 7);

# Reset color variable
export RESET=$(tput sgr0);

# Define color with hard codes
export SUPER_RED=$(tput setaf 9);
export SUPER_GREEN=$(tput setaf 10);
export SUPER_YELLOW=$(tput setaf 11);
export SUPER_BLUE=$(tput setaf 12);
export SUPER_MAGENTA=$(tput setaf 13);
export SUPER_CYAN=$(tput setaf 14);

#!/usr/bin/env bash

cd "$PUSH_SWAP_PATH";

MAKE_RESULT="$(make)";

if [ "$(find . -type f -name "push_swap" | wc -l)" -gt 0 ];
	then cp $PUSH_SWAP_PATH/push_swap $TESTER_PATH/;
fi;

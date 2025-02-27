#!/usr/bin/env bash

# https://github.com/nikitabobko/AeroSpace/discussions/719

usage() {
	echo "USAGE: $0 [--wrap-around] (next|prev)"
}

wrap_around=''
while [ $# -gt 1 ]; do
	case "$1" in
	--wrap-around) wrap_around='--wrap-around' ;;
	*) usage exit 1 ;;
	esac
	shift
done

main_direction="$1"

case "$main_direction" in
next) rev_direction="prev" ;;
prev) rev_direction="next" ;;
# These directions won't work right now since move-workspace-to-monitor only
# takes next or prev:
# right) rev_direction="left" ;;
# left) rev_direction="right" ;;
# up) rev_direction="down" ;;
# down) rev_direction="up" ;;
*)
	usage
	echo "ERROR: Argument '(next|prev)' is mandatory"
	exit 1
	;;
esac

undo=false
# Get the focused workspace
focused_workspace=$(aerospace list-workspaces --focused)

# Switch to the other monitor
# Get the other workspace name
# Move the other workspace to the originally focused monitor
aerospace focus-monitor "$wrap_around" "$main_direction"
other_workspace=$(aerospace list-workspaces --focused)
aerospace move-workspace-to-monitor "$wrap_around" "$rev_direction" || undo=true

if $undo; then
	# focus back the original, can't be swapped
	aerospace focus-monitor "$wrap_around" "$rev_direction"
	echo "ERROR: can't move workspace $other_workspace"
	exit 1
fi

# Go back to the original workspace
# Move it to the other monitor
aerospace workspace "$focused_workspace"
aerospace move-workspace-to-monitor "$wrap_around" "$main_direction" || undo=true

ret=0
if $undo; then
	echo "ERROR: can't move workspace $focused_workspace"
	aerospace workspace "$other_workspace"
	aerospace move-workspace-to-monitor "$wrap_around" "$main_direction"
	ret=1
else
	# Focus other workspaces so it's in the foreground
	aerospace workspace "$other_workspace"
fi

# Focus the original workspace so it ends focused
aerospace workspace "$focused_workspace"
exit $ret

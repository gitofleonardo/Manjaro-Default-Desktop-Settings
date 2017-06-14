#!/bin/bash

# export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

DEFAULT_SESSION=mate-session

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

ibus-daemon -drx

get_session(){
	local dbus_args=(--sh-syntax --exit-with-session)
	case $1 in
		awesome) dbus_args+=(awesome) ;;
		bspwm) dbus_args+=(bspwm-session) ;;
		budgie) dbus_args+=(budgie-desktop) ;;
		cinnamon) dbus_args+=(cinnamon-session) ;;
		deepin) dbus_args+=(startdde) ;;
		enlightenment) dbus_args+=(enlightenment_start) ;;
		fluxbox) dbus_args+=(startfluxbox) ;;
		gnome) dbus_args+=(gnome-session) ;;
		i3|i3wm) dbus_args+=(i3 --shmlog-size 0) ;;
		jwm) dbus_args+=(jwm) ;;
		kde) dbus_args+=(startkde) ;;
		lxde) dbus_args+=(startlxde) ;;
		lxqt) dbus_args+=(lxqt-session) ;;
		mate) dbus_args+=(mate-session) ;;
		xfce) dbus_args+=(xfce4-session) ;;
		openbox) dbus_args+=(openbox-session) ;;
		*) dbus_args+=($DEFAULT_SESSION) ;;
	esac

	echo "dbus-launch ${dbus_args[*]}"
}

exec $(get_session)
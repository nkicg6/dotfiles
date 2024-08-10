#!/usr/bin/env bash
CONFIG_NAME="wg0-nyc"
INTERFACE="wg0-nyc"
DEFAULT_GATEWAY="192.168.0.1"
DEFAULT_INTERFACE="wlp1s0"


vpn_up() {
    sudo wg-quick up $CONFIG_NAME
    if [ $? -eq 0 ]; then
        #sudo ip route del default
        sudo ip route del default via $DEFAULT_GATEWAY dev $DEFAULT_INTERFACE
        sudo ip route add default dev $INTERFACE
        sudo ip route add default $DEFAULT_GATEWAY dev $INTERFACE
        #ENDPOINT=$(sudo wg show $INTERFACE endpoints | awk '{print $2}' | cut -d: -f1)
        #sudo ip route add $ENDPOINT via $DEFAULT_GATEWAY dev $DEFAULT_INTERFAC
        echo "VPN is now active."
    else
        echo "Failed to bring up VPN."
    fi
}

vpn_down() {
    sudo wg-quick down $CONFIG_NAME
    if [ $? -eq 0 ]; then
        #sudo ip route del default
        sudo ip route add default via $DEFAULT_GATEWAY dev $DEFAULT_INTERFACE
        echo "VPN is now inactive."
    else
        echo "Failed to bring down VPN."
    fi
}


echo "new"
if ip link show $INTERFACE &>/dev/null; then
  echo "Turning vpn off"
  vpn_down
else
  echo "Turning vpn on"
  vpn_up
fi

echo "Current default route:"
ip route show default

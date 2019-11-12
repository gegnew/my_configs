# aliases for my vpn
alias vpn="sudo systemctl start openvpn-client@eliot.service"
alias novpn="sudo systemctl stop openvpn-client@eliot.service;sudo iptables -F;sudo iptables -X"

#aliases for johnny's vpn

test=$(iw dev wlp59s0 link | awk 'NR==1 {print $1}')


if [ "$test" == "Connected" ]; then
    echo "$(iw dev wlp59s0 link | awk 'NR==2 {print $2}') $(iw dev wlp59s0 link | grep -Eoe '-[0-9]{2}')dBm"
else
    echo "Disconnected"
fi

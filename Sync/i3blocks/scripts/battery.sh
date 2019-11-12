BAT=$(acpi -b | grep -E -o '[0-9][0-9]?%')
TEST=$(acpi -b | cut -c 12-14)

if [ $TEST = "Cha" ]
then
    echo "Charging: $BAT"
else
    echo "Battery(dis): $BAT"
fi

# Set urgent flag below 5% or use orange below 20%
[ ${BAT%?} -le 5 ] && exit 33
[ ${BAT%?} -le 20 ] && echo "#FF8000"

exit 0

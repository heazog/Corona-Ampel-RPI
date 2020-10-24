#!/bin/bash

WARNSTUFE=$(wget -q -O - "http://corona-ampel.gv.at/sites/corona-ampel.gv.at/files/assets/Warnstufen_Corona_Ampel_aktuell.json" | jq ".[0].Warnstufen | .[] | select(.Name==\"$1\") | .Warnstufe" | tr -d '"')

if [ -z "$WARNSTUFE" ]; then
    WARNSTUFE=$(wget -q -O - "http://corona-ampel.gv.at/sites/corona-ampel.gv.at/files/assets/Warnstufen_Corona_Ampel_Gemeinden_aktuell.json" | jq ".[0].Warnstufen | .[] | select(.Name==\"$1\") | .Warnstufe" | tr -d '"')
fi

function set {
    case $1 in
      "green")
          ./gpio.sh set 26 0
          ./gpio.sh set 19 0
          ./gpio.sh set 13 0
          ./gpio.sh set 6 1
          ;;
      "yellow")
          ./gpio.sh set 26 0
          ./gpio.sh set 19 0
          ./gpio.sh set 13 1
          ./gpio.sh set 6 0
          ;;
      "orange")
          ./gpio.sh set 26 0
          ./gpio.sh set 19 1
          ./gpio.sh set 13 0
          ./gpio.sh set 6 0
          ;;
      "red")
          ./gpio.sh set 26 1
          ./gpio.sh set 19 0
          ./gpio.sh set 13 0
          ./gpio.sh set 6 0
          ;;
     esac
}


case $WARNSTUFE in

  1)
    echo "gruen"
    set green
    ;;

  2)
    echo "gelb"
    set yellow
    ;;

  3)
    echo "orange"
    set orange
    ;;

  4)
    echo "rot"
    set red
    ;;

  *)
    echo "error"
    ;;
esac


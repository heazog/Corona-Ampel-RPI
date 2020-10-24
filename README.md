# Corona-Ampel-RPI
Zeigt die aktuelle Corona-Warnstufe für eine Festgelegte Region/Gemeinde an. (Österreich)


## Hardware
Es werden 4 LEDs benötigt.

**Achtung:** Vorwiederstand nicht vergessen!

| LED    | GPIO | PIN |
| ---    | ---: | --: |
| Rot    |   26 |  37 |
| Orange |   19 |  35 |
| Gelb   |   13 |  33 |
| Grün   |    6 |  31 |


![](https://www.raspberrypi.org/documentation/usage/gpio/images/GPIO-Pinout-Diagram-2.png)

## Software


### GPIO

```bash
# Definition:
./gpio.sh set/init PIN VALUE

# Beispiele:
# Rote LED einschalten
./gpio.sh set 26 1

# Grüne LED ausschalten
./gpio.sh set 6 0


# Jeder GPIO-Pin muss vor der ersten Verwendung initialisiert werden.
# Entweder mit
./gpio.sh init 26 out
./gpio.sh init 19 out
./gpio.sh init 13 out
./gpio.sh init 6 out
# oder einfach mit
sudo ./gpio_init.sh
# (Achtung: das initialisieren benötigt sudo Rechte)
```

### CORONA

```bash
# Definition:
./corona.sh REGION/GEMEINDE

# Beispiele:
./corona.sh Wien
./corona.sh Linz-Land
./corona.sh Sierning
```

### Automatische Aktualisierung
kann mittels Crontab realisiert werden.
```bash
crontab -e
# in der Datei ein neue zeile hinzufügen:

# jeden Tag um 3 in der Früh
0 3 * * * ./corona.sh Wien

# jede Stunde
0 * * * * ./corona.sh Wien

# alle 5 Minuten
*/5 * * * * ./corona.sh Wien
```

## Video - Tutorial:

(YT-Link)


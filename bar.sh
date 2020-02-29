#!/bin/sh

Clock() {
        DATETIME=$(date "+%a %b %d, %T")

        echo -n "$DATETIME"
}
#Define the battery
Battery() {
        BATPERC=$(acpi --battery | cut -d, -f2)
        echo "$BATPERC"
}

# Print the percentage
while true; do
        echo "%{r}$(Clock)$(Battery)"
        sleep 1;
done

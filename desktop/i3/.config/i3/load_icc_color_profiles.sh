#!/bin/bash

# Load color profiles either for my desktop monitors or my laptop
if [ $(hostnamectl --static) == "eva-01" ]; then

	dispwin -d1 "$HOME/.icc_color_profiles/Dell_S2721DGF.icm"
	sleep 1
	dispwin -d2 "$HOME/.icc_color_profiles/Dell_U2713HM.icm"

elif [ $(hostnamectl --static) == "eva-02" ]; then

	dispwin "$HOME/.icc_color_profiles/Gigabyte_Aero_15X.icm"

fi

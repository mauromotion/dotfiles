#!/bin/bash

# Load color profiles either for my desktop monitors or my laptop
if [ $(hostnamectl --static) == "eva-01" ]; then

  dispwin -d1 "$HOME/.icc_color_profiles/S2721DGF_2026.icm"
  # sleep 1
  # dispwin -d2 "$HOME/.icc_color_profiles/Dell_U2713HM.icm"

elif [ $(hostnamectl --static) == "eva-02" ]; then

  dispwin "$HOME/.icc_color_profiles/Gigabyte_Aero_15X.icm"

elif [ $(hostnamectl --static) == "eva-03" ]; then

  dispwin "$HOME/.icc_color_profiles/Thinkpad_X1_carbon_gen_9.icm"
fi

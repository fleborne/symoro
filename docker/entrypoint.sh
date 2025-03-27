#!/bin/bash

# xauth ---
if [[ -f /dot.Xauthority ]]; then
    xauth merge /dot.Xauthority
fi
# ----------

# symoro ---
source /home/user/symoro-env/bin/activate
symoro-bin
# ----------
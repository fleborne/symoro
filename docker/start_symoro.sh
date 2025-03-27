if [ ! -d $PWD/../symoro-robots ]; then     
    mkdir $PWD/../symoro-robots
    chgrp docker $PWD/../symoro-robots
    chmod g+rw $PWD/../symoro-robots
fi

# Settings to use graphical applications : linux or wsl ?
if [ -f /tmp/.X11-unix ]; then
    DOCKER_GUI="--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --volume="$XAUTHORITY:/dot.Xauthority""
elif [ -d /mnt/wslg ]; then
    DOCKER_GUI="--volume="/mnt/wslg:/mnt/wslg" --volume="/mnt/wslg/.X11-unix:/tmp/.X11-unix""
else
    DOCKER_GUI=""
fi

docker run -it --rm \
--env DISPLAY \
--env QT_X11_NO_MITSHM=1 \
--net="host" \
$DOCKER_GUI \
--user user \
--name="symoro" \
--volume="$PWD/../symoro-robots:/home/user/symoro-robots" \
symoro
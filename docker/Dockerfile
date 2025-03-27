FROM ubuntu:18.04

# essential packages
RUN apt-get update && apt-get install -q -y --no-install-recommends \
    xauth \
    git \
    wget \
    nano \
    sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# user
ARG USER_UID=1001
ARG GROUP_UID=1001
ARG USERNAME=user

RUN groupadd --gid $GROUP_UID $USERNAME \
    && useradd --uid $USER_UID --gid $GROUP_UID -m $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /home/$USERNAME

# symoro
RUN git -c http.sslVerify=false clone https://github.com/fleborne/symoro.git /home/$USERNAME/symoro

RUN apt-get update && apt-get install -q -y --no-install-recommends \
    python2.7 \
    virtualenv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -q -y --no-install-recommends \
    libgtk-3-dev \
    freeglut3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY ./requirements.txt /home/$USERNAME

RUN /usr/bin/virtualenv --python=python2.7 symoro-env && \
    . /home/$USERNAME/symoro-env/bin/activate && \
    pip install -r /home/$USERNAME/requirements.txt && \
    wget https://extras.wxpython.org/wxPython4/extras/linux/gtk3/ubuntu-18.04/wxPython-4.0.7-cp27-cp27mu-linux_x86_64.whl && \
    pip install wxPython-4.0.7-cp27-cp27mu-linux_x86_64.whl && \
    cd /home/$USERNAME/symoro && \
    python setup.py install
 
RUN chown -R $USERNAME:$USERNAME /home/$USERNAME

# entrypoint
COPY ./entrypoint.sh /entrypoint.sh
RUN sudo chmod +x /entrypoint.sh

SHELL [ "/bin/bash", "-c" ]
ENTRYPOINT ["/entrypoint.sh"]
CMD [ "/bin/bash" ]
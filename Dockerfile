FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    python3-dev \
    python3-pip \
    python3-wheel \
    python3-setuptools \
    git \
    cmake \
    libblas3 \
    libblas-dev \
    build-essential \
    gcc \
    file \
    sudo \
    language-pack-ja-base \
    language-pack-ja \
    && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

RUN update-locale LC_ALL=ja_JP.UTF-8 LANG=ja_JP.UTF-8 LANGUAGE=ja_JP.UTF-8

RUN pip3 install --no-cache-dir cupy-cuda100

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		vim htop byobu tmux nano ssh wget curl \
        fonts-takao-pgothic fonts-takao-mincho \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

ENV HOME="/home/genzitsu"
RUN mkdir $HOME && chmod 0777 $HOME

RUN pip3 install pip -U
RUN pip3 install \
    scikit-learn \
    numpy \
    pandas \
    seaborn \
    matplotlib \
    scipy \
    japanize-matplotlib \
    jupyter \
    environment-kernels \
    jupytext \
    jupyter-contrib-nbextensions \
    tqdm \
    ipdb \
  && rm -rf /root/.cache && rm -rf ${HOME}/.cache

RUN jupyter contrib nbextension install --user \
    && jupyter nbextension enable contrib_nbextensions_help_item/main \
    && jupyter nbextension enable execute_time/ExecuteTime \
    && jupyter nbextension enable freeze/main \
    && jupyter nbextension enable highlight_selected_word/main \
    && jupyter nbextension enable keyboard_shortcut_editor/main \
    && jupyter nbextension enable notify/notify \
    && jupyter nbextension enable scratchpad/main \
    && jupyter nbextension enable scroll_down/main \
    && jupyter nbextension enable collapsible_headings/main \
    && jupyter nbextension enable snippets/main

RUN pip3 install bash_kernel
RUN python3 -m bash_kernel.install

RUN chmod -R 0777 ${HOME}/.local ${HOME}/.jupyter

# user
# RUN chown -R genzitsu $HOME
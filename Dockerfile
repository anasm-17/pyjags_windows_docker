# Get rocker/tidyverse as base image
FROM ubuntu

# update linux packages
RUN apt-get update

# get wget
RUN apt-get install -y wget

# Install anaconda base version
RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    find /opt/conda/ -follow -type f -name '*.a' -delete && \
    find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /opt/conda/bin/conda clean -afy && \
    /opt/conda/bin/conda update -n base -c defaults conda

# Set anconda path
ENV PATH="/opt/conda/bin:${PATH}"

EXPOSE 8888

RUN apt-get update

RUN apt-get install -y pkg-config

RUN apt-get install -y jags

RUN pip install pyjags

# install other python packages
RUN conda install -c anaconda docopt -y
RUN conda install -c anaconda requests -y
RUN conda install -c conda-forge pytest -y
RUN conda install -c conda-forge altair vega_datasets -y
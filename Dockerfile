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

# Expose port
EXPOSE 8888

RUN apt-get update

# Install pkg-config, prerequisite for jags
RUN apt-get install -y pkg-config

# Install jags
RUN apt-get install -y jags

# Install pyjags
RUN pip install pyjags

# install other python packages
RUN conda install -c anaconda docopt -y
RUN conda install -c anaconda requests -y
RUN conda install -c conda-forge pytest -y
RUN conda install -c conda-forge altair vega_datasets -y

# Install dependencies for altair plots
RUN apt-get update && apt install -y chromium-browser && apt-get install -y libnss3 && apt-get install unzip

RUN wget -q "https://chromedriver.storage.googleapis.com/79.0.3945.36/chromedriver_linux64.zip" -O /tmp/chromedriver.zip \
    && unzip /tmp/chromedriver.zip -d /usr/bin/ \
    && rm /tmp/chromedriver.zip && chown root:root /usr/bin/chromedriver && chmod +x /usr/bin/chromedriver

RUN conda install selenium -y
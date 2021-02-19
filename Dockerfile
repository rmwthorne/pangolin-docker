FROM continuumio/miniconda3

RUN git clone https://github.com/cov-lineages/pangolin.git /opt/pangolin
WORKDIR /opt/pangolin

RUN conda env create -f environment.yml
SHELL ["conda", "run", "-n", "pangolin", "/bin/bash", "-c"]
RUN python setup.py install

ENTRYPOINT [ "conda", "run", "--no-capture-output", "-n", "pangolin"]

CMD pangolin -h

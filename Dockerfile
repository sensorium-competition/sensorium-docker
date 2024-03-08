FROM quay.io/jupyter/pytorch-notebook:cuda12-latest

LABEL maintainer="Alexander Ecker <ecker@cs.uni-goettingen.de>"

USER root

# Export port for Jupyter Notebook
# (still needs to be bound using -p when starting container)
EXPOSE 8888

# Add Jupyter config
ADD ./jupyter_lab_config.py /home/jovyan/.jupyter/jupyter_notebook_config.py

# Install neural predicitve model packages
RUN pip install git+https://github.com/sinzlab/nnfabrik.git
RUN pip install git+https://github.com/sinzlab/neuralpredictors
RUN pip install git+https://github.com/sinzlab/mei.git

# DataJoint
RUN pip install datajoint

WORKDIR /notebooks

# By default start running jupyter notebook
ENTRYPOINT ["jupyter", "lab", "--allow-root"]


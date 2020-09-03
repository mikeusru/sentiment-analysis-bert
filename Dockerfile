FROM huggingface/transformers-pytorch-gpu
RUN mkdir /workspace/src/
WORKDIR /workspace/src/
ADD requirements.txt .
RUN pip install -r requirements.txt
RUN pip install jupyter

# Add Tini. Tini operates as a process subreaper for jupyter. This prevents kernel crashes.
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]

# docker build -t myaccount/new_project .
# docker run --gpus all -p 8888:8888 -v ${PWD}:/workspace/src/ myaccount/new_project

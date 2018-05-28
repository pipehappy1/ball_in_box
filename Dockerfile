FROM ubuntu

RUN apt-get update
RUN apt-get install python3-pip -y
RUN pip3 --version
RUN pip3 install --upgrade pip
RUN pip3 install numpy imageio matplotlib scipy scikit-image


ARG ACCOUNT
RUN echo "ACCOUNT is $ACCOUNT"

WORKDIR "/home/yguan/workspace/ball_in_box/images/$ACCOUNT"
RUN mkdir /ball_in_box
RUN mkdir /ball_in_box/ball_in_box
COPY ./ball_in_box/* /ball_in_box/ball_in_box/
COPY ./setup.py /ball_in_box/
COPY ./requirements.txt /ball_in_box/
RUN pip3 install -r /ball_in_box/requirements.txt
RUN pip3 install -e /ball_in_box
RUN ls /ball_in_box
RUN ls /ball_in_box/ball_in_box
CMD python3 /ball_in_box/ball_in_box/area_sum.py

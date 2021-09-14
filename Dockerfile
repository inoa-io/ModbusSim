FROM alpine:latest

RUN apk add --no-cache bash python3 && \
  python3 -m ensurepip && \
  rm -r /usr/lib/python*/ensurepip && \
  pip3 install --upgrade pip setuptools && \
  rm -r /root/.cache

RUN mkdir -p /opt
ADD requirements.txt /opt/.
RUN pip3 install -r /opt/requirements.txt
RUN rm /opt/requirements.txt
ADD ./config /opt/modbussim/config
ADD ./src /opt/modbussim/src

WORKDIR /opt/modbussim/

ENV MODBUS_INTERFACE /dev/ttyS01
ENV BAUD_RATE 9600

#CMD ["python3", "-u", "/opt/src/server.py"]
CMD python3 -u ./src/server.py -m rtu -b ${BAUD_RATE} --rtu_parity even -s ${MODBUS_INTERFACE} -n 0 -d 1
#CMD ["python3", "-u", "./src/server.py", "-m", "rtu", "-b", "${BAUD_RATE}", "-p", "even", "-s", "${MODBUS_INTERFACE}", "-n", "0", "-d", "1"]
EXPOSE 5002

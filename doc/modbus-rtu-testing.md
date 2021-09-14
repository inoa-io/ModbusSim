# ModBus Simulator - Serial Communication

## How To

This project enables you to simulate serial interfaces via **socat** like real device communication.
For getting started, follow these steps:

1. Launch the [docker-compose-socat](../docker-compose-socat.yml) with help of [start-with-socat.sh](../start-with-socat.sh)
   ```shell
   ./start-with-socat.sh
   ```
2. Load some test data into the simulator. This will create 3 modbus slaves with id 1,2,3. You can see the test data in [data/dzg-4013-2.json](../data/dzg-4013-2.json):
   ```shell
   curl -X POST \
      -H "accept: application/json" \
      -H  "Content-Type: application/json" \
      -d @data/dzg-4013-2.json \
      "http://localhost:5002/dump"
   ```
3. Start a container with **modpoll** in it to verify connection:
   ```shell
   docker run -it --rm --privileged -v $PWD/env/socat:/dev2 -v /dev:/dev:rw inoa/modpoll:0.1    
   ```
4. Try out connection and simulator with **modpoll** inside the container started:
   ```shell
   modpoll -m rtu -a 3 -b 9600 -o 2 -c 2 -t 4 -r 0x4001 /dev2/ttyMaster01
   ```
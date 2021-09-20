# ModBus Simulator - Serial Communication

## Use Case(s)

### A) Virtualize the whole setup


#### What

This setup is used to validate and develop test data for ModBus RTU communication. And it is also usefull if you are
developing a ModBus Master that can be executed on your developer machine.

If you want to simulate ModBus RTU devices you need to communicate via serial interfaces.
This approach uses **socat** to create a virtual seriual bus with two connected interfaces, 
* *ttySlave01* 
* *ttyMaster01*
The first interface will be connected to the simulator, the second can be used with a master, like *modpoll* to access 
* the simulated modbus slaves.

#### How To

This project enables you to simulate serial interfaces via **socat** like real device communication.
For getting started, follow these steps:

1. Launch the [docker-compose-socat](../docker-compose-socat.yml) with help of [start-with-socat.sh](../start-with-socat.sh).
   Check [this](../start-with-socat.sh) bash script and the corresponding [docker-compose-socat.yml](../docker-compose-socat.yml) to understand how it works. 
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

### B) Simulate with real ModBus Master Device

#### What

This setup is used to test real ModBus masters with the ModBus Simulator.
You will need a ModBus USB Dongle for your PC and a connected ModBus Master like the Inoa Satellite that will connect to it.

In difference to setup A) you will communicate with real serial interfaces and not via pseudo terminals created by **socat**.

## How To

1. Launch the [docker-compose-socat](../docker-compose-rs485.yml) with help of [start-with-rs485.sh](../start-with-rs485.sh).
   Check [this](../start-with-socat.sh) bash script and the corresponding [docker-compose-rs485.yml](../docker-compose-rs485.yml) to understand how it works. It will use your **/dev/ttyUSB0** device per default.
   ```shell
   ./start-with-rs485.sh
   ```
2. If your RS485 interface it at a different location, start the simulator this way:
   ```shell
   export MODBUS_INTERFACE=/dev/ttyUSB1 && ./start-with-rs485.sh
   ```
3. Load some test data into the simulator. This will create 3 modbus slaves with id 1,2,3. You can see the test data in [data/dzg-4013-2.json](../data/dzg-4013-2.json):
   ```shell
   curl -X POST \
      -H "accept: application/json" \
      -H  "Content-Type: application/json" \
      -d @data/dzg-4013-2.json \
      "http://localhost:5002/dump"
   ```


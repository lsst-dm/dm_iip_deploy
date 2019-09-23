# Ports
This document describes what ports ctrl_iip software uses.

# References
* [RabbitMQ ports](https://www.rabbitmq.com/networking.html)
* [Redis ports](https://redis.io/topics/protocol)
* BBCP
* DDS multicast ports

| Port | from | to | Client |
|------|------|----|--------|
| 4369 | 0.0.0.0 | ATArchiver | RabbitMQ |
| 5672, 5671 | 0.0.0.0 | ATArchiver | RabbitMQ |
| 15672 | 0.0.0.0 | ATArchiver | RabbitMQ |
| 25672 | 0.0.0.0 | ATArchiver | RabbitMQ |
| 6379 | DAQ or Forwarder machines and localhost | ATArchiver | Redis |
| TODO | DAQ or Forwarder machines | ATArchiver | bbcp |
|  22  | DAQ or Forwarder machines | ATArchiver | ssh(bbcp uses sshd to connect) |
| TODO | 0.0.0.0 | ATArchiver | DDS |
| TODO | ATArchiver | DAQ or Forwarder machines | RabbitMQ |
| TODO | ATArchiver | DAQ or Forwarder machines | Redis |

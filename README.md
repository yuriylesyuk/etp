# etp alpha release


# ETP Edge Topology Processor

Utility to generate different artifacts using Edge topology configuration definition.

A configuration is written using JSON format. 

Examples of configurations can be seen in the examples folder.

## Quick Start Guide

1. install utility from github

npm install -g https://github.com/yuriylesyuk/etp/tarball/master


2. Fetch an example topology to your working folder. 

```shell
wget https://raw.githubusercontent.com/yuriylesyuk/etp/master/examples/uat-12n-4sn-topology.json
```
or
```shell
wget https://raw.githubusercontent.com/yuriylesyuk/etp/master/examples/prod-19n-5sn-topology.json
```

3. Generate svg diagram for the topology.
```shell
etp generate diagram $PWD/uat-12n-4sn-topology.json $PWD/svgdiagram-uat-12n.svg
```
4. Open generated svg file in your browser.


5. Generate firewall ports request
```shell
etp generate portrequest $PWD/uat-12n-4sn-topology.json $PWD/portrequest-uat-12n.csv
```

6. Open generated portrequest.cvs file in Excel.

## Edge Topology Definition

A topology of an Edge installation is represented as a JSON document, defining collections of nodes, subnets, and layout of the particular planet.

An example for a 12 node topologies is given below.

```json
{
    "planet": "UAT",
    "regions": [
        {
            "id": "1",
            "name": "dc-1",
            "subnets": [
                {
                    "name": "external",
                    "tier": "dmz",
                    "nodes": [
                        {
                            "id": 1,
                            "hostname": "nnnxxxyyy01",
                            "ip": "10.119.3.201",
                            "components": [
                                    "DP",
                                    "NO",
                                    "HT"
                                ]
                        },
                        {
                            "id": 7,
                            "hostname": "nnnxxxyyy07",
                            "ip": "10.119.3.207",
                            "components": [
                                "R",
                                "TG"
                            ]
                        },
                        {
                            "id": 8,
                            "hostname": "nnnxxxyyy08",
                            "ip": "10.119.3.208",
                            "components": [
                                "R",
                                "TG"
                            ]
                        }
                    ]
                },
                {
                    "name": "gateway-baas",
                    "tier": "core",
                    "nodes": [
                        {
                            "id": 9,
                            "hostname": "nnnxxxyyy09",
                            "ip": "10.119.3.209",
                            "components": [
                                "MP",
                                "UI",
                                "MS",
                                "TG"
                            ]
                        },
                        {
                            "id": 10,
                            "hostname": "nnnxxxyyy10",
                            "ip": "10.119.3.210",
                            "components": [
                                "MP",
                                "TG"
                            ]
                        },
                        {
                            "id": 11,
                            "hostname": "nnnxxxyyy11",
                            "ip": "10.119.3.211",
                            "components": [
                                "R",
                                "MP",
                                "TG"
                            ]
                        },
                        {
                            "id": 12,
                            "hostname": "nnnxxxyyy12",
                            "ip": "10.119.3.212",
                            "components": [
                                "R",
                                "MP",
                                "TG"
                            ]
                        },
                        {
                            "id": 5,
                            "hostname": "nnnxxxyyy05",
                            "ip": "10.119.3.205",
                            "components": [
                                "BS",
                                "BP",
                                "QIS",
                                "TC",
                                "QD",
                                "GF",
                                "IF",
                                "TG"
                            ]
                        }
                    ]
                },
                {
                    "name": "data-storage",
                    "tier": "core",
                    "nodes": [
                        {
                            "id": 2,
                            "hostname": "nnnxxxyyy02",
                            "ip": "10.119.3.202",
                            "components": [
                                "OL",
                                "CS",
                                "ZK",
                                "TG"
                            ]
                        },
                        {
                            "id": 3,
                            "hostname": "nnnxxxyyy03",
                            "ip": "10.119.3.203",
                            "components": [
                                "CS",
                                "ZK",
                                "TG"
                            ]
                        },
                        {
                            "id": 4,
                            "hostname": "nnnxxxyyy04",
                            "ip": "10.119.3.204",
                            "components": [
                                "CS",
                                "ZK",
                                "TG"
                            ]
                        }
                    ]
                },
                {
                    "name": "analytics",
                    "tier": "core",
                    "nodes": [
                        {
                            "id": 6,
                            "hostname": "nnnxxxyyy06",
                            "ip": "10.119.3.206",
                            "components": [
                                "PS",
                                "QIS",
                                "QD",
                                "PG",
                                "MY",
                                "TG"
                            ]
                        }
                    ]
                }
            ],
            "tiers": [
                { "name": "dmz" },
                { "name": "core" }
            ]
        }
    ]
}
```

## Firewall Ports Request

The etp generates a typical port request spreadsheet that you can use to submit to your Firewall/Security teams to create firewall rules. The generated file is in .csv format and can easily be opened in Excel or your preferred spreadsheet program.

Example contents can be seen on the following screenshot.

![alt port requests](docs/fwportrequest.png)

## Topology Diagram

The 'g diagram' command will generate an svg file that depicts Edge's topology.

Diagrams for example u12 and u19 topologies are:

uat-12n:

<img src="docs/svgdiagram-uat-12n.png" width="400">

prod-19n:

<img src="docs/svgdiagram-prod-19n.png" width="400">


## Check Ports functionality

The https://github.com/yuriylesyuk/edge-ops project contains two playbooks, checkports.yml and checkport-tasks.yml, that let you verify if ports on different boxes are open.

They use input configuration file in form: 

openapi-dev-ports.json:
```json
{ 
    "ports": [
        { "c": "10.119.3.233", "s": "10.119.3.236", "p": "9999"},
        { "c": "10.119.3.233", "s": "10.119.3.236", "p": "99"}
    ]
}
```

and generate report in form: 
```json
[
    "10.119.3.233 10.119.3.236:9999: Success",
    "10.119.3.233 10.119.3.236:99 Ncat: Connection refused."
]
```

The etp utility automatically generates check ports input configuration for all firewall ports that it creates request for.

You invoke it using following command line.

TODO: right now the configuration file is hard-coded as openapi-dev-ports.json in a playbook folder, but it also is generated when running 'g portrequest' command under same name. So all it good, but to be changed later.

```shell
ansible-playbook -i "localhost," checkports.yml
```

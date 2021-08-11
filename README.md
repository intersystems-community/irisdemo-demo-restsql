# Using InterSystems IRIS as a gateway to talk to SQL backends using REST
Simple demo of IRIS exposing REST APIs created based on Swagger that have a SQL database as the backend.

Click [here](https://www.youtube.com/watch?v=afgnmpRcRFc) to see a video of this demo.

![Demo](https://github.com/intersystems-community/irisdemo-demo-restsql/blob/master/README.png?raw=true)

## How to build and run the demo

Just clone this repository in your PC, run the ./build.sh script and then the ./run.sh.

Or, you can simply type:

```bash
docker run --rm -it --init --name restsql -p 1972:1972 -p 52773:52773 irisdemo-demo-restsql:1.0.3
```

## Open the Management Portal

The management portal will be at http://localhost:52773/csp/sys/UtilHome.csp.

## Postman project

You will find a postman colletion in the **Postman** folder of this repository. You should be able to import that colletion and run the same tests you saw on the video.

## DBeaver

Install DBeaver in your machine and configure a connection to InterSystems IRIS. InterSystems IRIS will be listening at port 1972. The namespace is USER. There is only one table in InterSystems IRIS: **XPTOBankData.Customer**.

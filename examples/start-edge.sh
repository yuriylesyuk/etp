











ansible dc1n13 -a "apigee-service apigee-zookeeper start"
ansible dc1n15 -a "apigee-service apigee-zookeeper start"
ansible dc1n16 -a "apigee-service apigee-zookeeper start"
ansible dc1n17 -a "apigee-service apigee-zookeeper start"
ansible dc1n18 -a "apigee-service apigee-zookeeper start"

ansible dc2n13 -a "apigee-service apigee-zookeeper start"
ansible dc2n15 -a "apigee-service apigee-zookeeper start"
ansible dc2n16 -a "apigee-service apigee-zookeeper start"
ansible dc2n17 -a "apigee-service apigee-zookeeper start"
ansible dc2n18 -a "apigee-service apigee-zookeeper start"

ansible dc1n13 -a "apigee-service apigee-cassandra start"
ansible dc1n15 -a "apigee-service apigee-cassandra start"
ansible dc1n16 -a "apigee-service apigee-cassandra start"
ansible dc1n17 -a "apigee-service apigee-cassandra start"
ansible dc1n18 -a "apigee-service apigee-cassandra start"

ansible dc2n13 -a "apigee-service apigee-cassandra start"
ansible dc2n15 -a "apigee-service apigee-cassandra start"
ansible dc2n16 -a "apigee-service apigee-cassandra start"
ansible dc2n17 -a "apigee-service apigee-cassandra start"
ansible dc2n18 -a "apigee-service apigee-cassandra start"

ansible dc1n13 -a "apigee-service apigee-openldap start"

ansible dc2n13 -a "apigee-service apigee-openldap start"

ansible dc1n19 -a "apigee-service apigee-qpidd start"
ansible dc1n29 -a "apigee-service apigee-qpidd start"

ansible dc2n19 -a "apigee-service apigee-qpidd start"
ansible dc2n29 -a "apigee-service apigee-qpidd start"

ansible dc1n19 -a "apigee-service apigee-postgresql start"

ansible dc2n19 -a "apigee-service apigee-postgresql start"









ansible dc1n03 -a "apigee-service edge-management-server start"

ansible dc2n03 -a "apigee-service edge-management-server start"

ansible dc1n01 -a "apigee-service edge-router start"
ansible dc1n02 -a "apigee-service edge-router start"

ansible dc2n01 -a "apigee-service edge-router start"
ansible dc2n02 -a "apigee-service edge-router start"

ansible dc1n03 -a "apigee-service edge-message-processor start"
ansible dc1n04 -a "apigee-service edge-message-processor start"
ansible dc1n05 -a "apigee-service edge-message-processor start"
ansible dc1n06 -a "apigee-service edge-message-processor start"
ansible dc1n07 -a "apigee-service edge-message-processor start"

ansible dc2n03 -a "apigee-service edge-message-processor start"
ansible dc2n04 -a "apigee-service edge-message-processor start"
ansible dc2n05 -a "apigee-service edge-message-processor start"
ansible dc2n06 -a "apigee-service edge-message-processor start"
ansible dc2n07 -a "apigee-service edge-message-processor start"

ansible dc1n19 -a "apigee-service edge-qpid-server start"

ansible dc2n19 -a "apigee-service edge-qpid-server start"

ansible dc1n19 -a "apigee-service edge-postgres-server start"

ansible dc2n19 -a "apigee-service edge-postgres-server start"

ansible dc1n03 -a "apigee-service edge-sap-ui start"

ansible dc2n03 -a "apigee-service edge-sap-ui start"

ansible dc1n10 -a "apigee-service apigee-elasticsearch start"
ansible dc1n11 -a "apigee-service apigee-elasticsearch start"

ansible dc2n10 -a "apigee-service apigee-elasticsearch start"
ansible dc2n11 -a "apigee-service apigee-elasticsearch start"

ansible dc1n10 -a "apigee-service baas-sap-usergrid start"
ansible dc1n11 -a "apigee-service baas-sap-usergrid start"

ansible dc2n10 -a "apigee-service baas-sap-usergrid start"
ansible dc2n11 -a "apigee-service baas-sap-usergrid start"

ansible dc1n10 -a "apigee-service baas-sap-portal start"
ansible dc1n11 -a "apigee-service baas-sap-portal start"

ansible dc2n10 -a "apigee-service baas-sap-portal start"
ansible dc2n11 -a "apigee-service baas-sap-portal start"


ansible dc1n10 -a "apigee-service baas-sap-portal stop"
ansible dc1n11 -a "apigee-service baas-sap-portal stop"

ansible dc2n10 -a "apigee-service baas-sap-portal stop"
ansible dc2n11 -a "apigee-service baas-sap-portal stop"

ansible dc1n10 -a "apigee-service baas-sap-usergrid stop"
ansible dc1n11 -a "apigee-service baas-sap-usergrid stop"

ansible dc2n10 -a "apigee-service baas-sap-usergrid stop"
ansible dc2n11 -a "apigee-service baas-sap-usergrid stop"

ansible dc1n10 -a "apigee-service apigee-elasticsearch stop"
ansible dc1n11 -a "apigee-service apigee-elasticsearch stop"

ansible dc2n10 -a "apigee-service apigee-elasticsearch stop"
ansible dc2n11 -a "apigee-service apigee-elasticsearch stop"

ansible dc1n03 -a "apigee-service edge-sap-ui stop"

ansible dc2n03 -a "apigee-service edge-sap-ui stop"

ansible dc1n03 -a "apigee-service edge-management-server stop"

ansible dc2n03 -a "apigee-service edge-management-server stop"

ansible dc1n01 -a "apigee-service edge-router stop"
ansible dc1n02 -a "apigee-service edge-router stop"

ansible dc2n01 -a "apigee-service edge-router stop"
ansible dc2n02 -a "apigee-service edge-router stop"

ansible dc1n03 -a "apigee-service edge-message-processor stop"
ansible dc1n04 -a "apigee-service edge-message-processor stop"
ansible dc1n05 -a "apigee-service edge-message-processor stop"
ansible dc1n06 -a "apigee-service edge-message-processor stop"
ansible dc1n07 -a "apigee-service edge-message-processor stop"

ansible dc2n03 -a "apigee-service edge-message-processor stop"
ansible dc2n04 -a "apigee-service edge-message-processor stop"
ansible dc2n05 -a "apigee-service edge-message-processor stop"
ansible dc2n06 -a "apigee-service edge-message-processor stop"
ansible dc2n07 -a "apigee-service edge-message-processor stop"

ansible dc1n19 -a "apigee-service edge-qpid-server stop"

ansible dc2n19 -a "apigee-service edge-qpid-server stop"

ansible dc1n19 -a "apigee-service edge-postgres-server stop"

ansible dc2n19 -a "apigee-service edge-postgres-server stop"

ansible dc1n13 -a "apigee-service apigee-openldap stop"

ansible dc2n13 -a "apigee-service apigee-openldap stop"

ansible dc1n19 -a "apigee-service apigee-qpidd stop"
ansible dc1n29 -a "apigee-service apigee-qpidd stop"

ansible dc2n19 -a "apigee-service apigee-qpidd stop"
ansible dc2n29 -a "apigee-service apigee-qpidd stop"









ansible dc1n19 -a "apigee-service apigee-postgresql stop"

ansible dc2n19 -a "apigee-service apigee-postgresql stop"

ansible dc1n13 -a "apigee-service apigee-cassandra stop"
ansible dc1n15 -a "apigee-service apigee-cassandra stop"
ansible dc1n16 -a "apigee-service apigee-cassandra stop"
ansible dc1n17 -a "apigee-service apigee-cassandra stop"
ansible dc1n18 -a "apigee-service apigee-cassandra stop"

ansible dc2n13 -a "apigee-service apigee-cassandra stop"
ansible dc2n15 -a "apigee-service apigee-cassandra stop"
ansible dc2n16 -a "apigee-service apigee-cassandra stop"
ansible dc2n17 -a "apigee-service apigee-cassandra stop"
ansible dc2n18 -a "apigee-service apigee-cassandra stop"

ansible dc1n13 -a "apigee-service apigee-zookeeper stop"
ansible dc1n15 -a "apigee-service apigee-zookeeper stop"
ansible dc1n16 -a "apigee-service apigee-zookeeper stop"
ansible dc1n17 -a "apigee-service apigee-zookeeper stop"
ansible dc1n18 -a "apigee-service apigee-zookeeper stop"

ansible dc2n13 -a "apigee-service apigee-zookeeper stop"
ansible dc2n15 -a "apigee-service apigee-zookeeper stop"
ansible dc2n16 -a "apigee-service apigee-zookeeper stop"
ansible dc2n17 -a "apigee-service apigee-zookeeper stop"
ansible dc2n18 -a "apigee-service apigee-zookeeper stop"














ansible n09 -a "apigee-service baas-sap-portal stop"

ansible n09 -a "apigee-service baas-sap-usergrid stop"

ansible n09 -a "apigee-service apigee-elasticsearch stop"

ansible n09 -a "apigee-service edge-sap-ui stop"

ansible n09 -a "apigee-service edge-management-server stop"

ansible n07 -a "apigee-service edge-router stop"
ansible n08 -a "apigee-service edge-router stop"
ansible n11 -a "apigee-service edge-router stop"
ansible n12 -a "apigee-service edge-router stop"

ansible n05 -a "apigee-service edge-message-processor stop"
ansible n06 -a "apigee-service edge-message-processor stop"
ansible n07 -a "apigee-service edge-message-processor stop"
ansible n08 -a "apigee-service edge-message-processor stop"

ansible n01 -a "apigee-service edge-qpid-server stop"
ansible n09 -a "apigee-service edge-qpid-server stop"

ansible n01 -a "apigee-service edge-postgres-server stop"

ansible n02 -a "apigee-service apigee-openldap stop"

ansible n01 -a "apigee-service apigee-qpidd stop"
ansible n09 -a "apigee-service apigee-qpidd stop"

ansible n01 -a "apigee-service apigee-postgresql stop"





ansible n02 -a "apigee-service apigee-cassandra stop"
ansible n03 -a "apigee-service apigee-cassandra stop"
ansible n04 -a "apigee-service apigee-cassandra stop"

ansible n02 -a "apigee-service apigee-zookeeper stop"
ansible n03 -a "apigee-service apigee-zookeeper stop"
ansible n04 -a "apigee-service apigee-zookeeper stop"


ansible n02 -a "apigee-service apigee-zookeeper start"
ansible n03 -a "apigee-service apigee-zookeeper start"
ansible n04 -a "apigee-service apigee-zookeeper start"

ansible n02 -a "apigee-service apigee-cassandra start"
ansible n03 -a "apigee-service apigee-cassandra start"
ansible n04 -a "apigee-service apigee-cassandra start"

ansible n02 -a "apigee-service apigee-openldap start"

ansible n01 -a "apigee-service apigee-qpidd start"
ansible n09 -a "apigee-service apigee-qpidd start"





ansible n01 -a "apigee-service apigee-postgresql start"

ansible n09 -a "apigee-service edge-management-server start"

ansible n07 -a "apigee-service edge-router start"
ansible n08 -a "apigee-service edge-router start"
ansible n11 -a "apigee-service edge-router start"
ansible n12 -a "apigee-service edge-router start"

ansible n05 -a "apigee-service edge-message-processor start"
ansible n06 -a "apigee-service edge-message-processor start"
ansible n07 -a "apigee-service edge-message-processor start"
ansible n08 -a "apigee-service edge-message-processor start"

ansible n01 -a "apigee-service edge-qpid-server start"
ansible n09 -a "apigee-service edge-qpid-server start"

ansible n01 -a "apigee-service edge-postgres-server start"

ansible n09 -a "apigee-service edge-sap-ui start"

ansible n09 -a "apigee-service apigee-elasticsearch start"

ansible n09 -a "apigee-service baas-sap-usergrid start"

ansible n09 -a "apigee-service baas-sap-portal start"


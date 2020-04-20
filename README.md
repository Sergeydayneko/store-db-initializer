Initializer for store point server.

Recommendations:

1. For initial data get into store-service and run ****mvn liquibase:update****

2. For ELK stack don't forget to use same version for each service

3. For elasticsearch: 
    1) if *nix system **sysctl -w vm.max_map_count=262144**
    2) if using volumes **chmod g+rwx <es_volume_folder_name>** and  **chgrp 0 <es_volume_folder_name>**
    3) for now using **volumes.\<esnode\>.driver: local**

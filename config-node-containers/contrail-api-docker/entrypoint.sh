#!/bin/bash

touch /etc/contrail/contrail-api.conf
if [ "$KEYSTONE" ]; then
    crudini --set /etc/contrail/contrail-api.conf KEYSTONE auth_host ${AUTH_HOST:-openstack}
    crudini --set /etc/contrail/contrail-api.conf KEYSTONE auth_port ${AUTH_PORT:-35357}
    crudini --set /etc/contrail/contrail-api.conf KEYSTONE auth_protocol http
    crudini --set /etc/contrail/contrail-api.conf KEYSTONE auth_url ${AUTH_URL:-http://openstack:35357/v3}
    crudini --set /etc/contrail/contrail-api.conf KEYSTONE admin_user ${ADMIN_USER:-neutron}
    crudini --set /etc/contrail/contrail-api.conf KEYSTONE admin_password ${ADMIN_PASS}
    crudini --set /etc/contrail/contrail-api.conf KEYSTONE admin_tenant_name ${ADMIN_TENANT_NAME:-admin}
    if [ "$ADMIN_TOKEN" ]; then
        crudini --set /etc/contrail/contrail-api.conf KEYSTONE admin_token ${ADMIN_TOKEN}
    fi
fi

/usr/bin/contrail-api --conf_file /etc/contrail/contrail-api.conf
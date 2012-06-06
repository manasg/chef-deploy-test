name "monitoring"
description "Monitorin Server"

run_list "recipe[nagios::server]"

default_attributes(
    "nagios" => {
        "server_auth_method" => "htauth"
    }
)

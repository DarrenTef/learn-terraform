# #!/bin/bash
# # Catches errors, undefined variables are errors, and catches error in pipelines
# set -euo pipefail

# # Change directory to example
# cd ../../examples/hello-world

# # Create the resources
# terraform init
# terraform apply -auto-approve

# # Wait while the instance boots up
# # (Could also use a provisioner in the TF config to do this)
# sleep 3

# echo "Checking Terraform output..."
# terraform output -json

# # Query the output, extract the IP and make a request
# set -x  # Enable debug mode
# terraform output -json | jq -r '.instance_ip_addr.value' | xargs -I {} curl -v http://{}:8080 -m 10
# set +x  # Disable debug mode

# # terraform output -json |
# #   jq -r '.instance_ip_addr.value' |
# #   xargs -I {} curl http://{}:8080 -m 10

# # # terraform output -json |                    # Pipes the output in json
# # #   jq -r '.instance_ip_addr.value' |         # for jq to pipe the raw output of the instance_ip_addr's value
# # #   xargs -I {} curl http://{}:8080 -m 10     # for xargs to run a command that pipes the ip_addr into a curl to check if instance is up
# # # terraform output -json \                            # Pipes the output in json
# # #   | jq -r '.instance_ip_addr.value' \               # for jq to pipe the raw output of the instance_ip_addr's value
# # #   | xargs -I {} curl http://{}:8080 -m 10           # for xargs to run a command that pipes the ip_addr into a curl to check if instance is up

# # If request succeeds, destroy the resources
# terraform destroy -auto-approve

# # If all succeeds, say yay!
# echo -e "\nYay!!!\nYay!!\n"


#!/bin/bash
set -euo pipefail

# Change directory to example
cd ../../examples/hello-world

# Create the resources
terraform init
terraform apply -auto-approve

# Wait while the instance boots up
# (Could also use a provisioner in the TF config to do this)
sleep 60 

# Query the output, extract the IP and make a request
terraform output -json |\
jq -r '.instance_ip_addr.value' |\
xargs -I {} curl http://{}:8080 -m 10

# If request succeeds, destroy the resources
terraform destroy -auto-approve

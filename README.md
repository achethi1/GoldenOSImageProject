# Introduction
Golden Image Project. Creating an ADO pipeline to automate creation of golden images.

# Prep Azure Environment
1. Install packer on the Azure organization
2. Create a varible group on Azure and add variables to use in the build
    + Make sure secrets are set to private (locked)
3. Make a service connection

# Execution Process
- <span style="color:green">azure-pipelines.yml</span> -- This playbook installs, inits, validates, and builds packer
- <span style="color:green">image_variables.pkrvars.hcl</span> -- Variables used in the build are defined here
- <span style="color:green">image.pkr.hcl</span> -- Uses an ARM template to create thee resources in Azure
- <span style="color:green">playbook.yml</span> -- Acts as a provisioner to add a text file to the VM
This Terraform project is created to perform the following tasks:

- Create a new repository for your project. (give `project-1` title for your repo)
- Have main.tf, providers.tf, variable.tf, output.tf. (Use all files as intended)
- Create two users (one user will be your name, another user will be your trainer’s name) on Azure with Terraform. Use correct argument in your configuration to force your trainer to change their passwords when s/he logins. (Create it as a two different resource blocks)
- Create four different users (usernames will be your classmates) on Aws by using `for_each` with Terraform.
- Create two S3(Simple Storage Service) bucket using `count` with Terraform.
- Create a Resource Group, Virtual Machine and Storage Account on Azure with Terraform. Use same Resource Group for every Azure resource.
- Use 2 tags at least in your configuration.
- Use 1 output at least in your configuration.
- Use variables as much as you can.
- Use main.tf for all resources.
- Keep both provider`s information in provider.tf.

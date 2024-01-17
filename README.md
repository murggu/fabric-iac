# fabric-iac

fabric-iac includes IaC to deploy Fabric artifacts (Fabric capacity for now). This project is Experimental.

## Prerequites
Make sure you have the following prerequisites in place:

- An Azure subscription
- Azure CLI installed
- Terraform CLI installed
- Git installed

## Terraform

To deploy with terraform, configure the `variables.tf` file according to your requirements (*.tfvars omitted for brevity), jump into terraform folder and run:

```
terraform init
```
```
terraform apply --auto-approve
```

## Bicep

To deploy with bicep, configure the `main.bicep` params and run:

```
az deployment sub create --location <location> --template-file bicep/main.bicep
```

## ARM

To deploy with ARM, configure the `parameters.json` and run (RG scope in this case):

```
az deployment group create --name fabtest --resource-group "<resource_group_name>" --template-file arm/fabric_capacity.json --parameter
s arm/parameters.json
```

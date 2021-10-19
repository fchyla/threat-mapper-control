# Desription

Terraform deployment of ThreatMapper control node https://github.com/deepfence/ThreatMapper requirements based on https://github.com/deepfence/ThreatMapper/wiki/Installing-the-Management-Console

# Usage
Module read me in `src/terraform`

```
cd src/terraform
terraform init
terraform plan -out theratmapper.tfplan
terraform apply "theratmapper.tfplan"
```
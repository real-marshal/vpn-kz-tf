**Terraform code to quickly deploy a shadowsocks server (outline) to a [serverspace.kz](https://serverspace.kz) server (whose ips fortunately are not considered datacenter ips).**

**Usage:**
1. create and populate terraform.tfvars
2. `terraform init` (may require non-russian ip)
3. `terraform apply`
4. paste the json from outline_config output into outline manager
5. `terraform destroy` to get rid of the provided infrastructure

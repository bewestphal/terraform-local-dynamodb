### Terraform Local DynamoDb

An example setup to make a local instance of dynamodb for development. 

## Setup
1. [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
2. Clone the repo <br>
`git clone https://github.com/bewestphal/terraform-dynamodb-local`
3. Navigate to example <br>
`cd terraform-local-dynamodb`
4. Initialize Terraform <br>
`terraform init`
5. [Optional] Configure the `locals.container_name` or `locals.dynamo_port` inside `main.tf` if desired <br>
(Default Port is `7090`)
6. [Configure the desired tables following the terraform dynamo format](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) <br>
_Note: Tables can also be configured in the admin panel_   
7. Start the container <br>
`terraform apply`

### Admin Panel
The `dynamo-local-admin` [Docker image](https://github.com/instructure/dynamo-local-admin-docker) also contains an admin 
panel at the configured port <br>
(Default: http://localhost:7090/)

# Ed-Fi-ODS AWS Deployment

# GENERAL INFO
| ODS Version | v5.3 |
| Databse engine | PostgreSQL |
| Database engine version | 13.X |
| Admin app version | 2.3.1 |

# GUIDE

## 1.VPC

1.1. Create an AWS Virtual Private network with:
- 2 Availability zones (AZ)
- 2 public subnets (One per AZ)
- 2 private subnets (One per AZ)
- 2 NAT Gateways (One per AZ)
- 1 internet gateway
- 1 Elastic IP
- 1 Route table
- 1 Network access controller
- 1 default security group

1.2. Configure security groups
- Add a rule for the PostgreSql protocol allowing your IP
- Add a rule for HTTP/HTTPS allowing any connecion

1.3. Copy VPC ID
1.4. Copy Security group ID

## 2. RDS
2.1. Create an RDS instance with:
- PostgreSql Engine
- PostgreSql version 13.X
- Free tier of multi-AZ
- a default DB subnet with the created VPC and default security group
- Publicly accessible (Will change later)
- IAM and PostgreSQL authentication

2.2. Copy RDS Hostname, port, username and password

## 3. Elastic load balancer
3.1. Create an ELB Target group with:
- Empty listing
- No listeners
3.2. Create an Application load balancer with
- the empty target group assigned
- Associated to the created VPC
- With the VPC default Security group

# 4. ECS & ECR
4.1. Create an ECR repository with:
- Public access

4.2. copy the repository publisher URL

4.3. Create empty ECS cluster with
- A sample name
- Fargate provisioning
- Assigned to the created VPC

4.5. Copy ECS ID and name

# 5. Install local dependencies
5.1. Install direnv
5.2. Install plsql
5.3. Install docker
5.4. Install openssl 1.1

# 6 Setup environment
6.1. Configure environment variables on file `.envrc` (See comments in file)
6.2. run `direnv allow` to apply environment configuration

# 7 Run scripts
7.1. Publish images by running `exec publish.sh`
7.2. deploy container running `exec deploy.sh`

# 8 Test deployment
8.1. Open API at `{LOAD_BALANCER_URL}:80`
8.2. Open Swagger at `{LOAD_BALANCER_URL}:8081`
8.3. Open Adminapp at `{LOAD_BALANCER_URL}:8082`



# **Practice Project - AWS Infrastructure with Terraform**


This project sets up a simple cloud infrastructure using AWS and Terraform to deploy a Node.js application with a MySQL database. 
The infrastructure is designed to be scalable and secure, leveraging AWS services like EC2, S3, RDS, and VPC.

#**Architecture Flow**

1. GitHub hosts the Node.js application's code.
2. Terraform provisions the AWS infrastructure, including:
3. EC2 instance to run the Node.js application.
4. RDS MySQL database for data storage.
5. S3 bucket for file storage.
6. The Node.js application connects to the RDS database over port 3306, restricted by security groups for secure communication.
7. The application interacts with Amazon S3 for uploading or retrieving files.
8. The whole setup runs within the default VPC, ensuring isolation and secure access to resources.


#** Getting Started** 

# NodeJs app with MySQL Database

A simple nodejs app connected with mySQL database.

## Getting Started

1. Clone the repo
```bash
git clone https://github.com/verma-kunal/nodejs-mysql.git
cd nodejs-mysql
```
2. Create a `.env` file in root directory and add the environment variables:
```bash
DB_HOST="localhost"
DB_USER="root" # default mysql user
DB_PASS=""
DB_NAME=""
TABLE_NAME=""
PORT=3000
```
> Make sure to create the database and the corresponding table in your mySQL database.
3. Initialize and start the development server:
```bash
npm install
npm run dev
```
![running app](https://github.com/user-attachments/assets/d882c2ec-2539-49eb-990a-3b0669af26b6)

# 4. Add the Node Js application source Code in the directory: 
    -  npm run dev
# 5.  Clone the Repo
      -  git clone https://github.com/verma-kunal/nodejs-mysql.git ./app
# 6. Initialize the terraform project
      - terraform init
# 7. Make relevant changes to the terraform code.
# 8. Apply the changes and provision the infrastructure:
      - terraform apply

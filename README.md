# web-database-architecture
In this project, I architected a secure cloud infrastructure using Terraform on AWS, with a strong focus on building a resilient Virtual Private Cloud (VPC). This VPC 
seamlessly integrates public and private subnets, along with robust routing, an internet gateway, and a NAT gateway for optimised network flow.
Within the public subnet, I deployed an Apache-powered EC2 instance, hosting a dynamic PHP webpage for user-friendly data input. Concurrently, in the private subnet, I 
established another EC2 instance for a MySQL database, meticulously configured for performance and security.
Security was paramount—I enforced strict security groups, automated SSH access using my public IP, and utilised the web server as a bastion host. Notably, the private 
IP-based web-database connection enhanced cybersecurity, safeguarding the database from internet exposure. Elastic IPs ensured web server stability. This project highlights 
my expertise in cloud infrastructure design, Infrastructure as Code, and rigorous security practices.

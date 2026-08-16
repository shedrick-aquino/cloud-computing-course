# Client Recommendations

## Client A – Startup Company

### Recommended Platform: AWS

I recommend **Amazon Web Services (AWS)** for the startup because it offers many services that can begin small and scale as application demand grows. The company can use managed and serverless technologies to avoid buying and maintaining physical infrastructure, while EC2 Auto Scaling can automatically adjust compute capacity when traffic changes. For a mobile application, useful services include **AWS Amplify** for application development and hosting, **AWS Lambda** for serverless backend logic, and **Amazon DynamoDB** for a scalable NoSQL database; Amazon S3 can also store application files and media. AWS is therefore a practical choice when the startup needs flexibility, a large service catalog, and room for rapid growth.

**Possible services:** AWS Amplify, AWS Lambda, Amazon DynamoDB, Amazon S3, Amazon Cognito.

## Client B – University

### Recommended Platform: Microsoft Azure

I recommend **Microsoft Azure** because the university already uses Windows Server, Microsoft 365, and Active Directory-related technologies. Microsoft Entra ID is Microsoft's cloud identity and access management service, and Microsoft notes that Azure and Microsoft 365 subscribers already use a Microsoft Entra tenant, making Azure a natural fit for identity integration.[^rec-entra] The university could migrate selected servers to **Azure Virtual Machines**, store files or backups in **Azure Blob Storage**, and use **Microsoft Entra ID** for cloud identity and access. Azure also supports hybrid and multicloud management through **Azure Arc**, which can help when some systems remain on campus.

**Possible services:** Azure Virtual Machines, Microsoft Entra ID, Azure Blob Storage, Azure Arc, Azure Virtual Network.

## Client C – AI Research Company

### Recommended Platform: Google Cloud

I recommend **Google Cloud** because the company focuses on artificial intelligence, machine learning, and high-performance workloads. **Vertex AI** provides an integrated platform for developing, training, deploying, and managing ML and AI applications, while **Compute Engine** provides virtual machines and accelerator-oriented machine options for compute-intensive workloads. The company could also use **Cloud Storage** for datasets and **Google Kubernetes Engine (GKE)** for scalable containerized training or inference workloads. This combination makes Google Cloud a strong match for research teams building modern AI systems.

**Possible services:** Vertex AI, Compute Engine, Cloud Storage, Google Kubernetes Engine, BigQuery.

## Client D – Global E-Commerce Company

### Recommended Platform: AWS

I recommend **AWS** for the multinational e-commerce company because AWS Regions and Availability Zones support resilient multi-location architectures. **Amazon EC2 Auto Scaling** can increase or decrease the number of instances based on demand, while **Elastic Load Balancing** distributes incoming traffic across healthy targets and multiple Availability Zones. **Amazon CloudFront** can deliver web content through a worldwide edge network, and **Amazon Route 53** provides scalable DNS routing and health checking. Together, these services are appropriate for a global web application that requires high availability, automatic scaling, and low-latency content delivery.

**Possible services:** Amazon EC2 Auto Scaling, Elastic Load Balancing, Amazon CloudFront, Amazon Route 53, Amazon RDS/Aurora.

---

## Checkpoint 6 – Multi-Cloud Decision Matrix

| Business Requirement | Recommended Platform | Justification |
|---|---|---|
| **Startup Company** | AWS | Broad service catalog, serverless options, and automatic scaling provide flexibility as a small application grows. |
| **Enterprise Organization** | AWS | Strong choice when the organization needs a very broad range of infrastructure, platform, database, security, analytics, and application services. |
| **Microsoft Environment** | Azure | Microsoft Entra ID, Windows VM support, Microsoft 365 integration, and Azure Arc make Azure a natural fit for Microsoft-centered environments. |
| **AI / Machine Learning** | GCP | Vertex AI, Compute Engine accelerators, Cloud Storage, and Google's data/AI ecosystem suit ML development and deployment. |
| **Kubernetes Deployment** | GCP | GKE is Google's managed Kubernetes service, and Kubernetes itself originated at Google before becoming an open-source project.|
| **Global Web Application** | AWS | Regions/AZs, EC2 Auto Scaling, Elastic Load Balancing, CloudFront, and Route 53 support resilient, scalable global delivery. |

## References

Amazon Web Services. “About AWS.” https://aws.amazon.com/about-aws  
Amazon Web Services. “What is Amazon EC2 Auto Scaling?” https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html  
Microsoft Learn. “Microsoft Entra product family.” https://learn.microsoft.com/en-us/entra/fundamentals/what-is-entra  
Microsoft Learn. “Azure Arc overview.” https://learn.microsoft.com/en-us/azure/azure-arc/overview  
Google Cloud. “Introduction to Vertex AI.” https://docs.cloud.google.com/vertex-ai/docs/start/introduction-unified-platform?hl=en  
Google Cloud. “Compute Engine overview.” https://docs.cloud.google.com/compute/docs/overview  
Google Cloud. “GKE overview.” https://docs.cloud.google.com/kubernetes-engine/docs/concepts/kubernetes-engine-overview  
Amazon Web Services. “Global Infrastructure.” https://docs.aws.amazon.com/whitepapers/latest/aws-overview/global-infrastructure.html  
Amazon Web Services. “What is Elastic Load Balancing?” https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/what-is-load-balancing.html  
Amazon Web Services. “What is Amazon CloudFront?” https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Introduction.html  
Amazon Web Services. “What is Amazon Route 53?” https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/Welcome.html

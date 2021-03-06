# Learn Microsoft Azure 

## Introduction 

### What the course covers?

+ Getting setup with an Azure Account
+ What is 'cloud' - hint, its not just a buzzword
+ The different types of cloud - public, private, hybrid and community.
+ Cloud Service Models - Infrastructure as a service (IaaS), Platform as a service (PaaS) and Software as a service (SaaS)
+ The history of Azure ... how it started, version 1 and version 2
+ The Azure global infrastructure platform
+ Architectural foundations - regions, region pairs & Geos
+ Account fundamentals - Subscriptions, directories, resource groups and security
+ Azure Virtual Networking - Key concepts
+ Overview of all Azure Product areas - understand when and where they would be used
+ Azure & AWS Product comparison - understand what products compete and compliment

### Accessing Course Files 

+ [Course Files](https://github.com/LevelUpCloud/LevelUpCloud-Introduction-to-Azure)

## Cloud Fundamentals 

### What's this cloud thing ? 
  + It's not just a buzzword.
  + There is no cloud. It's just a (someone else) computer 
  + Misconception that if something is virtualized then it's cloud. It's not!
  + [Definition of Cloud Computing](http://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-145.pdf)
  
#### Essential Charachteristics

+ ___On-demand self-service___: "A consumer can unilaterally provision computing capabilities... ..as needed automatically **without requiring human interaction** with each service provider." 

+ ___Broad network access___: "Capabilities are available over the **network** and accessed through standard mechanisms... " - WebUI, CLI, API, SDK, VPN, Dedicated Lines etc.

+ ___Resource pooling___: "...resources are pooled to serve multiple consumers using a **multi-tenant model**..."

  "There is a sense of **location independence** in that the customer generally has no control or knowledge over the exact location of the provided resources..."

e.g., AWS, Azure, Google Cloud, Office365, Dropbox, Netflix etc.

+ ___Rapid elasticity___: "Capabilities can be elastically provisioned and released... ... to **scale rapidly** outward and inward commensurate with demand."

  "To the consumer, the capabilities available for provisioning often **appear to be unlimited**..."

+ ___Measured service___: "Resource usage can be **Monitored, controlled, and reported,** providing transparency for both the provider and consumer of the utilized service."

### Cloud Deployment Models

| Cloud Flavors | Description |
|-|-|
|Public|Exist on the premis of the vendor for public use. E.g., |
|Private|Exist on the premis of the vendor exclusively for business/private use.|
|Hybrid|Having flavors of both public and private cloud.|
|Community|It's similar to Hybrid cloud in many ways. When a group of organisations club together and make a dedicated cloud plateform specifically for their use - a shared set of requirement(s). E.g., AWS Govt. cloud, Azure Govt. cloud|

+ Public Cloud is **Easy** - lots of examples.
+ Community Cloud is a thing - it exists.
+ Be **skeptical** of claims of Hybrid Cloud.
+ Be **very skeptical** of claims Private Cloud.

### Cloud Service Models : Cloud Service Spectrum

+ Cloud Servies - Products with in the Cloud
  + All cloud product fit somewhere
  + Other Service Models occupy a range somewhere
+ Service Models (\*aas)
  + IaaS : Infrastructure as a service
    + FaaS : Function as a service
    + DaaS : Database as a service
  + PaaS : Plateform as a service
  + SaaS : Software as a service
  + BaaS : Blockchain as a service
+ What the end-user gets
+ What the end-user manages
+ What the end-user sees

![cloudstack](https://acomdpsstorage.blob.core.windows.net/dpsmedia-prod/azure.microsoft.com/en-us/documentation/articles/azure-security-best-practices-software-updates-iaas/20151102073235/sec-cloudstack.png)

As you move from IaaS to PaaS to SaaS you loose flexibility but you gain in terms of ease of management which means less cost and less risk.

## Azure Fundamentals 

### Creating an Azure Account
  + Microsoft Account is what you need first to register for Azure account.
    + Create a new one or use an existing one.
    + You can even use an exiting gmail or other email for creating a MS Account.
  + [Azure Subscription](https://azure.microsoft.com/en-in/)
    + Fill Credit/Debit card details and register for free 30 days trial subscription.
    + You'll get one free trial per person throughout your lifetime of Azure.
  + [Azure Portal](https://portal.azure.com/)

### Azure vs Azure Stack 

+ **Azure** is a public cloud plateform. You can create cloud resources with in Azure Cloud Plateform.
+ **Azure Stack** is a private cloud plateform. It essentially is a set of hardware devices. It comes with
  + Compute
  + Storage
  + Networking
  
  It's the private version of Azure Cloud. It also consists :
    + Azure Backup
    + Azure Site Recovery Manager

### Azure v1 (Classic/ASM : Azure Service Management) vs Azure v2 (ARM : Azure Resource Manager)

+ Azure started in mid 2000's - named **Project Red Dog**

|Azure v1 (Classic : Azure Service Management) | Azure v2 (ARM : Azure Resource Management)|
|-|-|
|Announced in - 2008, Commercially available in - 2010 | Announced in - 2014 as preview, named "Prject Ibiza" |
|Azure v1 - ASM (Azure Service Management)| Azure v2 - ARM (Azure Resource Manager)|
|Classic Azure Portal was named - RDFE (Red Dog Front End)| New Portal/API's/Tooling|

+ Classic Azure Portal :

![Classic Azure Portal](https://gilgrossblog.files.wordpress.com/2017/12/manageportal.png)

+ New Azure Portal: 

![New Azure Portal](https://azurecomcdn.azureedge.net/mediahandler/acomblog/media/Default/blog/41eae6ac-94a3-48b9-9099-4d4df6249e75.jpg)


+ Azure v2 provided these facilities:
  + Building Blocks
  + Individual Resources
  + Resource Groups
  ![Resource Groups](https://media.licdn.com/mpr/mpr/shrinknp_800_800/AAEAAQAAAAAAAAlFAAAAJDk2NDc0NGNiLWY1MjAtNDk5Mi05ZDdkLWMxYjAzMjlmNTFlNA.png)
  + ARM Templates (JSON) : In Azure, you can take the infrastructure you've already have and make a template for it.
  + Tags : Allow you to group resources using one or more tags. It helps you to find/see the resources across the resource groups.
  + Role Based Access Control (RBAC) : Allows you to define a role, assign hat role to a group or a user. That group or user gets the security dicatated by that Role. Role can be applied to :
    + Subscription
    + Resource Group
  + The new portal can access legacy services and legacy configurations.

### Azure Virtual Networks (vNets) and Resource Groups (Azure Building Blocks)

**Virtual Networks**

+ Isolated Network
+ Address Space for the Network
+ Can be 'subnetted' into smaller sub-networks
+ Each of those can have an IP range
+ Can be connected together

**Azure Virtual Networks (vNets)**

+ VNet is a way of building a network on Azure Cloud
+ A way of creating an Isolated portion of Azure for specific purpose
+ Address Space for the Network
+ Can be 'subnetted' into smaller sub-networks
+ Each of those can have an IP range
+ Can be connected together
+ Putting Resources (Azure Virtual Machines) on those subnets.

![Azure Virtual Network](https://acomdpsstorage.blob.core.windows.net/dpsmedia-prod/azure.microsoft.com/en-us/documentation/articles/virtual-networks-overview/20150915062503/figure02.png)

### Demo: Creating Azure VNet and Subnets

![Vnet and Subnets](https://docs.microsoft.com/en-us/azure/includes/media/virtual-networks-create-vnet-scenario-include/vnet-scenario.png)

+ Create a **Resource Group** or use an existing one. Could be created separately or on the go. Name it "VNetDemoRG".
+ Create a **Virtual Network** with name "TestVNet" and address space `192.168.0.0/16`
+ Select "Use existing" and select "VNetDemoRG" resouce group from dropdown.
+ Provide a subnet name "FrontEnd" and address range `192.168.1.0/24` and click "Create".
+ Add another subnet with the name "BackEnd" and address range `192.168.2.0/24`
+ Delete "VNetDemoRG" resource group. It deletes all the associated resources with in the group. Currently it has "TestVNet" as resource.

### Account Structure - Accounts & Subscriptions 

| AWS | AZURE |
|-|-|
|Spearate Account for each services| Simple Azure Account|
|Account contains billing details| Account doesn't contains billing details, Subscription does! |
|Multi-User, multi-subscription | Single-user <-> Multi-subscription, Multi-user <-> Multi-subscription|
|it can have multiple sub-accounts as well as subscriptions. |It's just a container and might have zero or multiple subscriptions.|
|Not the same. |Each subscription could use same Azure Active Directory or different one.|

![Azure Account Structure](https://kloudsolutions.files.wordpress.com/2013/07/070713_1147_goodpractic2.png?w=770)

> Special Enterprise Subscription : Pay the amount upfront and get a discount on Resource Usage.

### MS Azure Account(a container) 
  + Can have multiple **subscription**
    + Different subscription have different billing arrangement
    + For each account there could be one or more subscriptions
    + For each subscriptions there could be one or more **Resource Group**
    + Multiple subscriptions can be associated with single or multiple accounts
    + Each single subscription is associated with an **Azure AD**
    + Multiple subscriptions can be associated with single or multiple Azure AD
    + Azure Active Directory (Azure AD) 
      + It gives permissions to subscription.
      + Azure AD is a global multi-tenant identity system.
    + Each resource group can hold one or more **Resources**.
    + Each resource can be associated with single resource group only.

### Global Infrastructure - Geos, Regions, Region Pairs & Availability Zones 

MS Azure, Bing, Office 365, Skype, Yammer, OneDrive, Xbox, Outlook.com etc. are aassociated with Global Services. Team associated with these services are :

+ MCIO : Microsoft Cloud Infrastructure and Operations
+ GFS : Global Foundation Services

#### 3 Concepts about the Global Infrastructure Plateform

1. Geo
  + Geographic area on the planet where the laws and regulations around data and the overall political structure are similar. 
    + Americas
    + Europe
    + Asia Pacific
    + Africa
  + Data can't leave Geo unless it is specifically allowed. It provides Data Sovereignty guarantee. It can be replicated to another region though.
  
2. Region
  + Represents Separate Azure Facilities, Isolated piece of Azure Resource
  + Resources that provisioned in one won't be impacted in case outage in another.
  + Regions could have single or more data centres or multi-floor data centers with complex arrangements of multiple geographically spread data centres in a CBD area with fast connectivity.
  + If regions fail then all the services in that region fail.
    + Fault Domains
    + Update Domains
  + Always tend to architect your sytems in such a way that it can cope with failure of a region. So build your infrastructure in separate regions just to achieve the high level of failover capability.
    
3. Region Pairs
  + Twin region or Region Pairs are built on the idea that they're close enough to be in the same Geography so they share the same political or data sovereign jurisdictions but they're far enough apart that a major fault in one region won't affect the second region. E.g., Australia East and Autralia Southeast 
  + This is really critical because a lot of products have built in replication failover between different elements of a region pair.
  
#### Summary

+ Geo -> 1+ Region(s)
+ Geo -> 1+ Region Pair(s)
+ Region Pair -> 2 Regions
+ Region -> 1+ Data Centre(s)
+ Data Center -> Multiple Fault and Update Domains

### Role Based Access Control (RBAC) 

+ It's a security model that Azure Resource Manager uses throughout all the product.
+ It's a system of access control introduced with the ARM.
+ Design to be scalable permission system.
+ It can meet the demand of larger Azure Implementations - Scalable and Granular Permission System
+ A user is given the least permission that they can work with, so it limits the damage that can be done if a single person's security information was compromised.

RBAC Consists :

1. Roles
  + It's a file/policy document. It does nothing on it's own.
  + It needs to be assigned and it's assigned to :
    + a user/users
    + User Group(s)
    + Application(s) 
  + A list of **actions** of what can happen, and what's denied - **NotActions**
    + `Microsoft.Compute/*` (Any resources in any compute area of Azure)
    + `Microsoft.Network/*/read` (Any read operation in any network area of Azure)
    
    + Roles Separation :
    
    |Built-in Roles|Custom Roles|
    |-|-|
    |common standard built-in set of roles|You create the policies yourself, custom policies|
    
    + Built-in Roles Separation :
    
    |Standard Admin role|Specific role|
    |-|-|
    |  <li>Owner : Full admin access, can provide access to others </li> <li>Contributor : less access than owner, can't provide access to others </li> <li>Reader : Only can read and access resouces </li> |  <li> Backup Operator </li><li> Website Cotributor  </li> |
    
2. Scopes
  + Under certain scope a role is assigned. Those scopes could be :
    + Subscription
    + Resource Group
    + Resource
  + 
3. Assignments
  


## Essential Services 

### Essential Services Introduction 
### COMPUTE 
### DEMO . Azure Marketplace & Create some VM's 
### STORAGE 
### DEMO . Static Web Hosting 
  + Azure Storage Explorer 
### NETWORK & CDN 

## All the Services 

### All the Services Introduction 
### DATABASES 
### AI & COGNITIVE SERVICES 
### BIG DATA & ANALYTICS 
  + Azure Analysis Services 
### DEMO - Making a chatbot
  + Create Slack Workspace 
  + Create a Slack App 
  + LUIS 
### WEB AND MOBILE 
### DEMO - Logic Apps - Understand Twitter Emotion
### INTERNET OF THINGS 
  + Event Hubs v's IOT Hubs 
### MANAGEMENT & MONITORING
### SECURITY & IDENTITY

## Finishing Up 

### Azure Roadmap 
  + Azure Roadmap 
  + Azure Updates 
  + Azure Blog 
### What you've learned ? 
### Whats Next ? 
  + Exam Resource - 70-532 - Developing Azure Solutions 
  + Exam Resources - 70-533 - Implementing Azure Infrastructure Solutions 
  + Exam Resources - 70-535 - Architecture Azure Solutions 

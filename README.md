<h1 align="center">Enterprise Active Directory & Security Operations Lab</h1>

<h2>Project Summary:</h2>

Designed and implemented a multi-phase enterprise Active Directory lab simulating real-world IT operations, including system administration, network services, security hardening, automation, and troubleshooting.

This project demonstrates:
- Deployment of redundant Domain Controllers (DC01 & DC02) for high availability.
- Centralized identity and access management using Active Directory.
- Network services configuration (DNS, DHCP) for domain functionality.
- Organizational Unit (OU) design and user provisioning.
- Group Policy enforcement to control user and system behavior.
- File server configuration with NTFS and share permissions using least privilege.
- PowerShell automation for bulk user provisioning and administrative efficiency.
- Security hardening and monitoring using account policies and event logging.
- Troubleshooting and help desk simulation using real-world IT scenarios and tools.

This lab simulates responsibilities across System Administration, IT Support, and Security Operations roles.

<h2>Description:</h2>
This project simulates a real-world enterprise IT environment using a Windows Server–based Active Directory infrastructure. The lab was designed to demonstrate core system administration skills, including identity and access management, network services configuration, automation, security hardening, and troubleshooting.

<h2 align="center">Languages and Technologies Used:</h2>

<div align="center">
 
<b>`Directory and Identity Services:`</b>

Active Directory Domain Services (**`AD DS`**).<br>
Active Directory Users & Computers (**`ADUC`**).<br>
Group Policy Management.<br>

<b>`Networking Services:`</b>

DNS.<br>
DHCP.<br>
TCP/IP IPv4 Addressing.<br>
Static IP Configuration.<br>
Host-Only Networking.<br>

<b>`File Services & Access Control:`</b>

File Server.<br>
SMB Sharing.<br>
NTFS Permissions.<br>
Group Policy Objects.<br>

<b>`Scripting and Tools:`</b>

PowerShell.<br>
</div>

<h2 align="center">Key Skills Demonstrated:</h2>

<div align="center">

`Active Directory Administration` (**AD DS**).<br>
`Group Policy Management` (**GPOs**).<br>
`DNS & DHCP Configuration.`<br>
`Identity & Access Management` (**IAM**).<br>
`Network Segmentation & Design.`<br>
`Windows Server Administration.`<br>
`PowerShell` (**Basic Automation**).<br>

</div>

<h2>Environments Used:</h2>

- VirtualBox.
- Windows 10 Client (**`21H2`**).
- Windows Server 2022.

<h1 align="left">Lab Walk-Through:</h1>

--------
<h2 align="center"><strong>Phase I: Environment Setup</strong></h2>

--------

<b>`Active Directory Purpose & Key Concepts:`</b>
- A domain controller is a critical system in enterprise networks, responsible for authentication, authorization, and policy enforcement.
- Active Directory provides centralized identity and access management.
- A domain controller hosts Active Directory and handles authentication and security policies across the network.
- Active Directory manages authentication, passwords, logins, users, groups, and computers, and controls access through permissions and group policies.
- Group Policy Objects enforce security settings and system configuration.
- Active Directory also supports least privilege access to protect network resources.

<b>`Lab Overview:`</b>

This lab focuses on building a functional Active Directory environment by configuring two Domain Controllers (DC01 and DC02) within an isolated network. Core services, including AD DS, DNS, and DHCP, were installed and configured, with DC01 acting as the primary controller and DC02 providing redundancy through replication. The setup was validated by verifying DNS resolution, Active Directory functionality, and successful replication between domain controllers.

**`Design Decisions:`**
- Implemented two Domain Controllers to simulate redundancy and high availability in enterprise environments.
- Separated external (NAT) and internal network traffic to reduce attack surface and reflect real-world network segmentation.
- Used static IP addressing to ensure consistent communication for critical infrastructure services.
- Configured DNS and replication to maintain directory consistency across domain controllers.

<h3 align="center">Server Setup & Domain Controller Configuration:</h3>

**`Step 1:`**
<p align="center"> <strong>Configuring DC01 Network Adapters:</strong> </p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/d738e85d-a0ad-4ed5-abc2-2f3bc6f92acb" width="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/3687234f-b5c9-4ed7-b612-33e91835fed9" width="400"/>
</p>
<p align="center"> <strong>Configuring DC02 Network Adapter:</strong> </p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/44ff227c-5336-43ca-9872-78ee7923b5f7" width="400"/>
</p>

**`Network Services Configuration:`**

DC01 was configured with dual network adapters to separate external connectivity (NAT) from internal domain traffic, improving security and simulating enterprise network segmentation. DC02 operates solely on the internal network to reduce exposure and support secure authentication and replication.

This setup isolates internal domain traffic while allowing DC01 limited external access for maintenance and updates.
<br>

**`Step 2:`**
<p align="center"> <strong>Configuring DC01 and DC02 with a Static IP Address:</strong> </p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/e1220a8f-0d39-4855-b56b-8e144124b025" width="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/bbfeecc0-b7d0-4463-95a0-33b8fcc2433d" width="400"/>
</p>

**`Assigning Static IP Configuration:`**

In this step, static IP addresses were configured on both domain controllers (DC01 and DC02) to ensure consistent and reliable network communication within the lab environment. 
- DC01 was assigned **192.168.1.10** and DC02 was assigned **192.168.1.11**, both using a subnet mask of **255.255.255.0**. 
- **No default gateway** was configured since the internal  network is isolated. 
- DNS settings were configured to support Active Directory, with DC02 pointing to DC01 as its primary DNS server.

Using static IPs is critical in a domain environment to prevent IP changes that could disrupt services like DNS and authentication.
<br>

**`Step 3:`**
<p align="center"><strong>Renaming the Server:</strong></p>
<p align="center"><strong>Renaming Server to DC01 and DC02:</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/dea5fd57-fb1a-4f0c-82c2-ecadd03184c9" width="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/b8ebba43-6558-4548-85cd-3ad75b06a9c9" width="400"/>
</p>

**`Server Renaming and Initial Configuration:`**

Both servers were renamed to DC01 and DC02 to align with standard enterprise naming conventions for domain controllers. This ensures clarity in role identification, simplifies management, and supports easier troubleshooting within the environment.
<br>

**`Step 4:`**
<p align="center"><strong>Install Roles (AD DS, DNS, DHCP):</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/bf92de49-7c0a-4723-b834-8d4d49c0648c" width="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/286f647e-3d0d-480f-ac7d-5f763bb36686" width="400"/>
</p>

**`Active Directory and Core Services Installation:`**

Core infrastructure roles were installed to support the Active Directory environment. DC01 was configured with Active Directory Domain Services (AD DS), DNS, and DHCP to function as the primary domain controller and network services provider. DC02 was configured with AD DS to operate as a secondary domain controller, supporting redundancy and replication.
<br>

**`Step 5:`**
<p align="center"><strong>Promote to Domain Controller:</strong></p>
<p align="center"><strong>DC01 Promotion:</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/92ef89e8-bb07-4939-b4dd-dbc3f1f51b95" width="400"/>
</p>
<p align="center"><strong>DC02 Promotion:</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/bf549d51-39f4-4935-8e33-2c71b9aa8678" width="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/0ca5fff9-393a-4ef8-ab2f-11cfea43309f" width="400"/>
</p>

**`Domain Controller Promotion:`**

DC01 was promoted to a domain controller by creating a new Active Directory forest (LAB.local), establishing the foundation of the domain environment. DC02 was then joined to the domain and promoted as an additional domain controller to provide redundancy, load balancing, and directory replication.

This configuration ensures high availability and fault tolerance within the Active Directory infrastructure.
<br>

**`Step 6:`**
<p align="center"><strong>Verify Active Directory + DNS / Replication:</strong></p>
<p align="center"><strong>DC01 Verification:</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/eaf601d6-5254-410b-8128-d2d4ab9e1a96" width="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/87513e3c-8f9c-42b8-80cc-81ef8b80a504" width="400"/>
</p>
<p align="center"><strong>DC02 Verification:</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/cc1d45e4-02d0-4f3b-bac2-8f6d03146b22" width="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/07b2a509-1afc-4b12-93bd-25e6f44482b5" width="400"/>
</p>

**`Active Directory and Replication Verification:`**

Post-deployment validation was performed to confirm proper Active Directory functionality. DNS configuration was verified through forward lookup zones, and replication health between DC01 and DC02 was validated using tools such as `repadmin` and Active Directory Sites and Services.

Successful replication confirmed directory consistency and proper communication between domain controllers.
<br>

**`Step 7:`**
<p align="center"><strong>Configure DHCP:</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/611a31c8-aeba-4bb3-a728-97fb7de0ae17" width="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/3232be71-a613-47d7-aee0-ca1524bfdb9a" width="400"/>
</p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/92e065fc-6747-4a1b-a622-af6cae5159f3" width="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/41ca138d-f8d7-4fa8-883e-849ab3956820" width="400"/>
</p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/491b9a01-66ae-4db7-a871-204c1c63f4ea" width="400"/>
</p>

**`DHCP Configuration:`**

A DHCP scope was configured to automate IP address assignment for client systems within the domain. The scope range (**192.168.1.100–192.168.1.200**) was defined to separate client devices from infrastructure systems.

DNS settings were configured to point to the domain controller, ensuring proper name resolution and domain connectivity. The DHCP server was authorized within Active Directory to allow it to issue IP addresses securely.

This setup enables centralized network management and reduces manual configuration for client devices.
<br>

**`Step 8:`**
<p align="center"><strong>Disable DNS on NAT NIC:</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/5de4f243-2265-4398-8c06-d2f36969db16" width="400"/>
</p>
<p align="center"><strong>Configure DNS on DC02:</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/b768c82a-7da8-4981-bed1-0d08a34603c0" width="400"/>
</p>

**`DNS Optimization and Configuration:`**

DNS settings were refined to prevent conflicts and ensure accurate name resolution. DNS registration was disabled on the NAT adapter to avoid incorrect record entries, while DC02 was configured to use DC01 as its primary DNS server.

This configuration ensures consistent name resolution and reliable communication between domain controllers.
- Preferred DNS: **192.168.1.10**
- Alternate DNS: **192.168.1.11**

Now, both DCs can resolve each other.
<br>

**`Step 9:`**
<p align="center"><strong>Test DC01:</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/b8b51aab-609c-4a25-80f1-be9e9ed71933" width="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/b58fe52d-ccf2-4cdd-888a-82156a1ab60d" width="400"/>
</p>

**`System Validation and Testing:`**

Network and domain functionality were validated using tools such as `ipconfig` and `nslookup` to confirm correct IP configuration and DNS resolution.

Successful testing verified that the domain environment was fully operational and that systems could communicate and resolve domain resources correctly.
<br>

**`Key Tasks Completed:`**
- Engineered a dual Domain Controller architecture (DC01/DC02) to simulate high availability and fault tolerance in an enterprise environment.
- Designed segmented network architecture using NAT (external) and isolated internal networks to reduce attack surface and mirror real-world infrastructure.
- Implemented static IP addressing for critical systems to ensure consistent DNS resolution and reliable domain communication.
- Deployed Active Directory Domain Services (AD DS), DNS, and DHCP to establish core identity and network services.
- Built a new Active Directory forest (**`LAB.local`**) and promoted DC01 as the primary Domain Controller.
- Integrated and promoted DC02 as a secondary Domain Controller to support redundancy and directory replication.
- Configured DNS for multi-DC support, ensuring accurate name resolution and service reliability.
- Validated AD health and replication using tools such as **`repadmin`** and Active Directory Sites and Services.
- Configured and authorized DHCP with a defined scope (**`192.168.1.100–200`**) to automate client IP assignment.
- Optimized network configuration by disabling DNS registration on external interfaces to prevent conflicts.
- Performed system validation using **`ipconfig`** and **`nslookup`** to confirm.

**`Overview:`**

This phase focused on building the core Active Directory infrastructure by configuring two domain controllers (DC01 and DC02) within an isolated network. Key services such as AD DS, DNS, and DHCP were installed, with DC01 acting as the primary controller and DC02 providing redundancy through replication. The setup was validated through DNS resolution, replication checks, and successful domain functionality testing.
<br>

--------

<h2 align="center"><strong>Phase II: Organizational Unit (OU) Design & User Provisioning</strong></h2>

--------

**`Objective:`**
Design and implement an Organizational Unit structure and provision users to support scalable identity management.

**`Key Concepts:`** 
-  OU design follows business structure, such as departments, roles, or locations.
-  User provisioning includes creating and configuring user accounts with the correct attributes and settings.
-  Security groups are used to assign permissions and control access to resources.
-  OU structure supports delegation of administration and simplifies policy application through Group Policy Objects.

<b>`Lab Overview:`</b>

This lab focuses on designing a structured Active Directory environment by creating Organizational Units (OUs) for departments such as HR, IT, and Finance, and provisioning users within each group. A hierarchical OU model was implemented to mirror a real-world enterprise and support scalable management. The setup was validated by joining a Windows client to the LAB.local domain and confirming successful authentication using domain accounts.

<h3 align="center">Active Directory Infrastructure Setup:</h3>

**`Step 1:`**
<p align="center"><strong>Creating OUs:</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/cc174823-f4fb-4366-b626-f75f32885a6f" width="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/a14525a5-2643-4d57-8a6d-20826c09bffc" width="400"/>
</p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/d55d9f6e-edb3-43cc-86da-e89ee45fcf5f" width="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/33de875c-d25a-4c1e-a192-8880011805c9" width="400"/>
</p>

**`Organizational Unit (OU) Design:`**

A hierarchical Organizational Unit structure was created to reflect a real-world enterprise environment. A parent "Company" OU was established, with child OUs for departments such as HR, IT, and Finance.

This structure supports scalable management, delegation of administrative control, and targeted Group Policy application.
<br>

**`Step 2:`**
<p align="center"><strong>Creating Departmental OU Users:</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/b8357139-6768-472f-85ff-ead5b99bdce3" width="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/2408b43e-e250-4a46-ac88-c7c3927fe62a" width="400"/>
</p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/e4ec89e4-a504-4926-88e4-72fd0ffcc979" width="400"/>
</p>

**`User Provisioning:`**

User accounts were created within each departmental OU to simulate real-world identity management. This approach ensures users are logically organized and allows policies and permissions to be applied based on department.

Standardized naming conventions were used to maintain consistency and support easier administration.
<br>

**`Step 3:`**
<p align="center"><strong>Domain Integration of a Windows Client with Active Directory</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/96b854cf-abc4-480b-84c4-116165f85e1c" width="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/d0588740-e4bc-43b5-b3fc-3562b4212adb" width="400"/>
</p>

**`Client Domain Integration:`**

A Windows 10 client machine was joined to the LAB.local domain to validate domain functionality. DNS was configured to point to the domain controller, ensuring proper domain resolution.

Successful login using domain credentials confirmed proper authentication and integration with Active Directory.

**`Key Tasks Completed:`**
- Designed and implemented a hierarchical Organizational Unit (OU) structure aligned with departmental functions (**`HR, IT, Finance`**) to support scalable identity management.
- Structured Active Directory objects to enable efficient policy application, delegation, and administrative organization.
- Provisioned user accounts within departmental OUs using standardized naming conventions to ensure consistency and manageability.
- Applied logical grouping of users and resources to support role-based access control (RBAC) principles.
- Demonstrated understanding of Active Directory object types and relationships (**`users, groups, OUs`**).
- Integrated a Windows 10 client into the domain environment to simulate enterprise endpoint management.
- Configured client DNS settings to ensure proper domain resolution and authentication.
- Validated successful domain authentication through user login testing across multiple accounts.

**`Overview`**

This phase involved designing a structured Organizational Unit (OU) hierarchy to reflect a real-world enterprise environment and provisioning users within each department. Departments such as HR, IT, and Finance were organized into OUs to support scalable management and policy application. The configuration was validated by joining a Windows client to the domain and confirming successful user authentication.
<br>

--------

<h2 align="center"><strong>Phase III: Group Policy Management</strong></h2>

--------

**`Objective:`**
Implement centralized control using Group Policy Objects to enforce security settings and standardize user and system configurations.

**`GPOs Key Concepts:`** 
-  Group Policy centralizes configuration for users and computers in an Active Directory domain.
-  GPOs link to sites, domains, or OUs to apply settings based on structure.
-  Security settings include password rules, account lockout policies, and system restrictions.
-  User and computer policies enforce limits such as blocking the Control Panel or Command Prompt.
-  Policy application follows Active Directory inheritance and updates through refresh cycles or gpupdate /force.
-  This approach reduces manual configuration and maintains consistent system settings across the domain.

<b>`Lab Overview:`</b>

This phase focuses on implementing centralized management through Group Policy Objects (GPOs) to control user and system behavior across the domain. Department-specific GPOs were created and applied to Organizational Units to enforce policies such as password requirements, screen lock settings, and system restrictions. The configuration was validated by applying policies to client machines and confirming different behaviors across departments using tools like gpupdate /force and gpresult /r.

<h3 align="center">Creating and Managing Group Policy Objects (GPOs):</h3>

**`Step 1:`**
<p align="center"> <strong>Open Group Policy Management Console (GPMC):</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/cb087389-5dca-4003-a740-20cef7c5f423" width="400"/>
  <img src="https://github.com/user-attachments/assets/69d3f2ea-c795-4a44-80c5-37edbe6d6780" width="400"/>
</p>
   
**`Group Policy Management Access:`**

The Group Policy Management Console (GPMC) was accessed through Server Manager to centrally create, manage, and deploy Group Policy Objects (GPOs) across the domain.
<br>

**`Step 2:`**
<p align="center"> <strong>Create a GPO (per department):</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/5f95cae5-a2e4-43e4-857e-54d9e228418d" width="400"/>
  <img src="https://github.com/user-attachments/assets/eeea36e7-726a-4022-ac95-472b276d2a33" width="400"/>
  <img src="https://github.com/user-attachments/assets/d3af92fd-419a-47a0-ac70-57223c6dd1a7" width="400"/>
</p>

**`Creating and Linking Group Policy Objects:`**

Separate Group Policy Objects (GPOs) were created for each departmental Organizational Unit (HR, IT, Finance) to enable targeted policy enforcement. This approach follows enterprise best practices by avoiding a single monolithic policy and allowing for granular control, scalability, and simplified troubleshooting.

Each GPO was linked directly to its respective OU to ensure policies were applied based on organizational structure.
<br>

**`Step 3:`**
<p align="center"> <strong>Configure Each Policy:</strong></p>
<p align="center">
  <strong>Finance-GPO:</strong><br>
  <img src="https://github.com/user-attachments/assets/12e2270a-72a1-4d74-a230-c6dd37ba860b" width="400"/>
  <img src="https://github.com/user-attachments/assets/151b9fc3-3fa6-4d92-b5f5-5b574ff942ad" width="400"/>
</p>
<p align="center">
  <strong>HR-GPO:</strong><br>
  <img src="https://github.com/user-attachments/assets/4fae738f-99ad-49c5-8ef6-3e5094f2a413" width="400"/>
  <img src="https://github.com/user-attachments/assets/05ab93b4-42ea-44c0-95a3-6f048039d5be" width="400"/>
</p>
<p align="center">
  <strong>IT-GPO:</strong><br>
  <img src="https://github.com/user-attachments/assets/d9eee175-4a29-4f38-a0f3-167f79235182" width="400"/>
  <img src="https://github.com/user-attachments/assets/448a981b-ca38-4f2e-90dd-dde63e099a7a" width="400"/>
</p>

**`Group Policy Configuration:`**

Department-specific policies were configured within each GPO to enforce security and system behavior standards. Settings included password policies, screen lock timeouts, and restrictions on system tools such as the Control Panel.

These configurations demonstrate centralized control and consistent policy enforcement across the domain.
<br>

 **`Step 4:`**
<p align="center"> <strong>Apply GPO to Specific OU:</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/0149e00e-59b8-4925-ac4c-a984a65c6b1e" width="400"/>
  <img src="https://github.com/user-attachments/assets/3d6816ea-586f-4c92-9918-fa1f8ced9528" width="400"/>
  <img src="https://github.com/user-attachments/assets/878761d4-041c-42aa-befe-c37e0ec5e360" width="400"/>
</p>

- If you created a GPO from an OU → already linked.

- If not:
  - Drag GPO to OU or Right-click OU → Link Existing GPO.

 **`Step 5:`**
<p align="center"> <strong>Verification:</strong></p>
<p align="center">
  <strong>Finance-GPO:</strong><br>
  <img src="https://github.com/user-attachments/assets/ab126af8-fd66-4df5-b00c-e673e7e5f3a6" width="400"/>
  <img src="https://github.com/user-attachments/assets/aa815971-3a55-4e11-82aa-7b4004c91dd1" width="400"/>
  <img src="https://github.com/user-attachments/assets/064e19d5-c032-4713-a3f7-4e5d0b5d9271" width="400"/>
</p>
<p align="center">
  <strong>HR-GPO:</strong><br>
  <img src="https://github.com/user-attachments/assets/485eb9ed-c183-4354-aa31-eda6e3a5987a" width="400"/>
  <img src="https://github.com/user-attachments/assets/abb64b7d-933c-4f00-a44b-ac6e66b47484" width="400"/>
  <img src="https://github.com/user-attachments/assets/f7e1d51d-ed74-4b3d-a853-8b52d1ac6bca" width="400"/>
</p>
<p align="center">
  <strong>IT-GPO:</strong><br>
  <img src="https://github.com/user-attachments/assets/eabc44b7-f76f-4cbd-90be-f705eafef04c" width="400"/>
  <img src="https://github.com/user-attachments/assets/acde8262-d890-45a6-862d-e5375c37d878" width="400"/>
  <img src="https://github.com/user-attachments/assets/14f58004-0af7-477a-a8d9-f914baf8724f" width="400"/>
</p>

**`On your Windows client:`**
1. **Force update:**
   - gpupdate /force
2. **Verify:**
   - Try opening Control Panel (HR & IT user blocked).
   - Check lock screen timeout.
3. **Run:**
   - gpresult /r
- This shows Applied GPOs and which OU did it come from.

**`Key Tasks Completed:`**
- Implemented centralized configuration management using Group Policy Objects (GPOs) across departmental OUs.
- Designed and deployed department-specific GPOs to enforce targeted security and system configurations.
- Applied security controls, including password policies, account restrictions, and system access limitations.
- Enforced user environment restrictions (e.g., Control Panel access, system settings) to standardize endpoint behavior.
- Linked GPOs to Organizational Units to ensure precise and scalable policy application.
- Validated policy deployment using **`gpupdate /force`** and **`gpresult /r`** to confirm correct inheritance and application.
- Tested and confirmed differentiated policy behavior across departments in a client environment.

**`Overview`**

This phase focused on implementing centralized control using Group Policy Objects (GPOs) to manage user and computer behavior across the domain. Department-specific GPOs were created and applied to enforce security settings, including password policies, screen lock timeouts, and system restrictions. The setup was tested by applying policies to client machines and verifying that different departments received the correct configurations.
<br>

--------

<h2 align="center"><strong>Phase IV: File Server & Permissions</strong></h2>

--------

**`Objective:`**
Configure file services and access controls to enforce least privilege and secure shared resources.

**`File Server & Permissions Key Concepts:`**
- A file server centralizes shared company resources so users can access approved folders over the network.
- Shared folders use UNC paths such as \\fileserver\HR and \\fileserver\IT.
- Share permissions control access to the folder through the network.
- NTFS permissions control what users can do with files and folders, including read, modify, write, or full control.
- Security groups should be assigned permissions instead of individual user accounts.
- Department-based permissions prevent HR users from accessing IT files and IT users from accessing HR files.
- Using both share and NTFS permissions helps protect company data and maintain proper access control.

<b>`Lab Overview:`</b>

This lab demonstrates the deployment of a dedicated Windows Server 2022 file server joined to the LAB.local Active Directory domain. It includes a separate data drive, HR and IT SMB shares, AGDLP-based security groups, NTFS and share permissions, access-based enumeration, permission testing, and automatic department drive mapping through Group Policy.

<h3 align="center">Deploying and Securing Department File Shares:</h3>


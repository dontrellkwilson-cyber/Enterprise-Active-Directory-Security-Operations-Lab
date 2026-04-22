<h1 align="center">Enterprise Active Directory & Security Operations Lab</h1>

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

<h2>Environments Used:</h2>

- VirtualBox.
- Windows 10 Client (**`21H2`**).
- Windows Server 2022.

<h1 align="center">Lab Walk-Through:</h1>
<h2 align="center"><strong>Phase I: Environment Setup</strong></h2>

<b>`Active Directory Purpose & Key Concepts:`</b>
- The server promoted to a domain controller is the most important system in a company’s network, as it hosts Active Directory.
- Active Directory provides centralized identity and access management.
- A domain controller hosts Active Directory and handles authentication and security policies across the network.
- Active Directory manages authentication, passwords, logins, users, groups, and computers, and controls access through permissions and group policies.
- Group Policy Objects enforce security settings and system configuration.
- Active Directory also supports least privilege access to protect network resources.

<b>`Lab Overview:`</b>

This lab focuses on building a functional Active Directory environment by configuring two Domain Controllers (DC01 and DC02) within an isolated network. Core services, including AD DS, DNS, and DHCP, were installed and configured, with DC01 acting as the primary controller and DC02 providing redundancy through replication. The setup was validated by verifying DNS resolution, Active Directory functionality, and successful replication between domain controllers.

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

DC01 is configured as the primary Domain Controller with two network adapters to separate external access from internal domain traffic.
- Adapter 1 (NAT) provides controlled internet access for updates and external connectivity.
- Adapter 2 (Internal Network) is used for all Active Directory and internal communication between domain devices.

DC02 is configured as a secondary Domain Controller with one network adapter.
- Adapter 1 (Internal Network) keeps it isolated from the internet and dedicated to Active Directory services like authentication and replication.

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
- Open Server Manager.
- Click Local Server on the left panel.
- Locate the Computer Name field.
- Click the current computer name and enter the System Properties window, click Change.
- Enter the new Computer Name and click OK to apply changes.
- Restart the server when prompted.
<br>

**`Step 4:`**
<p align="center"><strong>Install Roles (AD DS, DNS, DHCP):</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/bf92de49-7c0a-4723-b834-8d4d49c0648c" width="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/286f647e-3d0d-480f-ac7d-5f763bb36686" width="400"/>
</p>

**`Active Directory and Core Services Installation:`**
- Open Server Manager → Add Roles and Features.
- **`Install:`**
  - Active Directory Domain Services (AD DS).
  - DNS Server.
  - DHCP Server.
 
**For DC02:**
- **`Install:`**
  - Active Directory Domain Services.
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

**After install:**
- Click "Promote this server to a domain controller".
- **`Select:`**
  - Add a new forest.
  - Root domain name: LAB.local
- **`Set:`**
  - DSRM password (write this down).
- **`Then:`**
  - Install → Reboot
 
**For DC02:**

**First:**
- Go to:
- System → About Rename this PC (advanced).
- Click Change.
- Join domain:
  - LAB.local
-  **`Use:`**
  - Domain admin credentials.
- Reboot.
- Click: “Promote this server to a domain controller”.
- **`Choose:`**
  - Add a domain controller to an existing domain
  - Domain: LAB.local
- **`Check:`**
  - DNS Server.
  - Global Catalog.
<br>

**`Step 6:`**
<p align="center"><strong>Verify Active Directory + DNS / Replication:</strong></p>
<p align="center"><strong>DC01 Verification:</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/eaf601d6-5254-410b-8128-d2d4ab9e1a96" width="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/87513e3c-8f9c-42b8-80cc-81ef8b80a504" width="400"/>
</p>

**`After reboot:`**
- **Check:**
  - Active Directory Users and Computers.
  - DNS Manager.

- **`You should see:`**
  - Forward Lookup Zone: LAB.local
  
<p align="center"><strong>DC02 Verification:</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/cc1d45e4-02d0-4f3b-bac2-8f6d03146b22" width="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/07b2a509-1afc-4b12-93bd-25e6f44482b5" width="400"/>
</p>

**`After reboot:`**
- **Run:**
  - repadmin /replsummary
- **OR check:**
  - Active Directory Sites and Services.
- You should see DC01 ↔ DC02 replication.
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

**`Open DHCP Manager:`**
- **Create Scope:**
  - Name: **LAB-SCOPE**
- **Range:**
  - Start: **192.168.1.100**
  - End: **192.168.1.200**

**`Exclusions:`**
- **192.168.1.1 – 192.168.1.50** (servers, infra)

**`Configure Options:`**
- Router (Gateway): leave blank (or later if you add routing).
- DNS Server: **192.168.1.10**
- Domain Name: **LAB.local**
- Activate Scope.
- Then, authorize the DHCP server in AD.
<br>

**`Step 8:`**
<p align="center"><strong>Disable DNS on NAT NIC:</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/5de4f243-2265-4398-8c06-d2f36969db16" width="400"/>
</p>

**`Go to:`**
- Network Adapter → NAT NIC → IPv4 → Advanced.
- **Uncheck:**
  - “Register this connection in DNS”.
- Prevents DNS confusion.

<p align="center"><strong>Configure DNS on DC02:</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/b768c82a-7da8-4981-bed1-0d08a34603c0" width="400"/>
</p>

**`Update DNS settings:`**
- Preferred DNS: **192.168.1.10**
- Alternate DNS: **192.168.1.11**

Now both DCs can resolve each other.
<br>

**`Step 9:`**
<p align="center"><strong>Test DC01:</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/b8b51aab-609c-4a25-80f1-be9e9ed71933" width="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/b58fe52d-ccf2-4cdd-888a-82156a1ab60d" width="400"/>
</p>

**`Run:`**
- ipconfig /all

**`Confirm:`**
- Internal NIC = **192.168.1.10**
- DNS = **192.168.1.10**

**`Test:`**
- nslookup LAB.local
<br>

**`Key Tasks Completed:`**
- Configured a dual Domain Controller environment (DC01 & DC02) for redundancy and high availability.
- Designed network architecture using NAT (internet access) and an isolated internal network.
- Assigned static IP addresses to ensure consistent communication for Active Directory services.
- Installed and configured Active Directory Domain Services (AD DS), DNS, and DHCP.
- Deployed a new Active Directory forest (LAB.local) and promoted DC01 as the primary Domain Controller.
- Joined DC02 to the domain and promoted it as a secondary Domain Controller.
- Configured DNS for proper name resolution and followed best practices for multi-DC environments.
- Verified Active Directory health using replication tools (repadmin, AD Sites and Services).
- Configured and authorized DHCP with a scoped IP range for client devices.
- Optimized network settings by disabling DNS registration on the NAT adapter to prevent conflicts.
- Tested domain functionality and verified DNS resolution across domain controllers.

**`Overview`**

This phase focused on building the core Active Directory infrastructure by configuring two domain controllers (DC01 and DC02) within an isolated network. Key services such as AD DS, DNS, and DHCP were installed, with DC01 acting as the primary controller and DC02 providing redundancy through replication. The setup was validated through DNS resolution, replication checks, and successful domain functionality testing.
<br>

--------

<h2 align="center"><strong>Phase II: Organizational Unit (OU) Design & User Provisioning</strong></h2>

**`Organizational Unit (OU) Design & User Provisioning Key Concepts:`** 
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

**`Open Active Directory:`**
- **On DC01:**
  - Open Active Directory Users and Computers

**`Create Parent OU (“Company”):`**
- **Right-click:**
  - LAB.local
- **Click:**
  - Company
- **Name it:**
  - Company
- Click OK

**`Create Child OUs inside “Company:”`**
- **Now expand:**
  - LAB.local → Company

**`Create HR OU, IT OU, and Finance OU:`**
- Right-click Company
- New → Organizational Unit
- Name:
- Click OK.

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

**`Inside each OU:`**
- Right-click → New → User
- **Repeat for:**
  - IT OU
  - Finance OU
<br>

**`Step 3:`**
<p align="center"><strong>Domain Integration of a Windows Client with Active Directory</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/96b854cf-abc4-480b-84c4-116165f85e1c" width="400"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/d0588740-e4bc-43b5-b3fc-3562b4212adb" width="400"/>
</p>

**`Steps:`**
- Set the client DNS to the domain controller IP address **192.168.1.10**.
- Open system settings on the Windows 10 client.
- System → About Rename this PC (advanced).
- Click Change.
- Choose the Domain option.
- Enter the domain name.
- Provide domain admin credentials.
- Restart the client machine.
- After reboot, sign in using a domain user account.

**`Key Tasks Completed:`**
- Designed and implemented an Organizational Unit (OU) structure to mirror a real-world enterprise environment.
- Created a hierarchical OU model with a parent Company OU and departmental OUs (HR, IT, Finance).
- Provisioned user accounts within each department using standardized naming conventions.
- Organized users logically to support scalable management and policy application.
- Demonstrated understanding of Active Directory object types (users vs OUs).
- Joined a Windows 10 client machine to the LAB.local domain.
- Configured client DNS to use the Domain Controller for proper domain resolution.
- Validated domain authentication by logging in with Active Directory user accounts.

**`Overview`**
This phase involved designing a structured Organizational Unit (OU) hierarchy to reflect a real-world enterprise environment and provisioning users within each department. Departments such as HR, IT, and Finance were organized into OUs to support scalable management and policy application. The configuration was validated by joining a Windows client to the domain and confirming successful user authentication.
<br>

--------

<h2 align="center"><strong>Phase III: Group Policy Management</strong></h2>

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

This opens the console used to manage GPOs.
   
**`Steps:`**
- Open Server Manager.
- Click Tools at the top right.
- Select Group Policy Management.
<br>

**`Step 2:`**
<p align="center"> <strong>Create a GPO (per department):</strong></p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/5f95cae5-a2e4-43e4-857e-54d9e228418d" width="400"/>
  <img src="https://github.com/user-attachments/assets/eeea36e7-726a-4022-ac95-472b276d2a33" width="400"/>
  <img src="https://github.com/user-attachments/assets/d3af92fd-419a-47a0-ac70-57223c6dd1a7" width="400"/>
</p>

Instead of one big policy, create separate GPOs per OU (this is what companies actually do).

**`Steps:`**
- **Expand:**
  - Forest → Domains → LAB.local
- Right-click your OU (ex: HR)
- Click → Create a GPO in this domain, and Link it here.
- **Name it:**
  - HR-GPO
- Repeat for IT and Finance.

**`Decide where you want the policy:`**
- Domain Level (**applies to all**).
- OR specific OU (**Organizational Unit**).

There are two ways to create a new GPO.
- **Option 1**: Creates the GPO first and links it to a domain or OU later.
- **Option 2**: Creates and links the GPO at the same time.
   
**`Method I:`**
- Click Group Policy Objects.
- Right-click New.
- Enter a name.
- Click OK.

**`Method II:`**
- Right-click the OU or Domain.
- Click Create a GPO in this domain, and Link it here.
- Enter a name.
- Click OK.
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

**`Steps:`**
- Right-click the GPO.
- Click Edit.
- **`Configure settings under:`**
  - Computer Configuration (**applies on startup**).
  - User Configuration (**applies on login**).
- **`Navigate inside:`**
  - Policies → Administrative Templates.
  - Double-click any setting.
- **`Choose:`**
  - Enabled.
  - Disabled.
- Click Apply → OK.

**`User Configs:`**
- User Configuration → Policies → Administrative Templates → Control Panel → Personalization
- **Set:**
  - Screen saver timeout = 600 (10 min).
  - Enable screen saver.
- User Configuration → Policies → Administrative Templates → Control Panel
- **Set:**
  - Prohibit access to Control Panel = Enabled

**`Computer Configs:`**
- Computer Configuration → Policies → Windows Settings → Security Settings → Account Policies → Password Policy
- **Set:**
  - Minimum length: 8
  - Complexity: Enabled
  - Max age: 30 days
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

**`Overview`**
This phase focused on implementing centralized control using Group Policy Objects (GPOs) to manage user and computer behavior across the domain. Department-specific GPOs were created and applied to enforce security settings such as password policies, screen lock timeouts, and system restrictions. The setup was tested by applying policies to client machines and verifying that different departments received the correct configurations.
<br>

--------

<h2 align="center"><strong>Phase IV: File Server & Permissions</strong></h2>

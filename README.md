# Active Directory Enterprise Infrastructure Lab

Enterprise on-prem infrastructure | Windows Server 2022 | Simulated environment

![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Platform](https://img.shields.io/badge/Windows_Server-2022-blue)
![ActiveDirectory](https://img.shields.io/badge/Active_Directory-Enterprise-blue)
![PowerShell](https://img.shields.io/badge/PowerShell-Automation-important)

> Enterprise Active Directory lab demonstrating identity management, network services, security hardening, patch management, and infrastructure automation using Windows Server 2022.

---

## Project Overview

Production-like enterprise infrastructure focused on centralized administration, high availability, and security.

**Technologies**: Windows Server 2022, AD DS, DNS, DHCP, DFS, WSUS, ADCS, pfSense, Windows 10/11, PowerShell

### Focus Areas

- Active Directory infrastructure
- Network services
- File services & replication
- Group Policy & automation
- OS deployment & remote access
- Security hardening
- Patch management

---

## Lab Environment

| Component          | Configuration           |
| ------------------ | ----------------------- |
| Domain             | diarabaka.com           |
| Domain Controllers | 2 x Windows Server 2022 |
| Clients            | Windows 10 / Windows 11 |
| Firewall           | pfSense                 |
| PKI                | ADCS                    |
| Deployment         | WDS                     |
| Remote Access      | RDS                     |
| Update Management  | WSUS                    |

---

## Architecture

- Active Directory Domain Services
- DNS & DHCP redundancy
- DFS file replication
- WDS deployment
- RDS remote administration
- pfSense firewall segmentation

![Architecture](./assets/architecture/architecture-diagram.png)

---

## Core Infrastructure

- Active Directory & DNS (2 Domain Controllers)
- DHCP failover
- Organizational Units
- ADCS (internal PKI)

![AD DS](./assets/core/ad-dns.png)

![DHCP Address Leases](./assets/core/dhcp-address-leases.png)

![Redundancy](./assets/core/ad-redundancy.png)

![OU Structure](./assets/core/ou-structure.png)

---

## Network Services

- FTPS
- HTTPS (IIS + SSL)
- RDP administration
- pfSense firewall & network segmentation

![FTPS](./assets/network/ftps.png)

![HTTPS](./assets/network/https.png)

![RDP](./assets/network/rdp.png)

---

## File Services

- Centralized file sharing with DFS Namespace
- DFS Replication (DFS-R) for redundancy
- NTFS permissions for access control

![DFS](./assets/files/dfs.png)

![NTFS](./assets/files/ntfs-permissions.png)

---

## Management & Automation

- Group Policy (GPO)
- PowerShell automation

![GPO](./assets/mgmt/gpo.png)

![PowerShell](./assets/mgmt/powershell.png)

---

## Deployment & Remote Access

- RDS Deployment
- WDS (PXE deployment)

![RDS Overview](./assets/deployment/rds-overview.png)

![WDS](./assets/deployment/wds.png)

---

## Security Hardening

- BitLocker
- LAPS
- Kerberos hardening
- Audit policies
- Fine-grained password policies
- Firewall via GPO

![BitLocker Drive Encryption](./assets/security/bitlocker-drive-encryption.png)

![Audit Policies](./assets/security/audit-policies.png)

![Kerberos Authentication Policy](./assets/security/kerberos.png)

![Local Administrator Password Solution (LAPS)](./assets/security/laps.png)

![Fine-Grained Password Policy](./assets/security/fine-grained-password-policy.png)

![Firewall GPO](./assets/security/firewall-gpo.png)

---

## Patch Management (WSUS)

Centralized Windows update management.

### Synchronization Status

![Sync Status](./assets/wsus/update-sync.png)

_Products synced from Microsoft Update_

### Managed Computers

![All Computers](./assets/wsus/wsus-all-computers.png)

_Domain-joined clients reporting to WSUS_

---

## PowerShell Automation

```powershell
$csvPath = "C:\Script\users.csv"
$ouPath = "OU=Import,OU=THIERNO,DC=diarabaka,DC=com"

Import-Module ActiveDirectory

$users = Import-Csv -Path $csvPath

foreach ($user in $users) {

    $password = ConvertTo-SecureString $user.Password -AsPlainText -Force

    $userProps = @{
        Name                  = "$($user.FirstName) $($user.LastName)"
        GivenName             = $user.FirstName
        Surname               = $user.LastName
        SamAccountName        = $user.UserName
        UserPrincipalName     = "$($user.UserName)@diarabaka.com"
        DisplayName           = "$($user.FirstName) $($user.LastName)"
        Path                  = $ouPath
        AccountPassword       = $password
        Enabled               = $true
        ChangePasswordAtLogon = $true
    }

    New-ADUser @userProps
}

Write-Host "User provisioning completed."
```

---

## Enterprise Scenarios Simulated

- Domain controller redundancy
- DFS file replication
- PXE deployment (WDS)
- Security hardening
- Patch management
- Administrative automation

---

## Technologies & Skills Demonstrated

`AD DS` `DNS/DHCP` `GPO` `GPO Refresh` `WEF` `DFS/DFS-R` `BitLocker` `Kerberos` `LAPS` `WSUS`
`PowerShell` `pfSense` `RDS` `WDS`

---

## Challenges & Solutions

### DFS Replication Troubleshooting

**Problem**

DFS replication was not synchronizing correctly between replicated folders.

**Solution**

Verified DFS-R service status, Active Directory replication health, and replication topology configuration.

**Result**

Successful synchronization across all DFS members.

### DHCP Failover Validation

**Problem**

Ensure uninterrupted IP address assignment during DHCP server failure.

**Solution**

Configured DHCP Failover and tested service continuity during simulated outage.

**Result**

Clients continued receiving valid leases without interruption.

---

## Lessons Learned

- Active Directory infrastructure design
- Organizational Unit (OU) planning
- DNS and DHCP administration
- DFS Namespace and DFS Replication
- Group Policy deployment and troubleshooting
- Windows Server security hardening
- Active Directory Certificate Services (ADCS)
- WSUS administration
- PowerShell automation

---

## Future Improvements

- Microsoft Entra ID integration
- Hybrid identity synchronization
- Microsoft Intune management
- Microsoft Sentinel monitoring
- Automated compliance reporting

---

## Project Status

✅ Completed

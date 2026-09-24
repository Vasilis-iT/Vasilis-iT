Markdown

# 🛠️ IT Helpdesk & Troubleshooting Guide
> A practical reference guide and checklist for resolving common 1st Level IT Support issues in Windows environments.

---

## 📋 Table of Contents
1. [Network & Connectivity Issues](#1-network--connectivity-issues)
2. [Printer & Hardware Troubleshooting](#2-printer--hardware-troubleshooting)
3. [Windows OS & Performance Fixes](#3-windows-os--performance-fixes)
4. [User Access & Active Directory Basics](#4-user-access--active-directory-basics)

---

### 1. Network & Connectivity Issues

When a user reports "No Internet Connection" or slow network:
* **Step 1: Check Physical Connections**
  * Verify Ethernet cable is securely plugged into both the PC and the wall jack/switch.
  * Check network card status (LED lights on the port).
* **Step 2: Basic Network Diagnostics (CMD)**
  * Open Command Prompt (`cmd`) as a regular user (or administrator if needed).
  * Run `ipconfig /all` to check IP address, subnet mask, and Default Gateway.
  * Test local gateway connection: `ping [Gateway_IP]`
  * Test external DNS resolution: `ping 8.8.8.8` or `ping google.com`
* **Step 3: Reset Network Stack**
  * Release and renew IP configuration:
    ```cmd
    ipconfig /release
    ipconfig /renew
    ```
  * Flush the DNS resolver cache:
    ```cmd
    ipconfig /flushdns
    ```
  * Reset Winsock catalog:
    ```cmd
    netsh winsock reset
    ```
* **Step 4: Restart Network Adapter**
  * Go to `ncpa.cpl` (Network Connections), disable the Ethernet/Wi-Fi adapter, wait 10 seconds, and re-enable it.

---

### 2. Printer & Hardware Troubleshooting

When a user cannot print documents:
* **Step 1: Queue & Status Check**
  * Open `Printers & Scanners`, check if the printer is set to "Offline" or "Paused".
  * Open the print queue, cancel stuck or corrupted print jobs.
* **Step 2: Restart Print Spooler Service**
  * Open Services (`services.msc`), locate **Print Spooler**.
  * Right-click and select **Restart** (or use PowerShell: `Restart-Service spooler`).
* **Step 3: Driver & Connection Refresh**
  * Remove and re-add the network printer using its static IP address.
  * Reinstall/update the correct manufacturer drivers if necessary.

---

### 3. Windows OS & Performance Fixes

When a user complains about system freezing, slow performance, or application crashes:
* **Step 1: Task Manager Analysis**
  * Press `Ctrl + Shift + Esc` to open Task Manager.
  * Check CPU, Memory, and Disk usage peaks. Identify and `End Task` on frozen or runaway processes.
* **Step 2: System File Integrity Check**
  * Open Command Prompt as Administrator and run System File Checker to repair missing/corrupted system files:
    ```cmd
    sfc /scannow
    ```
  * If issues persist, run Deployment Image Servicing and Management (DISM):
    ```cmd
    DISM /Online /Cleanup-Image /RestoreHealth
    ```
* **Step 3: Disk Cleanup & Cache Clearing**
  * Clear temporary system and user files (`temp`, `%temp%`, `prefetch`).
  * Run Disk Cleanup (`cleanmgr`) to free up storage space.

---

### 4. User Access & Active Directory Basics

Standard 1st Level Active Directory (AD) tasks:
* **Password Resets:** Locating user accounts in AD Users and Computers (ADUC), unlocking locked-out accounts, and checking "User must change password at next logon".
* **Group Membership:** Verifying basic security group assignments for shared folder access or software permissions.
* **Remote Support Tools:** Establishing remote sessions securely via Remote Desktop (RDP), TeamViewer, or AnyDesk to guide users through troubleshooting steps.

---
*Created and maintained by Vasileios Ganotis — Aspiring IT Support & Helpdesk Specialist.*

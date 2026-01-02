 # Linux Server Automation: Smart Backup System

📌 Project Overview

This project was developed to automate a critical system administration task: the daily discovery and archival of modified files. The script ensures data integrity while maintaining server stability by monitoring system resources before execution.

🛠️ Key Technical Features

This script includes professional-grade server management logic to handle real-world production environments:

Smart Filtering: Uses Unix Epoch time logic to identify and backup only files modified within the last 24 hours.

Disk Health Check: Implements a pre-execution check using df -h to report available storage, preventing "Disk Full" errors.

Resource Management: Designed to run with optimized CPU priority using nice to ensure the backup process does not slow down the server for other users.

Error Auditing: Uses I/O redirection to capture system errors for later review by a System Administrator.

Automation: Configured for zero-touch operation via Crontab scheduling.

📁 Project Files

backup.sh: The main automation script containing the backup and monitoring logic.

README.md: Project documentation and usage guide.

success_output.png: Verification of successful script execution.

🚀 Usage Instructions
Make the script executable:

Bash
chmod +x backup.sh
Run a manual backup:


Bash

./backup.sh /path/to/source /path/to/destination

🗓️ Automation (Crontab)
To automate this script to run every day at midnight, add the following line to your crontab -e:


Bash
0 0 * * * /usr/local/bin/backup.sh /source_dir /dest_dir

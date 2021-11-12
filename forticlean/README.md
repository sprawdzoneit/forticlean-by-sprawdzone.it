FortiClean by sprawdzone.it
version: 1.0
------------------------------------------------

The script allows you to deactivate FortiClient EMS, so you can manually start/stop this application - even when ems administrator has blocked functions in the application.

The script was created to protect the privacy of the users who ware forced to install FortiClient EMS. Thanks to this, we control the data that is sent in background to the EMS. We protect our privacy (nobody controls where we enter, what we run). When FortiClient EMS is stopped, the administrator does not know the contents of our disk. The overall system performance is also improved - EMS itself launches many background services (not optimized) which significantly diminish system performance.


ATTENTION:
the user must have local administrator privileges
if the system disk is encrypted with bitlocker, you may need a recovery key before booting in safe mode (depends on TPM version)

after each FortiClient update sent from the Forti EMS panel by the administrator, the script execution must be rerun

INSTALLATION:
Run the BAT script as an administrator

PROCESS DESCRIPTION:
the script will make an entry in the registry for a one-time boot in safe mode (the user will have to enter the credentials).

then the commands executed in this mode modifying the startup mode of FortiClient EMS services.

the script will create two commands on the desktop to manually start the FortiClient service

will add another one-time entry to the registry to remove the service modification script, and automatically restart the computer in normal mode

two BAT commands will be visible on the desktop (the commands must also be performed as an administrator)

INFORMATION:
verified on version: FortiClientSetup_7.0.1_x64

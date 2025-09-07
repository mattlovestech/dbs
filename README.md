# File Structure
This file structure mirrors the in-class assignments.

Desktop/
└── databases/
    ├── assignment1.sql
    ├── careers_data_setup.sql
    └── [additional SQL files]
── dbs/
├── country_club.db



# Installation 
All you need to get going. 

## Run the Anaconda Installer

There are several ways to install the software we'll need for this class on your computer. We'll be using a simple installer called Anaconda.

Download the latest version of the Anaconda installer for Windows, OSX, or Linux (click the link to "Skip registration").
Accept most of the defaults for installation (just click "Continue" or "Next" the whole way).
Note: If you previously had an older version of Anaconda installed on your computer, you may run into issues trying to install it again. In that case, first follow these instructions to uninstall AnacondaLinks to an external site. before completing this step.

## Install SQLite3

SQLite3 already comes installed with the Anaconda Installer, so there's nothing you have to do here.

Verifying SQLite3

To verify that you have SQLite3 installed, open a new command line window (either Terminal or Powershell depending on your operating system), then type or copy the following text: sqlite3 --version (with two hyphens, not one) and hit enter:

% sqlite3 --version
3.45.3 2024-04-15 13:34:05 8653b758870e6ef0c98d46b3ace27849054af85da891eb121e9aaa537f1e8355 (64-bit)
Don't worry if it doesn't look exactly like mine. If the version number is 3 or above, you're all set!

## Install PostgreSQL

Even though we'll mostly be using SQLite3 in class, we'll also be exploring other versions of SQL including PostgreSQL – which is very popular for large applications (we'll talk about the reasons why in class). 

To install PostgreSQL, open a new command line window (Terminal or PowerShell, depending on which you're using), then type or copy the following text: conda install -c anaconda postgresql -y and hit enter.
It should now download PostgreSQL onto your computer. (If you run into an error, see Troubleshooting & Common Issues below.)
You'll have to reopen a new command line window for the changes to take effect.

Verifying PostgreSQL

To make sure you got PostgreSQL installed properly, open a new command line window (make sure to switch into your myenv if you had to create one), then type or copy the following text: psql --version (with two hyphens, not one) and hit enter:

% psql --version
psql (PostgreSQL) 17.4
If it says psql (PostgreSQL) 17 or above, you're all set!

## Troubleshooting & Common Issues:

Make sure you open up a new command line window after running the Anaconda installer and installing SQLite and PostgreSQL.
If you've waited several minutes after running conda install -c anaconda sqlite or conda install -c anaconda postgresql and it looks like it's frozen, you can interrupt the command by pressing Control + C and try running it again.
To check whether you've installed everything correctly, make sure you only type sqlite3 --version or psql --version in the prompt (no quotes, no spaces, no punctuation, nothing).
You may have to disable antivirus temporarily.
If you're using a work computer and it doesn't let you install SQLite3, Sublime Text, or PostgreSQL, you may need to contact your IT team.
You may run into issues if you previously had an older version of Anaconda installed on your computer. First follow these instructions to uninstall AnacondaLinks to an external site. before trying to install it again.
If you run into the following error while trying to install PostgreSQL:
Solving environment: failed with initial frozen solve. Retrying with flexible solve.
Solving environment: failed with repodata from current_repodata.json, will retry with next repodata source.
Collecting package metadata (repodata.json): done
Solving environment: failed with initial frozen solve. Retrying with flexible solve.
Try running the following code in your command line:

conda create --name myenv -y
This will create a new "virtual environment" called myenv (kind of like a sandbox that allows you to switch back and forth between different installations of things like Python or SQL). You then have to switch to the new environment with:

conda activate myenv
Once you've activated this environment, you should see (myenv) in parentheses on the left and you should be able to install both SQLite and PostgreSQL with conda install -c anaconda sqlite postgresql -y.

However, you'll have to switch to myenv with the command above every time you want to use PostgreSQL and also run conda deactivate when you want to switch out of the virtual environment.

If you run into the following error while trying to install PostgreSQL:

Conda SSLError: OpenSSL appears to be unavailable on this machine. OpenSSL is required to
download and install packages.
This is a relatively new error related to the Anaconda Installer, and the following steps seem to solve the problem for most people: https://github.com/conda/conda/issues/11982#issuecomment-1285538983Links to an external site.

If you run into the following error while trying to run the sqlite3 command:

sqlite3 : The term 'sqlite3' is not recognized as the name of a cmdlet, functio
n, script file, or operable program. Check the spelling of the name, or if a pa
th was included, verify that the path is correct and try again.
This likely means that you're on a Windows and using the wrong command line. Make sure you're opening the Anaconda PowerShell Prompt specifically (and not the Anaconda Prompt, or Windows PowerShell, which are different applications and won't work for this class).
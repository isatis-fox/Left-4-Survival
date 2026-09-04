#============================================================================================//
#
# Left 4 Escape / Left 4 Survival - Addon VPK Creator Uility
#
# File: create.sp
#
# Purpose: Create VPKs of the addons
#
# History:    Aug-21-26   Isatis   Created
#             Aug-25-26   Isatis   Seperated into seperate files (vpk.py + projects.py)
#             Sep-04-26   Isatis   Back into single file
#
#
#============================================================================================//

import os
import subprocess

# All folders with "addoninfo.txt" will have this
PROJECTS = []

# Path to vpk.exe from Left 4 Dead Authoring Tools
VPK = r"C:\Program Files (x86)\Steam\steamapps\common\Left 4 Dead 2\bin\vpk.exe"

# Current working directory
CWD = os.getcwd()

# Print projects
def outputProjects():
    for project in PROJECTS:
        print(project)
    print()

def validProject(givProject: str):
    for project in PROJECTS:
        if project == givProject:
            return True
    return False

def vpk(dirname: str):
    if dirname in ["everything", "all"]:
        for project in PROJECTS:
            print("Creating " + project.lower() + ".vpk")
            subprocess.call(
                [
                    f'{CWD}\\bin\\vpk.exe',
                    project.lower()
                ],
                cwd=CWD
            )
    else:
        print("Creating " + dirname.lower() + ".vpk")
        subprocess.call(
            [
                f'{CWD}\\bin\\vpk.exe',
                dirname.lower()
            ],
            cwd=CWD
        )
# Go through directories
for dir in os.listdir():
    # Does it have "addoninfo.txt"?
    if os.path.exists(f"{dir}\\addoninfo.txt"):
        PROJECTS.append(dir)

# This could be better..
try:
    while True:
        outputProjects()

        project = input("Create vpk for: ")

        if validProject():
            vpk(project)
except KeyboardInterrupt:
    exit()
    print()
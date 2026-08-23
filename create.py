import os
import subprocess

VPK = r"C:\Program Files (x86)\Steam\steamapps\common\Left 4 Dead 2\bin\vpk.exe"
CWD = os.getcwd()

stuff_can_create = [
    "ze_maps",
    "ze_map_assets"
]

try:
    while True:
        for thing_ in stuff_can_create:
            print(thing_)

        print()
            
        thing = input("Create what? ")

        for thing_ in stuff_can_create:
            if thing.lower() == thing_:
                os.system('cls')
                print("Creating " + thing.lower() + ".vpk")
                subprocess.call(
                    [
                        f'{CWD}\\bin\\vpk.exe',
                        thing.lower()
                    ],
                    cwd=CWD
                )
                print("\n")
            else:
                if thing.lower() == "all" or thing.lower() == "everything":
                    os.system('cls')
                    for thing_ in stuff_can_create:
                        print("Creating " + thing_.lower() + ".vpk")
                        subprocess.call(
                            [
                                f'{CWD}\\bin\\vpk.exe',
                                thing_.lower()
                            ],
                            cwd=CWD
                        )
                      
        
except KeyboardInterrupt:
    exit()
#"C:\Program Files (x86)\Steam\steamapps\common\Left 4 Dead 2\bin\vpk" ze_maps
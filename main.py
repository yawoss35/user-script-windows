import os

print("*********\n  Menu\n*********")

x = input("\n1) List Users on Windows\n2) Create a New User\n3) Change a Users Password\n4) Delete a User Account\n\n")

if x == "1":  
    os.system("net user")
elif x == "2":
    user = input("Username: ")
    pas = input("Password: ")
    os.system(f"net user {user} {pas} /add")
elif x == "3":
    chguser = input("Username whose password you will change: ")
    chgpass = input("New Password: ")
    os.system(f"net user {chguser} {chgpass}")
elif x == "4":
    deluser = input("The username you want to delete: ")
    os.system(f"net user {deluser} /delete")
else:
    print("Error!!!!")

input("\nPress Enter to exit...")  # Programın kapanmaması için kullanıcıdan giriş bekler

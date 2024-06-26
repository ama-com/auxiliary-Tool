from cx_Freeze import setup, Executable

executables = [
    Executable("createEcdsaKey.py")
]

setup(
    name="MyApp",
    version="1.0",
    description="Description of your app",
    options={"build_exe": {"excludes": ["tkinter"]}},
    executables=executables
)

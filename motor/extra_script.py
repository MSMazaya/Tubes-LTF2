import os
Import("env")

# include toolchain paths
env.Replace(COMPILATIONDB_INCLUDE_TOOLCHAIN=False)

# Possible Solution
# use clangd
# https://github.com/platformio/platformio-core/issues/364
# create new project and see how it goes


# override compilation DB path
env.Replace(COMPILATIONDB_PATH=os.path.join("./", "compile_commands.json"))

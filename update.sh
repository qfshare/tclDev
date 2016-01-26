
git submodule foreach --recursive git submodule init
git submodule foreach --recursive git submodule update

cp bin/neoAuto* bin/

cp dot/* cfg/ -fr
rm -fr cfg/.git* cfg/*/.git* cfg/*/*/.git* cfg/*/*/*/*/.git* cfg/*/*/*/.git*



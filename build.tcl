#!/usr/bin/tclsh

# Make Directory
puts "Make Directory"
exec mkdir -p scr bak bin cfg dmo doc eda lib rls scr
exec touch bak/neoBackup
exec mkdir -p doc/lib
exec touch doc/lib/jquery.js
exec touch eda/icc
cd lib
exec ln -fs ~/sdcparser/   
cd ..
exec touch rls/neoTest

exec mkdir -p scr/apps/ scr/core/ scr/hier/ scr/perl/ scr/temp/ scr/test/ scr/viml/ scr/wish/
exec touch scr/apps/neoAutoDoc
exec touch scr/core/neoDefineProcArgs
exec touch scr/core/neoParseProcArgs
exec touch scr/hier/sdcparser
exec touch scr/perl/logMonitor.pl
exec touch scr/temp/neoTemp
exec touch scr/test/neoTest
exec touch scr/viml/xoit.vim
exec touch scr/wish/gui.tk

exec touch mkf

# Add Submodule
puts "Clone dotfiles"
exec git submodule add --force https://github.com/xoit/dotfiles.git dot

# Copy dot to cfg 
exec cp dot/* cfg/ -fr
exec rm -fr cfg/.git* cfg/*/.git* cfg/*/*/.git* cfg/*/*/*/.git*

# Setup tclAutoDoc
puts "Clone tclAutoDoc"
exec git submodule add --force https://github.com/xoit/tclAutoDoc.git bin/tclAutoDoc
cd bin
catch {exec cp -fr tclAutoDoc/neoAutoDoc .}
cd ..
# Setup tlcAutoPlan
puts "Clone tclAutoPlan"
exec git submodule add --force https://github.com/xoit/tclAutoPlan.git bin/tclAutoPlan
cd bin
catch {exec cp -fr tclAutoPlan/neoAutoPlan .}
cd ..
# Setup tlcAutoTest
puts "Clone tclAutoTest"
exec git submodule add --force https://github.com/xoit/tclAutoTest.git bin/tclAutoTest
cd bin
catch {exec cp -fr tclAutoTest/neoAutoTest .}
cd ..
# Setup tlcAutoRls
puts "Clone tclAutoRls"
exec git submodule add --force https://github.com/xoit/tclAutoRls.git bin/tclAutoRls
cd bin
catch {exec cp -fr tclAutoRls/neoAutoRls .}
cd ..


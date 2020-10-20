
# hacked together by Nicholas Swiateck, nswiatec<>cisco.com. 
# use at own risk!

#Usage: ns-apRename.tcl <ap eth mac> <new name>
# Todo: implement error checking in input etc

# baseMac is set to first CLI parameter (interface name)
#
set baseMac [lindex $argv 0]
set newName [lindex $argv 1]
puts stdout "Input MAC $baseMac"
if {[string equal $baseMac ""]} { puts "Usage: C9800-Alpha#tclsh bootflash:applets/ns-apRename.tcl <ap eth mac> <new name>"; return; }
if { [ catch { exec "show ap summary | include $baseMac" } errmsg ] } {
  puts stdout "Invalid mac. Did not find in sh ap sum"; return}

set outpt [exec "show ap summary | include $baseMac"]

puts stdout "----------------------------------------------------------------------"

puts stdout "Found this one \n $outpt"

puts stdout "--------------"


# Split to get AP name
set xx [split "$outpt "]

# get the old name
set oldName [lindex $xx 0]

##
puts stdout "***** executing this: "
puts stdout "ap name $oldName name $newName"

exec "ap name $oldName name $newName"


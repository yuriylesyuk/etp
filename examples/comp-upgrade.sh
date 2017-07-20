#!/bin/bash

# Utility to upgrade syntax of pre-0.60 versions
#
# How to use:
#     comp-upgrade.sh <json-topology-file>>


file=$1

filetmp=$1.tmp
filebak=$1.bak

gawk -f - $file <<EOF > $filetmp
#                                 {"comp":"PS"},

    
\$0 !~ /"components" *:/



/"components" *: *\[.*\]/{
comps = \$0

print "\"components\": ["
match( comps, /\[.*\]/ )
c = substr( comps, RSTART+1, RLENGTH-2 )
 split( c, a,  "," )
 sep = ""
for( i in a ){
  print sep a[i]
  sep = ","
}
print "]"
}

/"components" *: *\[ *^/{

    print \$0
    comp = \$0
    while( comp !~ /\]/ ){
        getline comp
        #print ">" comp

        print gensub( /(".+")/, "{\"comp\":\\1}", "g", comp )

    }
}

EOF

if [ $? != 1 ]; then
    mv $file $filebak
    mv $filetmp $file
fi
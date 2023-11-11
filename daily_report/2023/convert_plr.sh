#!/bin/bash

# file name
i_file_name=`date '+%m%d.md'`
o_file_name=`date '+%m%d-discord.md'`

# preliminary
touch tmp.md
t_file_name="tmp.md"

# output
sed -e '1s|^|\`\`\`\n|g' $i_file_name > $t_file_name
sed -e '$s|$|\n\`\`\`\n|g' $t_file_name > $o_file_name
rm $t_file_name

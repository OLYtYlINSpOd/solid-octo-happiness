#!/usr/bin/bash
a(){
	cat $a|grep -i "\.ts"|grep -iv "\-06000.ts\|ext-x"
}
rm 1.txt
a=playlist.m3u8
c="http://87.239.27.170"
d="$c/p/Bh0oq1H765lrpWAwBFrbqw,1703786348/streaming/1kanalplus4/324/5"
e="Host: mhd158.iptv2022.com"
while true
do
	wget -T 15 -q -O $a --header "$e" "$d/tracks-v5a1/mono.m3u8$b"
	if(a);then
		for f in $(a)
		do
			if(! grep -i $f 1.txt);then
				echo $f >> 1.txt
				g=($(echo $f|sed "s/\//\n/gI;s/-/\n/gI"))
				h=202312${g[2]}T${g[3]}${g[4]}${g[5]}
				wget -T 15 -q -O $h.ts --header "$e" "$d/tracks-v5a1/$f"
				i=$(echo $f|sed "s/\.ts/\.webvtt/gI")
				wget -T 15 -q -O $h.webvtt --header "$e" "$d/tracks-t1/$i"
			fi
		done
	fi
done

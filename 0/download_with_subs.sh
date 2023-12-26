#!/usr/bin/bash
a(){
	wget -T 15 -c -O $k.ts --header "Host: mhd158.iptv2022.com" $m
}
c(){
	let c=c+$1
	if(($c>=60));then
		let c=c-60
		let b=b+1
		if(($b>=60));then
			let b=b-60
			let a=a+1
			if(($a>=24));then
				let a=a-24
				let d=d+1
			fi
		fi
	fi
}
d(){
	g=$(printf "%02d" $a)
	h=$(printf "%02d" $b)
	i=$(printf "%02d" $c)
	j=$(printf "%02d" $d)
	k=202312$j"T"$g$h$i
	m="http://87.239.27.170/p/Bh0oq1H765lrpWAwBFrbqw,1703786348/streaming/1kanalplus4/324/5/tracks-v5a1/2023/12/$j/$g/$h/$i-06000.ts"
}
e(){
	let c=c-$1
	if(($c<0));then
		let c=c+60
		let b=b-1
		if(($b<0));then
			let b=b+60
			let a=a-1
			if(($a<0));then
				let a=a+24
				let d=d-1
			fi
		fi
	fi
}
f(){
	wget -T 15 -O $k.webvtt --header "Host: mhd158.iptv2022.com" $(echo $m|sed "s/\.ts/\.webvtt/gI;s/v5a1/t1/gI")
}
a=${1#0}
b=${2#0}
c=${3#0}
d=${4#0}
d
while true
do
	if(a||(sleep 15;a));then
		f
		c 6
		d
	else
		e 5
		d
		for l in {1..12}
		do
			if(a);then
				f
				c 6
				d
				break
			else
				c 1
				d
				if(($l==12));then
					exit
				fi
			fi
		done
	fi
done

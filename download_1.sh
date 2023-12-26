#!/usr/bin/bash
a(){
	g=$(printf "%02d" $a)
	h=$(printf "%02d" $b)
	i=$(printf "%02d" $c)
	j=$(printf "%02d" $d)
	k=$(printf "%05d" $e)
	l=$(printf "%08x" $e)
}
b(){
	wget -a 1.log -c -T 15 -O 202312$g"T"$h$i$j.vtt "http://81.211.33.66/hls-live4/streams/1tv-orbit-plus-4/1tv-orbit-plus-420-202312"$g"T"$h$i$j"-TFrag_"$k".vtt"
}
c(){
	let d=d+$1
	if(($d>=60));then
		let d=d-60
		let c=c+1
		if(($c>=60));then
			let c=c-60
			let b=b+1
			if(($b>=24));then
				let b=b-24
				let a=a+1
			fi
		fi
	fi
}
d(){
	let d=d-$1
	if(($d<0));then
		let d=d+60
		let c=c-1
		if(($c<0));then
			let c=c+60
			let b=b-1
			if(($b<0));then
				let b=b+24
				let a=a-1
			fi
		fi
	fi
}
a=${1#0}
b=${2#0}
c=${3#0}
d=${4#0}
m=00000000
for f in {1..4}
do
	e=${5#0}
done
while true
do
	a
	if(! b);then
		for w in {1..6}
		do
			sleep 5
			if(b);then
				let e=e+1
				c 10
				break
			elif(($w==6));then
				c 10
				a
				s=$a;t=$b;u=$c;v=$d
				d 10
				a
				for o in {1..13}
				do
					if(b);then
						a=$s;b=$t;c=$u;d=$v
						let e=e+1
						a
						break
					fi
					if(($o==13));then
						exit
					fi
					c 1
					a
				done
			fi
		done
	else
		let e=e+1
		c 10
	fi
done

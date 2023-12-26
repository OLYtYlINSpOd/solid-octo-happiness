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
	wget -c -T 15 -O 202312$g"T"$h$i$j.ts "http://81.211.33.66/hls-live4/streams/1tv-orbit-plus-4/1tv-orbit-plus-45-202312"$g"T"$h$i$j"-TFrag_"$k".ts"
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
e(){
	let p=e%20
	if(($p==0));then
		let q=e-20
		if(! xxd -p "K1630"$q"5.key");then
			while true
			do
				wget -c -T 15 "http://81.211.33.66/hls-live4/keys/1tv-orbit-plus-4/-TFrag/K1630"$q"5.key"&&break
			done
		fi
		r=$(xxd -p "K1630"$q"5.key")
		openssl enc -aes-128-cbc -d -K $r -iv $m$m$m$l -in 202312$g"T"$h$i$j.ts -out 202312$g"T"$h$i$j.mp4&&rm 202312$g"T"$h$i$j.ts
	else
		let q=e-p
		if(! xxd -p "K1630"$q"5.key");then
			while true
			do
				wget -c -T 15 "http://81.211.33.66/hls-live4/keys/1tv-orbit-plus-4/-TFrag/K1630"$q"5.key"&&break
			done
		fi
		r=$(xxd -p "K1630"$q"5.key")
		openssl enc -aes-128-cbc -d -K $r -iv $m$m$m$l -in 202312$g"T"$h$i$j.ts -out 202312$g"T"$h$i$j.mp4&&rm 202312$g"T"$h$i$j.ts
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
				e
				let e=e+1
				c 10
				break
			elif(($w==6));then
				c 10
				s=$a;t=$b;u=$c;v=$d
				d 10
				d 5
				a
				for o in {1..11}
				do
					if(b);then
						e
						a=$s;b=$t;c=$u;d=$v
						let e=e+1
						a
						break
					fi
					if(($o==11));then
						exit
					fi
					c 1
					a
				done
			fi
		done
	else
		e
		let e=e+1
		c 10
	fi
done

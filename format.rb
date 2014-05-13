#!/usr/bin/env ruby

$realformat = ARGV[0]
dir = String.new(ARGV[1])

def oct2hex(s)
	t = (?0+s).split(?\\)
	ans = t[0][1..-1]
	t.shift

	t.each do |ts|
		ans += ts[0..2].to_i(8).chr
		ans += ts[3..-1]
	end

	ans
end

def work(currentdir, layer)
	Dir.chdir(currentdir)
	files = Dir.entries(currentdir)

	# puts files.join ?\n

	2.times { files.shift }  # ".", ".."
	files.shift if files[0] == ".DS_Store" ;

	currentdirname = currentdir.split('/')[-1]
	newcurrentdirname = oct2hex(currentdirname).force_encoding($realformat).encode("UTF-8")
	
	if layer > 0 ;
		print ' '*4*(layer-1)
		print '-'*4
	end
	puts newcurrentdirname
	files.each do |filename|
		print ' '*4*layer
		if File.directory?(filename) ;
			work(currentdir+?/+filename, layer+1)
			Dir.chdir(currentdir)
		else
			newfilename = oct2hex(filename).force_encoding($realformat).encode("UTF-8")
			File.rename(filename, newfilename)
			print ?-*4
			puts newfilename
		end
	end

	Dir.chdir("..")
	File.rename(currentdirname, newcurrentdirname)
end

work(dir, 0)

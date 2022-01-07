bold=`tput bold`

black=`tput setaf 0`
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
cyan=`tput setaf 6`
white=`tput setaf 7`

reset=`tput sgr0`

filename="main"
executable="emu"
arguments=


default: build run

build:
	@echo "${bold}${yellow}[INFO]${reset} Preprocessing." 
	@cpp src/${filename}.c > src/${filename}.i
	@echo "${bold}${yellow}[INFO]${reset} Compilation."
	@gcc -S src/${filename}.i -o src/${filename}.s
	@echo "${bold}${yellow}[INFO]${reset} Assembly."
	@as src/${filename}.s -o src/${filename}.o
	@echo "${bold}${yellow}[INFO]${reset} Linking."
	@gcc -o bin/${executable} src/*.o
	@echo "${bold}${yellow}[INFO]${reset} Cleaning up."
	@rm -rfv src/*.o src/*.i src/*.s
	@echo "${bold}${green}[INFO]${reset} Compilation done."

run:
	@echo "${bold}${green}[INFO]${reset} Running."
	@echo "${bold}${blue}[OUTPUT]:${reset}"
	@bin/${executable} ${arguments}

clean:
	@echo "${bold}${red}[INFO]${reset} Cleaning up."
	@rm -rfv bin/${executable}

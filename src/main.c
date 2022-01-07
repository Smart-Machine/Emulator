#include <stdio.h>
#include <string.h>

int disassemble_8080(unsigned char* codebuffer);

int main(int argc, char** argv)
{
	char* program = *argv++;
	if (!(*argv) || !(strcmp(*argv, "-h")) || !(strcmp(*argv, "--help")))
	{
		char* msg = "Usage:\v"
					"emu <flags> <filename> \n"
					"	flags: \n"
					"		... \n"
					"	filename: \n"
					"		The file should be a ROM file or similar. \n"
					;
		printf("%s",msg);
		return 0;
	}

	const char* filename = *argv++;
	FILE* game_file = fopen(filename, "rb");

	for (int i = 0; i < 32; i++)
	{
		printf("%x", fgetc(game_file));
	}

	fclose(game_file);

	return 0;
}

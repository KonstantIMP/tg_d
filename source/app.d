import std.stdio, tg.bot, tg.type, tg.core.format;

int main (string [] args) {
	TelegramBot test = new TelegramBot(args[1]);
	writeln (test.getUpdates()[$ - 1].getAsJson());

	TelegramInputFile testPhoto = TelegramInputFile.createFromFile("/home/kimp/Downloads/base_87716f252d.jpg");

	return 0;
}

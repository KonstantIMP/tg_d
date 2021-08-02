import std.stdio, tg.bot, tg.type, tg.core.format;

int main (string [] args) {
	TelegramBot test = new TelegramBot(args[1]);

	TelegramInputFile testPhoto = TelegramInputFile.createFromFile("/home/kimp/Downloads/base_87716f252d.jpg");

	test.sendPhoto(cast(ulong)1038959170, testPhoto);

	return 0;
}

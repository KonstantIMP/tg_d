import std.stdio, tg.bot, tg.type;

int main (string [] args) {
	TelegramBot test = new TelegramBot(args[1]);
	writeln (test.getMe().username);
	writeln (test.getUpdates().length);
	return 0;
}

import std.stdio, tg.bot, tg.type;

int main (string [] args) {
	TelegramBot test = new TelegramBot(args[1]);
	writeln (test.execute!(TelegramUser)("getMe").username);
	return 0;
}

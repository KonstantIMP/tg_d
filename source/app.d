import std.stdio, tg.bot, tg.type;

int main (string [] args) {
	TelegramBot test = new TelegramBot(args[1]);
	writeln (test.sendMessage(cast(ulong)1038959170, "Hello?").getAsJson());
	return 0;
}

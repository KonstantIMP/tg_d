# tg_d

A DLang library for creating telegram bots

## Features

* Unified request execution method - execute
* Unified types struct - abstract TelegramType
* Full Telegram types support
* Widespread use of exceptions

## Todo

- [ ] Webhook support
- [ ] Full methods implementation
- [ ] Write more examples
- [ ] Updates checking loop
- [ ] Signals for updtaes processing

## The basics

### Types

Every telegram type has 2 method for simple data sending/recieving

```d
    TelegramType.getAsJson(); // Returns the type as a JSON record
    TelegramType.setFromJson(); // Init type`s values from server`s JSON response
```

### Bot creating

```d
    TelegramBot bot = new TelegramBot(bot_api);
```

### File sending

```d
    // There is a special type for sending files

    TelegramInputFile id = TelegramInputFile.createFromId(id); // Creates file for sending from already downloaded to the server file by it`s id
    TelegramInputFile url = TelegramInputFile.createFromUrl(url); // Creates file for sending from file form the Internek
    TelegramInputFile local = TelegramInputFile.createFromFile(path); // Creates file for sending from local file
```

## Generating types implementation

You can regenerate types by this [repo](https://gitlab.com/KonstantIMP/t_api_to_d)

## Bots written by tg_d

* [StickBot](https://github.com/KonstantIMP/stickbot)

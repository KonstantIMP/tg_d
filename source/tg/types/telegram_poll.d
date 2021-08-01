/**
 * Contains TelegramPoll
 */
module tg.types.telegram_poll;

import tg.core.type, tg.core.exception, tg.core.array;
import std.json, tg.type;

/**
 * This object contains information about a poll.
 */
class TelegramPoll : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _id = "";
        _question = "";
        _options = null;
        _total_voter_count = 0;
        _is_closed = false;
        _is_anonymous = false;
        _type = "";
        _allows_multiple_answers = false;
        _correct_option_id = 0;
        _explanation = "";
        _explanation_entities = null;
        _open_period = 0;
        _close_date = 0;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "id" !in data ) throw new TelegramException("Could not find reqired entry : id");
        _id = data["id"].str();

        if ( "question" !in data ) throw new TelegramException("Could not find reqired entry : question");
        _question = data["question"].str();

        if ( "options" !in data ) throw new TelegramException("Could not find reqired entry : options");
        _options = toTelegram!TelegramPollOption(data["options"]);

        if ( "total_voter_count" !in data ) throw new TelegramException("Could not find reqired entry : total_voter_count");
        _total_voter_count = data["total_voter_count"].integer();

        if ( "is_closed" !in data ) throw new TelegramException("Could not find reqired entry : is_closed");
        _is_closed = data["is_closed"].boolean();

        if ( "is_anonymous" !in data ) throw new TelegramException("Could not find reqired entry : is_anonymous");
        _is_anonymous = data["is_anonymous"].boolean();

        if ( "type" !in data ) throw new TelegramException("Could not find reqired entry : type");
        _type = data["type"].str();

        if ( "allows_multiple_answers" !in data ) throw new TelegramException("Could not find reqired entry : allows_multiple_answers");
        _allows_multiple_answers = data["allows_multiple_answers"].boolean();

        if ( "correct_option_id" in data )
        _correct_option_id = data["correct_option_id"].integer();

        if ( "explanation" in data )
        _explanation = data["explanation"].str();

        if ( "explanation_entities" in data )
        _explanation_entities = toTelegram!TelegramMessageEntity(data["explanation_entities"]);

        if ( "open_period" in data )
        _open_period = data["open_period"].integer();

        if ( "close_date" in data )
        _close_date = data["close_date"].integer();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["id"] = _id;

        data["question"] = _question;

        data["options"] = _options.getAsJson();

        data["total_voter_count"] = _total_voter_count;

        data["is_closed"] = _is_closed;

        data["is_anonymous"] = _is_anonymous;

        data["type"] = _type;

        data["allows_multiple_answers"] = _allows_multiple_answers;

        if ( _correct_option_id != 0 ) data["correct_option_id"] = _correct_option_id;

        if ( _explanation != "" ) data["explanation"] = _explanation;

        if ( _explanation_entities !is null ) data["explanation_entities"] = _explanation_entities.getAsJson();

        if ( _open_period != 0 ) data["open_period"] = _open_period;

        if ( _close_date != 0 ) data["close_date"] = _close_date;

        return data;
    }

    /** Unique poll identifier */
    private string _id;
    /**
     * Getter for '_id'
     * Returns: Current value of '_id'
     */
    @property string id () { return _id; }
    /**
     * Setter for '_id'
     * Params: idNew = New value of '_id'
     * Returns: New value of '_id'
     */
    @property string id ( string idNew ) { return _id = idNew; }

    /** Poll question, 1-300 characters */
    private string _question;
    /**
     * Getter for '_question'
     * Returns: Current value of '_question'
     */
    @property string question () { return _question; }
    /**
     * Setter for '_question'
     * Params: questionNew = New value of '_question'
     * Returns: New value of '_question'
     */
    @property string question ( string questionNew ) { return _question = questionNew; }

    /** List of poll options */
    private TelegramPollOption[] _options;
    /**
     * Getter for '_options'
     * Returns: Current value of '_options'
     */
    @property TelegramPollOption[] options () { return _options; }
    /**
     * Setter for '_options'
     * Params: optionsNew = New value of '_options'
     * Returns: New value of '_options'
     */
    @property TelegramPollOption[] options ( TelegramPollOption[] optionsNew ) { return _options = optionsNew; }

    /** Total number of users that voted in the poll */
    private ulong _total_voter_count;
    /**
     * Getter for '_total_voter_count'
     * Returns: Current value of '_total_voter_count'
     */
    @property ulong totalVoterCount () { return _total_voter_count; }
    /**
     * Setter for '_total_voter_count'
     * Params: totalVoterCountNew = New value of '_total_voter_count'
     * Returns: New value of '_total_voter_count'
     */
    @property ulong totalVoterCount ( ulong totalVoterCountNew ) { return _total_voter_count = totalVoterCountNew; }

    /** True, if the poll is closed */
    private bool _is_closed;
    /**
     * Getter for '_is_closed'
     * Returns: Current value of '_is_closed'
     */
    @property bool isClosed () { return _is_closed; }
    /**
     * Setter for '_is_closed'
     * Params: isClosedNew = New value of '_is_closed'
     * Returns: New value of '_is_closed'
     */
    @property bool isClosed ( bool isClosedNew ) { return _is_closed = isClosedNew; }

    /** True, if the poll is anonymous */
    private bool _is_anonymous;
    /**
     * Getter for '_is_anonymous'
     * Returns: Current value of '_is_anonymous'
     */
    @property bool isAnonymous () { return _is_anonymous; }
    /**
     * Setter for '_is_anonymous'
     * Params: isAnonymousNew = New value of '_is_anonymous'
     * Returns: New value of '_is_anonymous'
     */
    @property bool isAnonymous ( bool isAnonymousNew ) { return _is_anonymous = isAnonymousNew; }

    /** Poll type, currently can be &#8220;regular&#8221; or &#8220;quiz&#8221; */
    private string _type;
    /**
     * Getter for '_type'
     * Returns: Current value of '_type'
     */
    @property string type () { return _type; }
    /**
     * Setter for '_type'
     * Params: typeNew = New value of '_type'
     * Returns: New value of '_type'
     */
    @property string type ( string typeNew ) { return _type = typeNew; }

    /** True, if the poll allows multiple answers */
    private bool _allows_multiple_answers;
    /**
     * Getter for '_allows_multiple_answers'
     * Returns: Current value of '_allows_multiple_answers'
     */
    @property bool allowsMultipleAnswers () { return _allows_multiple_answers; }
    /**
     * Setter for '_allows_multiple_answers'
     * Params: allowsMultipleAnswersNew = New value of '_allows_multiple_answers'
     * Returns: New value of '_allows_multiple_answers'
     */
    @property bool allowsMultipleAnswers ( bool allowsMultipleAnswersNew ) { return _allows_multiple_answers = allowsMultipleAnswersNew; }

    /** <em>Optional</em>. 0-based identifier of the correct answer option. Available only for polls in the quiz mode, which are closed, or was sent (not forwarded) by the bot or to the private chat with the bot. */
    private ulong _correct_option_id;
    /**
     * Getter for '_correct_option_id'
     * Returns: Current value of '_correct_option_id'
     */
    @property ulong correctOptionId () { return _correct_option_id; }
    /**
     * Setter for '_correct_option_id'
     * Params: correctOptionIdNew = New value of '_correct_option_id'
     * Returns: New value of '_correct_option_id'
     */
    @property ulong correctOptionId ( ulong correctOptionIdNew ) { return _correct_option_id = correctOptionIdNew; }

    /** <em>Optional</em>. Text that is shown when a user chooses an incorrect answer or taps on the lamp icon in a quiz-style poll, 0-200 characters */
    private string _explanation;
    /**
     * Getter for '_explanation'
     * Returns: Current value of '_explanation'
     */
    @property string explanation () { return _explanation; }
    /**
     * Setter for '_explanation'
     * Params: explanationNew = New value of '_explanation'
     * Returns: New value of '_explanation'
     */
    @property string explanation ( string explanationNew ) { return _explanation = explanationNew; }

    /** <em>Optional</em>. Special entities like usernames, URLs, bot commands, etc. that appear in the <em>explanation</em> */
    private TelegramMessageEntity[] _explanation_entities;
    /**
     * Getter for '_explanation_entities'
     * Returns: Current value of '_explanation_entities'
     */
    @property TelegramMessageEntity[] explanationEntities () { return _explanation_entities; }
    /**
     * Setter for '_explanation_entities'
     * Params: explanationEntitiesNew = New value of '_explanation_entities'
     * Returns: New value of '_explanation_entities'
     */
    @property TelegramMessageEntity[] explanationEntities ( TelegramMessageEntity[] explanationEntitiesNew ) { return _explanation_entities = explanationEntitiesNew; }

    /** <em>Optional</em>. Amount of time in seconds the poll will be active after creation */
    private ulong _open_period;
    /**
     * Getter for '_open_period'
     * Returns: Current value of '_open_period'
     */
    @property ulong openPeriod () { return _open_period; }
    /**
     * Setter for '_open_period'
     * Params: openPeriodNew = New value of '_open_period'
     * Returns: New value of '_open_period'
     */
    @property ulong openPeriod ( ulong openPeriodNew ) { return _open_period = openPeriodNew; }

    /** <em>Optional</em>. Point in time (Unix timestamp) when the poll will be automatically closed */
    private ulong _close_date;
    /**
     * Getter for '_close_date'
     * Returns: Current value of '_close_date'
     */
    @property ulong closeDate () { return _close_date; }
    /**
     * Setter for '_close_date'
     * Params: closeDateNew = New value of '_close_date'
     * Returns: New value of '_close_date'
     */
    @property ulong closeDate ( ulong closeDateNew ) { return _close_date = closeDateNew; }
}


import QtQml 2.0
import QOwnNotesTypes 1.0

/**
 * This script changes the default New Note action to create a blank note instead of a note with a headline.
 */
QtObject {
    /**
     * This function is called before a note note is created
     * 
     * It allows you to modify the headline of the note before it is created
     * Note that you have to take care about a unique note name, otherwise
     * the new note will not be created, it will just be found in the note list
     *
     * You can use this method for creating note templates
     * 
     * @param headline text that would be used to create the headline
     * @return {string} the headline of the note
     */
    function handleNewNoteHeadlineHook(headline) {
        var text = "";

        return text;
    }
}

import QtQml 2.0
import QOwnNotesTypes 1.0

/**
 * This script changes the default New Note action to create a blank note instead of a note with a headline.
 */
QtObject {
    /**
     * Initializes the custom action
     */
    function init() {
        script.registerCustomAction("blankNote", "Create a new blank note", "Blank note", "document-new");
    }

    /**
     * This function is invoked when a custom action is triggered
     * in the menu or via button
     *
     * @param identifier string the identifier defined in registerCustomAction
     */
    function customActionInvoked(identifier) {
        if (identifier != "blankNote") {
            return;
        }

        var headline = script.inputDialogGetText(
            "line edit", "Note headline", "");

        var text = "";
        var filePath = script.currentNoteFolderPath() + script.dirSeparator();
        var fileName = headline + ".md";
        script.writeToFile(filePath + fileName, text);

        // Force a reload of the note list
        mainWindow.buildNotesIndexAndLoadNoteDirectoryList(true, true);

        // var note = script.fetchNoteByFileName(filePath + fileName);
        var note = script.fetchNoteByFileName(fileName);
        script.setCurrentNote(note);
    }

}

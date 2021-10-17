import QtQml 2.0
import com.qownnotes.noteapi 1.0

/**
 * This script creates a menu item and a button to jump to the default or main note for the current subfolder
 */
QtObject {
    /**
     * Initializes the custom action
     */
    function init() {
        script.registerCustomAction("defaultNote", "Jump to default note for subfolder", "Default note", "go-jump");
    }

    function getSubFolder(note, path) {
        var fileName = note.fullNoteFilePath;
        var pathRe = new RegExp(path + "\/((.*)\/)*.*");
        var subfolderName = fileName.replace(pathRe, "$2");
        return subfolderName;
    }

    /**
     * This function is invoked when a custom action is triggered
     * in the menu or via button
     *
     * @param identifier string the identifier defined in registerCustomAction
     */
    function customActionInvoked(identifier) {
        if (identifier != "defaultNote") {
            return;
        }

        var currentNoteId = script.currentNote().id;
        var note = script.fetchNoteById(currentNoteId);
        var path = script.currentNoteFolderPath();
        var subfolderName = getSubFolder(note, path);
        var defaultNoteName = subfolderName + ".md";
        var defaultNote = script.fetchNoteByFileName(defaultNoteName);
        script.setCurrentNote(defaultNote);
    }
}

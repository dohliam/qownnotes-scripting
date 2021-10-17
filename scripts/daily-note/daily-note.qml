import QtQml 2.0
import com.qownnotes.noteapi 1.0

/**
 * This script creates a menu item and a button to create or jump to the current date's daily note
 */
QtObject {
    property string headlinePrefix;
    property string defaultFolder;
    property string defaultTags;
    property string noteBodyTemplate;
    property bool isCreateFolderWithDateString;
    property bool isAskForDateString;

    // register your settings variables so the user can set them in the script settings
    property variant settingsVariables: [
        {
            "identifier": "headlinePrefix",
            "name": "Headline prefix",
            "description": "Please enter a prefix for your note headline:",
            "type": "string",
            "default": "",
        },
        {
            "identifier": "defaultFolder",
            "name": "Default folder",
            "description": "The default folder where the newly created daily note should be placed. Specify the path to the folder relative to the note folder. Make sure that the full path exists. Examples: to place new daily notes in the subfolder 'Journal' enter: \"Journal\". Leave blank to disable (notes will be created in the currently active folder).",
            "type": "string",
            "default": "journal",
        },
        {
            "identifier": "isCreateFolderWithDateString",
            "name": "Create new folder",
            "description": "Create a new folder with the date string in the default folder.",
            "type": "boolean",
            "default": false,
        },
        {
            "identifier": "defaultTags",
            "name": "Default tags",
            "description": "One or more default tags (separated by commas) to assign to a newly created daily note. Leave blank to disable auto-tagging.",
            "type": "string",
            "default": "",
        },
        {
            "identifier": "isAskForDateString",
            "name": "Ask for the date string",
            "description": "Ask for the date string instead of using the current date",
            "type": "boolean",
            "default": false,
        },
        {
            "identifier": "noteBodyTemplate",
            "name": "Template",
            "description": "Template for a new daily entry.",
            "type": "text",
            "default": "",
        },
    ];

    /**
     * Initializes the custom action
     */
    function init() {
        script.registerCustomAction("dailyNote", "Create or open a daily note", "Daily note", "document-new");
    }

    /**
     * This function is invoked when a custom action is triggered
     * in the menu or via button
     *
     * @param identifier string the identifier defined in registerCustomAction
     */
    function customActionInvoked(identifier) {
        if (identifier != "dailyNote") {
            return;
        }

        // get the date headline
        var m = new Date();
        var dateString = m.getFullYear() + "-" + ("0" + (m.getMonth()+1)).slice(-2) + "-" + ("0" + m.getDate()).slice(-2)

        if (isAskForDateString) {
            dateString = script.inputDialogGetText(
                "Date string", "Please enter the date string", dateString);
        }

        var headline = headlinePrefix + dateString;
        var noteName = headline.replace(/\-/g, "")

        var fileName = noteName + ".md";

        // Check if we already have a daily note for today.

        // When a default folder is set, make sure to search in that folder.
        // This has the highest chance of finding an existing daily note.
        // Right now we can not search the whole database for a note with this
        // name / filename.
        if (defaultFolder !== '') {
            script.jumpToNoteSubFolder(defaultFolder);
        }

        var subFolder = defaultFolder;

        if (isCreateFolderWithDateString) {
            subFolder += (subFolder !== '') ? '/' : '';
            subFolder += dateString;
            mainWindow.createNewNoteSubFolder(dateString)
        }

        var note = script.fetchNoteByFileName(fileName);

        // check if note was found
        if (note.id > 0) {
            // jump to the note if it was found
            script.log("found daily note: " + headline);
            script.setCurrentNote(note);
        } else {
            // create a new daily note if it wasn't found
            // keep in mind that the note will not be created instantly on the disk
            script.log("creating new daily note: " + headline);

            // Sub folder.
            if (subFolder !== '') {
                var msg = 'Jump to folder \'' + subFolder + '\' before creating a new daily note.';
                script.log('Attempt: ' + msg);
                var jump = script.jumpToNoteSubFolder(subFolder);
                if (jump) {
                    script.log('Success: ' + msg);
                } else {
                    script.log('Failed: ' + msg);
                }
            }

            // Create the new daily note.
            script.createNote("# " + headline + "\n\n" + noteBodyTemplate);
            const currentNote = script.currentNote();

            // rename the note file if needed
            if (currentNote.allowDifferentFileName()) {
                currentNote.renameNoteFile(noteName);
                mainWindow.buildNotesIndexAndLoadNoteDirectoryList(false, true);
            }

            // Default tags.
            if (defaultTags && defaultTags !== '') {
                defaultTags
                    // Split on 0..* ws, 1..* commas, 0..* ws.
                    .split(/\s*,+\s*/)
                    .forEach(function(i) {
                        script.log('Tag the new daily note with default tag: ' + i);
                        script.tagCurrentNote(i);
                    });
            }
        }
    }
}

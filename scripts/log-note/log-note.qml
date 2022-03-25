import QtQml 2.0
import com.qownnotes.noteapi 1.0

/**
 * This script creates a menu item and a button to create or jump to a regular (daily or monthly) log or journal note
 */
QtObject {
    property string headlinePrefix;
    property string defaultFolder;
    property string defaultTags;
    property string noteBodyTemplate;
    property string dateSeparator;
    property bool isCreateFolderWithDateString;
    property bool isAskForDateString;
    property bool isShowDay;
    property bool removeSeparators;

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
            "description": "The default folder where the newly created log note should be placed. Specify the path to the folder relative to the note folder. Examples: to place new log notes in the subfolder 'Journal' enter: \"Journal\". Multiple folders can be specified (separated by a comma) for use with different note collections. For example, to use the folder 'Journal' in one collection, and 'Tagebuch' in another, enter \"Journal,Tagebuch\". Leave blank to disable using default subfolder. If this option is disabled, or if none of the specified folders exist, notes will be created in the currently active folder instead.",
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
            "identifier": "dateSeparator",
            "name": "Date separator",
            "description": "Character to use as a separator between the year, month, and day in date strings (e.g., use '-' for dates in the form '2010-01-01'). Leave blank to not use a separator (e.g., '20100101').",
            "type": "string",
            "default": "-",
        },
        {
            "identifier": "defaultTags",
            "name": "Default tags",
            "description": "One or more default tags (separated by commas) to assign to a newly created log note. Leave blank to disable auto-tagging.",
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
            "identifier": "isShowDay",
            "name": "Show day in date",
            "description": "Show full date including day (default: show year and month only)",
            "type": "boolean",
            "default": false,
        },
        {
            "identifier": "removeSeparators",
            "name": "Remove separators",
            "description": "Remove separators (e.g., '-') from filenames. Check this if you want to use a date like '2010-01-01 for your headline, but save the file as '20100101.md'. Default is to include the separators in the filename.",
            "type": "boolean",
            "default": false,
        },
        {
            "identifier": "noteBodyTemplate",
            "name": "Template",
            "description": "Template for a new log entry.",
            "type": "text",
            "default": "",
        },
    ];

    /**
     * Initializes the custom action
     */
    function init() {
        script.registerCustomAction("logNote", "Create or open a regular log note", "log note", "document-new");
    }

    /**
     * This function is invoked when a custom action is triggered
     * in the menu or via button
     *
     * @param identifier string the identifier defined in registerCustomAction
     */
    function customActionInvoked(identifier) {
        if (identifier != "logNote") {
            return;
        }

        // get the date headline
        var m = new Date();
        var dateString = m.getFullYear() + dateSeparator + ("0" + (m.getMonth()+1)).slice(-2);
        if (isShowDay) {
            dateString = m.getFullYear() + dateSeparator + ("0" + (m.getMonth()+1)).slice(-2) + dateSeparator + ("0" + m.getDate()).slice(-2);
        }

        if (isAskForDateString) {
            dateString = script.inputDialogGetText(
                "Date string", "Please enter the date string", dateString);
        }

        var headline = headlinePrefix + dateString;
        var noteName = dateString;
        if (removeSeparators) {
            var seperatorRegex = new RegExp(dateSeparator, "g");
            noteName = dateString.replace(seperatorRegex, "");
        }

        var fileName = noteName + ".md";

        // Check if we already have a log note for today.

        // When a default folder is set, make sure to search in that folder.
        // This has the highest chance of finding an existing log note.
        // Right now we can not search the whole database for a note with this
        // name / filename.
        if (defaultFolder !== '') {
            if (/,/.test(defaultFolder)) {
                var folderArray = defaultFolder.split(/\s*,\s*/);
                for (var i=0; i<folderArray.length; i++) {
                    var optFolder = folderArray[i];
                    script.jumpToNoteSubFolder(optFolder);
                }
            } else {
                script.jumpToNoteSubFolder(defaultFolder);
            }
        }

        var subFolder = defaultFolder;

        if (isCreateFolderWithDateString) {
            subFolder += (subFolder !== '') ? '/' : '';
            subFolder += dateString;
            mainWindow.createNewNoteSubFolder(dateString);
        }

        var note = script.fetchNoteByFileName(fileName);

        // check if note was found
        if (note.id > 0) {
            // jump to the note if it was found
            script.log("found log note: " + headline);
            script.setCurrentNote(note);
        } else {
            // create a new log note if it wasn't found
            // keep in mind that the note will not be created instantly on the disk
            script.log("creating new log note: " + headline);

            // Sub folder.
            if (subFolder !== '') {
                var msg = 'Jump to folder \'' + subFolder + '\' before creating a new log note.';
                script.log('Attempt: ' + msg);
                var jump = script.jumpToNoteSubFolder(subFolder);
                if (jump) {
                    script.log('Success: ' + msg);
                } else {
                    script.log('Failed: ' + msg);
                }
            }

            // Create the new log note.
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
                        script.log('Tag the new log note with default tag: ' + i);
                        script.tagCurrentNote(i);
                    });
            }
        }
    }
}

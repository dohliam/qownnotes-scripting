import QtQml 2.0
import QOwnNotesTypes 1.0

QtObject {
    property string scriptDirPath

    function getSubfolder(note, path) {
        var fileName = note.fullNoteFilePath;
        var pathRe = new RegExp(path + "\/((.*)\/)*.*");
        var subfolderName = fileName.replace(pathRe, "$2");
        return subfolderName;
    }

    /**
     * This function is called when the markdown html of a note is generated
     *
     * It allows you to modify this html
     * This is for example called before by the note preview
     *
     * The method can be used in multiple scripts to modify the html of the preview
     *
     * @param {NoteApi} note - the note object
     * @param {string} html - the html that is about to being rendered
     * @param {string} forExport - the html is used for an export, false for the preview
     * @return {string} the modified html or an empty string if nothing should be modified
     */

    function noteToMarkdownHtmlHook(note, html, forExport) {
        var note_name = note.name;
        var path = script.currentNoteFolderPath();
        var subfolderName = getSubfolder(note, path);

        var params = [subfolderName, note_name, path];
        //script.log(subfolderName + " | " + note_name + " | " + path)
        
        var rubyScriptPath = scriptDirPath + script.dirSeparator() + "backlinks.rb"
        var result = script.startSynchronousProcess(rubyScriptPath, params);
        //script.log(result);
        return html + "\n\n" + result;
    }
}

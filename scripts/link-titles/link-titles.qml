import QtQml 2.0
import QOwnNotesTypes 1.0

QtObject {
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
        var re = new RegExp('<a href="([^"]+)">', 'g');
        html = html.replace(re, "<a href=\"$1\" title=\"$1\">");
        return html;
    }
}

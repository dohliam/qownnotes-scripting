import QtQml 2.0
import QOwnNotesTypes 1.0

QtObject {
    property string wikilinksBackgroundColor;
    property string wikilinksForegroundColor;

    property variant settingsVariables: [
        {
            "identifier": "wikilinksBackgroundColor",
            "name": "Wiki Links Background Color",
            "description": "Color for the backgroud of rendered wiki links (name or #hex):",
            "type": "string",
            "default": "#FFFF00",
        },
        {
            "identifier": "wikilinksForegroundColor",
            "name": "Wiki Links Foreground Color",
            "description": "Color for the foreground of rendered wiki links (name or #hex):",
            "type": "string",
            "default": "#ff832b",
        }
    ];
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
        var path = script.currentNoteFolderPath();
        if (script.platformIsWindows()) {
            path = "/" + path;
        }

        var file_path = "file://" + path + "/";
        html = html.replace(new RegExp("<x-wikilink data-target=\"(.*?)\">(.*?)</x-wikilink>", "gi"), "<a href=\"" + file_path + "$1.md\">$2</a>");
        //html = html.replace(new RegExp('\[\[(.*?)(\|(.*?))*\]\]', "g"), "<a href=\"$1.md\">$3</a>");
        //mdHtml = mdHtml.replace(new RegExp("<x-wikilink data-target=\"(.*?)\">(.*?)</x-wikilink>", "gi"), "<a href=\"$1.md\">$2</a>");
        return html;
    }
}

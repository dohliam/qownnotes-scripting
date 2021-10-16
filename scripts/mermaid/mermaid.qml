import QtQml 2.0
import QOwnNotesTypes 1.0

//import "mermaid.js" as Mermaid

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

    //QString base64_encode(QString string);

    function preNoteToMarkdownHtmlHook(note, markdown, forExport) {
        var re = /```mermaid\n([\s\S]*?)\n```/gim;
        markdown = markdown.replace(re, function(_, diag){
            var normalize = diag.replace(/&gt;/gi, ">").replace(/&lt;/gi, "<");
            var encodedData = Qt.btoa(normalize);
            var ink = '![](https://mermaid.ink/img/' + encodedData + ')';
            //var ink = '```\n![](https://mermaid.ink/img/' + encodedData + ')\n```';
            return ink;
        });
        return markdown;
    }

    //function noteToMarkdownHtmlHook(note, html, forExport) {
        //var re = /<pre><code class="language-mermaid">([\s\S]*?)<\/code><\/pre>/gim;
        ////var mer = "<div class=\"mermaid\">\n$1\n</div>";
////         QString src = "Hello";
////         console.log(src.toUtf8().toBase64())

////         var mer = "<div class=\"mermaid\">\n$1\n</div>";
        ////var script = "<script src=\"mermaid.js\"></script><script>mermaid.initialize({ startOnLoad: true });</script>\n</body>";
        //if (html.match(/<pre><code class="language-mermaid">/)) {
            //html = html.replace(re, function(_, diag){
                //var encodedData = Qt.btoa(diag);
                //var ink = '<img src="https://mermaid.ink/img/' + encodedData + '" />';
                //var mer = "<div class=\"mermaid\">\n" + ink + "\n</div>";
                //return mer;
            //});
            ////html = html.replace(re, mer).replace(/<\/body>/gi, script);
            //return html;
            ////this.mermaid.initialize({ startOnLoad: true });
        //}
    //}
}

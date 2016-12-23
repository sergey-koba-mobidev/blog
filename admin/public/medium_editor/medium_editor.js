var editor = new MediumEditor('.editable', {
    buttonLabels: 'fontawesome',
    extensions: {
        table: new MediumEditorTable(),
        embedButton: new EmbedButtonExtension({
            embedOpts: {
                oembedProxy: "https://iframe.ly/api/oembed?api_key=cfbfb6143da0b54b3c938a&url="
            }
        })
    },
    toolbar: {
        buttons: [
            'bold',
            'italic',
            'underline',
            'anchor',
            'h2',
            'h3',
            'quote',
            'unorderedlist',
            'orderedlist',
            'image',
            'embedButton',
            'table',
            'pre',
            'removeFormat'
        ]
    },
    static: true,
    sticky: true
});
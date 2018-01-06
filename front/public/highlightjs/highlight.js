$(function () {
    $('article pre').each(function (i, block) {
        hljs.highlightBlock(block);
    });
    $('article pre.hljs').each(function(i, block) {
        hljs.lineNumbersBlock(block);
    });
});
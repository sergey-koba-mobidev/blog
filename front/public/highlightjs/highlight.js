$(function () {
    $('article pre').each(function (i, block) {
        hljs.highlightBlock(block);
    });
});
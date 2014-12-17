var str = "";

if ($('.question_link').length === 0) {
    str = str + 'ERROR' + '\n';
}
_.each($(".question_link"), function(i) {
    var $el = $(i);
    str = str + $el.text().trim() + ',http://chuansongme.com' + $el.attr('href') + '\n'
})
str

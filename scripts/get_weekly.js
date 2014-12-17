var str = "";
_.each($('table a'), function(i) {
    var text = $(i).text().trim().replace(/,/g, ';');
    var link = removeS($(i).attr('href'));
    if (text.indexOf('cooperpress') == -1
        && text !== 'Archive'
        && text !== 'Read this issue on the Web'
        && text !== 'Read this e-mail on the Web'
        && text !== 'Rackspace'
        && text != 'Peter Cooper'
        && link.indexOf('cooperpress') == -1
        && link.indexOf('UPDATE_PROFILE') == -1
        && link.indexOf('EMAIL_UID') == -1
        && link.indexOf('CUNSUB') == -1) {
        str += (text + ',' + link + '\n');
    }
});

function removeS(str) {
    return str.replace(/\?utm_source=.*&utm_medium=email/g, '')
}

str

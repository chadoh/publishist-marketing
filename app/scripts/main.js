function getURLParameter(name) {
    return decodeURI(
        (RegExp(name + '=' + '(.+?)(&|$)').exec(location.search)||[,null])[1]
    );
}

subdomain = getURLParameter("subdomain");
if(subdomain != "null") {
    examples = document.getElementsByClassName("subdomain");
    for(i=0;i<examples.length;i++) {
        examples[i].innerHTML = subdomain;
    }
}

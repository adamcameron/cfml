// chained.js

function* getWords(){
    for (number of ['tahi','rua', 'toru', 'wha', 'rima', 'ono', 'whitu', 'waru', 'iwa', 'tekau']){
        yield number;
    }
    yield* getColours();
};

function* getColours(){
    for (colour of ['whero','karaka', 'kowhai', 'kakariki', 'kikorangi', 'poropango', 'papura']){
        yield colour;
    }
}

for (item of getWords()){
    console.log(item);
}
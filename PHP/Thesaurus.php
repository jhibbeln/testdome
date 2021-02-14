<?php

class Thesaurus
{
    private $thesaurus;

    function __construct(array $thesaurus)
    {
        $this->thesaurus = $thesaurus;
    }

    public function getSynonyms(string $word) : string
    {
        if (isset($this->thesaurus[$word])) {
            $synonyms = $this->thesaurus[$word];
        } else {
            $synonyms = [];
        }

        return json_encode([
            'word'     => $word,
            'synonyms' => $synonyms,
        ]);
    }
}

$thesaurus = new Thesaurus(
    [
        "buy" => array("purchase"),
        "big" => array("great", "large")
    ]
);

echo $thesaurus->getSynonyms("big");
echo "\n";
echo $thesaurus->getSynonyms("agelast");
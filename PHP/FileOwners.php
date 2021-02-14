<?php

function groupByOwners(array $files) : array
{
    $fileOwners = [];

    foreach ($files as $file => $owner) {
        $fileOwners[$owner][] = $file;
    }

    return $fileOwners;
}

$files = array
(
    "Input.txt" => "Randy",
    "Code.py" => "Stan",
    "Output.txt" => "Randy"
);
var_dump(groupByOwners($files));
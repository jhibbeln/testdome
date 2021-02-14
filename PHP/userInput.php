<?php

class TextInput
{
    protected $input = [];

    public function add($i)
    {
        array_push($this->input, $i);
    }

    public function getValue()
    {
        return implode('', $this->input);
    }
}

class NumericInput extends TextInput
{
    public function add($i)
    {
        if (is_numeric($i)) {
            array_push($this->input, $i);
        }
    }
}

$input = new NumericInput();
$input->add('1');
$input->add('a');
$input->add('0');
echo $input->getValue();
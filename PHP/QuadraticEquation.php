<?php
/**
 * https://de.wikipedia.org/wiki/Quadratische_Gleichung
 *
 * @return array An array of two elements containing roots in any order
 */
function findRoots($a, $b, $c)
{
    // leider copy paste :/
    $D = $b*$b - 4*$a*$c;
    if ($D >= 0){
        $x1 = (-$b + sqrt($D))/(2*$a);
        $x2 = (-$b - sqrt($D))/(2*$a);
        return [$x1, $x2];
    } else {
        $x1 = -$b/(2*$a);
        $x2 = sqrt(-$D)/(2*$a);
        return [$x1, $x2];
    }
}

print_r(findRoots(2, 10, 8));
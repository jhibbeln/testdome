<?php

class LeagueTable
{
    /**
     * array
     */
    protected $standings = [];

    /**
     * LeagueTable constructor.
     * @param array $players
     */
    public function __construct(array $players)
    {
        $this->standings = [];
        foreach($players as $index => $p) {
            $this->standings[$p] = [
                'index'        => $index,
                'games_played' => 0,
                'score'        => 0,
                'player'       => $p
            ];
        }
    }

    /**
     * @return array
     */
    public function getSorted(): array
    {
        $standings = $this->standings;

        // usort sortiert aufsteigend anhand des Callbacks.
        // Ein negativer Rückgabewert meldet, dass das aktuell zu vergleichende Element kleiner ist.
        // In dieser Sortierung erhalten die am höchsten gerankten Spieler die geringste Position.
        // Ist ein Score also größer liefert diese Funktion ein negatives Ergebnis zurück.
        // Der Index wird bei Usort neu gesetzt. Ein assoziatives Array wird dabei zu einem mit nummerischem fortlaufendem Index ab 0
        // Der Gewinner ist an der Position [0] zu finden.
        usort($standings, function ($standingA, $standingB) {
            if ($standingA['score'] === $standingB['score']) {
                if ($standingA['games_played'] === $standingB['games_played']) {
                    $sort = $standingA['index'] < $standingB['index'] ? -1 : 1;
                } else {
                    $sort = $standingA['games_played'] < $standingB['games_played'] ? -1 : 1;
                }
            } else {
                $sort = $standingA['score'] > $standingB['score'] ? -1 : 1;
            }

            return $sort;
        });

        return $standings;
    }

    /**
     * @param string $player
     * @param int $score
     */
    public function recordResult(string $player, int $score) : void
    {
        $this->standings[$player]['games_played']++;
        $this->standings[$player]['score'] += $score;
    }

    /**
     * @param int $rank
     * @return string
     */
    public function playerRank(int $rank) : string
    {
        $sorted = $this->getSorted();

        return $sorted[$rank-1]['player'];
    }
}


$table = new LeagueTable(array('Mike', 'Chris', 'Arnold'));
$table->recordResult('Mike', 2);
$table->recordResult('Mike', 3);
$table->recordResult('Arnold', 5);
$table->recordResult('Chris', 5);
echo $table->playerRank(1);

$sortedByScore = $table->getSorted();
var_dump($sortedByScore);
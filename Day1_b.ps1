function solveFirstBasementEntry
{
    [cmdletBinding()]
    param(
        $instructions
    )

    $floor=0
    $stepsTaken=0
	$stepIntoBasement=-1
    foreach($step in $instructions.ToCharArray())
    {
        $stepsTaken++
        $stepDirection = 0
        if($step -eq "(") { $stepDirection =  1 }
        if($step -eq ")") { $stepDirection = -1 }

        $floor += $stepDirection
		
		if($floor -eq -1 -and $stepIntoBasement -eq -1)
		{
			$stepIntoBasement = $stepsTaken
		}

        write-verbose "$stepsTaken : $step --> $stepDirection, now at $floor"
    }

    $stepIntoBasement
}

$easySet = "()))(()"
$hardSet = get-content ".\Day1_Input.txt"

$easyAnswer  = solveFirstBasementEntry $easySet -Verbose
write-Host "Easy set (should be 3): $easyAnswer"

$finalAnswer = solveFirstBasementEntry $hardSet
write-Host "Final answer: $finalAnswer"
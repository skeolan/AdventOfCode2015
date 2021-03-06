﻿function solveFloors
{
    [cmdletBinding()]
    param(
        $instructions
    )

    $floor=0
    $stepsTaken=0
    foreach($step in $instructions.ToCharArray())
    {
        $stepsTaken++
        $stepDirection = 0
        if($step -eq "(") { $stepDirection =  1 }
        if($step -eq ")") { $stepDirection = -1 }

        $floor += $stepDirection

        write-verbose "$stepsTaken : $step --> $stepDirection, now at $floor"
    }

    $floor
}

$easySet = "())"
$hardSet = get-content ".\Day1_Input.txt"


$easyAnswer  = solveFloors $easySet -Verbose
write-Host "Easy set (should be -1): $easyAnswer"

$finalAnswer = solveFloors $hardSet
write-Host "Final answer: $finalAnswer"
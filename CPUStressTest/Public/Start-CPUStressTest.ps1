function Start-CPUStressTest {
    [CmdletBinding()]
    param (
        [ValidateRange(0, 100)]
        [Int]
        $loadPct,
        $CPUs,
        [ValidateSet("Lowest", "BelowNormal", "Normal", "AboveNormal", "Highest")]
        $Priority = "Normal")
    begin {
        $loadPm = $loadPct * 10
        if ($CPUs -gt $env:NUMBER_OF_PROCESSORS) { $CPUs = $env:NUMBER_OF_PROCESSORS }
    }
    process {
        $ScriptBlock = {
            $loadPm = $args[0]
            [System.Threading.Thread]::CurrentThread.Priority = $args[1]
            $StopWatch = [System.Diagnostics.Stopwatch]::New()
            while ($true) {
                $StopWatch.Start()
                while ($StopWatch.ElapsedMilliseconds -lt $loadPm) {
                    $i++
                }
                Start-Sleep -Milliseconds $(1000 - $loadPm)
                $StopWatch.Reset()
            }
        }

        $Script:StressJob = 1..$CPUs | foreach {Start-Job -ScriptBlock $ScriptBlock -ArgumentList $loadPm, $Priority}
    }
    end { }
}
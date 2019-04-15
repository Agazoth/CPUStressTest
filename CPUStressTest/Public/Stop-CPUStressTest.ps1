function Stop-CPUStressTest {
    [CmdletBinding()]
    param (
        
    )
    
    begin {
    }
    
    process {
        $Script:StressJob.StopJob()
        $Script:StressJob | Remove-Job
    }
    
    end {
    }
}
---
external help file: CPUStressTest-help.xml
Module Name: CPUStressTest
online version:
schema: 2.0.0
---

# Start-CPUStressTest

## SYNOPSIS
Start a CPU stress test

## SYNTAX

```
Start-CPUStressTest [[-loadPct] <Int32>] [[-CPUs] <Object>] [-Priority <Object>] [<CommonParameters>]
```

## DESCRIPTION
Start a CPU stress test. It is possible to choose a specific load percentage and a specific number of CPUs to target. 

## EXAMPLES

### Example 1
```powershell
PS C:\> Start-CPUStressTest -loadPct 50 -CPUs 4
```

Starts 4 Jobs that calculates $++ for ½ second and then sleeps for ½ second until the jobs are removed, usualy by Stop-CPUStressTest

## PARAMETERS

### -CPUs
Number of CPUs to test. Windows distributes the workload, but usualy each job gets its own CPU assigned. If the CPUs number is higher then the actual amount of CPUs, the number is reduced to the actual number of CPUs

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -loadPct
The amount of load to put on the CPUs. If set to 50 %, each job will do $i++  ½ second and then sleep for ½ second. If set to 100, the jobs will do $i++ continously

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Priority
Job priority can be set according to possibilities. Make sure that the scope that starts and stops the test has a higher Priority then the priority on the stress test if both loadPct and CPUs is maxed out. If not, it might be nessesary to close the console running the test or even reboot the machine to stop the test.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS

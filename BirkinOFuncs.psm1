Set-StrictMode -Version latest
function Out-Page{
    [CmdletBinding()]

    Param(
        [Parameter(ValueFromPipeline = $true)]
        $cmdOutput,
        
        [int]$Lines = 20
      
        )
        begin{
        $outputArray = @()
        }

        process{
        $outputArray += $_
        }

        end{
        if ($Lines -le 0){
            $Lines = 20
        }

        $countPage = 0
        $totLine = $outputArray.Count
        $staleLineC = $countPage * $Lines

        while ($staleLineC -lt $totLine) {
            $outputArray | Select-Object -Skip ($staleLineC) -First $Lines | ForEach-Object { $_ }
            $countPage++
            $staleLineC = $countPage * $Lines

            Write-Host -ForegroundColor Yellow "Press ENTER to continue..."
            $null = Read-Host
        }
        Write-Host "Exitting"

        }

}
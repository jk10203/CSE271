$psISE.Options.ConsolePaneBackgroundColor = '#0B3861'
$psISE.Options.ConsolePaneForegroundColor = '#F4E4EE'
$psISE.Options.ErrorBackgroundColor = '#C42A2A'
$psISE.Options.ErrorForegroundColor = 'white'
function prompt {
    $history = @(Get-History)
    if ($history.Count -gt 0) {
        $lastItem = $history[$history.Count - 1]
        $lastId = $lastItem.Id
    } else {
        $lastId = 0
    }

    $nextCommand = $lastId + 1

    $(if (Test-Path variable:/PSDebugContext) { '[DBG]: ' }
      else { '' }) + 'PS ' + $(Get-Location) +
        $(if ($NestedPromptLevel -ge 1) { '>>' }) + "($nextCommand) (=@w@=)> "
}
function blessup {cd "c:\Users\gak425\Desktop\CSE271\"}



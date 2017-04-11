Param (

    [io.DirectoryInfo]
    $ProjectPath = (property ProjectPath (Join-Path $PSScriptRoot '../..' -Resolve -ErrorAction SilentlyContinue)),

    [string]
    $BuildOutput = (property BuildOutput 'C:\BuildOutput'),

    [string]
    $LineSeparation = (property LineSeparation ('-' * 78)) 
)

task Clean {
    $LineSeparation
    "`t`t`t CLEAN UP"
    $LineSeparation

    if (![io.path]::IsPathRooted($BuildOutput)) {
        $BuildOutput = Join-Path -Path $ProjectPath.FullName -ChildPath $BuildOutput
    }
    if (Test-Path $BuildOutput) {
        "Removing $BuildOutput"
        Remove-Item $BuildOutput -Force -Recurse
    }

}
$arg1 = $args[0]
$arg2 = $args[1]
$arg3 = $args[2]

$PesterConfig = New-PesterConfiguration
$PesterConfig.TestResult.OutputFormat = "NUnitXml"
$PesterConfig.TestResult.OutputPath = $arg1
$PesterConfig.TestResult.Enabled = $True
$PesterConfig.Run.Path = $arg3 
$PesterConfig.Should.ErrorAction = 'Continue'
$PesterConfig.CodeCoverage.Enabled = $true

cd $arg2

Invoke-Pester -Configuration $PesterConfig
